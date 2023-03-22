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

		 /* CLAIM b2 */
	case 3: // STATE 1 - _spin_nvr.tmp:3 - [(!((cabin_door_is_open==0)))] (0:0:0 - 1)
		
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
		if (!( !((((int)now.cabin_door_is_open)==0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 8 - _spin_nvr.tmp:8 - [(!((cabin_door_is_open==0)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported8 = 0;
			if (verbose && !reported8)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported8 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported8 = 0;
			if (verbose && !reported8)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported8 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[5][8] = 1;
		if (!( !((((int)now.cabin_door_is_open)==0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 13 - _spin_nvr.tmp:10 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported13 = 0;
			if (verbose && !reported13)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported13 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported13 = 0;
			if (verbose && !reported13)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported13 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[5][13] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC req_button */
	case 6: // STATE 1 - assignment2.pml:191 - [(!(floor_request_made[(_pid-4)]))] (0:0:0 - 1)
		IfNotBlocked
		reached[4][1] = 1;
		if (!( !(((int)now.floor_request_made[ Index((((int)((P4 *)_this)->_pid)-4), 2) ]))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 2 - assignment2.pml:194 - [assert(((0<=(_pid-4))&&((_pid-4)<2)))] (0:0:0 - 1)
		IfNotBlocked
		reached[4][2] = 1;
		spin_assert(((0<=(((int)((P4 *)_this)->_pid)-4))&&((((int)((P4 *)_this)->_pid)-4)<2)), "((0<=(_pid-4))&&((_pid-4)<2))", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 3 - assignment2.pml:195 - [request!(_pid-4)] (0:0:0 - 1)
		IfNotBlocked
		reached[4][3] = 1;
		if (q_full(now.request))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.request);
		sprintf(simtmp, "%d", (((int)((P4 *)_this)->_pid)-4)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.request, 0, (((int)((P4 *)_this)->_pid)-4), 1);
		if (q_zero(now.request)) { boq = now.request; };
		_m = 2; goto P999; /* 0 */
	case 9: // STATE 4 - assignment2.pml:196 - [floor_request_made[(_pid-4)] = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[4][4] = 1;
		(trpt+1)->bup.oval = ((int)now.floor_request_made[ Index((((int)((P4 *)_this)->_pid)-4), 2) ]);
		now.floor_request_made[ Index((((P4 *)_this)->_pid-4), 2) ] = 1;
#ifdef VAR_RANGES
		logval("floor_request_made[(_pid-4)]", ((int)now.floor_request_made[ Index((((int)((P4 *)_this)->_pid)-4), 2) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 10 - assignment2.pml:200 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[4][10] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC req_handler */
	case 11: // STATE 1 - assignment2.pml:178 - [request?destination] (0:0:1 - 1)
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
		logval("req_handler:destination", ((int)((P3 *)_this)->destination));
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
	case 12: // STATE 2 - assignment2.pml:179 - [go_to!destination] (0:0:0 - 1)
		IfNotBlocked
		reached[3][2] = 1;
		if (q_full(now.go_to))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go_to);
		sprintf(simtmp, "%d", ((int)((P3 *)_this)->destination)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go_to, 0, ((int)((P3 *)_this)->destination), 1);
		if (q_zero(now.go_to)) { boq = now.go_to; };
		_m = 2; goto P999; /* 0 */
	case 13: // STATE 3 - assignment2.pml:180 - [served?1] (0:0:0 - 1)
		reached[3][3] = 1;
		if (q_zero(now.served))
		{	if (boq != now.served) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.served) == 0) continue;

		XX=1;
		if (1 != qrecv(now.served, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.served-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.served, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.served);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.served))
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
	case 14: // STATE 8 - assignment2.pml:183 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[3][8] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC main_control */
	case 15: // STATE 1 - assignment2.pml:113 - [go_to?destination] (0:0:1 - 1)
		reached[2][1] = 1;
		if (q_zero(now.go_to))
		{	if (boq != now.go_to) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.go_to) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((int)((P2 *)_this)->destination);
		;
		((P2 *)_this)->destination = qrecv(now.go_to, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("main_control:destination", ((int)((P2 *)_this)->destination));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.go_to);
			sprintf(simtmp, "%d", ((int)((P2 *)_this)->destination)); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.go_to))
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
	case 16: // STATE 2 - assignment2.pml:115 - [update_cabin_door!0] (0:0:0 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		if (q_full(now.update_cabin_door))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.update_cabin_door);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.update_cabin_door, 0, 0, 1);
		if (q_zero(now.update_cabin_door)) { boq = now.update_cabin_door; };
		_m = 2; goto P999; /* 0 */
	case 17: // STATE 3 - assignment2.pml:116 - [cabin_door_updated?0] (0:0:0 - 1)
		reached[2][3] = 1;
		if (q_zero(now.cabin_door_updated))
		{	if (boq != now.cabin_door_updated) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.cabin_door_updated) == 0) continue;

		XX=1;
		if (0 != qrecv(now.cabin_door_updated, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.cabin_door_updated-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.cabin_door_updated, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.cabin_door_updated);
			sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.cabin_door_updated))
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
	case 18: // STATE 5 - assignment2.pml:121 - [DESTINATION_IS_BELOW = (current_floor>destination)] (0:0:1 - 1)
		IfNotBlocked
		reached[2][5] = 1;
		(trpt+1)->bup.oval = ((int)((P2 *)_this)->_11_4_1_DESTINATION_IS_BELOW);
		((P2 *)_this)->_11_4_1_DESTINATION_IS_BELOW = (((int)now.current_floor)>((int)((P2 *)_this)->destination));
#ifdef VAR_RANGES
		logval("main_control:DESTINATION_IS_BELOW", ((int)((P2 *)_this)->_11_4_1_DESTINATION_IS_BELOW));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 6 - assignment2.pml:122 - [DESTINATION_IS_ABOVE = (current_floor<destination)] (0:0:1 - 1)
		IfNotBlocked
		reached[2][6] = 1;
		(trpt+1)->bup.oval = ((int)((P2 *)_this)->_11_4_1_DESTINATION_IS_ABOVE);
		((P2 *)_this)->_11_4_1_DESTINATION_IS_ABOVE = (((int)now.current_floor)<((int)((P2 *)_this)->destination));
#ifdef VAR_RANGES
		logval("main_control:DESTINATION_IS_ABOVE", ((int)((P2 *)_this)->_11_4_1_DESTINATION_IS_ABOVE));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 7 - assignment2.pml:123 - [(DESTINATION_IS_BELOW)] (0:0:1 - 1)
		IfNotBlocked
		reached[2][7] = 1;
		if (!(((int)((P2 *)_this)->_11_4_1_DESTINATION_IS_BELOW)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _11_4_1_DESTINATION_IS_BELOW */  (trpt+1)->bup.oval = ((P2 *)_this)->_11_4_1_DESTINATION_IS_BELOW;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)_this)->_11_4_1_DESTINATION_IS_BELOW = 0;
		_m = 3; goto P999; /* 0 */
	case 21: // STATE 8 - assignment2.pml:124 - [move!1] (0:0:0 - 1)
		IfNotBlocked
		reached[2][8] = 1;
		if (q_full(now.move))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.move);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.move, 0, 1, 1);
		if (q_zero(now.move)) { boq = now.move; };
		_m = 2; goto P999; /* 0 */
	case 22: // STATE 9 - assignment2.pml:125 - [direction = down] (0:0:2 - 1)
		IfNotBlocked
		reached[2][9] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->direction;
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
		_m = 3; goto P999; /* 0 */
	case 23: // STATE 11 - assignment2.pml:127 - [(DESTINATION_IS_ABOVE)] (0:0:1 - 1)
		IfNotBlocked
		reached[2][11] = 1;
		if (!(((int)((P2 *)_this)->_11_4_1_DESTINATION_IS_ABOVE)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _11_4_1_DESTINATION_IS_ABOVE */  (trpt+1)->bup.oval = ((P2 *)_this)->_11_4_1_DESTINATION_IS_ABOVE;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)_this)->_11_4_1_DESTINATION_IS_ABOVE = 0;
		_m = 3; goto P999; /* 0 */
	case 24: // STATE 12 - assignment2.pml:128 - [move!1] (0:0:0 - 1)
		IfNotBlocked
		reached[2][12] = 1;
		if (q_full(now.move))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.move);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.move, 0, 1, 1);
		if (q_zero(now.move)) { boq = now.move; };
		_m = 2; goto P999; /* 0 */
	case 25: // STATE 13 - assignment2.pml:129 - [direction = up] (0:0:2 - 1)
		IfNotBlocked
		reached[2][13] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->direction;
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
		_m = 3; goto P999; /* 0 */
	case 26: // STATE 20 - assignment2.pml:137 - [((current_floor>destination))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][20] = 1;
		if (!((((int)now.current_floor)>((int)((P2 *)_this)->destination))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 27: // STATE 21 - assignment2.pml:138 - [move!1] (0:0:0 - 1)
		IfNotBlocked
		reached[2][21] = 1;
		if (q_full(now.move))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.move);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.move, 0, 1, 1);
		if (q_zero(now.move)) { boq = now.move; };
		_m = 2; goto P999; /* 0 */
	case 28: // STATE 22 - assignment2.pml:139 - [floor_reached?1] (0:0:0 - 1)
		reached[2][22] = 1;
		if (q_zero(now.floor_reached))
		{	if (boq != now.floor_reached) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.floor_reached) == 0) continue;

		XX=1;
		if (1 != qrecv(now.floor_reached, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.floor_reached-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.floor_reached, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.floor_reached);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.floor_reached))
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
	case 29: // STATE 23 - assignment2.pml:140 - [current_floor = (current_floor-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[2][23] = 1;
		(trpt+1)->bup.oval = ((int)now.current_floor);
		now.current_floor = (((int)now.current_floor)-1);
#ifdef VAR_RANGES
		logval("current_floor", ((int)now.current_floor));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 30: // STATE 25 - assignment2.pml:142 - [((current_floor<destination))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][25] = 1;
		if (!((((int)now.current_floor)<((int)((P2 *)_this)->destination))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 31: // STATE 26 - assignment2.pml:143 - [move!1] (0:0:0 - 1)
		IfNotBlocked
		reached[2][26] = 1;
		if (q_full(now.move))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.move);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.move, 0, 1, 1);
		if (q_zero(now.move)) { boq = now.move; };
		_m = 2; goto P999; /* 0 */
	case 32: // STATE 27 - assignment2.pml:144 - [floor_reached?1] (0:0:0 - 1)
		reached[2][27] = 1;
		if (q_zero(now.floor_reached))
		{	if (boq != now.floor_reached) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.floor_reached) == 0) continue;

		XX=1;
		if (1 != qrecv(now.floor_reached, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.floor_reached-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.floor_reached, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.floor_reached);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.floor_reached))
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
	case 33: // STATE 28 - assignment2.pml:145 - [current_floor = (current_floor+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[2][28] = 1;
		(trpt+1)->bup.oval = ((int)now.current_floor);
		now.current_floor = (((int)now.current_floor)+1);
#ifdef VAR_RANGES
		logval("current_floor", ((int)now.current_floor));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 34: // STATE 30 - assignment2.pml:147 - [((current_floor==destination))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][30] = 1;
		if (!((((int)now.current_floor)==((int)((P2 *)_this)->destination))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 35: // STATE 31 - assignment2.pml:148 - [move!0] (0:0:0 - 1)
		IfNotBlocked
		reached[2][31] = 1;
		if (q_full(now.move))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.move);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.move, 0, 0, 1);
		if (q_zero(now.move)) { boq = now.move; };
		_m = 2; goto P999; /* 0 */
	case 36: // STATE 32 - assignment2.pml:149 - [direction = none] (0:0:2 - 1)
		IfNotBlocked
		reached[2][32] = 1;
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
	case 37: // STATE 43 - assignment2.pml:159 - [update_cabin_door!1] (0:0:0 - 6)
		IfNotBlocked
		reached[2][43] = 1;
		if (q_full(now.update_cabin_door))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.update_cabin_door);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.update_cabin_door, 0, 1, 1);
		if (q_zero(now.update_cabin_door)) { boq = now.update_cabin_door; };
		_m = 2; goto P999; /* 0 */
	case 38: // STATE 44 - assignment2.pml:160 - [cabin_door_updated?1] (0:0:0 - 1)
		reached[2][44] = 1;
		if (q_zero(now.cabin_door_updated))
		{	if (boq != now.cabin_door_updated) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.cabin_door_updated) == 0) continue;

		XX=1;
		if (1 != qrecv(now.cabin_door_updated, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.cabin_door_updated-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.cabin_door_updated, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.cabin_door_updated);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.cabin_door_updated))
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
	case 39: // STATE 45 - assignment2.pml:163 - [assert(((0<=current_floor)&&(current_floor<2)))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][45] = 1;
		spin_assert(((0<=((int)now.current_floor))&&(((int)now.current_floor)<2)), "((0<=current_floor)&&(current_floor<2))", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 40: // STATE 46 - assignment2.pml:165 - [floor_request_made[destination] = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][46] = 1;
		(trpt+1)->bup.oval = ((int)now.floor_request_made[ Index(((int)((P2 *)_this)->destination), 2) ]);
		now.floor_request_made[ Index(((P2 *)_this)->destination, 2) ] = 0;
#ifdef VAR_RANGES
		logval("floor_request_made[main_control:destination]", ((int)now.floor_request_made[ Index(((int)((P2 *)_this)->destination), 2) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 41: // STATE 47 - assignment2.pml:166 - [served!1] (0:0:0 - 1)
		IfNotBlocked
		reached[2][47] = 1;
		if (q_full(now.served))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.served);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.served, 0, 1, 1);
		if (q_zero(now.served)) { boq = now.served; };
		_m = 2; goto P999; /* 0 */
	case 42: // STATE 52 - assignment2.pml:169 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][52] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC elevator_engine */
	case 43: // STATE 1 - assignment2.pml:96 - [move?1] (0:0:0 - 1)
		reached[1][1] = 1;
		if (q_zero(now.move))
		{	if (boq != now.move) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.move) == 0) continue;

		XX=1;
		if (1 != qrecv(now.move, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.move-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.move, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.move);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.move))
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
	case 44: // STATE 2 - assignment2.pml:98 - [floor_reached!1] (0:0:0 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		if (q_full(now.floor_reached))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.floor_reached);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.floor_reached, 0, 1, 1);
		if (q_zero(now.floor_reached)) { boq = now.floor_reached; };
		_m = 2; goto P999; /* 0 */
	case 45: // STATE 3 - assignment2.pml:99 - [move?0] (0:0:0 - 1)
		reached[1][3] = 1;
		if (q_zero(now.move))
		{	if (boq != now.move) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.move) == 0) continue;

		XX=1;
		if (0 != qrecv(now.move, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.move-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.move, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.move);
			sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.move))
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
	case 46: // STATE 12 - assignment2.pml:103 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][12] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC cabin_door */
	case 47: // STATE 1 - assignment2.pml:77 - [update_cabin_door?1] (0:0:0 - 1)
		reached[0][1] = 1;
		if (q_zero(now.update_cabin_door))
		{	if (boq != now.update_cabin_door) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.update_cabin_door) == 0) continue;

		XX=1;
		if (1 != qrecv(now.update_cabin_door, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.update_cabin_door-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.update_cabin_door, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.update_cabin_door);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.update_cabin_door))
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
	case 48: // STATE 2 - assignment2.pml:78 - [floor_door_is_open[current_floor] = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.oval = ((int)floor_door_is_open[ Index(((int)now.current_floor), 2) ]);
		floor_door_is_open[ Index(now.current_floor, 2) ] = 1;
#ifdef VAR_RANGES
		logval("floor_door_is_open[current_floor]", ((int)floor_door_is_open[ Index(((int)now.current_floor), 2) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 49: // STATE 3 - assignment2.pml:79 - [cabin_door_is_open = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		(trpt+1)->bup.oval = ((int)now.cabin_door_is_open);
		now.cabin_door_is_open = 1;
#ifdef VAR_RANGES
		logval("cabin_door_is_open", ((int)now.cabin_door_is_open));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 50: // STATE 4 - assignment2.pml:80 - [cabin_door_updated!1] (0:0:0 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		if (q_full(now.cabin_door_updated))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.cabin_door_updated);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.cabin_door_updated, 0, 1, 1);
		if (q_zero(now.cabin_door_updated)) { boq = now.cabin_door_updated; };
		_m = 2; goto P999; /* 0 */
	case 51: // STATE 6 - assignment2.pml:82 - [update_cabin_door?0] (0:0:0 - 1)
		reached[0][6] = 1;
		if (q_zero(now.update_cabin_door))
		{	if (boq != now.update_cabin_door) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.update_cabin_door) == 0) continue;

		XX=1;
		if (0 != qrecv(now.update_cabin_door, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.update_cabin_door-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.update_cabin_door, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.update_cabin_door);
			sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.update_cabin_door))
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
	case 52: // STATE 7 - assignment2.pml:83 - [cabin_door_is_open = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][7] = 1;
		(trpt+1)->bup.oval = ((int)now.cabin_door_is_open);
		now.cabin_door_is_open = 0;
#ifdef VAR_RANGES
		logval("cabin_door_is_open", ((int)now.cabin_door_is_open));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 53: // STATE 8 - assignment2.pml:84 - [floor_door_is_open[current_floor] = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][8] = 1;
		(trpt+1)->bup.oval = ((int)floor_door_is_open[ Index(((int)now.current_floor), 2) ]);
		floor_door_is_open[ Index(now.current_floor, 2) ] = 0;
#ifdef VAR_RANGES
		logval("floor_door_is_open[current_floor]", ((int)floor_door_is_open[ Index(((int)now.current_floor), 2) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 54: // STATE 9 - assignment2.pml:85 - [cabin_door_updated!0] (0:0:0 - 1)
		IfNotBlocked
		reached[0][9] = 1;
		if (q_full(now.cabin_door_updated))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.cabin_door_updated);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.cabin_door_updated, 0, 0, 1);
		if (q_zero(now.cabin_door_updated)) { boq = now.cabin_door_updated; };
		_m = 2; goto P999; /* 0 */
	case 55: // STATE 14 - assignment2.pml:88 - [-end-] (0:0:0 - 1)
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

