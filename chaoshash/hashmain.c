#include "chash.c"

int main(int argc,char *argv[]){
  int i,j;
  arrayul p;
  array16 t;

  seed();
  p=crand(password);
  //  for(i=0;i<8;i++)
  //  printf("%llu\n",p.u[i]);
  
  t=hash(argc,argv);
  for(i=0;i<16/2;i++)
    printf("%08x ",t.h[i]);
  printf("\n");

  return 0;
}
