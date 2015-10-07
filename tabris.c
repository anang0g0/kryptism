/* ---------------------------------

File Encrypter "tabris.c"
ver 0.1
20150822 Y.Terasawa
Published under GPL Lisense

------------------------------------*/


#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define N 64

unsigned char r[N]={50,57,14,8,53,6,19,47,12,60,7,49,51,44,4,16,10,15,28,2,41,33,35,42,23,21,38,29,27,36,63,48,59,17,3,24,58,39,18,9,5,11,22,46,45,40,1,34,32,56,43,61,37,31,30,13,20,55,0,62,26,25,52,54};

unsigned char s[N]={58,1,59,3,36,25,63,51,50,21,17,11,53,2,18,7,6,12,31,28,20,32,14,8,22,13,38,30,26,34,47,54,46,43,60,35,55,49,27,39,40,61,56,5,37,4,9,16,52,29,48,19,0,62,10,33,41,42,15,44,57,24,45,23};

unsigned char xx[N]={42,33,26,62,5,32,12,46,47,3,34,7,11,0,30,44,28,58,10,20,9,50,17,57,41,6,4,31,36,16,14,19,48,29,59,38,54,53,1,15,51,21,22,40,13,49,43,63,45,39,52,25,8,35,60,2,37,23,18,61,27,56,55,24};

unsigned char aa[64]={ 148, 246, 52, 251, 16, 194, 72, 150, 249, 23, 90, 107, 151, 42, 154, 124, 48, 58, 30, 24, 42, 33, 38, 10, 115, 41, 164, 16, 33, 32, 252, 143, 86, 175, 8, 132, 103, 231, 95, 190, 61, 29, 215, 75, 251, 248, 72, 48, 224, 200, 147, 93, 112, 25, 227, 223, 206, 137, 51, 88, 109, 214, 17, 172};


unsigned char x[5][N]={-1};




#define str_length 1600
#define password_length 3200

char password[password_length + 1];

void seed(void){
    /*
    * 変数宣言
    */
    char str[str_length + 1];
    
    int i, j, k, rnd;
    char confirm[2];
    
    /*
    * 乱数の初期化
    */
    srand(clock());
  i=0;
  while(i<1000)
    i++;
    /*
    * 乱数生成とパスワードの生成
    */
    for(i = 0; i < str_length; i++) {
        for(j = 0; j < 2; j++) {
            k = i * 2 + j;
            do {
                rnd = rand();
                password[k] = str[i] + rnd;
            }while(!isalnum(password[k]));
        }
    }
    
    /*
    * NULL文字の挿入
    */
    password[password_length] = '\0';
    
    /*
    * パスワードの出力
    */
//    printf("生成パスワード：%s",password);
    
return;
  
}



void ufu(){
int i,k,j,l;
time_t t;

srand(time(&t));

	seed();
	
int ii;
for(ii=0;ii<2;ii++){
for(i=0;i<N;i++)
x[ii][i]= -1;

i=rand()%N;
  x[ii][N-1]= i;

i=0;
  while(i<N-1){
k=0;

    j=rand()%N;
    for(l=0;l<i+1;l++){
      if(x[ii][l]==j && j!=x[ii][N-1])
      k=1;
    }
    
    if(k==0 && j!=x[ii][N-1] && i!=j){
      x[ii][i]=j;
      printf("%d,",x[ii][i]);
      i++;
    }
  }
      printf("%d},\n",x[ii][N-1]);
}
printf("%d\n",i);

//	return &x;
}


unsigned char v[N];

void ransue(){
int i,j=0;
	

unsigned char z[N];
unsigned char w[N];


ufu();

	for(i=0;i<N;i++){
z[x[0][i]]=i;
v[i]=aa[i];
	}
	
for(i=0;i<N;i++)
v[i]^=v[x[1][i]];

	
for(i=0;i<N;i++)
w[i]=x[0][x[1][z[i]]];
for(i=0;i<N;i++)
x[1][i]=w[i];
for(i=0;i<N;i++)
v[i]^=v[w[i]];
	
return;
}



int main(){
int i,j,k;
unsigned char inv_x[N];
unsigned char ps[N]={26,31,29,50,1,54,0,7,42,9,19,35,24,53,63,15,59,30,44,60,36,56,37,22,57,20,61,23,12,40,10,14,6,33,58,55,4,21,38,16,32,17,18,3,46,8,25,52,43,5,48,51,45,39,2,49,41,47,11,27,34,13,62,28};
unsigned char pr[N]={13,10,0,27,1,35,50,39,53,21,36,25,20,49,24,3,54,38,42,45,26,7,17,2,60,56,30,4,34,58,5,16,12,23,46,19,31,9,41,37,43,57,52,33,28,48,63,11,61,51,29,32,40,15,18,8,6,22,44,62,14,55,47,59};
unsigned char a[N],b[N],inv_b[N],c[N];
time_t t;
FILE *fp,*fo;


for(i=0;i<N;i++)
inv_x[xx[i]]=i;
/*
for(i=0;i<N;i++)
inv_x[x[i]]=i;
for(i=0;i<N;i++){
pr[i]=x[r[inv_x[i]]];
ps[i]=x[s[inv_x[i]]];
}
for(i=0;i<N;i++)
printf("%d,",pr[i]);
printf("\n");
for(i=0;i<N;i++)
printf("%d,",ps[i]);
printf("\n");
*/
unsigned char u[N/2],tmp[N],tmb[N];
//srand(time(&t));

for(i=0;i<N/2;i++){
u[i]=rand()%256;
printf("%u\n",u[i]);
}

for(i=0;i<N;i++){
a[i]=i;
b[i]=i;
}

for(i=0;i<32;i++){
for(j=0;j<8;j++){
if(u[i]%2==0){
printf("0");
for(k=0;k<N;k++){
tmp[k]=a[r[k]];
tmb[k]=b[pr[k]];
}
for(k=0;k<N;k++){
a[k]=tmp[k];
b[k]=tmb[k];
}
} else if(u[i]%2==1){
printf("1");
for(k=0;k<N;k++){
tmp[k]=a[s[k]];
tmb[k]=b[ps[k]];
}
for(k=0;k<N;k++){
a[k]=tmp[k];
b[k]=tmb[k];
}
}
u[i]=(u[i]>>1);
}
}
printf("\n");

for(i=0;i<N;i++)
printf("%u,",a[i]);
printf("\n");
for(i=0;i<N;i++)
printf("%u,",b[i]);
printf("\n");
for(i=0;i<N;i++)
printf("%u,",xx[a[inv_x[i]]]);

printf("\n");

	char file[100],out[100];
	int f;
	unsigned char buf[64];
	unsigned char h[N];
	
	for(i=0;i<N;i++)
	h[i]= r[i];
	
	scanf("%s",&file);
	fp=fopen(file,"rb");
	scanf("%s",&out);
	fo=fopen(out,"wb");
	

	for(i=0;i<N;i++)
	inv_b[b[i]]=i;
	j=0;
	while((f=fread(buf,1,64,fp))>0){
	for(i=0;i<N;i++)
	c[i]=b[h[inv_b[i]]];
	for(i=0;i<N;i++)
	h[i]=c[i];
		for(i=0;i<N;i++){
                  aa[i]^=aa[c[i]];
                  printf("%d,",aa[i]);
		}
	for(i=0;i<N;i++)
	buf[i]^=aa[i];
	fwrite(buf,1,64,fo);
	}
	fclose(fp);
	fclose(fo);

	
	return 0;

}



