mtype = {P , C};
mtype turn = P;
int count  = 0;
active proctype producer(){
	do
	::  ( turn == P ) ->
		count ++;
		printf( "Produce\n");
		count --;
		turn = C;
		
	od
}
active proctype consumer(){
	do
	:: (turn == C) ->
		count ++;
		printf (" Consume\n");
		count --;
		turn = P;
		
	od
}
active proctype monitor(){
	assert(count == 0 || count == 1);
}
