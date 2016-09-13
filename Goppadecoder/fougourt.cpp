#include "oplib.cpp"
#include <time.h>
#include <string.h>
#include <ctype.h>
#include <iostream>

#define NN 256

unsigned char Pk[NN][NN]={0};
unsigned int X[5][NN]={-1};

void ufu(){
  int i,k,j,l,ii;
  time_t t;

  
 srand(time(&t));
 seed();
	

 for(ii=0;ii<3;ii++){
   for(i=0;i<NN;i++)
     X[ii][i]= -1;
   
   i=rand()%NN;
   X[ii][NN-1]= i;
   
   i=0;
   while(i<NN-1){
     k=0;
     
     j=rand()%NN;
     for(l=0;l<i+1;l++){
       if(X[ii][l]==j && j!=X[ii][NN-1])
	 k=1;
    }
     
     if(k==0 && j!=X[ii][NN-1] && i!=j){
       X[ii][i]=j;
       printf("%d,",X[ii][i]);
       i++;
     }
   }
   printf("%d},\n",X[ii][NN-1]);
 }
 printf("%d\n",i);


}


int main(int argc,char **argv){
  int i,j,k,l;
  unsigned long a,x,count=1;
  //  unsigned char cc[K]={0};
  unsigned char m[K],mm[T]={0},kaoru[128][256]={0};
  time_t timer;
  FILE *fp,*fq;
  int c;
  time_t t;
  unsigned char e[128]={1};

  unsigned char g2[7]={1,0,9,0,0,6,4};
  //  unsigned char s[K]={0}; //{4,12,7,8,11,13};

  unsigned char ee[10]={1,2,3,4,5,6,7,8,9,10};
  unsigned char zz[T]={86,97,114,105,97,98,108,101,32,80,111,108,121,110,111,109};
  //  unsigned char zz[T]={10,97,114,105,97,98,108,101,32,80,111,108,121,110,111,109};
  int y,me=0;
  OP f,h,r,w;
  vec v;
  unsigned char d=0;
  unsigned char rr[256]={0},num[128]={0},num2[128]={0},ss[256]={0};


  srand(time(&t));
  for(i=0;i<128;i++){
    for(j=0;j<256;j++)
      kaoru[i][j]=rand()%256;
  }

  ufu();

  for(i=0;i<128;i++)
    ss[i]=1;
  for(i=0;i<256;i++)
    rr[i]=ss[X[0][i]];

  for(i=0;i<128;i++)
    printf("%d",ss[i]);
  std::cout << std::endl;
  for(i=0;i<128;i++)
    printf("%d",rr[i]);
  std::cout << std::endl;
  //exit(1);
  
  int count2=0;
  
  count=0;
  for(i=0;i<256;i++){
      if(rr[i]==1){
	num[count++]=i;
      } else if(rr[i]==0){
	num2[count2++]=i;
      }
      //      count++;
  }
  
  for(i=0;i<128;i++)
    printf("%d,",num[i]);
  printf("\n");
  for(i=0;i<128;i++)
    printf("%d,",num2[i]);
  std::cout << std::endl;
  //  exit(1);

  
  // code generate
  w=setpol(g,K+1);
  printpol(o2v(w));
  //    exit(1);

    for(i=0;i<M;i++){
    d=trace(w,(unsigned char)i);
    printf("%d,",d);
    if(d==0){
      printf("%i bad trace 0\n",i);
      exit(1);
    }
  }
  printf("\n");
  
  
   det(g);
  for(i=0;i<K;i++){
    for(j=0;j<M;j++)
      printf("%d,",mat[i][j]);
    printf("\n");
  }
  //  exit(1);
  
    for(i=0;i<128;i++){
    for(j=0;j<256;j++){
      Pk[num[i]][j]=mat[i][j];
      Pk[num2[i]][j]=rand()%256;
    }

    }
    for(i=0;i<256;i++){
      for(j=0;j<256;j++)
	printf("%u,",Pk[i][j]);
      printf("\n");
    }
    exit(1);


  fp=fopen(argv[1],"rb");
  fq=fopen(argv[2],"wb");

  while((c=fread(zz,1,T,fp))>0){
    //    for(i=0;i<T;i++)
    //  zz[i]=i+1;
  
  //exit(1);

    
  printf("zz=");
  for(i=0;i<K;i++){
    syn[i]=0;

    for(j=0;j<T;j++){
      printf("%u,",zz[j]);
      syn[i]^=gf[mlt(fg[zz[j]],fg[mat[i][j]])];
    }
    //    printf("%d,",syn[i]);
  }
  printf("\n");
  //    exit(1);  
  
  f=setpol(syn,K);
  printpol(o2v(f));
  //  exit(1);
  r=decode(w,f);
  
  for(i=0;i<T;i++){
    mm[i]=r.t[i].a;
    printf("e=%d %d\n",r.t[i].a,r.t[i].n);
  }
  fwrite(mm,1,T,fq);
  }

  fclose(fp);
  fclose(fq);
  
  // h2g(mat);
  //  exit(1);

  return 0;
}
