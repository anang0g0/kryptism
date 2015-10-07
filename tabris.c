/* ---------------------------------

File Encrypter "tabris.c"
ver 0.1
20150822 Y.Terasawa
Published under GPL Lisense

------------------------------------*/


#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <ctype.h>
#include <string.h>

#define N 64

unsigned char r[N]={50,57,14,8,53,6,19,47,12,60,7,49,51,44,4,16,10,15,28,2,41,33,35,42,23,21,38,29,27,36,63,48,59,17,3,24,58,39,18,9,5,11,22,46,45,40,1,34,32,56,43,61,37,31,30,13,20,55,0,62,26,25,52,54};

unsigned char s[N]={58,1,59,3,36,25,63,51,50,21,17,11,53,2,18,7,6,12,31,28,20,32,14,8,22,13,38,30,26,34,47,54,46,43,60,35,55,49,27,39,40,61,56,5,37,4,9,16,52,29,48,19,0,62,10,33,41,42,15,44,57,24,45,23};

unsigned char xx[N]={42,33,26,62,5,32,12,46,47,3,34,7,11,0,30,44,28,58,10,20,9,50,17,57,41,6,4,31,36,16,14,19,48,29,59,38,54,53,1,15,51,21,22,40,13,49,43,63,45,39,52,25,8,35,60,2,37,23,18,61,27,56,55,24};

unsigned char aa[64]; //={ 148, 246, 52, 251, 16, 194, 72, 150, 249, 23, 90, 107, 151, 42, 154, 124, 48, 58, 30, 24, 42, 33, 38, 10, 115, 41, 164, 16, 33, 32, 252, 143, 86, 175, 8, 132, 103, 231, 95, 190, 61, 29, 215, 75, 251, 248, 72, 48, 224, 200, 147, 93, 112, 25, 227, 223, 206, 137, 51, 88, 109, 214, 17, 172};

unsigned char E[48]={32,1,2,3,4,5,4,5,6,7,8,9,8,9,10,11,12,13,12,13,14,15,16,17,16,17,18,19,20,21,20,21,22,23,24,25,24,25,26,27,28,29,28,29,30,31,32,1};
unsigned char Sbox[8][4][16]={
  {{14,4,13,1,2,15,11,8,3,10,6,12,5,9,0,7},
    {0,15,7,4,14,2,13,1,10,6,12,11,9,5,3,8},
    {4,1,14,8,13,6,2,11,15,12,9,7,3,10,5,0},
    {15,12,8,2,4,9,1,7,5,11,3,14,10,0,6,13}
  },
  {{15,1,8,14,6,11,3,4,9,7,2,13,12,0,5,10},
    {3,13,4,7,15,2,8,14,12,0,1,10,6,9,11,5},
    {0,14,7,11,10,4,13,1,5,8,12,6,9,3,2,15},
    {13,8,10,1,3,15,4,2,11,6,7,12,0,5,14,9}
  },
  {{10,0,9,14,6,3,15,5,1,13,12,7,11,4,2,8},
    {13,7,0,9,3,4,6,10,2,8,5,14,12,11,15,1},
    {13,6,4,9,8,15,3,0,11,1,2,12,5,10,14,7},
    {1,10,13,0,6,9,8,7,4,15,14,3,11,5,2,12}
  },
  {{7,13,14,3,0,6,9,101,2,8,5,11,12,4,15},
    {13,8,11,5,6,15,0,3,4,7,2,12,1,10,14,9},
    {10,6,9,0,12,11,7,13,15,1,3,14,5,2,8,4},
    {3,15,0,6,10,1,13,8,9,4,5,11,12,7,2,14}
  },
    {{2,12,4,1,7,10,11,6,8,5,3,15,13,0,14,9},
      {14,11,2,12,4,7,13,1,5,0,15,10,3,9,8,6},
      {4,2,1,11,10,13,7,8,15,9,12,5,6,3,0,14},
      {11,8,12,7,1,14,2,13,6,15,0,9,10,4,5,3}
    },
    {{12,1,10,15,9,2,6,8,0,13,3,4,14,7,5,11},
      {10,15,4,2,7,12,9,5,6,1,13,14,0,11,3,8},
      {9,14,15,5,2,8,12,3,7,0,4,10,1,13,11,6},
      {4,3,2,12,9,5,15,10,11,14,1,7,6,0,8,13}
    },
    {{4,11,2,14,15,0,8,13,3,12,9,7,5,10,16,1},
      {13,0,11,7,4,9,1,10,14,3,5,12,2,15,8,6},
      {1,4,11,13,12,3,7,14,10,15,6,8,0,5,9,2},
      {6,11,13,8,1,4,10,7,9,5,0,15,14,2,3,12}
    },
    {{13,2,8,4,6,15,11,1,10,9,3,14,5,0,12,7},
      {1,15,13,8,10,3,7,4,12,5,6,11,0,14,9,2},
      {7,11,4,1,9,12,14,2,0,6,10,13,15,3,5,8},
      {2,1,14,7,4,10,8,13,15,12,9,0,3,5,6,11}
    }
  };
  
unsigned char x[5][N]={-1};



int nlp(int m){
  int i,j,k,flg,flg2,ee[48]={0},mm,c[8]={0},l,u;

  for(i=0;i<48;i++)
    ee[i]=(1<<E[i]);
  j=0;
  for(i=0;i<48;i++){
    l=m&ee[i];
    if(l>0){
      flg=1;
    } else {
      flg=0;
    }
    c[j]=(1<<(i%6));
    if(i%6==0)
      j++;
    }

  mm=0;
  for(i=0;i<8;i++){
    flg=c[i]&1;
    flg2= (c[i]>>5)&1;
    mm=Sbox[i][(flg2<<1)^flg][(c[i]>>1)&0xf];
    mm=(mm<<4);
  }

  return mm;
}


#define str_length 128
#define password_length 256

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

//PR:(x,y),f(x)=y,|(x,y)|=t,f=h(mx),x=m;f=(x-ai)p_r(x),(ai)sec,f(pub),c=f+m;
//SR(sindrome reconstruction):ml+gv=w->e=w/l'->x=H,eH=S=c,l(random),(g,x)sec
//Perm:x=xyx^-1,a=h(mx)
//arr:B^=ABA^-1,A=h(mx) or Tr(r)(A,B),r=h(mx)
//ecmc mat:G'=RG+e, MG',g=h(mx)


#define SHR(n, x) ( (x)>>(n) )
#define ROTR(n, x) ( ( (x)>>(n) ) | ( (x)<<(64-n) ) )

#define Ch(x,y,z)  ( ( (x) & (y) ) ^ ( ~(x) & (z) ) )
#define Maj(x,y,z) ( ( (x) & (y) ) ^ (  (x) & (z) ) ^ ( (y) & (z) ) )

#define S512_0(x) ( ROTR(28 , x) ^ ROTR(34 , x) ^ ROTR(39, x) )
#define S512_1(x) ( ROTR(14 , x) ^ ROTR(18 , x) ^ ROTR(41, x) )
 
#define s512_0(x) ( ROTR( 1 , x) ^ ROTR( 8 , x) ^ SHR( 7 , x) )
#define s512_1(x) ( ROTR(19 , x) ^ ROTR(61 , x) ^ SHR( 6 , x) )


void SHA512_transform(unsigned long long H[],unsigned long long W[])
{
    static const unsigned long long K[80]=
    {
    0x428a2f98d728ae22ULL, 0x7137449123ef65cdULL, 0xb5c0fbcfec4d3b2fULL, 0xe9b5dba58189dbbcULL,
    0x3956c25bf348b538ULL, 0x59f111f1b605d019ULL, 0x923f82a4af194f9bULL, 0xab1c5ed5da6d8118ULL,
    0xd807aa98a3030242ULL, 0x12835b0145706fbeULL, 0x243185be4ee4b28cULL, 0x550c7dc3d5ffb4e2ULL,
    0x72be5d74f27b896fULL, 0x80deb1fe3b1696b1ULL, 0x9bdc06a725c71235ULL, 0xc19bf174cf692694ULL,
    0xe49b69c19ef14ad2ULL, 0xefbe4786384f25e3ULL, 0x0fc19dc68b8cd5b5ULL, 0x240ca1cc77ac9c65ULL,
    0x2de92c6f592b0275ULL, 0x4a7484aa6ea6e483ULL, 0x5cb0a9dcbd41fbd4ULL, 0x76f988da831153b5ULL,
    0x983e5152ee66dfabULL, 0xa831c66d2db43210ULL, 0xb00327c898fb213fULL, 0xbf597fc7beef0ee4ULL,
    0xc6e00bf33da88fc2ULL, 0xd5a79147930aa725ULL, 0x06ca6351e003826fULL, 0x142929670a0e6e70ULL,
    0x27b70a8546d22ffcULL, 0x2e1b21385c26c926ULL, 0x4d2c6dfc5ac42aedULL, 0x53380d139d95b3dfULL,
    0x650a73548baf63deULL, 0x766a0abb3c77b2a8ULL, 0x81c2c92e47edaee6ULL, 0x92722c851482353bULL,
    0xa2bfe8a14cf10364ULL, 0xa81a664bbc423001ULL, 0xc24b8b70d0f89791ULL, 0xc76c51a30654be30ULL,
    0xd192e819d6ef5218ULL, 0xd69906245565a910ULL, 0xf40e35855771202aULL, 0x106aa07032bbd1b8ULL,
    0x19a4c116b8d2d0c8ULL, 0x1e376c085141ab53ULL, 0x2748774cdf8eeb99ULL, 0x34b0bcb5e19b48a8ULL,
    0x391c0cb3c5c95a63ULL, 0x4ed8aa4ae3418acbULL, 0x5b9cca4f7763e373ULL, 0x682e6ff3d6b2b8a3ULL,
    0x748f82ee5defb2fcULL, 0x78a5636f43172f60ULL, 0x84c87814a1f0ab72ULL, 0x8cc702081a6439ecULL,
    0x90befffa23631e28ULL, 0xa4506cebde82bde9ULL, 0xbef9a3f7b2c67915ULL, 0xc67178f2e372532bULL,
    0xca273eceea26619cULL, 0xd186b8c721c0c207ULL, 0xeada7dd6cde0eb1eULL, 0xf57d4f7fee6ed178ULL,
    0x06f067aa72176fbaULL, 0x0a637dc5a2c898a6ULL, 0x113f9804bef90daeULL, 0x1b710b35131c471bULL,
    0x28db77f523047d84ULL, 0x32caab7b40c72493ULL, 0x3c9ebe0a15c9bebcULL, 0x431d67c49c100d4cULL,
    0x4cc5d4becb3e42b6ULL, 0x597f299cfc657e2aULL, 0x5fcb6fab3ad6faecULL, 0x6c44198c4a475817ULL
    };

    unsigned long long T1, T2;
    unsigned long long x[8];
    int t;
    memcpy(x, H, 64);
#define ROUND(n,a,b,c,d,e,f,g,h)\
        T1=x[h]+S512_1(x[e])+Ch(x[e],x[f],x[g])+K[t+n]+W[t+n];\
        T2=S512_0(x[a])+Maj(x[a],x[b],x[c]);\
        x[d]=x[d]+T1;\
        x[h]=T1+T2

    for(t=0; t<80; t+=8){
        ROUND(0,0,1,2,3,4,5,6,7);
        ROUND(1,7,0,1,2,3,4,5,6);
        ROUND(2,6,7,0,1,2,3,4,5);
        ROUND(3,5,6,7,0,1,2,3,4);
        ROUND(4,4,5,6,7,0,1,2,3);
        ROUND(5,3,4,5,6,7,0,1,2);
        ROUND(6,2,3,4,5,6,7,0,1);
        ROUND(7,1,2,3,4,5,6,7,0);
    }
    H[0]+=x[0];
    H[1]+=x[1];
    H[2]+=x[2];
    H[3]+=x[3];
    H[4]+=x[4];
    H[5]+=x[5];
    H[6]+=x[6];
    H[7]+=x[7];
}


void SHA512_process(unsigned long long H[],unsigned long long W[])
{
    unsigned long *Buf=(unsigned long *)W;
    int t;
    for (t=0 ;t<16 ;t++) //little-endianをbig-endianに変換　big-endianの機種では不要
        W[t]=(unsigned long long)(Buf[t*2]<<24 | Buf[t*2]<<8 & 0xFF0000 | Buf[t*2]>>8 & 0xFF00 | Buf[t*2]>>24)<<32
            |(unsigned long long)(Buf[t*2+1]<<24 | Buf[t*2+1]<<8 & 0xFF0000 | Buf[t*2+1]>>8 & 0xFF00 | Buf[t*2+1]>>24);
    for (t=16 ;t<80 ; t++) W[t] = s512_1(W[t-2]) + W[t-7] + s512_0(W[t-15]) + W[t-16];
    SHA512_transform(H,W);
}


//残りの、128バイトより少ないバイトの処理、終了処理  
void SHA512_finish(unsigned long long H[],unsigned long long W[],unsigned long long FileLen)
{
    unsigned long *Buf=(unsigned long *)W;
    int t;
    int Witi=(FileLen%128)/8;
    int amari=(FileLen%8)*8; //64ビット中のデータのない余りビット数 
    for (t=0 ;t<=Witi ;t++) //little-endianをbig-endianに変換　big-endianの機種では不要
        W[t]=(unsigned long long)(Buf[t*2]<<24 | Buf[t*2]<<8 & 0xFF0000 | Buf[t*2]>>8 & 0xFF00 | Buf[t*2]>>24)<<32
            |(unsigned long long)(Buf[t*2+1]<<24 | Buf[t*2+1]<<8 & 0xFF0000 | Buf[t*2+1]>>8 & 0xFF00 | Buf[t*2+1]>>24);
    if (amari==0) W[Witi]=0x8000000000000000ULL; //メッセージの終わりに1ビットを立てる 
        else W[Witi]=W[Witi] & 0xFFFFFFFFFFFFFFFFULL<<(64-amari) | 0x8000000000000000ULL>>amari;
    Witi++;

    if(Witi>=15){  //最後に入れる「ファイル長」が入らないので、次のブロックを作る
        for (t=Witi; t<16 ; t++) W[t]=0;  //残りのブロックを0で埋める
        for (t=16 ; t<80 ; t++) W[t] = s512_1(W[t-2]) + W[t-7] + s512_0(W[t-15]) + W[t-16];
        SHA512_transform(H,W);
        Witi=0;
    }

    for(t=Witi;t<14; t++) W[t]=0; //残りのブロックを0で埋める
    W[14]=FileLen>>61; //「ファイル長」のバイトをビットに変換して入れる 
    W[15]=FileLen<<3;
    for (t=16 ; t<80 ; t++) W[t] = s512_1(W[t-2]) + W[t-7] + s512_0(W[t-15]) + W[t-16];
    SHA512_transform(H,W);
}


int SHA512(char *filename,unsigned long long H[])
{
    H[0]=0x6a09e667f3bcc908ULL;
    H[1]=0xbb67ae8584caa73bULL;
    H[2]=0x3c6ef372fe94f82bULL;
    H[3]=0xa54ff53a5f1d36f1ULL;
    H[4]=0x510e527fade682d1ULL;
    H[5]=0x9b05688c2b3e6c1fULL;
    H[6]=0x1f83d9abfb41bd6bULL;
    H[7]=0x5be0cd19137e2179ULL;
    
    unsigned long long W[80];
    FILE *fp;
    unsigned long Len;
    unsigned long long FileLen=0;//ファイル長

    if (!(fp=fopen(filename , "rb"))) return 1;
    while(1){
        Len=fread(W, 1, 128, fp);
        FileLen+=Len;
        if (Len!=128) break; 
        SHA512_process(H,W);
    }
    SHA512_finish(H,W,FileLen);
    if(ferror(fp)){//ファイルエラーが発生したかどうか調べる
        fclose(fp);
        return 1;
    }
    fclose(fp);
    return 0;
}


int sha(int argc, char**argv)
{
    unsigned long long H[8]; //ハッシュ
    int t,i;
   typedef union a {
	unsigned long long l;
	unsigned char e[8];
	} hash;
hash bb[8];
  int count=0;

    if (SHA512(argv[1],H)){  //argv[1]はファイル名の先頭の番地 ファイル名からH[8]を求める。
        printf("ファイルエラーが発生しました");
    }else{
        printf("%s\n\n",argv[1]);  //argv[1]はファイル名の先頭の番地
        for (t=0; t<8; t++) { bb[t].l=H[t];}
	printf("\n\n");
	for (t=0; t<8; t++) {
          for(i=0;i<8;i++) { aa[count++]=bb[t].e[i]; }
	}
    }
    printf("\n\n");
//    system("PAUSE");


  return 0;

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



int main(int argc,char *argv[]){
int i,j,k;
unsigned char inv_x[N];
unsigned char ps[N]={26,31,29,50,1,54,0,7,42,9,19,35,24,53,63,15,59,30,44,60,36,56,37,22,57,20,61,23,12,40,10,14,6,33,58,55,4,21,38,16,32,17,18,3,46,8,25,52,43,5,48,51,45,39,2,49,41,47,11,27,34,13,62,28};
unsigned char pr[N]={13,10,0,27,1,35,50,39,53,21,36,25,20,49,24,3,54,38,42,45,26,7,17,2,60,56,30,4,34,58,5,16,12,23,46,19,31,9,41,37,43,57,52,33,28,48,63,11,61,51,29,32,40,15,18,8,6,22,44,62,14,55,47,59};
unsigned char a[N],b[N],inv_b[N],c[N];
time_t t;
FILE *fp,*fo;

typedef struct sv {
unsigned char a[64];
  unsigned int b[16];
} fract;

fract bb;

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

	printf("@@@@@@@\n");




//for(i=0;i<N;i++) printf("%d ",aa[i]);

	printf("yyyyyyyyy\n");
//exit(1);


	
/*	
for(i=0;i<N;i++)
printf("%u,",a[i]);
printf("\n");
for(i=0;i<N;i++)
printf("%u,",b[i]);
printf("\n");
for(i=0;i<N;i++)
printf("%u,",xx[a[inv_x[i]]]);
printf("\n");
  */

	char file[100],out[100];
	int f;
	unsigned char buf[64];
	unsigned char h[N];
	
	for(i=0;i<N;i++)
	h[i]= r[i];
	

ufu();

unsigned char nx[N],inv_aa[N],inv_xx[N],xx[N],zz[N],inv_r[N],d[16][N];


sha(argc,argv);

char m[1];


	scanf("%s",&file);
	fp=fopen(file,"rb");
	scanf("%s",&out);
	fo=fopen(out,"wb");


for(i=0;i<N;i++)
nx[i]=x[0][i];

printf("input mode\n");
scanf("%s",&m);

if(strcmp(m,"e")==0){
fwrite(nx,1,64,fo);
  for(i=0;i<N;i++){
    xx[i]=x[0][i];

  }
}

if(strcmp(m,"d")==0){
  fread(nx,1,64,fp);
  for(i=0;i<N;i++){
    x[0][i]=nx[i];
//    xx[i]=x[0][i];
  }
  for(i=0;i<N;i++)
    inv_r[r[i]]=i;
  
}


//test
for(i=0;i<N;i++){
  nx[i]=r[i];
  inv_r[r[i]]=i;
  inv_x[x[0][i]]=i;
}
for(j=0;j<16;j++){
  for(i=0;i<N;i++)
    d[j][i]=x[0][nx[inv_x[i]]];
  for(i=0;i<N;i++){
    nx[i]=d[j][i];
printf("%d,",nx[i]);
  }
  printf("\n");
}

//end test


for(i=0;i<N;i++)
inv_b[nx[i]]=i;

j=0;
while((f=fread(buf,1,64,fp))>0){
  if(strcmp(m,"e")==0){
    for(i=0;i<N;i++)
      bb.a[i]=buf[i];

    for(i=0;i<16;i++){
      bb.b[i]=nlp(bb.b[i]);
      //      inv_aa[c[i]]=i;
    }

    for(j=0;j<16;j++){
      for(i=0;i<N;i++){
        c[i]=nx[h[inv_b[i]]];
//        inv_aa[d[j][i]]=i;
      }
      for(i=0;i<N;i++)
        h[i]=c[i];
      for(i=0;i<N;i++){
        aa[i]^=aa[c[i]];
        //printf("a%d,",aa[i]);
      }
      for(i=0;i<N;i++)
        buf[i]=bb.a[d[j][i]];
      for(i=0;i<N;i++){
        buf[i]^=aa[i];
        //    bb.a[i]=buf[i];
      }
    }
  } else {
    for(i=0;i<N;i++)
      bb.a[i]=buf[i];
    
    for(i=0;i<16;i++){
      bb.b[i]=nlp(bb.b[i]);
      //      inv_aa[c[i]]=i;
    }

    for(j=0;j<16;j++){
      for(i=0;i<N;i++){
        c[i]=nx[h[inv_b[i]]];
        inv_aa[d[j][i]]=i;
      }
      for(i=0;i<N;i++)
        h[i]=c[i];
      for(i=0;i<N;i++){
        aa[i]^=aa[c[i]];
        //printf("a%d,",aa[i]);
      }
      for(i=0;i<N;i++)
        buf[i]=bb.a[i];
      for(i=0;i<N;i++){
        buf[i]^=aa[i];
        tmp[i]=buf[i];
      }
      for(i=0;i<N;i++)
        buf[i]=tmp[inv_aa[i]];
    }
  }
  fwrite(buf,1,f,fo);
}
fclose(fp);
fclose(fo);


return 0;

}


