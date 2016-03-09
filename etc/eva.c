#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <iostream>

#define N 256

int inv_a[64][64]; //\82\B1\82\B1\8222t\8Ds\97777\FC\82\E9
int buf; //\8888888893I\82222222\81[\83^\82\F0\92~\82\A6\82\E9
unsigned char a[64][64],r[8][8],s[8][8]={0};
int inv_x[8][8]={0};
unsigned char aa[64],x[3][64];


unsigned char gf[N]={0,1,2,4,8,16,32,64,128,29,58,116,232,205,135,19,38,76,152,45,90,180,117,234,201,143,3,6,12,24,48,96,192,157,39,78,156,37,74,148,53,106,212,181,119,238,193,159,35,70,140,5,10,20,40,80,160,93,186,105,210,185,111,222,161,95,190,97,194,153,47,94,188,101,202,137,15,30,60,120,240,253,231,211,187,107,214,177,127,254,225,223,163,91,182,113,226,217,175,67,134,17,34,68,136,13,26,52,104,208,189,103,206,129,31,62,124,248,237,199,147,59,118,236,197,151,51,102,204,133,23,46,92,184,109,218,169,79,158,33,66,132,21,42,84,168,77,154,41,82,164,85,170,73,146,57,114,228,213,183,115,230,209,191,99,198,145,63,126,252,229,215,179,123,246,241,255,227,219,171,75,150,49,98,196,149,55,110,220,165,87,174,65,130,25,50,100,200,141,7,14,28,56,112,224,221,167,83,166,81,162,89,178,121,242,249,239,195,155,43,86,172,69,138,9,18,36,72,144,61,122,244,245,247,243,251,235,203,139,11,22,44,88,176,125,250,233,207,131,27,54,108,216,173,71,142};
unsigned char fg[N]={0,1,2,26,3,51,27,199,4,224,52,239,28,105,200,76,5,101,225,15,53,142,240,130,29,194,106,249,201,9,77,114,6,139,102,48,226,37,16,34,54,148,143,219,241,19,131,70,30,182,195,126,107,40,250,186,202,155,10,121,78,229,115,167,7,192,140,99,103,222,49,254,227,153,38,180,17,146,35,137,55,209,149,207,144,151,220,190,242,211,20,93,132,57,71,65,31,67,183,164,196,73,127,111,108,59,41,85,251,134,187,62,203,95,156,160,11,22,122,44,79,213,230,173,116,244,168,88,8,113,193,248,141,129,100,14,104,75,223,238,50,198,255,25,228,166,154,120,39,185,181,125,18,69,147,218,36,33,138,47,56,64,210,92,150,189,208,206,145,136,152,179,221,253,191,98,243,87,212,172,21,43,94,159,133,61,58,84,72,110,66,163,32,46,68,217,184,124,165,119,197,24,74,237,128,13,112,247,109,162,60,83,42,158,86,171,252,97,135,178,188,205,63,91,204,90,96,177,157,170,161,82,12,246,23,236,123,118,45,216,80,175,214,234,231,232,174,233,117,215,245,235,169,81,89,176};


using namespace std;




int mlt(int x,int y){

    if(x==0||y==0)
        return 0;
  
  return ((x+y-2)%(N-1))+1;
}


int mltn(int n,int x){
  int i,j;
  
  i=x;
    for(j=0;j<n-1;j++)
      i=mlt(i,x);
  
  return i;
}


int Inv(int b){
int i;

  for(i=0;i<256;i++){
    if(gf[mlt(fg[i],fg[b])]==1)
      return i;
  }
    
}

#define KK 8


int ll[64][64],xx[8][16];



void gauss(unsigned char x[8][8]){
int i,j,k=0,pivot,mul,n;

//                1111111111111111111111111111111111111111111
for(i=0;i<8;i++){
for(j=0;j<8;j++)
xx[i][j]=x[i][j];
}

for(i=0;i<8;i++){
for(j=8;j<16;j++){
if(i==(j-8))
xx[i][j]=1;
else xx[i][j]=0;
}
}

/*
for(i=0;i<8;i++){
for(j=0;j<16;j++)
printf("%d,",xx[i][j]);
printf("\n");
}
*/
//exit(1);

for (i = 0; i < KK; ++i)
{

    //                                                          
    pivot = xx[i][i];
    for (j = 0; j < KK * 2; ++j)
    {
        xx[i][j] = gf[mlt(fg[Inv(pivot)] , fg[xx[i][j]])];
    }

    /*                                                                
    // iiiiiiiiiiiiiiiiiii0000000000000000000000000000000000000000 */

  k=i+1;
    while(k < KK)
    {

        mul = xx[k][i];

        for (n = i; n < KK * 2; ++n)
        {

            xx[k][n] = xx[k][n] ^  gf[mlt(fg[mul] , fg[xx[i][n]])];
        }
      ++k;
    }

}

//                                                                      
for (i = KK - 1; i > 0; --i)
{
    for (k = i - 1; k >= 0; --k)
    {
        mul = xx[k][i];
        for (n = i; n < KK * 2; ++n)
        {
            xx[k][n] = xx[k][n] ^ gf[mlt(fg[mul] , fg[xx[i][n]])];
        }
    }
}

for(i=0;i<8;i++){
  for(j=0;j<16;j++){
  //  
    if(j>7)
      inv_x[i][j-8]=xx[i][j];
//    printf("%d,",xx[i][j]);
  }
//  printf("\n");
}


}




// ===========================================================================
// SHA-512
// 2008.03.23              
// ===========================================================================

#include <stdio.h>
#include <time.h>

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
    for (t=0 ;t<16 ;t++) //little-endiannnnbig-endiannnnnnnnnnnnnbig-endiannnnnnnnnnnnnnnnnnnnnn
        W[t]=(unsigned long long)(Buf[t*2]<<24 | Buf[t*2]<<8 & 0xFF0000 | Buf[t*2]>>8 & 0xFF00 | Buf[t*2]>>24)<<32 | (unsigned long long)(Buf[t*2+1]<<24 | Buf[t*2+1]<<8 & 0xFF0000 | Buf[t*2+1]>>8 & 0xFF00 | Buf[t*2+1]>>24);
    for (t=16 ;t<80 ; t++) W[t] = s512_1(W[t-2]) + W[t-7] + s512_0(W[t-15]) + W[t-16];
    SHA512_transform(H,W);
}


//////////////128888888888888888888888888888888888888888888888888888888888  
void SHA512_finish(unsigned long long H[],unsigned long long W[],unsigned long long FileLen)
{
    unsigned long *Buf=(unsigned long *)W;
    int t;
    int Witi=(FileLen%128)/8;
    int amari=(FileLen%8)*8; //64444444444444444444444444444444444444444444444444444 
    for (t=0 ;t<=Witi ;t++) //little-endiannnnbig-endiannnnnnnnnnnnnbig-endiannnnnnnnnnnnnnnnnnnnnn
        W[t]=(unsigned long long)(Buf[t*2]<<24 | Buf[t*2]<<8 & 0xFF0000 | Buf[t*2]>>8 & 0xFF00 | Buf[t*2]>>24)<<32 | (unsigned long long)(Buf[t*2+1]<<24 | Buf[t*2+1]<<8 & 0xFF0000 | Buf[t*2+1]>>8 & 0xFF00 | Buf[t*2+1]>>24);
    if (amari==0) W[Witi]=0x8000000000000000ULL; ////////////////////////////////1111111111111111111111 
        else W[Witi]=W[Witi] & 0xFFFFFFFFFFFFFFFFULL<<(64-amari) | 0x8000000000000000ULL>>amari;
    Witi++;

    if(Witi>=15){  ////////////////////////////////////////////////////////////////////////////////////////////
        for (t=Witi; t<16 ; t++) W[t]=0;  //////////////////////////0000000000000
        for (t=16 ; t<80 ; t++) W[t] = s512_1(W[t-2]) + W[t-7] + s512_0(W[t-15]) + W[t-16];
        SHA512_transform(H,W);
        Witi=0;
    }

    for(t=Witi;t<14; t++) W[t]=0; //////////////////////////0000000000000
    W[14]=FileLen>>61; /////////////////////////////////////////////////////////////////////// 
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
    unsigned long long FileLen=0;/////////////////

    if (!(fp=fopen(filename , "rb"))) return 1;
    while(1){
        Len=fread(W, 1, 128, fp);
        FileLen+=Len;
        if (Len!=128) break; 
        SHA512_process(H,W);
    }
    SHA512_finish(H,W,FileLen);
    if(ferror(fp)){///////////////////////////////////////////////////////////
        fclose(fp);
        return 1;
    }
    fclose(fp);
    return 0;
}


void sha(int argc, char**argv)
{
    unsigned long long H[8]; //////////////
    int t,i,count=0;
   typedef union a {
	unsigned long long l;
	unsigned char e[8];
	} hash;
hash bb[8];

    if (SHA512(argv[1],H)){  //argv[1]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]                      H[8]]]]]]]]]]]]]]]]
        printf("""""""""""""""""""""""""""""""""""""""""""");
    }else{
        printf("%s\n\n",argv[1]);  //argv[1]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
        for (t=0; t<8; t++) {printf("%08x", H[t]>>32); bb[t].l=H[t]; printf("%08x", H[t]);}
	printf("\n\n");
	for (t=0; t<8; t++) {
		for(i=0;i<8;i++) aa[count++]=bb[t].e[i];
	}
    }
    printf("\n\n");
    system("PAUSE");
    return;
}





#define NN 64

void ufu(){
int i,j,k,f,len,l;
  unsigned int u[1],d;

  u[0]=1234567890;


  unsigned char a[64]={24,253,98,162,133,36,228,129,255,177,135,238,241,115,184,58,181,111,53,179,180,116,93,211,206,246,170,184,252,25,124,212,51,11,24,230,140,151,240,41,163,247,37,203,60,234,74,160,45,7,107,24,120,81,77,111,183,11,248,35,189,206,115,171};
  unsigned short x[5][N]={-1};
  FILE *fp;
  time_t t;
  
  typedef union uni {
    unsigned int u;
    unsigned char  z[4];
  } on;
  on o[NN];
  


srand(time(&t));
    
int ii;
for(ii=0;ii<3;ii++){
for(i=0;i<NN;i++)
x[ii][i]= -1;
    
i=rand()%NN;
  x[ii][NN-1]= i;
    
//printf("{%d,",i);
    
i=0;

  while(i<NN-1){
k=0;

    j=rand()%NN;
    for(l=0;l<i+1;l++){
      if(x[ii][l]==j && j!=x[ii][NN-1])
      k=1;
    }
//	if(k==1)
//	j=rand()%N;
    
    if(k==0 && j!=x[ii][NN-1] && i!=j){
      x[ii][i]=j;
      printf("%d,",x[ii][i]);
      i++;
    }
  }
      printf("%d},\n",x[ii][NN-1]);
}
printf("%d\n",i);
	
	for(i=0;i<N;i++)
	x[4][x[0][i]]=i;

//exit(1);


  return;

}


  
unsigned char v[NN];

void ransue(){
int i,j=0;
	

unsigned char z[NN];
unsigned char w[NN];


ufu();

  exit(1);
  
	for(i=0;i<NN;i++){
z[x[0][i]]=i;
v[i]=aa[i];
	}
	
for(i=0;i<NN;i++)
v[i]^=v[x[1][i]];

	
for(i=0;i<NN;i++)
w[i]=x[0][x[1][z[i]]];
for(i=0;i<NN;i++)
x[1][i]=w[i];
for(i=0;i<NN;i++)
v[i]^=v[w[i]];
	
return;
}




int main(int argc,char *argv[]){
  int i,j,k,l,n;
  time_t t;
  
  unsigned char x[8][8];
  FILE *fp,*fo;
  
  
  for(i=0;i<8;i++){
    for(j=0;j<8;j++)
      s[i][j]=rand()%256;
  }


unsigned char ps[NN]={26,31,29,50,1,54,0,7,42,9,19,35,24,53,63,15,59,30,44,60,36,56,37,22,57,20,61,23,12,40,10,14,6,33,58,55,4,21,38,16,32,17,18,3,46,8,25,52,43,5,48,51,45,39,2,49,41,47,11,27,34,13,62,28};
unsigned char pr[NN]={13,10,0,27,1,35,50,39,53,21,36,25,20,49,24,3,54,38,42,45,26,7,17,2,60,56,30,4,34,58,5,16,12,23,46,19,31,9,41,37,43,57,52,33,28,48,63,11,61,51,29,32,40,15,18,8,6,22,44,62,14,55,47,59};
unsigned char a[NN],b[NN],inv_b[NN];
//  unsigned char aa[64]={24,253,98,162,133,36,228,129,255,177,135,238,241,115,184,58,181,111,53,179,180,116,93,211,206,246,170,184,252,25,124,212,51,11,24,230,140,151,240,41,163,247,37,203,60,234,74,160,45,7,107,24,120,81,77,111,183,11,248,35,189,206,115,171};
int count=0;



srand(time(&t));

if(argv[1]==NULL){
cout << "usage: cdp.exe keyfile" << endl;
  exit(1);
}

//for(i=0;i<64;i++)
//     aa[i]=rand()%256;
       
sha(argc,argv);
//srand(time(&t));

     

char file[100],out[100];
int f;
unsigned char buf[64];
unsigned char h[NN];

for(i=0;i<NN;i++)
     h[i]= ps[i];
     

     int ii;
for(ii=0;ii<3;ii++){
for(i=0;i<NN;i++)
x[ii][i]= -1;
    
i=rand()%NN;
  x[ii][NN-1]= i;
    
//printf("{%d,",i);
    
i=0;

  while(i<NN-1){
k=0;

    j=rand()%NN;
    for(l=0;l<i+1;l++){
      if(x[ii][l]==j && j!=x[ii][NN-1])
      k=1;
    }
//	if(k==1)
//	j=rand()%N;
    
    if(k==0 && j!=x[ii][NN-1] && i!=j){
      x[ii][i]=j;
      if(ii==0){
        for(l=0;l<64;l++)
          b[l]=x[ii][l];
      } else {
        for(l=0;l<64;l++)
          a[l]=x[ii][l];
      }
        
      printf("%d,",x[ii][i]);
      i++;
    }
  }
      printf("%d},\n",x[ii][NN-1]);
}
printf("%d\n",i);
	
//     ufu();

       for(j=0;j<64;j++)
         printf("%d,",a[j]);
       printf("\n");
       for(j=0;j<64;j++)
         printf("%d,",b[j]);
       printf("\n");

unsigned char u[8][8];


//exit(1);

char mode[3];
unsigned char nx[NN];

count=0;
for(i=0;i<8;i++){
for(j=0;j<8;j++)
  nx[count++]=u[i][j]=rand()%256;
}

//for(i=0;i<NN;i++)
//nx[i]=b[i];

     
printf("input mode\n");
//scanf("%s",&mode);
  cin >> mode;
 cin >> file;
cin >> out;
//  scanf("%s",&file);
//  scanf("%s",&out);

     fp=fopen(file,"rb");
     fo=fopen(out,"wb");

fpos_t sz;
fpos_t fsize=0;
long fs;
sz=fseek(fp,0,SEEK_END);
//fgetpos(fp,&fsize);
fs=ftell(fp);
fseek(fp,sz,SEEK_SET);
printf("%d\n",fs);


int c2,c3=0,c4=0;

c2=0;
if(fs%64==0)
c2=fs/64-2;
if(fs%64 != 0){
  while(fs>0){
    fs=fs-64;
    c2++;
  }

}


if(strcmp(mode,"e")==0)
fwrite(nx,1,64,fo);

     count=0;
if(strcmp(mode,"d")==0){
  fread(nx,1,64,fp);
  for(i=0;i<8;i++){
    for(j=0;j<8;j++)
    u[i][j]=nx[count++];
  }
}


for(i=0;i<NN;i++)
inv_b[b[i]]=i;
j=0;

//	exit(1);
     
     int c;
     unsigned char buff[64],m[8][8],tmp[8][8]={0},e[64];
unsigned char cc[64];
unsigned char tmp2[8][8]={0};


for(i=0;i<64;i++)
printf("%d,",aa[i]);
//exit(1);

c3=0;
  while((c=fread(buff,1,64,fp))>0){
  c3++;
    if(c3%10000==0)
      cout << "o";
//    printf("c=%d\n",c3);
    if(c<64){
      count=c;
      while(count<64)
        buff[count++]=0;
    }
    
//    count=0;
/*
     for(l=0;l<100;l++){
       count=0;
       //  while(count<100){
         
       for(i=0;i<NN;i++)
         cc[i]=b[a[inv_b[i]]];
       for(i=0;i<NN;i++)
         a[i]=cc[i];
       for(i=0;i<NN;i++){
         aa[i]^=aa[cc[i]];
//             printf("%d,",cc[i]);
       }
//         printf("\n");
       //count++;
     }
*/
//fwrite(aa,1,64,fo);


count=0;
for(i=0;i<8;i++){
  for(j=0;j<8;j++)
    r[i][j]=aa[count++];
}

gauss(r);

for(i=0;i<8;i++){
  for(k=0;k<8;k++){
    n=0;
    for(j=0;j<8;j++)
      n^=gf[mlt(fg[r[i][j]],fg[inv_x[j][k]])];
 //   printf("%d,",n);
    
  }
//  printf("\n");
}


//printf("%s\n",&mode[0]);
  if(strcmp(mode,"d")==0){
    printf("sofdjgosi\n");
    for(i=0;i<8;i++){
      for(j=0;j<8;j++)
        tmp[i][j]=inv_x[i][j];
    }
  
      for(i=0;i<8;i++){
      for(j=0;j<8;j++)
        inv_x[i][j]=r[i][j];
    }

    for(i=0;i<8;i++){
      for(j=0;j<8;j++)
        r[i][j]=tmp[i][j];
    }
  }

    
    count=0;
    for(i=0;i<8;i++){
      for(j=0;j<8;j++)
        m[i][j]=buff[count++];
    }
    for(i=0;i<8;i++){
      for(k=0;k<8;k++){
        tmp[i][k]=0;
        for(j=0;j<8;j++)
    tmp[i][k]^=gf[mlt(fg[r[i][j]],fg[m[j][k]])];
      }}
        for(i=0;i<8;i++){
      for(k=0;k<8;k++){
        s[i][k]=0;
        for(j=0;j<8;j++)
    s[i][k]^=gf[mlt(fg[tmp[i][j]],fg[inv_x[j][k]])];
      }}
    count=0;
    for(i=0;i<8;i++){
      for(j=0;j<8;j++)
        e[count++]=s[i][j];
    }
l=63;
if(fs%64==0 && c3-1 == c2 && c2>0){
    while(e[l]==0){
      l--;
    }
  fwrite(e,1,l+1,fo);
} else if((c3-1) < c2){
  fwrite(e,1,64,fo);
}


if(c<64){
for(i=0;i<64;i++)
     printf("%d,",e[i]);
}

    for(i=0;i<8;i++){
      for(k=0;k<8;k++){
        tmp2[i][k]=0;
      for(j=0;j<8;j++)
        tmp2[i][k]^=gf[mlt(fg[r[i][j]],fg[u[j][k]])];
    }
    }
    for(i=0;i<8;i++){
      for(k=0;k<8;k++){
        r[i][k]=0;
      for(j=0;j<8;j++)
        r[i][k]^=gf[mlt(fg[tmp2[i][j]],fg[inv_x[j][k]])];
    }
    }

/*
for(i=0;i<64;i++)
     aa[i]=e[i];
  */
}
printf("\n@%d %d\n",c3,c2);

  fclose(fp);
  fclose(fo);

  
return 0;
}




