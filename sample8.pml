 init
 {
       chan ret_main = [0] of {int};
       int temp; 
       run main( ret_main);
       ret_main ? temp;
 }
 proctype test(chan in_test; int a ; int b)
{
 	if
 	:: ( a >= b) -> in_test ! a;
  		goto end
	:: else -> in_test ! b;
		goto end
  	fi;     
 	end: printf (" End of test ");
 }
proctype main(chan in_main)
{
	chan ret_test = [0] of {int};
 	int x;
 	int y;
 	int temp;
	x = 2;
	y = 3;
 	run  test( ret_test, x, y);
	ret_test ? temp;
	in_main ! temp;
	goto end;
	end: printf(" End of main")
 }
