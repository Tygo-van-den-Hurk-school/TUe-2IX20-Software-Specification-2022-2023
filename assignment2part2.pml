/**
 * Elevator template model for Assignment 2 of 2IX20 - Software Specification.
 * Set up for one elevator and two floors.
 */
//-------------------------------------------------------------------------------------------------
/** the number of floors */
#define NUMBER_OF_FLOORS 4

/** the number of elevators */
#define NUMBER_OF_ELEVATORS 4

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

// LTL formulas to be verified
/** this property does not hold, as a request for floor 1 can be indefinitely postponed.*/
//ltl p1 { []<> (floor_request_made[0]==true) } 

/**
 * this property should hold, but does not yet; at any moment during an execution, the opening of
 * the cabin door will happen at some later point.
 */
//ltl p2 { []<> (cabin_door_is_open==true) } 

/** When a request is made at floor 1, then eventually the elevator reaches floor 1.*/
//ltl a1 { [](floor_request_made[0] -> <>current_floor == 0)}

/** When a request is made at floor 2, then eventually the elevator reaches floor 2.*/
//ltl a2 { [](floor_request_made[1] -> <>current_floor == 1)}

/** Always eventually the cabin doors open.*/
//ltl b1 { []<>(cabin_door_is_open == true)}

/** Always eventuall the cabin doors close. */
//ltl b2 { []<>(cabin_door_is_open == false)}

/** if the cabin door is open, then the doors at the current floor are also open. */
//ltl c  { [](cabin_door_is_open == true -> floor_door_is_open[current_floor] == true)}

/** A request always is for a valid floor, i.e., it has a value between 0 and N.
 * Handled with assert
 */

/** When the request button of floor i is pressed, eventually, that request is processed.*/
int i
int j
ltl e { [](floor_request_made[i] -> <>(current_floor[j] == i))}

/** Each elevvator eventually processes a request. */
int elevatorsUsed
ltl f { <>(elevatorsUsed == NUMBER_OF_ELEVATOR + 1)}


/**
 * When an elevator signals that it has processed a request via the 'served' channel, its current
 * floor is equal to the destination floor of the request.
 * Handled with assert
 */


/** Eventually a request is made at floor number N-1. */
int k
ltl h { <>(floor_request_made[k][NUMBER_OF_FLOORS - 1] == true)}

//-------------------------------------------------------------------------------------------------

/** type for direction of elevator */
mtype { down, up, none };

/** asynchronous channel to handle passenger requests */
chan request[NUMBER_OF_ELEVATORS] = [NUMBER_OF_FLOORS] of { byte };

/** an array for the status of requests per floor */
bool floor_request_made[NUMBER_OF_ELEVATORS][NUMBER_OF_FLOORS];

/** status of floor doors of the shaft of the single elevator */
bool floor_door_is_open[NUMBER_OF_ELEVATORS][NUMBER_OF_FLOORS];

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
            floor_door_is_open[ELEVATOR_SHAFT][current_floor] = true;
            cabin_door_is_open[ELEVATOR_SHAFT] = true;
            cabin_door_updated[ELEVATOR_SHAFT]!true;
        }
	:: update_cabin_door[ELEVATOR_SHAFT]?false -> {
            cabin_door_is_open[ELEVATOR_SHAFT] = false;
            floor_door_is_open[ELEVATOR_SHAFT][current_floor] = false; 
            cabin_door_updated[ELEVATOR_SHAFT]!false;
        }
	od;
}

/*
 * process combining the elevator engine and sensors
 */
active [NUMBER_OF_ELEVATORS] proctype elevator_engine() {

    int ELEVATOR_SHAFT = ENGINE_ID
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
    
    int ELEVATOR_SHAFT = MAIN_CONTROL_ID
    bool used = flase;
        
    // makes it known that the elevator is avalible
    served[ELEVATOR_SHAFT]!true; 

	byte destination; 
	mtype direction;
	do
	:: true -> go_to[ELEVATOR_SHAFT]?destination -> {

            // Open doors...
            update_cabin_door[ELEVATOR_SHAFT]!false;
            cabin_door_updated[ELEVATOR_SHAFT]?false;

            // ! THIS PART IS JANKY, and we PROMISE there was no other way of doing this nicely:
            do // This is the only way of making a sort of function that allows for an early return
            :: true -> { // it is just a while true loop that breaks at the end, or earlier... ughh
                    
                    bool DESTINATION_IS_BELOW = (current_floor[ELEVATOR_SHAFT] > destination);;
                    bool DESTINATION_IS_ABOVE = (current_floor[ELEVATOR_SHAFT] < destination);;
                    if 
                    :: DESTINATION_IS_BELOW -> direction = down;
                    :: DESTINATION_IS_ABOVE -> direction = up;
                    :: else -> break; // ! "early return" of the "function"
                    fi;

                    move[ELEVATOR_SHAFT]!true;

                    do 
                    :: current_floor > destination -> {
                            floor_reached[ELEVATOR_SHAFT]?true;
                            current_floor[ELEVATOR_SHAFT]--;
                        }
                    :: current_floor < destination -> {
                            floor_reached[ELEVATOR_SHAFT]?true;
                            current_floor[ELEVATOR_SHAFT]++;
                        } 
                    :: current_floor == destination -> {
                            move[ELEVATOR_SHAFT]!false;
                            direction = none;
                            break;
                        }
                    od;

                    break; // ! end of "function" thus we "return".
                }
            od;

            // Close doors...
            update_cabin_door[ELEVATOR_SHAFT]!true;
            cabin_door_updated[ELEVATOR_SHAFT]?true;
            
            floor_request_made[ELEVATOR_SHAFT][destination] = false;
            served[ELEVATOR_SHAFT]!true;

            // this is an assertion for g.
            bool CORRECT_FLOOR = (current_floor == destination);
            assert(CORRECT_FLOOR)

            if // To keep track of all the elevators we've used.
            :: !used -> {
                    used = true;
                    elevatorsUsed++;
                }
            fi;
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

	do
	:: !floor_request_made[REQUEST_BUTTON_ID] -> {
			
            atomic { // this is an assertion for d.
                bool NON_NEGATIVE_CURRENT_FLOOR = (REQUEST_BUTTON_ID >= 0);
                bool NOT_TOO_HIGH_CURRENT_FLOOR = (REQUEST_BUTTON_ID <= NUMBER_OF_FLOORS);
                
                bool CURRENT_FLOOR_WITHIN_BOUNDS = (
                    NON_NEGATIVE_CURRENT_FLOOR && NOT_TOO_HIGH_CURRENT_FLOOR
                );

				assert(CURRENT_FLOOR_WITHIN_BOUNDS); 
            }

            atomic { 
				request!REQUEST_BUTTON_ID;
				floor_request_made[REQUEST_BUTTON_ID] = true;
			}
		}
	od;
}
