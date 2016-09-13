//date      :  20160310
//auther    : the queer who thinking about cryptographic future
//code name : OVP - One Variable Polynomial library with OpenMP friendly
//status    : now in debugging (ver 0.1)

#include "chash.cpp"


#define DEG 256
#define K 6
#define T K/2



unsigned char mat[K][N]={0};
unsigned char c[]={0};
unsigned char mat[K][M]={0};



typedef struct {
  unsigned short n;
  unsigned short a;
} oterm;

typedef struct{
  oterm t[DEG];
} OP;

typedef struct {
  unsigned int x[DEG];
} vec;

OP ss={0};


unsigned char oinv(unsigned char a){
  int i;

  for(i=0;i<M;i++){
    if(gf[mlt(fg[a],i)]==1)
      return (unsigned char)i;
  }

}


unsigned char equ(unsigned char a,unsigned char b){
  int i;

  for(i=0;i<M;i++){
    if(gf[mlt(fg[a],fg[i])]==b){
      return i;
    }
  }

}


int deg(vec a){
  int i,n=0;

  for(i=0;i<DEG;i++){
//        printf("%d[%d],",a.x[i],i);
    if(a.x[i]>0)
      n=i;
  }
  
  if(n>0){
    return n;
  }else{
    return 0;
  }
//exit(1);
}


vec o2v(OP f){
  vec a={0};
  int i,count=0;


  for(i=0;i<DEG;i++){
    if(f.t[i].a>0)
      a.x[f.t[i].n]=f.t[i].a;
  }
  //  exit(1);

  return a;
}


OP v2o(vec a){
  int i,count=0;
  OP f={0};

  for(i=0;i<DEG;i++){
    if(a.x[i]>0){
      f.t[i].n=i;
      f.t[i].a=a.x[i];
    }
  }

  return f;
}


OP init_op(OP f){
  int i;

  for(i=0;i<deg(o2v(f))+1;i++){
    f.t[i].a=0;
    f.t[i].n=0;
}
    
  return f;
}


vec init_vec(vec a){
int i;

for(i=0;i<deg(a)+1;i++)
  a.x[i]=0;

return a;
}


<<<<<<< HEAD
vec Setvec(int p){
int i,a,b,n=0;
vec v={0};

for(i=p-1;i>-1;i--){
if(c[i]>0)
  a=n;
n++;
}


for(i=0;i<a+1;i++)
  v.x[a-i]=c[i];
=======
vec Setvec(void){
  int i,a,b,n;
  vec v={0};


  a=deg(c);

  for(i=0;i<a+1;i++)
    v.x[a-i]=c[i];
>>>>>>> 19a429fc6ab186a3a37215eddfed9359d1214e43

  return v;
}


void printpol(vec a){
  int i,n;

  n=deg(a);
  if(n<0){
    printf("baka\n");
    exit(1);
    }
  

  for(i=n;i>-1;i--){
    if(a.x[i]>0){
      printf("%u",a.x[i]);
      if(i>0)
	printf("x^%d",i);
    if(i>0)
      printf("+");
    }
  }
  printf("\n");

  return;
}


OP oadd(OP f,OP g){
  vec a={0},b={0},c={0};
  int i,k;
  OP h;

  a=o2v(f);
  b=o2v(g);
  if(deg(a)>deg(b)){
    k=deg(a)+1;
  }else{
    k=deg(b)+1;
}
  printf("k=%d\n",k);
  //  exit(1);
  for(i=0;i<k;i++)
    c.x[i]=a.x[i]^b.x[i];
  h=v2o(c);

  return h;
}


OP oterml(OP f,oterm t){
  int i;
  OP h={0};


  printf("deg=%d\n",deg(o2v(f)));
  for(i=0;i<deg(o2v(f))+1;i++){
    h.t[i].n=f.t[i].n+t.n;
    h.t[i].a=gf[mlt(fg[f.t[i].a],fg[t.a])];
  printf("%dx%d,",h.t[i].a,h.t[i].n);
  }
  printf("\n");
  //  exit(1);

  return h;
}


OP omul(OP f,OP g){
  int i,count=0;
  oterm t;
  OP h={0},e={0},r={0};


  for(i=0;i<deg(o2v(g))+1;i++){
    t=g.t[i];
    e=oterml(f,t);
    h=oadd(h,e);
  }

  return h;
}


oterm LT(OP f){
  int i;
  oterm t;

  for(i=0;i<deg(o2v(f))+1;i++){
    if(f.t[i].a>0){
      t.n=f.t[i].n;
      t.a=f.t[i].a;
    }
  }

  return t;
}


oterm LTdiv(OP f,oterm t){
  oterm tt,s;

  tt=LT(f);
  if(tt.n<t.n){
    s.n=0;
    s.a=0;
  } else if(tt.n==t.n){
    s.n=0;
    s.a=equ(t.a,tt.a);
  }else if(tt.n>t.n){
    s.n=tt.n-t.n;
    s.a=equ(t.a,tt.a);
    printf("%u\n",s.a);
}

  return s;    
}


OP omod(OP f,OP g){
  int i=0,j,n;
  OP h,e;
  oterm a,b,c;

 
  printpol(o2v(f));
  printpol(o2v(g));
  if(deg(o2v(f))==0 || deg(o2v(g))==0){
<<<<<<< HEAD
    printf("baka^\n");
    exit(1);
  }
//exit(1);  

=======
    printf("baka\n");
    exit(1);
  }
    
>>>>>>> 19a429fc6ab186a3a37215eddfed9359d1214e43
  a=LT(f);
  b=LT(g);
  n=a.n-b.n;
  while(deg(o2v(f))>=deg(o2v(g))){
    printf("n=======%u\n",deg(o2v(f)));
    printf("flgmjeo@ri");
    c=LTdiv(f,b);
    printf("%dx%d\n",c.a,c.n);
    ss.t[i++]=c;
    h=oterml(g,c);
    printf("er@pgkepoj");
    printpol(o2v(h));
    printpol(o2v(f));
    printpol(o2v(ss));
//exit(1);  
    f=oadd(h,f);
    //f=e;
    printpol(o2v(f));
    a=LT(f);

  }
  //exit(1);

  return f;
}


OP opow(OP f,int n){
  int i;
  OP g={0};

  memcpy(g.t,f.t,sizeof(f.t));
  for(i=1;i<n;i++)
    g=omul(g,f);

  return g;
}


OP opowmod(OP f,OP mod,int n){
  OP g;
  int i;
  
  g=omod(opow(f,n),mod);
  
  return g;
}


unsigned char trace(OP f,unsigned char x){
  int i;
  unsigned char u=0;

  for(i=0;i<deg(o2v(f))+1;i++)
    u^=gf[mlt(fg[f.t[i].a],mltn(f.t[i].n,fg[x]))];

  return u;
}


// invert of polynomial
OP inv(OP a,OP I){
  OP d,x={0},s={0},q={0},r={0},t={0};

  memcpy(d.t,I.t,deg(o2v(I))+1);
  //  d = I;
  //  x = {0};
  s.t[0].a = 1;
  while (deg(o2v(r)) > 0){
    r=omod(d , a);
    printpol(o2v(ss));
    //    exit(1);
    memcpy(q.t,ss.t,deg(o2v(ss))+1);
    // r = d % a;
    memcpy(d.t , a.t,deg(o2v(a))+1);
    memcpy(a.t , r.t,deg(o2v(r))+1);
    //a = r;
    t = oadd(x,omul(q , s));
    memcpy(x.t,s.t,deg(o2v(s))+1);
    //    x = s;
    memcpy(s.t,t.t,deg(o2v(t))+1);
    //    s = t;
  }
  //  gcd = d;  // $\gcd(a, n)$ 
  omod(I,d);

 return omod(oadd(x , I) , ss);
}


OP ToHorner(OP f){
  OP h;
  int i;
  vec v;

  v=o2v(f);


  return h;
}


OP vx(OP f,OP g){
  OP h={0};
  OP v[32]={0},vv={0};
  oterm a,b;
  int i;

  v[0].t[0].a=0;
  v[0].t[1].n=0;
  v[1].t[0].a=1;
  v[1].t[1].n=0;

  a=LT(f);
  b=LT(g);
  for(i=2;i<T+5;i++){
  h=omod(f,g);
  printf("ss=");
  printpol(o2v(ss));
  //   exit(1);
  v[i]=oadd(v[i-2],omul(ss,v[i-1]));
  printf("-------");
  printpol(o2v(v[i]));
  memcpy(f.t,g.t,sizeof(g.t));
  memcpy(g.t,h.t,sizeof(h.t));
  //  exit(1);
    if(deg(o2v(v[i-1]))==T)
    break;
  }
  memcpy(vv.t,v[i-1].t,sizeof(v[i-1].t));
  //      exit(1);
  printf("%d\n",deg(o2v(vv)));
  //    exit(1);
  
  return vv;
}


vec genrandompol(int n){
  arrayul u;
  vec x={0};
  int i,j=0,k;

  //  x=init_vec(x);
  i=n/N+1;
  while(j<i){
  seed();
  u=crand((unsigned char*)password);
  for(k=0;k<n+1;k++){
    x.x[j*N+k]=u.d[k];
    printf("%d,",u.d[k]);
  }
  j++;
  }
  printf("\n%d\n",deg(x));
  exit(1);  

  return x;
}


OP ogcd(OP f,OP g){
  OP h;
  oterm a,b;
  int i=0;

  a=LT(f);
  b=LT(g);
  while(i<T){
  h=omod(f,g);
  printpol(o2v(h));
  memcpy(f.t,g.t,sizeof(g.t));
  memcpy(g.t,h.t,sizeof(h.t));
  a=LT(f);
  printf("%dx%d\n",a.a,a.n);
  b=LT(g);
  printf("%dx%d\n",b.a,b.n);
  i++;
   }
//  exit(1);

  return h;
}

<<<<<<< HEAD

OP bibun(vec a){
 OP w[DEG]={0},l={0},t={0};
 int i,j,k,n;
 vec tmp={0};
 
 
 n=deg(a);
 for(i=0;i<T;i++){
   w[i].t[0].a=a.x[i];
   w[i].t[0].n=0;
   w[i].t[1].a=1;
   w[i].t[1].n=1;
   printpol(o2v(w[i]));
 }
 // exit(1);
 tmp.x[0]=1;
 for(i=0;i<T;i++){
   t=v2o(tmp);
   for(j=0;j<T;j++){
     if(i!=j)
       t=omul(t,w[j]);
   }
   l=oadd(l,t);
 }
 /*
 l= oadd(oadd(omul(omul(w[2],w[3]),w[1]),
	   omul(omul(w[0],w[2]),w[3])),
   oadd(omul(omul(w[0],w[1]),w[3]),
	omul(omul(w[0],w[1]),w[2])));
 printf("reogh95-\n");
 */ 
 printpol(o2v(l));
 printf("%d\n",oinv(2));
 //  exit(1);
 
 return l;
}


vec chen(OP f){
  vec e={0};
  int i,count=0,n,x=0;
  unsigned char y[256]={0},z;

//  e=o2v(f);
n=deg(o2v(f));
  for(x=0;x<M;x++){
    z=0;
    for(i=0;i<n+1;i++){
      z^=gf[mlt(mltn(f.t[i].n,fg[(unsigned char)x]),fg[f.t[i].a])];
    }
    if(z==0)
      e.x[count++]=(unsigned char)x;
    //    printf("%d\n",x);
  }

return e;
}


OP decode(OP f,OP s){
int i,j,k;
OP r,h,w,e={0};
oterm t1,t2;
vec x;


 r=vx(f,s);
 printpol(o2v(r));
 //      exit(1);
 h=ogcd(f,s);
 x=chen(r);
 for(i=0;i<T;i++)
   printf("x=%d ",x.x[i]);
 printf("\n");
 //exit(1);
 w=bibun(x);
 printpol(o2v(w));
printf("@@@@@@@@@\n");
//exit(1);

 
t1=LT(r);
t2.a=t1.a;
t2.n=0;
w=oterml(w,t2);
printpol(o2v(w));
printpol(o2v(h));
 printf("%d\n",deg(x)+1);
 //  exit(1);
for(i=0;i<deg(x)+1;i++){
  e.t[i].a=gf[mlt(fg[trace(h,x.x[i])],oinv(trace(w,x.x[i])))];
e.t[i].n=x.x[i];
}

 for(i=0;i<T;i++)
   printf("%d ",trace(h,x.x[i]));
 printf("\n");
 for(i=0;i<T;i++)
   printf("%d ",oinv(trace(w,x.x[i])));
 printf("\n");

 
return e;
}


OP setpol(unsigned char f[],int n){
OP g;
vec a;

  memset(c,0,DEG);
  memcpy(c,f,n);
  a=Setvec(n);
  g=v2o(a);


return g;
}


void det(unsigned char g[K+1]){
  OP f,h,w;
  unsigned char cc[K+1],d[2]={0},Ha[K][N];
  int i,j,a,b;
  oterm t={0};
  vec e;
  
    for(i=0;i<K+1;i++)
      printf("%d ",cc[i]);
    printf("\n");
    
  for(i=0;i<M;i++){
    memcpy(cc,g,K+1);
    w=setpol(g,K+1);

    a=trace(w,i);
      
    printf("a=");
    printf("%d ",gf[oinv(a)]);
   
  printf("\n");
  //exit(1);
  
  for(j=0;j<K+1;j++)
    printf("%d ",cc[j]);
  printf("\n");
  
  cc[K]^=a;
  f=setpol(cc,K+1);
    printpol(o2v(f));
  
  for(j=0;j<K+1;j++)
    printf("%d ",cc[j]);
  printf("\n");
  
  //  exit(1);
  //d[0]=i;
  //d[1]=1;
  h.t[0].a=i;
  h.t[0].n=0;
  h.t[1].a=1;
  h.t[1].n=1;
  
  omod(f,h);
  //   printpol(o2v(ss));
   //    exit(1);

  b=oinv(a);
  t.a=gf[b];
  t.n=0;
  //  printf("t=%d\n",t.a);
  //  exit(1);
  w=oterml(ss,t);
  //  printpol(o2v(w));
  e=o2v(w);
  for(j=0;j<K;j++){
    printf("%d,",e.x[K-1-j]);
    mat[j][i]=e.x[K-1-j];
  }
  printf("\n");
    }
  //   exit(1); 
  for(i=0;i<K;i++){
    for(j=0;j<M;j++)
      printf("%x,",mat[i][j]);
    printf("\n");
  }
  
  //    exit(1);
}
=======

OP lbib(vec a){
OP w[DEG]={0},l={0},t={0};
int i,j,k,n;
vec tmp={0};

n=deg(a);
for(i=0;i<n+1;i++){
w[i].t[0].a=a.x[i];
w[i].t[0].n=0;
w[i].t[1].a=1;
w[i].t[1].n=1;
}

tmp.x[0]=1;
for(i=0;i<n+1;i++){
t=v2o(tmp);
for(j=0;j<n+1;j++){
if(i!=j)
t=omul(t,w[j]);
}
l=oadd(l,t);
}


return l;
}


vec chen(OP f){
  vec e={0};
  int i,count=0,n;
  unsigned char x=0,y[256]={0},z;

//  e=o2v(f);
n=deg(o2v(f));
  for(x=0;x<M;x++){
    z=0;
    for(i=0;i<n+1;i++){
	z^=gf[mlt(mltn(f.t[i].n,fg[x]),fg[f.t[i].a])];
    }
    if(z==0)
      e.x[count++]=x;    
  }

return e;
}


OP decode(OP f,OP s){
int i,j,k;
OP r,h,w,e={0};
oterm t1,t2;
vec x;

    r=vx(f,s);
    h=ogcd(f,s);
    x=chen(r);
    w=lbib(x);

printf("@@@@@@@@@\n");

t1=LT(r);
t2.a=t1.a;
t2.n=0;
w=oterml(w,t2);
printpol(o2v(w));
printpol(o2v(h));
for(i=0;i<deg(x)+1;i++){
e.t[i].a=gf[mlt(fg[trace(h,x.x[i])],oinv(trace(w,x.x[i])))];
e.t[i].n=x.x[i];
}


return e;
}


OP setpol(unsigned char f[],int n){
OP g;
vec a;

  memcpy(c,f,n);
  a=Setvec();
  g=v2o(a);


return g;
}


int main(){
  vec a,b,x;
  int n,i,k=6;
  unsigned char s[6]={4,12,7,8,11,13};
  unsigned char g[7]={1,0,0,0,1,0,1};
  OP f,g1,h,r,t,w,e;
  oterm t1,t2;


  g1=setpol(s,6);
  f=setpol(g,7);

  printpol(o2v(g1));
  printpol(o2v(f));

>>>>>>> 19a429fc6ab186a3a37215eddfed9359d1214e43

  e=decode(f,g1);

  for(i=0;i<deg(o2v(e))+1;i++)
    printf("e=%d %d\n",e.t[i].a,e.t[i].n);

int main(void){
  int i,j,k,l,ll,oo,lll=0,aa=0;
  unsigned long cc,a,x,count=1;
  unsigned char coef[6]={13,11,8,7,12,4};
  unsigned char xx[200]={0},b[K]={0},bb[K]={0},c[K]={0};
  unsigned char va[K+2][K+2]={0},p[200][200][200]={0},m[K];
  time_t timer;
  FILE *fp,*fq;
  //unsigned char g[K+1]={1,0,0,0,1,0,1};//{1,0,0,0,0,0,1,0,1,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1};
    //{1,0,1,0,1,0,0,1,1};

  //={1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1}; //={1,5,0,1,7,3,15}; //={1,2,9,4,0,6,4}; // //
  unsigned char g2[7]={1,0,9,0,0,6,4};
  //  unsigned char s[K]={0}; //{4,12,7,8,11,13};

  unsigned char ee[10]={1,2,3,4,5,6,7,8,9,10};
  unsigned char zz[M]={0};
  unsigned char R[M][M],R1[K][K],E[K][K]={0},G1[K][M],G2[K][M];
  int y;
  OP f,h,r,w;
  vec v;
  unsigned char  HH[8][16]={
    {1,1,15,4,3,9,15,5,14,5,1,1,8,3,8,2},
    {1,0,8,8,15,15,6,7,3,3,11,10,12,13,5,5},
    {0,0,9,1,14,1,13,12,1,2,1,1,6,7,4,1},
    {0,0,11,3,10,5,5,15,8,11,10,11,3,8,10,15},
    {1,1,0,1,0,1,8,3,1,0,10,11,5,15,0,1},
    {0,1,0,3,0,5,2,9,8,0,11,10,14,4,0,15},
    {1,0,15,1,3,1,3,8,1,5,0,0,15,5,8,1},
    {0,0,7,3,12,5,10,10,8,6,0,0,11,11,13,15}
  };
  unsigned char d=0;

  unsigned char s[K]={4,12,7,8,11,13};
  unsigned char g[K+1]={1,0,0,0,1,0,1};

  
  w=setpol(g,K+1);
  f=setpol(s,K);
  r=decode(w,f);
  
  for(i=0;i<T;i++)
    printf("e=%d %d\n",r.t[i].a,r.t[i].n);
  
  // h2g(mat);
  //  exit(1);

  return 0;
}
<<<<<<< HEAD
=======

>>>>>>> 19a429fc6ab186a3a37215eddfed9359d1214e43
