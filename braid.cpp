/* ---------------------------------

File Encrypter "tabris.c"
ver 0.1
20150822 Y.Terasawa
Published under GPL Lisense
ver 1.0
20160129
------------------------------------*/


#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <ctype.h>
#include <string.h>

#define N 64

#define M 256


typedef struct a4 {
  unsigned char ar[4];
} array;

typedef struct a8 {
  unsigned char ar[8];
} array8;

typedef struct aN {
  unsigned char ar[N];
} arrayn;

typedef struct pub {
  unsigned char a[N];
  unsigned char b[N];
} set;

unsigned char gf[M]={0,1,2,4,8,16,32,64,128,29,58,116,232,205,135,19,38,76,152,45,90,180,117,234,201,143,3,6,12,24,48,96,192,157,39,78,156,37,74,148,53,106,212,181,119,238,193,159,35,70,140,5,10,20,40,80,160,93,186,105,210,185,111,222,161,95,190,97,194,153,47,94,188,101,202,137,15,30,60,120,240,253,231,211,187,107,214,177,127,254,225,223,163,91,182,113,226,217,175,67,134,17,34,68,136,13,26,52,104,208,189,103,206,129,31,62,124,248,237,199,147,59,118,236,197,151,51,102,204,133,23,46,92,184,109,218,169,79,158,33,66,132,21,42,84,168,77,154,41,82,164,85,170,73,146,57,114,228,213,183,115,230,209,191,99,198,145,63,126,252,229,215,179,123,246,241,255,227,219,171,75,150,49,98,196,149,55,110,220,165,87,174,65,130,25,50,100,200,141,7,14,28,56,112,224,221,167,83,166,81,162,89,178,121,242,249,239,195,155,43,86,172,69,138,9,18,36,72,144,61,122,244,245,247,243,251,235,203,139,11,22,44,88,176,125,250,233,207,131,27,54,108,216,173,71,142};
unsigned char fg[M]={0,1,2,26,3,51,27,199,4,224,52,239,28,105,200,76,5,101,225,15,53,142,240,130,29,194,106,249,201,9,77,114,6,139,102,48,226,37,16,34,54,148,143,219,241,19,131,70,30,182,195,126,107,40,250,186,202,155,10,121,78,229,115,167,7,192,140,99,103,222,49,254,227,153,38,180,17,146,35,137,55,209,149,207,144,151,220,190,242,211,20,93,132,57,71,65,31,67,183,164,196,73,127,111,108,59,41,85,251,134,187,62,203,95,156,160,11,22,122,44,79,213,230,173,116,244,168,88,8,113,193,248,141,129,100,14,104,75,223,238,50,198,255,25,228,166,154,120,39,185,181,125,18,69,147,218,36,33,138,47,56,64,210,92,150,189,208,206,145,136,152,179,221,253,191,98,243,87,212,172,21,43,94,159,133,61,58,84,72,110,66,163,32,46,68,217,184,124,165,119,197,24,74,237,128,13,112,247,109,162,60,83,42,158,86,171,252,97,135,178,188,205,63,91,204,90,96,177,157,170,161,82,12,246,23,236,123,118,45,216,80,175,214,234,231,232,174,233,117,215,245,235,169,81,89,176};


unsigned char r[N]={50,57,14,8,53,6,19,47,12,60,7,49,51,44,4,16,10,15,28,2,41,33,35,42,23,21,38,29,27,36,63,48,59,17,3,24,58,39,18,9,5,11,22,46,45,40,1,34,32,56,43,61,37,31,30,13,20,55,0,62,26,25,52,54};

unsigned char s[N]={58,1,59,3,36,25,63,51,50,21,17,11,53,2,18,7,6,12,31,28,20,32,14,8,22,13,38,30,26,34,47,54,46,43,60,35,55,49,27,39,40,61,56,5,37,4,9,16,52,29,48,19,0,62,10,33,41,42,15,44,57,24,45,23};

unsigned char ps[N]={26,31,29,50,1,54,0,7,42,9,19,35,24,53,63,15,59,30,44,60,36,56,37,22,57,20,61,23,12,40,10,14,6,33,58,55,4,21,38,16,32,17,18,3,46,8,25,52,43,5,48,51,45,39,2,49,41,47,11,27,34,13,62,28};
unsigned char pr[N]={13,10,0,27,1,35,50,39,53,21,36,25,20,49,24,3,54,38,42,45,26,7,17,2,60,56,30,4,34,58,5,16,12,23,46,19,31,9,41,37,43,57,52,33,28,48,63,11,61,51,29,32,40,15,18,8,6,22,44,62,14,55,47,59};


unsigned char xx[N]={42,33,26,62,5,32,12,46,47,3,34,7,11,0,30,44,28,58,10,20,9,50,17,57,41,6,4,31,36,16,14,19,48,29,59,38,54,53,1,15,51,21,22,40,13,49,43,63,45,39,52,25,8,35,60,2,37,23,18,61,27,56,55,24};

unsigned char aa[64]; //={ 148, 246, 52, 251, 16, 194, 72, 150, 249, 23, 90, 107, 151, 42, 154, 124, 48, 58, 30, 24, 42, 33, 38, 10, 115, 41, 164, 16, 33, 32, 252, 143, 86, 175, 8, 132, 103, 231, 95, 190, 61, 29, 215, 75, 251, 248, 72, 48, 224, 200, 147, 93, 112, 25, 227, 223, 206, 137, 51, 88, 109, 214, 17, 172};


unsigned char x[5][N]={-1};
unsigned char message[4]={0};


#define str_length 128
#define password_length 256

char password[password_length + 1];

void seed(void){
    /*
    * �ϐ��錾
    */
    char str[str_length + 1];
    
    int i, j, k, rnd;
    char confirm[2];
    
    /*
    * �����̏�����
    */
    srand(clock());
  i=0;
  while(i<1000)
    i++;
    /*
    * ���������ƃp�X���[�h�̐���
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
    * NULL�����̑}��
    */
    password[password_length] = '\0';
    
    /*
    * �p�X���[�h�̏o��
    */
//    printf("�����p�X���[�h�F%s",password);
    
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
    for (t=0 ;t<16 ;t++) //little-endian��big-endian�ɕϊ��@big-endian�̋@��ł͕s�v
        W[t]=(unsigned long long)(Buf[t*2]<<24 | Buf[t*2]<<8 & 0xFF0000 | Buf[t*2]>>8 & 0xFF00 | Buf[t*2]>>24)<<32
            |(unsigned long long)(Buf[t*2+1]<<24 | Buf[t*2+1]<<8 & 0xFF0000 | Buf[t*2+1]>>8 & 0xFF00 | Buf[t*2+1]>>24);
    for (t=16 ;t<80 ; t++) W[t] = s512_1(W[t-2]) + W[t-7] + s512_0(W[t-15]) + W[t-16];
    SHA512_transform(H,W);
}


//�c��́A128�o�C�g��菭�Ȃ��o�C�g�̏����A�I������  
void SHA512_finish(unsigned long long H[],unsigned long long W[],unsigned long long FileLen)
{
    unsigned long *Buf=(unsigned long *)W;
    int t;
    int Witi=(FileLen%128)/8;
    int amari=(FileLen%8)*8; //64�r�b�g���̃f�[�^�̂Ȃ��]��r�b�g�� 
    for (t=0 ;t<=Witi ;t++) //little-endian��big-endian�ɕϊ��@big-endian�̋@��ł͕s�v
        W[t]=(unsigned long long)(Buf[t*2]<<24 | Buf[t*2]<<8 & 0xFF0000 | Buf[t*2]>>8 & 0xFF00 | Buf[t*2]>>24)<<32
            |(unsigned long long)(Buf[t*2+1]<<24 | Buf[t*2+1]<<8 & 0xFF0000 | Buf[t*2+1]>>8 & 0xFF00 | Buf[t*2+1]>>24);
    if (amari==0) W[Witi]=0x8000000000000000ULL; //���b�Z�[�W�̏I����1�r�b�g�𗧂Ă� 
        else W[Witi]=W[Witi] & 0xFFFFFFFFFFFFFFFFULL<<(64-amari) | 0x8000000000000000ULL>>amari;
    Witi++;

    if(Witi>=15){  //�Ō�ɓ����u�t�@�C�����v������Ȃ��̂ŁA���̃u���b�N�����
        for (t=Witi; t<16 ; t++) W[t]=0;  //�c��̃u���b�N��0�Ŗ��߂�
        for (t=16 ; t<80 ; t++) W[t] = s512_1(W[t-2]) + W[t-7] + s512_0(W[t-15]) + W[t-16];
        SHA512_transform(H,W);
        Witi=0;
    }

    for(t=Witi;t<14; t++) W[t]=0; //�c��̃u���b�N��0�Ŗ��߂�
    W[14]=FileLen>>61; //�u�t�@�C�����v�̃o�C�g���r�b�g�ɕϊ����ē���� 
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
    unsigned long long FileLen=0;//�t�@�C����

    if (!(fp=fopen(filename , "rb"))) return 1;
    while(1){
        Len=fread(W, 1, 128, fp);
        FileLen+=Len;
        if (Len!=128) break; 
        SHA512_process(H,W);
    }
    SHA512_finish(H,W,FileLen);
    if(ferror(fp)){//�t�@�C���G���[�������������ǂ������ׂ�
        fclose(fp);
        return 1;
    }
    fclose(fp);
    return 0;
}

int mon(unsigned long long H[], unsigned long long W[80])
{
    H[0]=0x6a09e667f3bcc908ULL;
    H[1]=0xbb67ae8584caa73bULL;
    H[2]=0x3c6ef372fe94f82bULL;
    H[3]=0xa54ff53a5f1d36f1ULL;
    H[4]=0x510e527fade682d1ULL;
    H[5]=0x9b05688c2b3e6c1fULL;
    H[6]=0x1f83d9abfb41bd6bULL;
    H[7]=0x5be0cd19137e2179ULL;
    

    FILE *fp;
    unsigned long Len;
    unsigned long long FileLen=0;//�t�@�C����


        SHA512_process(H,W);

    SHA512_finish(H,W,FileLen);

    return 0;
}


int sha(int argc, char**argv)
{
    unsigned long long H[8]; //�n�b�V��
    int t,i;
   typedef union a {
	unsigned long long l;
	unsigned char e[8];
	} hash;
hash bb[8];
  int count=0;

    if (SHA512(argv[1],H)){  //argv[1]�̓t�@�C�����̐擪�̔Ԓn �t�@�C��������H[8]�����߂�B
        printf("�t�@�C���G���[���������܂���");
    }else{
        printf("%s\n\n",argv[1]);  //argv[1]�̓t�@�C�����̐擪�̔Ԓn
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
int deka(unsigned long long int u[N])
{
    unsigned long long H[8]; //�n�b�V��
    int t,i;
   typedef union a {
	unsigned long long l;
	unsigned char e[8];
	} hash;
hash bb[8];
  int count=0;

  mon(H,u);
  //        printf("%s\n\n",argv[1]);  //argv[1]�̓t�@�C�����̐擪�̔Ԓn
        for (t=0; t<8; t++) { bb[t].l=H[t];}
	printf("\n\n");
	for (t=0; t<8; t++) {
          for(i=0;i<8;i++) { aa[count++]=bb[t].e[i]; }
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



int mlt(int x, int y){

    if(x==0||y==0)
        return 0;
  
  return ((x+y-2)%(M-1))+1;
}

int mltn(int n,int x){
  int i,j;

  i=x;
    for(j=0;j<n-1;j++)
      i=mlt(i,x);

  return i;
}



arrayn chash(unsigned char b[N]){
int i,j=0;
 arrayn n;


 unsigned char salt[64]={ 148, 246, 52, 251, 16, 194, 72, 150, 249, 23, 90, 107, 151, 42, 154, 124, 48, 58, 30, 24, 42, 33, 38, 10, 115, 41, 164, 16, 33, 32, 252, 143, 86, 175, 8, 132, 103, 231, 95, 190, 61, 29, 215, 75, 251, 248, 72, 48, 224, 200, 147, 93, 112, 25, 227, 223, 206, 137, 51, 88, 109, 214, 17, 172};

 unsigned char z[N],w[N];
 unsigned char m[N]={0},v[256]={0},g[N]={0},f[32]={0};
 unsigned char inv_x[N],inv_y[N];
 unsigned char s[N]={4,34,41,33,53,1,59,55,62,24,61,13,39,48,29,0,51,23,2,49,32,17,19,42,50,8,43,46,63,44,57,16,47,18,36,31,38,27,30,58,3,45,11,7,35,52,15,22,12,26,56,60,10,5,40,54,25,14,20,21,37,6,28,9};;
 unsigned char tt[N]={15,2,48,46,30,7,13,3,29,33,1,26,25,34,17,0,41,27,31,16,61,50,55,56,44,19,62,60,22,4,12,9,38,52,42,10,58,36,28,63,37,51,47,59,40,53,45,11,39,24,18,6,20,21,14,49,23,35,8,43,54,57,32,5};
	FILE *fp,*op;
	int c,count;
time_t t;
 int k;


 for(i=0;i<N;i++)	
   aa[i]=0;

	for(i=0;i<N;i++){
		inv_x[s[i]]=i;
		inv_y[tt[i]]=i;
	}
	for(i=0;i<N;i++){
	  b[i]^=salt[i];
	  //	  b[i+N/2]=111;
	}
	k=0;



	for(j=0;j<8;j++){
	for(i=0;i<N;i++)
	  z[i]=s[tt[inv_x[i]]];
	for(i=0;i<N;i++)
	  tt[i]=z[i];

	for(i=0;i<N;i++){
	  m[i]^=gf[mlt(fg[4],mlt(fg[b[z[i]]],fg[255^b[z[i]]]))]|5*(b[z[i]]^b[z[(i+1)%N]]);
	  //	  g[i]=5*b[z[i]]^b[z[(i+1)%N]];
	  //f[i]^=3*b[z[i]];
	  //b[i]^=g[i]*g[i]*f[i]^m[i]*m[i]*m[i]^4*m[i]^f[i]*f[i]*f[i];
	}
	for(i=0;i<N;i++)
	  b[i]^=m[i];
	//
	//m[i];
	//	printf("m\n");
	}
	//printf("relkg");
	//		exit(1);

	for(i=0;i<N;i++)
	  n.ar[i]=b[i];

	/*
	for(i=0;i<N;i++)
	  printf("%u,",b[i]);
	printf("\n");
	*/

return n;

}


set session(unsigned char u[N]){
unsigned char a[N],b[N],inv_b[N],c[N];
 unsigned char tmp[N],tmb[N];
 int i,j,k;
 set t;

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

 for(i=0;i<N;i++){
   t,a[i]=a[i];
   t.b[i]=b[i];
}
 //printf("\n");


 return t;

}

void keygen(){
  int i,j,k;
  unsigned char fi[N],inv_f[N];
  unsigned char pi[4][N];

  ufu();
  for(i=0;i<N;i++)
    fi[i]=x[0][i];

  for(i=0;i<N;i++)
    inv_f[fi[i]]=i;

  for(i=0;i<N;i++){
    pi[0][i]=x[1][i];
    pi[1][i]=x[2][i];
    pi[2][i]=fi[x[1][inv_f[i]]];
    pi[3][i]=fi[x[2][inv_f[i]]];
}

}

int main(int argc,char *argv[]){
  int i,j,k,count=0;
 unsigned char inv_x[N],o;
unsigned char a[N],b[N],inv_b[N],c[N];
time_t t;
FILE *fp,*fo;
 set fai;
 arrayn p;
 array8 q;
 unsigned char salt[64]={ 148, 246, 52, 251, 16, 194, 72, 150, 249, 23, 90, 107, 151, 42, 154, 124, 48, 58, 30, 24, 42, 33, 38, 10, 115, 41, 164, 16, 33, 32, 252, 143, 86, 175, 8, 132, 103, 231, 95, 190, 61, 29, 215, 75, 251, 248, 72, 48, 224, 200, 147, 93, 112, 25, 227, 223, 206, 137, 51, 88, 109, 214, 17, 172};

 unsigned char test[32]={1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};
//{1,1,1,1,0,0,0,0,1,0,1,0,1,0,1,0,1,1,1,1,0,0,0,0,1,0,1,0,1,0,1,0};
 unsigned char ee[4];
 unsigned int t2=0,l=0;

   

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
 unsigned char inv_t[16][N];

//srand(time(&t));

for(i=0;i<N/2;i++){
u[i]=rand()%256;
printf("%u\n",u[i]);
}

 fai=session(u);

//sha(argc,argv);


	char file[100],out[100];
	int f;
	unsigned char buf[64];
	unsigned char h[N];
	
	for(i=0;i<N;i++)
	h[i]= r[i];

	printf("\ninput file name\n");
	scanf("%s",&file);
	fp=fopen(file,"rb");
	printf("input outfile name\n");
	scanf("%s",&out);
	fo=fopen(out,"wb");

ufu();

char m[1];
unsigned char nx[N];
 unsigned char cipher[4];
 unsigned char temp[N];
 unsigned char inv_c[16][N];


 

for(i=0;i<N;i++)
nx[i]=x[0][i];

printf("input mode\n");
scanf("%s",&m);
  printf("@");
if(strcmp(m,"e")==0)
fwrite(nx,1,64,fo);

if(strcmp(m,"d")==0){
  fread(nx,1,64,fp);
  for(i=0;i<N;i++)
    x[0][i]=nx[i];
}

for(i=0;i<N;i++)
inv_b[nx[i]]=i;
j=0;


  for(i=0;i<N;i++)
    c[i]=nx[h[inv_b[i]]];
  for(i=0;i<N;i++)
    h[i]=c[i];
  /*
  for(i=0;i<N;i++)
  salt[i]^=salt[c[i]];
  */

  printf("in\n");
  /*
    deka((unsigned long long int)c);
  for(i=0;i<N;i++)
    table[j][i]=aa[i];
  //  p=chash(c);
  printf("out\n");
  */


  if(strcmp("d",m)==0){
    for(i=0;i<N;i++)
      inv_c[j][c[i]]=i;
  }


//  printf("@");
while((f=fread(buf,1,64,fp))>0){
  
  /*
  for(i=0;i<N;i++){
    //    aa[i]^=aa[table[j][i]];
    buf[i]^=aa[i];
    //printf("a%d,",aa[i]);
  }  
  */


  if(strcmp("e",m)==0){
       p=chash(c);

       for(k=0;k<N;k++)
	 buf[k]^=p.ar[k];
    } else if(strcmp("d",m)==0){
        p=chash(c);

      for(k=0;k<N;k++)
	buf[k]^=p.ar[k];
    
  }
    /*
  for(i=0;i<N;i++)
    temp[i]=buf[inv_c[15-k][i]];
  for(i=0;i<N;i++)
    buf[i]=temp[i];
  }
    */
   
  //  for(i=0;i<N;i++)
  //   buf[i]^=aa[i];
  fwrite(buf,1,f,fo);
    }
fclose(fp);
fclose(fo);


return 0;

 }



