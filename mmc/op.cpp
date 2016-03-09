//date      :  20160310
//auther    : the queer who thinking about cryptographic future
//code name : OVP - One Variable Polynomial library with OpenMP friendly
//status    : now in debugging (ver 0.1)

#include "chash.cpp"


#define DEG 256
#define K 6



unsigned char mat[K][N]={0};
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


vec Setvec(void){
  int i,a,b,n;
  vec v={0};


  a=deg(c);

  for(i=0;i<a+1;i++)
    v.x[a-i]=c[i];

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
  int i=0,j;
  OP h,e;
  oterm a,b,c;

 
  printpol(o2v(f));
  printpol(o2v(g));
  if(deg(o2v(f))==0 || deg(o2v(g))==0){
    printf("baka\n");
    exit(1);
  }
    
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


  e=decode(f,g1);

  for(i=0;i<deg(o2v(e))+1;i++)
    printf("e=%d %d\n",e.t[i].a,e.t[i].n);



  return 0;
}

