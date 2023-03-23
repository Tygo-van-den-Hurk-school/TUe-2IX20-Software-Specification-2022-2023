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
#define ENGINE_ID (_pid + NUMBER_OF_ELEVATORS)

/** IDs of the main control processes */
#define MAIN_CONTROL_ID (ENGINE_ID + NUMBER_OF_ELEVATORS)

/** IDs of the main control processes */
#define REQUEST_HANDELER_ID (MAIN_CONTROL_ID + NUMBER_OF_ELEVATORS)

/** IDs of the request button processes */
#define REQUEST_BUTTON_ID (REQUEST_HANDELER_ID + NUMBER_OF_ELEVATORS)

//-------------------------------------------------------------------------------------------------

// LTL formulas to be verified
/** 
 * this property does not hold, as a request for floor 1 can be indefinitely postponed.
 */
//ltl p1 { []<> (floor_request_made[0]==true) } 

/**
 * this property should hold, but does not yet; at any moment during an execution, the opening of
 * the cabin door will happen at some later point.
 */
//ltl p2 { []<> (cabin_door_is_open==true) } 

/**
 * When a request is made at floor 1, then eventually the elevator reaches floor 1.
 */
//ltl a1 { [](floor_request_made[0] -> <>current_floor == 0)}

/**
 * When a request is made at floor 2, then eventually the elevator reaches floor 2.
 */
//ltl a2 { [](floor_request_made[1] -> <>current_floor == 1)}

/**
 * always eventuall the cabin doors open.
 */
//ltl b1 { []<>(cabin_door_is_open == true)}

/**
 * always eventuall the cabin doors close.
 */
//ltl b2 { []<>(cabin_door_is_open == false)}

/**
 * if the cabin door is open, then the doors at the current floor are also open
 */
//ltl c  { [](cabin_door_is_open == true -> floor_door_is_open[current_floor] == true)}

/**
 * When the request button of floor i is pressed, eventually, that request is processed.
 */
int i
ltl e { [](floor_request_made[i] -> <>(current_floor == i))}

/**
 * Each elevvator eventually processes a request.
 */


/**
 * When an elevator signals that it has processed a request via the 'served' channel, its current
 * floor is equal to the destination floor of the request.
 */

/**
 * Eventually a request is made at floor number N-1
 */
//-------------------------------------------------------------------------------------------------

/** type for direction of elevator */
mtype { down, up, none };

/** asynchronous channel to handle passenger requests */
chan request = [NUMBER_OF_FLOORS] of { byte };

/** an array for the status of requests per floor */
bool floor_request_made[NUMBER_OF_FLOORS];

/** status of floor doors of the shaft of the single elevator */
bool floor_door_is_open[NUMBER_OF_FLOORS];

/** wether or not the cabin door is open */
bool cabin_door_is_open;

/** if true the cabin door controler will open the cabin door */
chan update_cabin_door = [0] of { bool };

/** if true the cabin door has been opened */
chan cabin_door_updated = [0] of { bool };

// status and synchronous channels for elevator cabin and engine
byte current_floor = 0;
chan move = [0] of { bool };
chan floor_reached = [0] of { bool };

// synchronous channels for communication between request handler and main control
chan go_to = [0] of { byte };
chan served = [0] of { bool };

//-------------------------------------------------------------------------------------------------
/**
 * cabin door process. Opens the door if update cabin door is true
 * on the channle update_cabin_door.
 */
active [NUMBER_OF_ELEVATORS] proctype cabin_door() {

	do
	:: update_cabin_door?true -> {
            floor_door_is_open[current_floor] = true;
            cabin_door_is_open = true;
            cabin_door_updated!true;
        }
	:: update_cabin_door?false -> {
            cabin_door_is_open = false;
            floor_door_is_open[current_floor] = false; 
            cabin_door_updated!false;
        }
	od;
}

/*
 * process combining the elevator engine and sensors
 */
active [NUMBER_OF_ELEVATORS] proctype elevator_engine() {

	do
	:: move?true -> {
            do
            :: move?false -> break;
            :: floor_reached!true;
            od;
        }
	od;
}

/**
 * DUMMY main control process. Remodel it to control the doors and the engine!
 */ 
active [NUMBER_OF_ELEVATORS] proctype main_control() {

	byte destination; 
	mtype direction;
	do
	:: true -> go_to?destination -> {

            update_cabin_door!false;
            cabin_door_updated?false;

            // ! THIS PART IS JANKY, and we PROMISE there was no other way of doing this:
            do // This is the only way of making a sort of function that allows for an early return
            :: true -> {
                    
                    bool DESTINATION_IS_BELOW = (current_floor > destination);;
                    bool DESTINATION_IS_ABOVE = (current_floor < destination);;
                    if 
                    :: DESTINATION_IS_BELOW -> direction = down;
                    :: DESTINATION_IS_ABOVE -> direction = up;
                    :: else -> break; // ! "early return" of the "function"
                    fi;

                    move!true;
                    
                    move!true;

                    do 
                    :: current_floor > destination -> {
                            floor_reached?true;
                            current_floor--;
                        }
                    :: current_floor < destination -> {
                            floor_reached?true;
                            current_floor++;
                        } 
                    :: current_floor == destination -> {
                            move!false;
                            direction = none;
                            break;
                        }
                    od;

                    break; // ! end of "function" thus we "return".
                }
            od;

            update_cabin_door!true;
            cabin_door_updated?true;

            atomic { // an example assertion.
                bool NON_NEGATIVE_CURRENT_FLOOR = (0 <= current_floor);
                bool CABIN_NOT_ABOVE_EXISTING_FLOORS = (current_floor < NUMBER_OF_FLOORS);
                bool CURRENT_FLOOR_WITHIN_BOUNDS = (
                    NON_NEGATIVE_CURRENT_FLOOR && CABIN_NOT_ABOVE_EXISTING_FLOORS
                );
                assert(CURRENT_FLOOR_WITHIN_BOUNDS);
            }


            floor_request_made[destination] = false;
            served!true;
        }
	od;
}

/**
 * request handler process. Remodel this process to serve M elevators!
 */
active [NUMBER_OF_ELEVATORS] proctype req_handler() {

	byte destination;
	do
	:: request?destination -> {
            go_to!destination;
            served?true;
        }
	od;
}

/**
 * request button associated to a floor i to request an elevator
 */
active [NUMBER_OF_ELEVATORS][NUMBER_OF_FLOORS] proctype req_button() {

	do
	:: !floor_request_made[REQUEST_BUTTON_ID] -> {
			atomic {
				assert(0 <= REQUEST_BUTTON_ID && REQUEST_BUTTON_ID < NUMBER_OF_FLOORS);
				request!REQUEST_BUTTON_ID;
				floor_request_made[REQUEST_BUTTON_ID] = true;
			}
		}
	od;
}
