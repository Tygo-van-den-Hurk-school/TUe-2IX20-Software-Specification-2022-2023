	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM h */
;
		;
		
	case 4: // STATE 6
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC request_button */
;
		;
		
	case 6: // STATE 4
		;
		((P4 *)_this)->_14_6_3_CURRENT_FLOOR_WITHIN_BOUNDS = trpt->bup.ovals[2];
		((P4 *)_this)->_14_6_3_NOT_TOO_HIGH_CURRENT_FLOOR = trpt->bup.ovals[1];
		((P4 *)_this)->_14_6_3_NON_NEGATIVE_CURRENT_FLOOR = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 7: // STATE 7
		;
		_m = unsend(now.request);
		;
		goto R999;

	case 8: // STATE 8
		;
		now.floor_request_made[ Index(((((((P4 *)_this)->_pid-2)-2)-2)-1), 4) ] = trpt->bup.oval;
		;
		goto R999;

	case 9: // STATE 14
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC request_handler */

	case 10: // STATE 1
		;
		XX = 1;
		unrecv(now.request, XX-1, 0, ((int)((P3 *)_this)->destination), 1);
		((P3 *)_this)->destination = trpt->bup.oval;
		;
		;
		goto R999;

	case 11: // STATE 2
		;
		XX = 1;
		unrecv(now.served[ Index(((int)((P3 *)_this)->nextElevatorID), 2) ], XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 12: // STATE 3
		;
		_m = unsend(now.go_to[ Index(((int)((P3 *)_this)->nextElevatorID), 2) ]);
		;
		goto R999;

	case 13: // STATE 4
		;
		((P3 *)_this)->nextElevatorID = trpt->bup.oval;
		;
		goto R999;

	case 14: // STATE 9
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC main_control */

	case 15: // STATE 1
		;
		_m = unsend(now.served[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]);
		;
		goto R999;

	case 16: // STATE 3
		;
		((P2 *)_this)->direction = trpt->bup.ovals[1];
		((P2 *)_this)->destination = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 17: // STATE 5
		;
		XX = 1;
		unrecv(now.go_to[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ], XX-1, 0, ((int)((P2 *)_this)->destination), 1);
		((P2 *)_this)->destination = trpt->bup.oval;
		;
		;
		goto R999;

	case 18: // STATE 6
		;
		_m = unsend(now.update_cabin_door[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]);
		;
		goto R999;

	case 19: // STATE 7
		;
		XX = 1;
		unrecv(now.cabin_door_updated[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ], XX-1, 0, 0, 1);
		;
		;
		goto R999;

	case 20: // STATE 9
		;
		((P2 *)_this)->_12_4_1_DESTINATION_IS_BELOW = trpt->bup.oval;
		;
		goto R999;

	case 21: // STATE 10
		;
		((P2 *)_this)->_12_4_1_DESTINATION_IS_ABOVE = trpt->bup.oval;
		;
		goto R999;

	case 22: // STATE 12
		;
		((P2 *)_this)->direction = trpt->bup.ovals[1];
	/* 0 */	((P2 *)_this)->_12_4_1_DESTINATION_IS_BELOW = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 23: // STATE 14
		;
		((P2 *)_this)->direction = trpt->bup.ovals[1];
	/* 0 */	((P2 *)_this)->_12_4_1_DESTINATION_IS_ABOVE = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 24: // STATE 19
		;
		_m = unsend(now.move[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]);
		;
		goto R999;
;
		;
		
	case 26: // STATE 21
		;
		XX = 1;
		unrecv(now.floor_reached[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ], XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 27: // STATE 22
		;
		now.current_floor[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ] = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 29: // STATE 25
		;
		XX = 1;
		unrecv(now.floor_reached[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ], XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 30: // STATE 26
		;
		now.current_floor[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ] = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 32: // STATE 29
		;
		_m = unsend(now.move[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]);
		;
		goto R999;

	case 33: // STATE 30
		;
		((P2 *)_this)->direction = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 34: // STATE 41
		;
		_m = unsend(now.update_cabin_door[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]);
		;
		goto R999;

	case 35: // STATE 42
		;
		XX = 1;
		unrecv(now.cabin_door_updated[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ], XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 36: // STATE 43
		;
		now.floor_request_made[ Index(((P2 *)_this)->destination, 4) ] = trpt->bup.oval;
		;
		goto R999;

	case 37: // STATE 44
		;
		_m = unsend(now.served[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]);
		;
		goto R999;

	case 38: // STATE 45
		;
		((P2 *)_this)->_12_4_CORRECT_FLOOR = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 40: // STATE 47
		;
	/* 0 */	((P2 *)_this)->used = trpt->bup.oval;
		;
		;
		goto R999;

	case 41: // STATE 48
		;
		((P2 *)_this)->used = trpt->bup.oval;
		;
		goto R999;

	case 42: // STATE 49
		;
		elevatorsUsed = trpt->bup.oval;
		;
		goto R999;

	case 43: // STATE 57
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC elevator_engine */

	case 44: // STATE 1
		;
		XX = 1;
		unrecv(now.move[ Index(((P1 *)_this)->ELEVATOR_SHAFT, 2) ], XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 45: // STATE 2
		;
		XX = 1;
		unrecv(now.move[ Index(((P1 *)_this)->ELEVATOR_SHAFT, 2) ], XX-1, 0, 0, 1);
		;
		;
		goto R999;

	case 46: // STATE 4
		;
		_m = unsend(now.floor_reached[ Index(((P1 *)_this)->ELEVATOR_SHAFT, 2) ]);
		;
		goto R999;

	case 47: // STATE 12
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC cabin_door */

	case 48: // STATE 1
		;
		XX = 1;
		unrecv(now.update_cabin_door[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ], XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 49: // STATE 2
		;
		now.floor_door_is_open[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ].floor[ Index(now.current_floor[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ], 4) ] = trpt->bup.oval;
		;
		goto R999;

	case 50: // STATE 3
		;
		cabin_door_is_open[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ] = trpt->bup.oval;
		;
		goto R999;

	case 51: // STATE 4
		;
		_m = unsend(now.cabin_door_updated[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ]);
		;
		goto R999;

	case 52: // STATE 6
		;
		XX = 1;
		unrecv(now.update_cabin_door[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ], XX-1, 0, 0, 1);
		;
		;
		goto R999;

	case 53: // STATE 7
		;
		cabin_door_is_open[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ] = trpt->bup.oval;
		;
		goto R999;

	case 54: // STATE 8
		;
		now.floor_door_is_open[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ].floor[ Index(now.current_floor[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ], 4) ] = trpt->bup.oval;
		;
		goto R999;

	case 55: // STATE 9
		;
		_m = unsend(now.cabin_door_updated[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ]);
		;
		goto R999;

	case 56: // STATE 14
		;
		p_restor(II);
		;
		;
		goto R999;
	}

