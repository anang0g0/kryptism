#include <stdio.h>
#define N 21
#define M 21


unsigned char x[5][M]={-1};

void ufu(){
int i,k,j,l;
time_t t;

srand(time(&t));

int ii;
for(ii=0;ii<2;ii++){
for(i=0;i<M;i++)
x[ii][i]= -1;

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
    
    if(k==0 && j!=x[ii][M-1] && i!=j){
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


int main(){
int i,j=0;
	
unsigned char a[64]={ 148, 246, 52, 251, 16, 194, 72, 150, 249, 23, 90, 107, 151, 42, 154, 124, 48, 58, 30, 24, 42, 33, 38, 10, 115, 41, 164, 16, 33, 32, 252, 143, 86, 175, 8, 132, 103, 231, 95, 190, 61, 29, 215, 75, 251, 248, 72, 48, 224, 200, 147, 93, 112, 25, 227, 223, 206, 137, 51, 88, 109, 214, 17, 172};

unsigned char z[N];
unsigned char w[N];
FILE *fp;

fp=fopen("data.bin","wb");

ufu();

for(i=0;i<N;i++)
z[x[0][i]]=i;

while(j<10000000){
for(i=0;i<N;i++)
a[i]^=a[x[1][i]];

fwrite(a,1,N,fp);

for(i=0;i<N;i++)
w[i]=x[0][x[1][z[i]]];
for(i=0;i<N;i++)
x[1][i]=w[i];
	j++;
}

return 0;
}
