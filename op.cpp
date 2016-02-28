//date      :  20160228
//auther    : the queer who thinking about cryptographic future
//code name : OVP - One Variable Polynomial library with OpenMP friendly
//status    : now in debugging (ver 0.1)

#include "chash.cpp"


#define DEG 256



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

OP ss;

unsigned char oinv(unsigned char a){
  int i;

  for(i=0;i<M;i++){
    if(gf[mlt(fg[a],fg[i])]==1)
      return (unsigned char)i;
  }

}


vec o2v(OP f){
  vec a;
  int i,count=0;

  memset(a.x,0,DEG);
  for(i=0;i<DEG;i++)
    if(f.t[count].n>0)
      a.x[f.t[count].n]=f.t[count].a;

  return a;
}

OP v2o(vec a){
  int i,count=0;
  OP f;

  for(i=0;i<DEG;i++){
    f.t[i].n=i;
    f.t[i].a=a.x[i];
  }

  return f;
}

int deg(vec a){
  int i,n;

  for(i=0;i<sizeof(a);i++){
    if(a.x[i]>0)
      n=i;
  }

  return n;
}

OP oadd(OP f,OP g){
  vec a,b,c;
  int i;
  OP h;

  a=o2v(f);
  b=o2v(g);
  for(i=0;i<DEG;i++)
    c.x[i]=a.x[i]^b.x[i];
  h=v2o(c);

  return h;
}

OP oterml(OP f,oterm t){
  int i;
  OP h;

  memset(h.t,0,sizeof(h));
  for(i=0;i<DEG;i++){
    h.t[i].n=f.t[i].n+t.n;
    h.t[i].a=gf[mlt(fg[f.t[i].a],fg[t.a])];
  }

  return h;
}

OP omul(OP f,OP g){
  int i,count=0;
  oterm t;
  OP h,e,r;

  memset(h.t,0,sizeof(h));
  for(i=0;i<DEG;i++){
    t=g.t[i];
    e=oterml(f,t);
    r=oadd(e,h);
    h=e;
}

  return h;
}

oterm LT(OP f){
  int i;
  oterm t;

  for(i=0;i<DEG;i++){
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
    s.a=oinv(tt.a);
  }else if(tt.n>t.n){
    s.n=tt.n-t.n;
    s.a=oinv(tt.a);
}

  return s;    
}

OP omod(OP f,OP g){
  int i=0,j;
  OP h,e;
  oterm a,b,c;

  memset(ss.t,0,sizeof(ss));
  a=LT(f);
  b=LT(g);
  while(a.n>=b.n){
    c=LTdiv(f,b);
    ss.t[i++]=c;
    h=oterml(g,c);
    e=oadd(h,f);
    f=e;
    a=LT(f);
  }

  return f;
}

void printpol(vec a){
  int i,n;

  n=deg(a);
  for(i=0;i<n;i++){
    if(a.x[i]>0){
      printf("%ux^%u",a.x[i],i);
    if(i<n)
      printf("+");
    }
  }
  printf("\n");

  return;
}


vec genrandompol(int n){
  arrayul u;
  vec x;
  int i,j=0,k;

  memset(x.x,0,sizeof(x));
  i=n/N+1;
  while(j<i){
  seed();
  u=crand((unsigned char*)password);
  for(k=0;k<n;k++){
    x.x[j*N+k]=u.d[k];
    printf("%d,",u.d[k]);
  }
  j++;
  }
  printf("\n%d\n",deg(x));
  exit(1);  

  return x;
}


int main(){

  printf("%d\n",deg(genrandompol(32)));

  //  printpol(genrandompol(32));

  return 0;
}




