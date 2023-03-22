	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM b2 */
;
		;
		;
		;
		
	case 5: // STATE 13
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC req_button */
;
		;
		;
		;
		
	case 8: // STATE 3
		;
		_m = unsend(now.request);
		;
		goto R999;

	case 9: // STATE 4
		;
		now.floor_request_made[ Index((((P4 *)_this)->_pid-4), 2) ] = trpt->bup.oval;
		;
		goto R999;

	case 10: // STATE 10
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC req_handler */

	case 11: // STATE 1
		;
		XX = 1;
		unrecv(now.request, XX-1, 0, ((int)((P3 *)_this)->destination), 1);
		((P3 *)_this)->destination = trpt->bup.oval;
		;
		;
		goto R999;

	case 12: // STATE 2
		;
		_m = unsend(now.go_to);
		;
		goto R999;

	case 13: // STATE 3
		;
		XX = 1;
		unrecv(now.served, XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 14: // STATE 8
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC main_control */

	case 15: // STATE 1
		;
		XX = 1;
		unrecv(now.go_to, XX-1, 0, ((int)((P2 *)_this)->destination), 1);
		((P2 *)_this)->destination = trpt->bup.oval;
		;
		;
		goto R999;

	case 16: // STATE 2
		;
		_m = unsend(now.update_cabin_door);
		;
		goto R999;

	case 17: // STATE 3
		;
		XX = 1;
		unrecv(now.cabin_door_updated, XX-1, 0, 0, 1);
		;
		;
		goto R999;

	case 18: // STATE 5
		;
		((P2 *)_this)->_11_4_1_DESTINATION_IS_BELOW = trpt->bup.oval;
		;
		goto R999;

	case 19: // STATE 6
		;
		((P2 *)_this)->_11_4_1_DESTINATION_IS_ABOVE = trpt->bup.oval;
		;
		goto R999;

	case 20: // STATE 7
		;
	/* 0 */	((P2 *)_this)->_11_4_1_DESTINATION_IS_BELOW = trpt->bup.oval;
		;
		;
		goto R999;

	case 21: // STATE 8
		;
		_m = unsend(now.move);
		;
		goto R999;

	case 22: // STATE 9
		;
		((P2 *)_this)->direction = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 23: // STATE 11
		;
	/* 0 */	((P2 *)_this)->_11_4_1_DESTINATION_IS_ABOVE = trpt->bup.oval;
		;
		;
		goto R999;

	case 24: // STATE 12
		;
		_m = unsend(now.move);
		;
		goto R999;

	case 25: // STATE 13
		;
		((P2 *)_this)->direction = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		
	case 27: // STATE 21
		;
		_m = unsend(now.move);
		;
		goto R999;

	case 28: // STATE 22
		;
		XX = 1;
		unrecv(now.floor_reached, XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 29: // STATE 23
		;
		now.current_floor = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 31: // STATE 26
		;
		_m = unsend(now.move);
		;
		goto R999;

	case 32: // STATE 27
		;
		XX = 1;
		unrecv(now.floor_reached, XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 33: // STATE 28
		;
		now.current_floor = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 35: // STATE 31
		;
		_m = unsend(now.move);
		;
		goto R999;

	case 36: // STATE 32
		;
		((P2 *)_this)->direction = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 37: // STATE 43
		;
		_m = unsend(now.update_cabin_door);
		;
		goto R999;

	case 38: // STATE 44
		;
		XX = 1;
		unrecv(now.cabin_door_updated, XX-1, 0, 1, 1);
		;
		;
		goto R999;
;
		;
		
	case 40: // STATE 46
		;
		now.floor_request_made[ Index(((P2 *)_this)->destination, 2) ] = trpt->bup.oval;
		;
		goto R999;

	case 41: // STATE 47
		;
		_m = unsend(now.served);
		;
		goto R999;

	case 42: // STATE 52
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC elevator_engine */

	case 43: // STATE 1
		;
		XX = 1;
		unrecv(now.move, XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 44: // STATE 2
		;
		_m = unsend(now.floor_reached);
		;
		goto R999;

	case 45: // STATE 3
		;
		XX = 1;
		unrecv(now.move, XX-1, 0, 0, 1);
		;
		;
		goto R999;

	case 46: // STATE 12
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC cabin_door */

	case 47: // STATE 1
		;
		XX = 1;
		unrecv(now.update_cabin_door, XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 48: // STATE 2
		;
		floor_door_is_open[ Index(now.current_floor, 2) ] = trpt->bup.oval;
		;
		goto R999;

	case 49: // STATE 3
		;
		now.cabin_door_is_open = trpt->bup.oval;
		;
		goto R999;

	case 50: // STATE 4
		;
		_m = unsend(now.cabin_door_updated);
		;
		goto R999;

	case 51: // STATE 6
		;
		XX = 1;
		unrecv(now.update_cabin_door, XX-1, 0, 0, 1);
		;
		;
		goto R999;

	case 52: // STATE 7
		;
		now.cabin_door_is_open = trpt->bup.oval;
		;
		goto R999;

	case 53: // STATE 8
		;
		floor_door_is_open[ Index(now.current_floor, 2) ] = trpt->bup.oval;
		;
		goto R999;

	case 54: // STATE 9
		;
		_m = unsend(now.cabin_door_updated);
		;
		goto R999;

	case 55: // STATE 14
		;
		p_restor(II);
		;
		;
		goto R999;
	}

