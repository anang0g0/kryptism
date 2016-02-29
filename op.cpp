//date      :  20160228
//auther    : the queer who thinking about cryptographic future
//code name : OVP - One Variable Polynomial library with OpenMP friendly
//status    : now in debugging (ver 0.1)

#include "chash.cpp"


#define DEG 256
#define K 6


unsigned char c[]={0};

typedef struct {
  unsigned int n;
  unsigned int a;
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
    if(gf[mlt(fg[a],fg[i])]==1)
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
    //    printf("%d[%d],",a.x[i],i);
    if(a.x[i]>0)
      n=i;
  }
  
  if(n>0){
    return n;
  }else{
    return 0;
  }
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




vec Setvec(void){
  int i,a,b;
  vec v={0};

  for(i=0;i<DEG;i++){
    if(c[i]>0)
      a=i;
}

  //  printf("size=%d",a);

    
  for(i=0;i<a+1;i++)
    v.x[a-i]=c[i];

  return v;
}


void printpol(vec a){
  int i,n;

  n=deg(a);
  if(n<1){
    printf("baka\n");
    exit(1);
}

  for(i=n;i>-1;i--){
    if(a.x[i]>0){
      printf("%u",a.x[i]);
      if(i>0)
	printf("x^%d",i);
    if(i>0 && a.x[i-1]>0)
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

  //  memset(h.t,0,sizeof(h));
  /*
  for(i=0;i<DEG;i++){
    h.t[i].a=0;
    h.t[i].n=0;
  }
  */
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

  //  memset(h.t,0,sizeof(h));
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
  int i=0,j;
  OP h,e;
  oterm a,b,c;

  //  memset(ss.t,0,sizeof(ss));
  /*
  for(i=0;i<DEG;i++){
    ss.t[i].a=0;
    ss.t[i].n=0;
    }*/
  printpol(o2v(f));
  printpol(o2v(g));
  a=LT(f);
  b=LT(g);
  while(a.n>=b.n){
    printf("flgmjeo@ri");
    c=LTdiv(f,b);
    printf("%dx%d\n",c.a,c.n);
    ss.t[i++]=c;
    h=oterml(g,c);
    printf("er@pgkepoj");
    printpol(o2v(h));
    f=oadd(h,f);
    //f=e;
    printpol(o2v(f));
    a=LT(f);
  }

  return f;
}


OP vx(OP f,OP g){
  OP h={0};
  OP v[32]={0},vv={0};
  oterm a,b;
  int i=2;

  v[0].t[0].a=0;
  v[0].t[1].n=0;
  v[1].t[0].a=1;
  v[1].t[1].n=0;

  a=LT(f);
  b=LT(g);
  while(i<deg(o2v(f))+1){
  h=omod(f,g);
  v[i]=oadd(v[i-2],omul(ss,v[i-1]));
  printf("-------");
  printpol(o2v(v[i]));
  memcpy(f.t,g.t,sizeof(g.t));
  memcpy(g.t,h.t,sizeof(h.t));
  i++;
  }
  memcpy(vv.t,v[i-1].t,sizeof(v[i-1].t));

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
  while(i<3){
  h=omod(f,g);
  printpol(o2v(h));
  memcpy(f.t,g.t,sizeof(g.t));
  //  *g.t= *h.t;
  memcpy(g.t,h.t,sizeof(h.t));
  a=LT(f);
  printf("%dx%d\n",a.a,a.n);
  b=LT(g);
  printf("%dx%d\n",b.a,b.n);
  i++;
   }
  exit(1);

  return h;
}

OP bibun(vec a){

}


int main(){
  vec a,b;
  int n,i,k=6;
  unsigned char s[6]={4,12,7,8,11,13};
  unsigned char g[7]={1,0,0,0,1,0,1};
  OP f,g1,h,r,t;
  oterm t1,t2;


  memcpy(c,s,6);
  a=Setvec();
  printpol(a);
  memcpy(c,g,7);
  b=Setvec();
  f=v2o(b);
  g1=v2o(a);
  r=vx(f,g1);
  //  h=ogcd(f,g1);
  printpol(o2v(r));
  exit(1);

  t1.a=6;
  t1.n=1;
  t2.a=10;
  t2.n=0;
  r.t[0]=t1;
  r.t[1]=t2;
  printpol(o2v(r));
  //    exit(1);


  g1=v2o(a);
  printpol(o2v(g1));
  f=v2o(b);
  printpol(o2v(f));
  h=omod(f,g1);
  printf("test\n");
  printpol(o2v(h));
  //  exit(1);
  
t1=LT(f);
  printf("LT(f)=%dx%d\n",t1.a,t1.n);
  t2=LT(g1);
  printf("LT(g1)=%dx%d\n",t2.a,t2.n);
  t2=LTdiv(f,t2);
  printf("LTdiv=%dx%d\n",t2.a,t2.n);
  t=oterml(g1,t2);
 printpol(o2v(t));
  f=oadd(f,t);
  //  h=oadd(f,g1);
 printpol(o2v(f));
 t1=LT(f);
 printf("LT(f)=%dx%d\n",t1.a,t1.n);
 t2=LT(g1);
 printf("LT(g1)=%dx%d\n",t2.a,t2.n);
 t2=LTdiv(f,t2);
  printf("LTdiv=%dx%d\n",t2.a,t2.n);
 t=oterml(g1,t2);
 h=oadd(f,t);
 printpol(o2v(h));
 // printf("%dx%d\n",t2.a,t2.n);
  //  h=omod(f,g1);
  //  printf("%d\n",deg(genrandompol(32)));
  exit(1);
   

  return 0;
}




