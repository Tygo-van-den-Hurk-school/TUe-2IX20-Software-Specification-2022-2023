#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* CLAIM h */
	case 3: // STATE 1 - _spin_nvr.tmp:4 - [(!((floor_request_made[(4-1)]==1)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[5][1] = 1;
		if (!( !((((int)now.floor_request_made[ Index((4-1), 4) ])==1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 6 - _spin_nvr.tmp:6 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported6 = 0;
			if (verbose && !reported6)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported6 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported6 = 0;
			if (verbose && !reported6)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported6 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[5][6] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC request_button */
	case 5: // STATE 1 - assignment2part2.pml:250 - [(!(floor_request_made[((((_pid-2)-2)-2)-1)]))] (0:0:0 - 1)
		IfNotBlocked
		reached[4][1] = 1;
		if (!( !(((int)now.floor_request_made[ Index(((((((int)((P4 *)_this)->_pid)-2)-2)-2)-1), 4) ]))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 2 - assignment2part2.pml:254 - [NON_NEGATIVE_CURRENT_FLOOR = (((((_pid-2)-2)-2)-1)>=0)] (0:9:3 - 1)
		IfNotBlocked
		reached[4][2] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)((P4 *)_this)->_14_6_3_NON_NEGATIVE_CURRENT_FLOOR);
		((P4 *)_this)->_14_6_3_NON_NEGATIVE_CURRENT_FLOOR = (((((((int)((P4 *)_this)->_pid)-2)-2)-2)-1)>=0);
#ifdef VAR_RANGES
		logval("request_button:NON_NEGATIVE_CURRENT_FLOOR", ((int)((P4 *)_this)->_14_6_3_NON_NEGATIVE_CURRENT_FLOOR));
#endif
		;
		/* merge: NOT_TOO_HIGH_CURRENT_FLOOR = (((((_pid-2)-2)-2)-1)<=4)(9, 3, 9) */
		reached[4][3] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P4 *)_this)->_14_6_3_NOT_TOO_HIGH_CURRENT_FLOOR);
		((P4 *)_this)->_14_6_3_NOT_TOO_HIGH_CURRENT_FLOOR = (((((((int)((P4 *)_this)->_pid)-2)-2)-2)-1)<=4);
#ifdef VAR_RANGES
		logval("request_button:NOT_TOO_HIGH_CURRENT_FLOOR", ((int)((P4 *)_this)->_14_6_3_NOT_TOO_HIGH_CURRENT_FLOOR));
#endif
		;
		/* merge: CURRENT_FLOOR_WITHIN_BOUNDS = (NON_NEGATIVE_CURRENT_FLOOR&&NOT_TOO_HIGH_CURRENT_FLOOR)(9, 4, 9) */
		reached[4][4] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P4 *)_this)->_14_6_3_CURRENT_FLOOR_WITHIN_BOUNDS);
		((P4 *)_this)->_14_6_3_CURRENT_FLOOR_WITHIN_BOUNDS = (((int)((P4 *)_this)->_14_6_3_NON_NEGATIVE_CURRENT_FLOOR)&&((int)((P4 *)_this)->_14_6_3_NOT_TOO_HIGH_CURRENT_FLOOR));
#ifdef VAR_RANGES
		logval("request_button:CURRENT_FLOOR_WITHIN_BOUNDS", ((int)((P4 *)_this)->_14_6_3_CURRENT_FLOOR_WITHIN_BOUNDS));
#endif
		;
		/* merge: assert(CURRENT_FLOOR_WITHIN_BOUNDS)(9, 5, 9) */
		reached[4][5] = 1;
		spin_assert(((int)((P4 *)_this)->_14_6_3_CURRENT_FLOOR_WITHIN_BOUNDS), "CURRENT_FLOOR_WITHIN_BOUNDS", II, tt, t);
		_m = 3; goto P999; /* 3 */
	case 7: // STATE 7 - assignment2part2.pml:264 - [request!((((_pid-2)-2)-2)-1)] (0:0:0 - 1)
		IfNotBlocked
		reached[4][7] = 1;
		if (q_full(now.request))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.request);
		sprintf(simtmp, "%d", ((((((int)((P4 *)_this)->_pid)-2)-2)-2)-1)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.request, 0, ((((((int)((P4 *)_this)->_pid)-2)-2)-2)-1), 1);
		if (q_zero(now.request)) { boq = now.request; };
		_m = 2; goto P999; /* 0 */
	case 8: // STATE 8 - assignment2part2.pml:265 - [floor_request_made[((((_pid-2)-2)-2)-1)] = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[4][8] = 1;
		(trpt+1)->bup.oval = ((int)now.floor_request_made[ Index(((((((int)((P4 *)_this)->_pid)-2)-2)-2)-1), 4) ]);
		now.floor_request_made[ Index(((((((P4 *)_this)->_pid-2)-2)-2)-1), 4) ] = 1;
#ifdef VAR_RANGES
		logval("floor_request_made[((((_pid-2)-2)-2)-1)]", ((int)now.floor_request_made[ Index(((((((int)((P4 *)_this)->_pid)-2)-2)-2)-1), 4) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 14 - assignment2part2.pml:269 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[4][14] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC request_handler */
	case 10: // STATE 1 - assignment2part2.pml:236 - [request?destination] (0:0:1 - 1)
		reached[3][1] = 1;
		if (q_zero(now.request))
		{	if (boq != now.request) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.request) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((int)((P3 *)_this)->destination);
		;
		((P3 *)_this)->destination = qrecv(now.request, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("request_handler:destination", ((int)((P3 *)_this)->destination));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.request);
			sprintf(simtmp, "%d", ((int)((P3 *)_this)->destination)); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.request))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 11: // STATE 2 - assignment2part2.pml:237 - [served[nextElevatorID]?1] (0:0:0 - 1)
		reached[3][2] = 1;
		if (q_zero(now.served[ Index(((int)((P3 *)_this)->nextElevatorID), 2) ]))
		{	if (boq != now.served[ Index(((int)((P3 *)_this)->nextElevatorID), 2) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.served[ Index(((int)((P3 *)_this)->nextElevatorID), 2) ]) == 0) continue;

		XX=1;
		if (1 != qrecv(now.served[ Index(((int)((P3 *)_this)->nextElevatorID), 2) ], 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.served[ Index(((int)((P3 *)_this)->nextElevatorID), 2) ]-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.served[ Index(((int)((P3 *)_this)->nextElevatorID), 2) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.served[ Index(((int)((P3 *)_this)->nextElevatorID), 2) ]);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.served[ Index(((int)((P3 *)_this)->nextElevatorID), 2) ]))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 12: // STATE 3 - assignment2part2.pml:238 - [go_to[nextElevatorID]!destination] (0:0:0 - 1)
		IfNotBlocked
		reached[3][3] = 1;
		if (q_full(now.go_to[ Index(((int)((P3 *)_this)->nextElevatorID), 2) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go_to[ Index(((int)((P3 *)_this)->nextElevatorID), 2) ]);
		sprintf(simtmp, "%d", ((int)((P3 *)_this)->destination)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go_to[ Index(((int)((P3 *)_this)->nextElevatorID), 2) ], 0, ((int)((P3 *)_this)->destination), 1);
		if (q_zero(now.go_to[ Index(((int)((P3 *)_this)->nextElevatorID), 2) ])) { boq = now.go_to[ Index(((int)((P3 *)_this)->nextElevatorID), 2) ]; };
		_m = 2; goto P999; /* 0 */
	case 13: // STATE 4 - assignment2part2.pml:239 - [nextElevatorID = ((nextElevatorID+1)%2)] (0:0:1 - 1)
		IfNotBlocked
		reached[3][4] = 1;
		(trpt+1)->bup.oval = ((int)((P3 *)_this)->nextElevatorID);
		((P3 *)_this)->nextElevatorID = ((((int)((P3 *)_this)->nextElevatorID)+1)%2);
#ifdef VAR_RANGES
		logval("request_handler:nextElevatorID", ((int)((P3 *)_this)->nextElevatorID));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 9 - assignment2part2.pml:242 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[3][9] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC main_control */
	case 15: // STATE 1 - assignment2part2.pml:162 - [served[ELEVATOR_SHAFT]!1] (0:0:0 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		if (q_full(now.served[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.served[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.served[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ], 0, 1, 1);
		if (q_zero(now.served[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ])) { boq = now.served[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]; };
		_m = 2; goto P999; /* 0 */
	case 16: // STATE 2 - assignment2part2.pml:165 - [destination = 0] (0:54:2 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P2 *)_this)->destination);
		((P2 *)_this)->destination = 0;
#ifdef VAR_RANGES
		logval("main_control:destination", ((int)((P2 *)_this)->destination));
#endif
		;
		/* merge: direction = 0(54, 3, 54) */
		reached[2][3] = 1;
		(trpt+1)->bup.ovals[1] = ((P2 *)_this)->direction;
		((P2 *)_this)->direction = 0;
#ifdef VAR_RANGES
		logval("main_control:direction", ((P2 *)_this)->direction);
#endif
		;
		/* merge: .(goto)(0, 55, 54) */
		reached[2][55] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 17: // STATE 5 - assignment2part2.pml:167 - [go_to[ELEVATOR_SHAFT]?destination] (0:0:1 - 1)
		reached[2][5] = 1;
		if (q_zero(now.go_to[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]))
		{	if (boq != now.go_to[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.go_to[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((int)((P2 *)_this)->destination);
		;
		((P2 *)_this)->destination = qrecv(now.go_to[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ], XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("main_control:destination", ((int)((P2 *)_this)->destination));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.go_to[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]);
			sprintf(simtmp, "%d", ((int)((P2 *)_this)->destination)); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.go_to[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 18: // STATE 6 - assignment2part2.pml:170 - [update_cabin_door[ELEVATOR_SHAFT]!0] (0:0:0 - 1)
		IfNotBlocked
		reached[2][6] = 1;
		if (q_full(now.update_cabin_door[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.update_cabin_door[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.update_cabin_door[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ], 0, 0, 1);
		if (q_zero(now.update_cabin_door[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ])) { boq = now.update_cabin_door[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]; };
		_m = 2; goto P999; /* 0 */
	case 19: // STATE 7 - assignment2part2.pml:171 - [cabin_door_updated[ELEVATOR_SHAFT]?0] (0:0:0 - 1)
		reached[2][7] = 1;
		if (q_zero(now.cabin_door_updated[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]))
		{	if (boq != now.cabin_door_updated[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.cabin_door_updated[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]) == 0) continue;

		XX=1;
		if (0 != qrecv(now.cabin_door_updated[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ], 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.cabin_door_updated[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.cabin_door_updated[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.cabin_door_updated[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]);
			sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.cabin_door_updated[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 20: // STATE 9 - assignment2part2.pml:177 - [DESTINATION_IS_BELOW = (current_floor[ELEVATOR_SHAFT]>destination)] (0:0:1 - 1)
		IfNotBlocked
		reached[2][9] = 1;
		(trpt+1)->bup.oval = ((int)((P2 *)_this)->_12_4_1_DESTINATION_IS_BELOW);
		((P2 *)_this)->_12_4_1_DESTINATION_IS_BELOW = (((int)now.current_floor[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ])>((int)((P2 *)_this)->destination));
#ifdef VAR_RANGES
		logval("main_control:DESTINATION_IS_BELOW", ((int)((P2 *)_this)->_12_4_1_DESTINATION_IS_BELOW));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 21: // STATE 10 - assignment2part2.pml:178 - [DESTINATION_IS_ABOVE = (current_floor[ELEVATOR_SHAFT]<destination)] (0:0:1 - 1)
		IfNotBlocked
		reached[2][10] = 1;
		(trpt+1)->bup.oval = ((int)((P2 *)_this)->_12_4_1_DESTINATION_IS_ABOVE);
		((P2 *)_this)->_12_4_1_DESTINATION_IS_ABOVE = (((int)now.current_floor[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ])<((int)((P2 *)_this)->destination));
#ifdef VAR_RANGES
		logval("main_control:DESTINATION_IS_ABOVE", ((int)((P2 *)_this)->_12_4_1_DESTINATION_IS_ABOVE));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 11 - assignment2part2.pml:180 - [(DESTINATION_IS_BELOW)] (19:0:3 - 1)
		IfNotBlocked
		reached[2][11] = 1;
		if (!(((int)((P2 *)_this)->_12_4_1_DESTINATION_IS_BELOW)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _12_4_1_DESTINATION_IS_BELOW */  (trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->_12_4_1_DESTINATION_IS_BELOW;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)_this)->_12_4_1_DESTINATION_IS_BELOW = 0;
		/* merge: direction = down(0, 12, 19) */
		reached[2][12] = 1;
		(trpt+1)->bup.ovals[1] = ((P2 *)_this)->direction;
		((P2 *)_this)->direction = 3;
#ifdef VAR_RANGES
		logval("main_control:direction", ((P2 *)_this)->direction);
#endif
		;
		if (TstOnly) return 1; /* TT */
		/* dead 2: direction */  
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)_this)->direction = 0;
		/* merge: .(goto)(0, 18, 19) */
		reached[2][18] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 23: // STATE 13 - assignment2part2.pml:181 - [(DESTINATION_IS_ABOVE)] (19:0:3 - 1)
		IfNotBlocked
		reached[2][13] = 1;
		if (!(((int)((P2 *)_this)->_12_4_1_DESTINATION_IS_ABOVE)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _12_4_1_DESTINATION_IS_ABOVE */  (trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->_12_4_1_DESTINATION_IS_ABOVE;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)_this)->_12_4_1_DESTINATION_IS_ABOVE = 0;
		/* merge: direction = up(0, 14, 19) */
		reached[2][14] = 1;
		(trpt+1)->bup.ovals[1] = ((P2 *)_this)->direction;
		((P2 *)_this)->direction = 2;
#ifdef VAR_RANGES
		logval("main_control:direction", ((P2 *)_this)->direction);
#endif
		;
		if (TstOnly) return 1; /* TT */
		/* dead 2: direction */  
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)_this)->direction = 0;
		/* merge: .(goto)(0, 18, 19) */
		reached[2][18] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 24: // STATE 19 - assignment2part2.pml:185 - [move[ELEVATOR_SHAFT]!1] (0:0:0 - 3)
		IfNotBlocked
		reached[2][19] = 1;
		if (q_full(now.move[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.move[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.move[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ], 0, 1, 1);
		if (q_zero(now.move[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ])) { boq = now.move[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]; };
		_m = 2; goto P999; /* 0 */
	case 25: // STATE 20 - assignment2part2.pml:188 - [((current_floor[ELEVATOR_SHAFT]>destination))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][20] = 1;
		if (!((((int)now.current_floor[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ])>((int)((P2 *)_this)->destination))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 26: // STATE 21 - assignment2part2.pml:189 - [floor_reached[ELEVATOR_SHAFT]?1] (0:0:0 - 1)
		reached[2][21] = 1;
		if (q_zero(now.floor_reached[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]))
		{	if (boq != now.floor_reached[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.floor_reached[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]) == 0) continue;

		XX=1;
		if (1 != qrecv(now.floor_reached[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ], 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.floor_reached[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.floor_reached[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.floor_reached[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.floor_reached[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 27: // STATE 22 - assignment2part2.pml:190 - [current_floor[ELEVATOR_SHAFT] = (current_floor[ELEVATOR_SHAFT]-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[2][22] = 1;
		(trpt+1)->bup.oval = ((int)now.current_floor[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]);
		now.current_floor[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ] = (((int)now.current_floor[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ])-1);
#ifdef VAR_RANGES
		logval("current_floor[main_control:ELEVATOR_SHAFT]", ((int)now.current_floor[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 28: // STATE 24 - assignment2part2.pml:192 - [((current_floor[ELEVATOR_SHAFT]<destination))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][24] = 1;
		if (!((((int)now.current_floor[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ])<((int)((P2 *)_this)->destination))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 29: // STATE 25 - assignment2part2.pml:193 - [floor_reached[ELEVATOR_SHAFT]?1] (0:0:0 - 1)
		reached[2][25] = 1;
		if (q_zero(now.floor_reached[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]))
		{	if (boq != now.floor_reached[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.floor_reached[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]) == 0) continue;

		XX=1;
		if (1 != qrecv(now.floor_reached[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ], 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.floor_reached[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.floor_reached[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.floor_reached[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.floor_reached[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 30: // STATE 26 - assignment2part2.pml:194 - [current_floor[ELEVATOR_SHAFT] = (current_floor[ELEVATOR_SHAFT]+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[2][26] = 1;
		(trpt+1)->bup.oval = ((int)now.current_floor[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]);
		now.current_floor[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ] = (((int)now.current_floor[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ])+1);
#ifdef VAR_RANGES
		logval("current_floor[main_control:ELEVATOR_SHAFT]", ((int)now.current_floor[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 31: // STATE 28 - assignment2part2.pml:196 - [((current_floor[ELEVATOR_SHAFT]==destination))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][28] = 1;
		if (!((((int)now.current_floor[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ])==((int)((P2 *)_this)->destination))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 32: // STATE 29 - assignment2part2.pml:197 - [move[ELEVATOR_SHAFT]!0] (0:0:0 - 1)
		IfNotBlocked
		reached[2][29] = 1;
		if (q_full(now.move[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.move[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.move[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ], 0, 0, 1);
		if (q_zero(now.move[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ])) { boq = now.move[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]; };
		_m = 2; goto P999; /* 0 */
	case 33: // STATE 30 - assignment2part2.pml:198 - [direction = none] (0:0:2 - 1)
		IfNotBlocked
		reached[2][30] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->direction;
		((P2 *)_this)->direction = 1;
#ifdef VAR_RANGES
		logval("main_control:direction", ((P2 *)_this)->direction);
#endif
		;
		if (TstOnly) return 1; /* TT */
		/* dead 2: direction */  
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)_this)->direction = 0;
		_m = 3; goto P999; /* 0 */
	case 34: // STATE 41 - assignment2part2.pml:208 - [update_cabin_door[ELEVATOR_SHAFT]!1] (0:0:0 - 7)
		IfNotBlocked
		reached[2][41] = 1;
		if (q_full(now.update_cabin_door[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.update_cabin_door[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.update_cabin_door[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ], 0, 1, 1);
		if (q_zero(now.update_cabin_door[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ])) { boq = now.update_cabin_door[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]; };
		_m = 2; goto P999; /* 0 */
	case 35: // STATE 42 - assignment2part2.pml:209 - [cabin_door_updated[ELEVATOR_SHAFT]?1] (0:0:0 - 1)
		reached[2][42] = 1;
		if (q_zero(now.cabin_door_updated[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]))
		{	if (boq != now.cabin_door_updated[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.cabin_door_updated[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]) == 0) continue;

		XX=1;
		if (1 != qrecv(now.cabin_door_updated[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ], 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.cabin_door_updated[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.cabin_door_updated[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.cabin_door_updated[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.cabin_door_updated[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 36: // STATE 43 - assignment2part2.pml:211 - [floor_request_made[destination] = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][43] = 1;
		(trpt+1)->bup.oval = ((int)now.floor_request_made[ Index(((int)((P2 *)_this)->destination), 4) ]);
		now.floor_request_made[ Index(((P2 *)_this)->destination, 4) ] = 0;
#ifdef VAR_RANGES
		logval("floor_request_made[main_control:destination]", ((int)now.floor_request_made[ Index(((int)((P2 *)_this)->destination), 4) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 37: // STATE 44 - assignment2part2.pml:212 - [served[ELEVATOR_SHAFT]!1] (0:0:0 - 1)
		IfNotBlocked
		reached[2][44] = 1;
		if (q_full(now.served[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.served[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.served[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ], 0, 1, 1);
		if (q_zero(now.served[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ])) { boq = now.served[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ]; };
		_m = 2; goto P999; /* 0 */
	case 38: // STATE 45 - assignment2part2.pml:216 - [CORRECT_FLOOR = (current_floor[ELEVATOR_SHAFT]==destination)] (0:0:1 - 1)
		IfNotBlocked
		reached[2][45] = 1;
		(trpt+1)->bup.oval = ((int)((P2 *)_this)->_12_4_CORRECT_FLOOR);
		((P2 *)_this)->_12_4_CORRECT_FLOOR = (((int)now.current_floor[ Index(((P2 *)_this)->ELEVATOR_SHAFT, 2) ])==((int)((P2 *)_this)->destination));
#ifdef VAR_RANGES
		logval("main_control:CORRECT_FLOOR", ((int)((P2 *)_this)->_12_4_CORRECT_FLOOR));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 39: // STATE 46 - assignment2part2.pml:216 - [assert(CORRECT_FLOOR)] (0:0:0 - 1)
		IfNotBlocked
		reached[2][46] = 1;
		spin_assert(((int)((P2 *)_this)->_12_4_CORRECT_FLOOR), "CORRECT_FLOOR", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 40: // STATE 47 - assignment2part2.pml:219 - [(!(used))] (0:0:1 - 1)
		IfNotBlocked
		reached[2][47] = 1;
		if (!( !(((int)((P2 *)_this)->used))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: used */  (trpt+1)->bup.oval = ((P2 *)_this)->used;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)_this)->used = 0;
		_m = 3; goto P999; /* 0 */
	case 41: // STATE 48 - assignment2part2.pml:220 - [used = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[2][48] = 1;
		(trpt+1)->bup.oval = ((int)((P2 *)_this)->used);
		((P2 *)_this)->used = 1;
#ifdef VAR_RANGES
		logval("main_control:used", ((int)((P2 *)_this)->used));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 42: // STATE 49 - assignment2part2.pml:221 - [elevatorsUsed = (elevatorsUsed+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[2][49] = 1;
		(trpt+1)->bup.oval = elevatorsUsed;
		elevatorsUsed = (elevatorsUsed+1);
#ifdef VAR_RANGES
		logval("elevatorsUsed", elevatorsUsed);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 43: // STATE 57 - assignment2part2.pml:226 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][57] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC elevator_engine */
	case 44: // STATE 1 - assignment2part2.pml:144 - [move[ELEVATOR_SHAFT]?1] (0:0:0 - 1)
		reached[1][1] = 1;
		if (q_zero(now.move[ Index(((P1 *)_this)->ELEVATOR_SHAFT, 2) ]))
		{	if (boq != now.move[ Index(((P1 *)_this)->ELEVATOR_SHAFT, 2) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.move[ Index(((P1 *)_this)->ELEVATOR_SHAFT, 2) ]) == 0) continue;

		XX=1;
		if (1 != qrecv(now.move[ Index(((P1 *)_this)->ELEVATOR_SHAFT, 2) ], 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.move[ Index(((P1 *)_this)->ELEVATOR_SHAFT, 2) ]-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.move[ Index(((P1 *)_this)->ELEVATOR_SHAFT, 2) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.move[ Index(((P1 *)_this)->ELEVATOR_SHAFT, 2) ]);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.move[ Index(((P1 *)_this)->ELEVATOR_SHAFT, 2) ]))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 45: // STATE 2 - assignment2part2.pml:146 - [move[ELEVATOR_SHAFT]?0] (0:0:0 - 1)
		reached[1][2] = 1;
		if (q_zero(now.move[ Index(((P1 *)_this)->ELEVATOR_SHAFT, 2) ]))
		{	if (boq != now.move[ Index(((P1 *)_this)->ELEVATOR_SHAFT, 2) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.move[ Index(((P1 *)_this)->ELEVATOR_SHAFT, 2) ]) == 0) continue;

		XX=1;
		if (0 != qrecv(now.move[ Index(((P1 *)_this)->ELEVATOR_SHAFT, 2) ], 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.move[ Index(((P1 *)_this)->ELEVATOR_SHAFT, 2) ]-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.move[ Index(((P1 *)_this)->ELEVATOR_SHAFT, 2) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.move[ Index(((P1 *)_this)->ELEVATOR_SHAFT, 2) ]);
			sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.move[ Index(((P1 *)_this)->ELEVATOR_SHAFT, 2) ]))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 46: // STATE 4 - assignment2part2.pml:147 - [floor_reached[ELEVATOR_SHAFT]!1] (0:0:0 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		if (q_full(now.floor_reached[ Index(((P1 *)_this)->ELEVATOR_SHAFT, 2) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.floor_reached[ Index(((P1 *)_this)->ELEVATOR_SHAFT, 2) ]);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.floor_reached[ Index(((P1 *)_this)->ELEVATOR_SHAFT, 2) ], 0, 1, 1);
		if (q_zero(now.floor_reached[ Index(((P1 *)_this)->ELEVATOR_SHAFT, 2) ])) { boq = now.floor_reached[ Index(((P1 *)_this)->ELEVATOR_SHAFT, 2) ]; };
		_m = 2; goto P999; /* 0 */
	case 47: // STATE 12 - assignment2part2.pml:151 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][12] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC cabin_door */
	case 48: // STATE 1 - assignment2part2.pml:124 - [update_cabin_door[ELEVATOR_SHAFT]?1] (0:0:0 - 1)
		reached[0][1] = 1;
		if (q_zero(now.update_cabin_door[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ]))
		{	if (boq != now.update_cabin_door[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.update_cabin_door[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ]) == 0) continue;

		XX=1;
		if (1 != qrecv(now.update_cabin_door[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ], 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.update_cabin_door[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ]-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.update_cabin_door[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.update_cabin_door[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ]);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.update_cabin_door[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ]))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 49: // STATE 2 - assignment2part2.pml:125 - [floor_door_is_open[ELEVATOR_SHAFT].floor[current_floor[ELEVATOR_SHAFT]] = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.oval = ((int)now.floor_door_is_open[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ].floor[ Index(((int)now.current_floor[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ]), 4) ]);
		now.floor_door_is_open[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ].floor[ Index(now.current_floor[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ], 4) ] = 1;
#ifdef VAR_RANGES
		logval("floor_door_is_open[cabin_door:ELEVATOR_SHAFT].floor[current_floor[cabin_door:ELEVATOR_SHAFT]]", ((int)now.floor_door_is_open[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ].floor[ Index(((int)now.current_floor[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ]), 4) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 50: // STATE 3 - assignment2part2.pml:126 - [cabin_door_is_open[ELEVATOR_SHAFT] = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		(trpt+1)->bup.oval = ((int)cabin_door_is_open[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ]);
		cabin_door_is_open[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ] = 1;
#ifdef VAR_RANGES
		logval("cabin_door_is_open[cabin_door:ELEVATOR_SHAFT]", ((int)cabin_door_is_open[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 51: // STATE 4 - assignment2part2.pml:127 - [cabin_door_updated[ELEVATOR_SHAFT]!1] (0:0:0 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		if (q_full(now.cabin_door_updated[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.cabin_door_updated[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ]);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.cabin_door_updated[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ], 0, 1, 1);
		if (q_zero(now.cabin_door_updated[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ])) { boq = now.cabin_door_updated[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ]; };
		_m = 2; goto P999; /* 0 */
	case 52: // STATE 6 - assignment2part2.pml:129 - [update_cabin_door[ELEVATOR_SHAFT]?0] (0:0:0 - 1)
		reached[0][6] = 1;
		if (q_zero(now.update_cabin_door[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ]))
		{	if (boq != now.update_cabin_door[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.update_cabin_door[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ]) == 0) continue;

		XX=1;
		if (0 != qrecv(now.update_cabin_door[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ], 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.update_cabin_door[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ]-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.update_cabin_door[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.update_cabin_door[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ]);
			sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.update_cabin_door[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ]))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 53: // STATE 7 - assignment2part2.pml:130 - [cabin_door_is_open[ELEVATOR_SHAFT] = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][7] = 1;
		(trpt+1)->bup.oval = ((int)cabin_door_is_open[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ]);
		cabin_door_is_open[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ] = 0;
#ifdef VAR_RANGES
		logval("cabin_door_is_open[cabin_door:ELEVATOR_SHAFT]", ((int)cabin_door_is_open[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 54: // STATE 8 - assignment2part2.pml:131 - [floor_door_is_open[ELEVATOR_SHAFT].floor[current_floor[ELEVATOR_SHAFT]] = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][8] = 1;
		(trpt+1)->bup.oval = ((int)now.floor_door_is_open[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ].floor[ Index(((int)now.current_floor[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ]), 4) ]);
		now.floor_door_is_open[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ].floor[ Index(now.current_floor[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ], 4) ] = 0;
#ifdef VAR_RANGES
		logval("floor_door_is_open[cabin_door:ELEVATOR_SHAFT].floor[current_floor[cabin_door:ELEVATOR_SHAFT]]", ((int)now.floor_door_is_open[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ].floor[ Index(((int)now.current_floor[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ]), 4) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 55: // STATE 9 - assignment2part2.pml:132 - [cabin_door_updated[ELEVATOR_SHAFT]!0] (0:0:0 - 1)
		IfNotBlocked
		reached[0][9] = 1;
		if (q_full(now.cabin_door_updated[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.cabin_door_updated[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ]);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.cabin_door_updated[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ], 0, 0, 1);
		if (q_zero(now.cabin_door_updated[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ])) { boq = now.cabin_door_updated[ Index(((P0 *)_this)->ELEVATOR_SHAFT, 2) ]; };
		_m = 2; goto P999; /* 0 */
	case 56: // STATE 14 - assignment2part2.pml:135 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][14] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

