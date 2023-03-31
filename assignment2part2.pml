/**
 * Elevator template model for Assignment 2 of 2IX20 - Software Specification.
 * Set up for one elevator and two floors.
 */

//-------------------------------------------------------------------------------------------------

/** the number of floors */
#define NUMBER_OF_FLOORS 2

/** the number of elevators */
#define NUMBER_OF_ELEVATORS 2

/** IDs of the cabin door processes */
#define CABIN_DOOR_ID (_pid)

/** IDs of the engine processes */
#define ENGINE_ID (CABIN_DOOR_ID - NUMBER_OF_ELEVATORS)

/** IDs of the main control processes */
#define MAIN_CONTROL_ID (ENGINE_ID - NUMBER_OF_ELEVATORS)

/** IDs of the main control processes */
//#define REQUEST_HANDELER_ID (MAIN_CONTROL_ID - NUMBER_OF_ELEVATORS)

/** IDs of the request button processes */
#define REQUEST_BUTTON_ID (MAIN_CONTROL_ID - NUMBER_OF_ELEVATORS - 1)

//-------------------------------------------------------------------------------------------------
// LTL formulas to be verified:

/** this property does not hold, as a request for floor 1 can be indefinitely postponed.*/
// ltl p1 { []<> (floor_request_made[0]==true) } 

/**
 * this property should hold, but does not yet; at any moment during an execution, the opening of
 * the cabin door will happen at some later point.
 */
// ltl p2 { []<> (cabin_door_is_open==true) } 

/** A request always is for a valid floor, i.e., it has a value between 0 and N.
 * Handled with assert
 */
// assert in process somewhere

/** When the request button of floor i is pressed, eventually, that request is processed.*/
// int i;
// int j;
// ltl e { [](floor_request_made[i] -> <>!floor_request_made[i])}

/** Each elevvator eventually processes a request. */
int elevatorsUsed = 0;
//ltl f { <>(elevatorsUsed == NUMBER_OF_ELEVATORS)}

/**
 * When an elevator signals that it has processed a request via the 'served' channel, its current
 * floor is equal to the destination floor of the request.
 * Handled with assert
 */
// assert in process somewhere

/** Eventually a request is made at floor number N-1. */
// int k;
// ltl h { <>(floor_request_made[NUMBER_OF_FLOORS - 1] == true)}

//-------------------------------------------------------------------------------------------------

/** type for direction of elevator */
mtype { down, up, none };

/** asynchronous channel to handle passenger requests */
chan request = [NUMBER_OF_FLOORS] of { byte };

/** an array for the status of requests per floor */
bool floor_request_made[NUMBER_OF_FLOORS]

/** This is a component of the 2D array floor_door_is_open*/
typedef door_array {
    bool floor[NUMBER_OF_FLOORS]; 
};

/** 
 * status of floor doors of the shaft of the single elevator
 *
 * is equivalent to: floor_door_is_open[NUMBER_OF_ELEVATORS][NUMBER_OF_FLOORS]
 * but it has to be done this way because promela does not support 2D array's.
 * This is a work around where you make an array of a defintion of an array, 
 * which is similar in use case, but different in creation.
 */
door_array floor_door_is_open[NUMBER_OF_ELEVATORS];

/** wether or not the cabin door is open */
bool cabin_door_is_open[NUMBER_OF_ELEVATORS];

/** if true the cabin door controler will open the cabin door */
chan update_cabin_door[NUMBER_OF_ELEVATORS] = [0] of { bool };

/** if true the cabin door has been opened */
chan cabin_door_updated[NUMBER_OF_ELEVATORS] = [0] of { bool };

// status and synchronous channels for elevator cabin and engine
byte current_floor[NUMBER_OF_ELEVATORS] = 0;
chan move[NUMBER_OF_ELEVATORS] = [0] of { bool };
chan floor_reached[NUMBER_OF_ELEVATORS] = [0] of { bool };

// synchronous channels for communication between request handler and main control
chan go_to[NUMBER_OF_ELEVATORS] = [1] of { byte };
chan served[NUMBER_OF_ELEVATORS] = [1] of { bool };

//-------------------------------------------------------------------------------------------------

/**
 * cabin door process. Opens the door if update cabin door is true
 * on the channle update_cabin_door.
 */
active [NUMBER_OF_ELEVATORS] proctype cabin_door() {

    int ELEVATOR_SHAFT = CABIN_DOOR_ID
	do
	:: update_cabin_door[ELEVATOR_SHAFT]?true -> {
            atomic {
                floor_door_is_open[ELEVATOR_SHAFT].floor[current_floor[ELEVATOR_SHAFT]] = true;
                cabin_door_is_open[ELEVATOR_SHAFT] = true;
            }
            cabin_door_updated[ELEVATOR_SHAFT]!true; // cannot move into atomic: syncronous
        }
	:: update_cabin_door[ELEVATOR_SHAFT]?false -> {
            atomic {
                cabin_door_is_open[ELEVATOR_SHAFT] = false;
                floor_door_is_open[ELEVATOR_SHAFT].floor[current_floor[ELEVATOR_SHAFT]] = false; 
            }
            cabin_door_updated[ELEVATOR_SHAFT]!false; // cannot move into atomic: syncronous
        }
	od;
}

/**
 * process combining the elevator engine and sensors
 */
active [NUMBER_OF_ELEVATORS] proctype elevator_engine() {

    int ELEVATOR_SHAFT = ENGINE_ID;
	do
	:: move[ELEVATOR_SHAFT]?true -> {
            do
            :: move[ELEVATOR_SHAFT]?false -> break;
            :: floor_reached[ELEVATOR_SHAFT]!true;
            od;
        }
	od;
}

/**
 * Process to process floor requests.
 */ 
active [NUMBER_OF_ELEVATORS] proctype main_control() {
    
    int ELEVATOR_SHAFT = MAIN_CONTROL_ID;
    bool used = false;

    byte destination; 
    mtype direction;

    // makes it known that the elevator is available
    served[ELEVATOR_SHAFT]!true;

	do
	:: true -> go_to[ELEVATOR_SHAFT]?destination -> {

            // Open doors...
            update_cabin_door[ELEVATOR_SHAFT]!false;
            cabin_door_updated[ELEVATOR_SHAFT]?false;

            // ! THIS PART IS JANKY, and we PROMISE there was no other way of doing this nicely:
            do // This is the only way of making a sort of function that allows for an early return
            :: true -> { // it is just a while true loop that breaks at the end, or earlier... ughh
                    
                    atomic {

                        bool DESTINATION_IS_BELOW = (current_floor[ELEVATOR_SHAFT] > destination);
                        bool DESTINATION_IS_ABOVE = (current_floor[ELEVATOR_SHAFT] < destination);
                        
                        if 
                        :: DESTINATION_IS_BELOW -> direction = down;
                        :: DESTINATION_IS_ABOVE -> direction = up;
                        :: else -> break; // ! "early return" of the "function"
                        fi;
                    }

                    move[ELEVATOR_SHAFT]!true;

                    do 
                    :: current_floor[ELEVATOR_SHAFT] > destination -> {
                            floor_reached[ELEVATOR_SHAFT]?true;
                            current_floor[ELEVATOR_SHAFT]--;
                        }
                    :: current_floor[ELEVATOR_SHAFT] < destination -> {
                            floor_reached[ELEVATOR_SHAFT]?true;
                            current_floor[ELEVATOR_SHAFT]++;
                        } 
                    :: current_floor[ELEVATOR_SHAFT] == destination -> {
                            move[ELEVATOR_SHAFT]!false;
                            atomic {
                                direction = none;
                                break;
                            }
                        }
                    od;

                    break; // ! end of "function" thus we "return".
                }
            od;

            // Close doors...
            update_cabin_door[ELEVATOR_SHAFT]!true;
            cabin_door_updated[ELEVATOR_SHAFT]?true;
            
            // mark the request as done, and get ready for the next request
            floor_request_made[destination] = false;
            served[ELEVATOR_SHAFT]!true;

            atomic { 

                bool AT_CORRECT_FLOOR = (current_floor[ELEVATOR_SHAFT] == destination);
                assert(AT_CORRECT_FLOOR) // this is an assertion for g

                if // To keep track of all the elevators we've used.
                :: !used -> {
                        used = true;
                        elevatorsUsed++;
                    }
                :: else;
                fi;
            }
        }
	od;
}

/**
 * request handler process. Remodel this process to serve M elevators!
 */
active proctype request_handler() {

    byte nextElevatorID = 0;
    byte destination;

	do
	:: request?destination -> {
            served[nextElevatorID]?true;
            go_to[nextElevatorID]!destination;
            nextElevatorID = ((nextElevatorID + 1) % NUMBER_OF_ELEVATORS);
        }
	od;
}

/**
 * request button associated to a floor i to request an elevator
 */
active [NUMBER_OF_FLOORS] proctype request_button() {

    atomic { // this is an assertion for d.
        bool NON_NEGATIVE_CURRENT_FLOOR = (REQUEST_BUTTON_ID >= 0);
        bool NOT_TOO_HIGH_CURRENT_FLOOR = (REQUEST_BUTTON_ID <= NUMBER_OF_FLOORS);
        
        bool CURRENT_FLOOR_WITHIN_BOUNDS = (
            NON_NEGATIVE_CURRENT_FLOOR && NOT_TOO_HIGH_CURRENT_FLOOR
        );

        assert(CURRENT_FLOOR_WITHIN_BOUNDS); 
    }

	do
	:: !floor_request_made[REQUEST_BUTTON_ID] -> atomic {
            request!REQUEST_BUTTON_ID;
            floor_request_made[REQUEST_BUTTON_ID] = true;
		}
	od;
}
