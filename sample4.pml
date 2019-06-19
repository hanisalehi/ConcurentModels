
chan feed = [1] of { byte };
bool got[2]=0;


active proctype Producer()
{
	
  do
	:: nfull(feed) -> feed ! 1;	
  od;

}

active [2] proctype Consumer()
{
  byte x;
  do
  
		:: feed ? [1] -> got[_pid-1] = 1; feed?1;  got[_pid-1] = 0;
	
	
  od;
}


ltl liveness {
    [] <> (got[1] )
}

/* Please check this model for  "[] <> (got[0])" as well, and observe the results.  */






