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

		 /* PROC R */
	case 3: // STATE 1 - sample3.pml:20 - [sync_R_Q?0] (0:0:0 - 1)
		reached[2][1] = 1;
		if (boq != now.sync_R_Q) continue;
		if (q_len(now.sync_R_Q) == 0) continue;

		XX=1;
		if (0 != qrecv(now.sync_R_Q, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.sync_R_Q-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.sync_R_Q, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.sync_R_Q);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.sync_R_Q))
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
	case 4: // STATE 2 - sample3.pml:21 - [printf('End of R')] (0:0:0 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		Printf("End of R");
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 3 - sample3.pml:22 - [sync_P_R!0] (0:0:0 - 1)
		IfNotBlocked
		reached[2][3] = 1;
		if (q_len(now.sync_P_R))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.sync_P_R);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.sync_P_R, 0, 0, 1);
		{ boq = now.sync_P_R; };
		_m = 2; goto P999; /* 0 */
	case 6: // STATE 4 - sample3.pml:23 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][4] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Q */
	case 7: // STATE 1 - sample3.pml:13 - [sync_P_Q?0] (0:0:0 - 1)
		reached[1][1] = 1;
		if (boq != now.sync_P_Q) continue;
		if (q_len(now.sync_P_Q) == 0) continue;

		XX=1;
		if (0 != qrecv(now.sync_P_Q, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.sync_P_Q-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.sync_P_Q, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.sync_P_Q);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.sync_P_Q))
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
	case 8: // STATE 2 - sample3.pml:14 - [(1)] (4:0:0 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		if (!(1))
			continue;
		/* merge: printf('End of Q')(0, 3, 4) */
		reached[1][3] = 1;
		Printf("End of Q");
		_m = 3; goto P999; /* 1 */
	case 9: // STATE 4 - sample3.pml:16 - [sync_R_Q!0] (0:0:0 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		if (q_len(now.sync_R_Q))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.sync_R_Q);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.sync_R_Q, 0, 0, 1);
		{ boq = now.sync_R_Q; };
		_m = 2; goto P999; /* 0 */
	case 10: // STATE 5 - sample3.pml:17 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC P */
	case 11: // STATE 1 - sample3.pml:7 - [sync_P_R?0] (0:0:0 - 1)
		reached[0][1] = 1;
		if (boq != now.sync_P_R) continue;
		if (q_len(now.sync_P_R) == 0) continue;

		XX=1;
		if (0 != qrecv(now.sync_P_R, 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.sync_P_R-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.sync_P_R, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.sync_P_R);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.sync_P_R))
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
	case 12: // STATE 2 - sample3.pml:8 - [printf('End of P')] (0:0:0 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		Printf("End of P");
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 3 - sample3.pml:9 - [sync_P_Q!0] (0:0:0 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		if (q_len(now.sync_P_Q))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.sync_P_Q);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.sync_P_Q, 0, 0, 1);
		{ boq = now.sync_P_Q; };
		_m = 2; goto P999; /* 0 */
	case 14: // STATE 4 - sample3.pml:10 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][4] = 1;
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

