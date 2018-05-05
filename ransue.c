#include <stdio.h>
#include <time.h>
#include <stdlib.h>

#define N 32
#define M 32
#define NN 4

unsigned char x[5][M]={-1};

void ufu(){
int i,k,j,l;
time_t t;

 srand(time(&t)+clock());
 
int ii;
for(ii=0;ii<3;ii++){
for(i=0;i<M;i++)
x[ii][i]= 0xff;

i=rand()%M;
  x[ii][M-1]= i;

i=0;
  while(i<M-1){
k=0;

    j=rand()%M;
    for(l=0;l<i+1;l++){
      if(x[ii][l]==j && j!=x[ii][M-1])
      k=1;
    }
    //    printf("}");
    if(k==0 && j!=x[ii][M-1] && i!=j){
      //   printf("%d\n",ii);
      x[ii][i]=j;
      printf("%d,",x[ii][i]);
      i++;
    }
  }
      printf("%d},\n",x[ii][M-1]);
 }
printf("%d\n",i);

//	return &x;
}




void data(){
  unsigned long long int i,j=0,k=0;
  unsigned char a[N]={1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
  
  int flag=0;
  int flg=0;
  int count=0;
  int count2=0;
  unsigned char aa[32]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

  unsigned char z[N];
  unsigned char w[N];
  FILE *fp;
  int cnt=0;
  int ff=0,flg2;
  unsigned char ww[N];

    flg2=0;
 fp=fopen("rand.dat","wb");
 unsigned char yy[N]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

 
   
   while(j<100000000){
    
     for(i=0;i<N;i++)
       a[i]^=a[x[1][i]]; 
     
     
     for(cnt=0;cnt<NN;cnt++){
       for(i=cnt*8;i<8*cnt+8;i++){
	 aa[cnt]^=a[i];
	 if(i==0)
	   aa[cnt]^=(aa[cnt]<<1);
	 if((1+cnt)*7+cnt!=i && i>0)
	   aa[cnt]^=(aa[cnt]<<1);
       }
       
     }

          
               
     fwrite(aa,1,NN,fp);
     
     
     for(i=0;i<N;i++)
       w[i]=x[0][x[1][x[2][i]]]; //z[i]]];
     
     for(i=0;i<N;i++){
       x[1][i]=w[i];       
     }

    j++;
   }
   fclose(fp);
   
}



int main(){
 
ufu();
data();

return 0;
}
