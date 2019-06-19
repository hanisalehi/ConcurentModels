chan sync_P_Q = [0] of  {int};
chan sync_P_R = [0] of {int};
chan sync_R_Q = [0] of {int};

active proctype P()
{
	sync_P_R ? 0;
	printf("End of P");
	sync_P_Q ! 0;
}
active proctype Q()
{
	sync_P_Q ? 0;
	skip;
	printf("End of Q");
	sync_R_Q ! 0;
}
active proctype R()
{
	sync_R_Q ? 0;
	printf("End of R");
	sync_P_R ! 0;
}
