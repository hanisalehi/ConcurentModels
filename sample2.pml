byte n = 0;
chan sync_ch = [0] of {int};
active proctype P(){
  
  n = 1;
  printf("Process P, n = %d\n" , n);
  sync_ch ! 0;
 
}
active proctype Q(){
     sync_ch ? 0;
     n = 2;
    printf("Process Q, n = %d\n" , n);	
}
