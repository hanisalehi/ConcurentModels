	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC R */

	case 3: // STATE 1
		;
		XX = 1;
		unrecv(now.sync_R_Q, XX-1, 0, 0, 1);
		;
		;
		goto R999;
;
		;
		
	case 5: // STATE 3
		;
		_m = unsend(now.sync_P_R);
		;
		goto R999;

	case 6: // STATE 4
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Q */

	case 7: // STATE 1
		;
		XX = 1;
		unrecv(now.sync_P_Q, XX-1, 0, 0, 1);
		;
		;
		goto R999;
;
		
	case 8: // STATE 2
		goto R999;

	case 9: // STATE 4
		;
		_m = unsend(now.sync_R_Q);
		;
		goto R999;

	case 10: // STATE 5
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC P */

	case 11: // STATE 1
		;
		XX = 1;
		unrecv(now.sync_P_R, XX-1, 0, 0, 1);
		;
		;
		goto R999;
;
		;
		
	case 13: // STATE 3
		;
		_m = unsend(now.sync_P_Q);
		;
		goto R999;

	case 14: // STATE 4
		;
		p_restor(II);
		;
		;
		goto R999;
	}

