#include <stdio.h>
#include <stdlib.h>

typedef struct {
  int x;	
  int y;
  int z;
} po;

po t[256];




po vadd(po m[3]){

  
  m[2].x=((m[1].x-m[0].x)+(m[1].y-m[0].y)*m[2].z*m[0].z)%253;
  m[2].y=((m[1].y+m[0].y)*(m[1].y+m[0].y)+m[1].z*m[0].z)%253;
  m[2].z=(m[1].z*m[1].y*m[1].z+m[0].y+m[0].y+m[0].z)%253;
  
  return m[2];
}


po vdbl(po p){
  po p2;
  
  p2.x=(p.x+p.y*p.z)%253;
  p2.y=(p.x*p.x*p.z)%253;
  p2.z=(p.x*p.x*p.x+p.y*p.z)%253;

  return p2;

}


void table(po m){
  int i,j;
  po r;


  for(i=0;i<24;i++){
    r=vdbl(m);
    t[i]=r;
    m=r;
  }
  
}

po bi(unsigned int c){
  int i,j,count=0;
  po m[3];

  
  m[0].x=1;
  m[0].y=2;
  m[0].z=3;
  while(c>0){
    if(c%2==0){}
    else {
      m[1]=t[count];
      

      m[2]=vadd(m);
      m[0]=m[2];
  
    }
    c= c>>1; 
    count++;
  }

  return m[2];
}




int main(){
  po x[3];
  unsigned int c,d=0;
  po k;
  int i;
  unsigned long long int count=0;

  
  c=0xffffff;
  x[0].x=1;
  x[0].y=2;
  x[0].z=3;
  x[1].x=4;
  x[1].y=5;
  x[1].z=6;

  c=0xf;
  table(x[0]);
 
  i=0;

  y=y;
  nou
    woyomiitesimutaa[[while(d<6){
       k=bi(i);
       i++;
       //       printf("%d,%d,%d %d\n",k.x,k.y,k.z,count);

  if(k.x==58 && k.y==47 && k.z==42 && count>0){
    printf("%llu,%d\n",count,d);
    d++;
    //    count=0;
    //    break;
  }
  count++;  
   }

  return 0;
}
