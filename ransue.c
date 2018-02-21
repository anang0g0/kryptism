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


int cycle2(){
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
    // fp=fopen("rand.dat","wb");
 unsigned char yy[N]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

 
 for(i=0;i<NN;i++)
   printf("%d,",aa[i]);
 printf("\n");


   for(i=0;i<NN;i++)
     aa[i]=yy[i];
   
   while(j<100000000){
     flag=0;
     
     
    
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

     for(k=0;k<NN;k++){
       if(aa[i]!=yy[i])
	 flag=1;
     }
     
     if(flag==0){
       
       for(k=0;k<NN;k++)
	 printf("%d,",aa[k]);
       printf("\n");
       
       printf("%d\n",j);
       printf("count=%d\n",count);
       
       count++;
       if(count>10)
	 return 0;

     }
     
               
     //fwrite(aa,1,NN,fp);
     
     
     for(i=0;i<N;i++)
       w[i]=x[0][x[1][x[2][i]]]; //z[i]]];
     
     for(i=0;i<N;i++){
       x[1][i]=w[i];       
     }

    j++;
   }

   j=0;

   
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


int cycle(){
  int i,j,k;
  unsigned char w[N],ww[N];
  int flg=0;
  
  //  ufu();
  for(i=0;i<N;i++){
    w[i]=i;
    ww[i]=x[1][i];
  }
  //  exit(1);
  printf("-------------------------------------------\n");
  while(1){
    for(i=0;i<N;i++){
      ww[i]=x[1][i];
      printf("%d,",ww[i]);
    }
    printf("\n");
    j=0;

    while(j<1000000){
    for(i=0;i<N;i++)
      w[i]=x[0][x[1][x[2][i]]];
    for(i=0;i<N;i++)
      x[1][i]=w[i];

    flg=0;
    for(i=0;i<N;i++){
    if(ww[i]!=x[1][i])
      flg=1;
      }
    if(flg==0){
      printf("%d\n",j);
      //      data();
      return 0;
    }

    j++;
    }

  }
  
}


int main(){
 
  ufu();
  //  data();
    cycle();
    cycle2();
  
return 0;
}
