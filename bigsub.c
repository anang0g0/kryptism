##include <stdio.h>
#include <string.h>
#include <stdlib.h>


char str1[] = "1234567891011";
char str2[] = "99999";
char *set[10] ={"1000","2000","3000","4000","5000","6000","7000","8000","9000","10000"};
char *set2[10] = {"100","200","300","400","500","600","700","800","900","1000"};
char buf[640]; 
unsigned short t[640],t2[640];
unsigned short a[640],b[640];

int setnum(char *str){

  int i;

  for(i=0;i<640;i++)
    t[i]=buf[i]=0;

  if(strlen(str)%4==0)
      printf("len/4=%d\n",strlen(str)%4);
    if(strlen(str)%4>0)
      printf("len/4=%d\n",strlen(str)%4);
    if(strlen(str)%4==0){
      for(i=0;i<strlen(str)/4+1;i++){
	strncpy( buf, str+(i*4), 4 ); //strの先頭+3の位置から5文字をtにコピー
	buf[4] = '\0';            //取り出した文字数分の最後に'\0'を入れ
	t[i+1]=strtoul(buf,NULL,10);
	//	printf( "%d ", t[i] );
      }
      for(i=0;i<ind(str)+1;i++)
	printf("%d@",t[i]);
      printf("\n");
	
    }
    printf("\n");
    if(strlen(str)%4>0){
      printf("re=%d\n",(strlen(str)%4));
      strncpy(buf,str+0,(strlen(str)%4));
      buf[strlen(str)%4]='\0';
      t[0]=strtoul(buf,NULL,10);
            printf("%d ",t[0]);
      if((strlen(str)-(strlen(str)%4))%4==0){
	for(i=0;i<strlen(str)/4;i++){
	  strncpy( buf, str+strlen(str)%4+i*4, 4 ); //strの先頭+3の位置から5文字をtにコピー
	  buf[4] = '\0';            //取り出した文字数分の最後に'\0'を入れ
	  t[i+1]=strtoul(buf,NULL,10);
	  //	  printf( "%d ", t[i] );	
	}
      }
      for(i=0;i<ind(str)+1;i++)
	printf("%d[,",t[i]);
      printf("\n");
      //      exit(1);
    }

    return t[0];
}

int keta(char *str){
  int len=0;

  len=strlen(str);

  return len;
}

int compare(char *aa,char *bb){
  int i,j;

  //  i=setnum(aa);
  //j=setnum(bb);

  if(keta(aa)>keta(bb))
    return 1;
  if(keta(aa)<keta(bb))
    return -1;
  if(keta(aa)==keta(bb) && i>j)
    return 1;
  if(keta(aa)== keta(bb) && i<j)
    return -1;
  if(keta(aa)== keta(bb) && i==j)
    return 0;
}


int ind(char *str){

    if(keta(str)%4==0)
      return keta(str)/4;
    if(keta(str)%4>0)
      return keta(str)/4;
}


  void awase(char *s1,char *s2){

    int i,j,k=0,ii=0,kk=0;

    i=ind(s1);
    j=ind(s2);
    if(i>j){
      a[0]=setnum(s1);
      for(k=1;k<i+1;k++){
	a[k]=t[k];
	printf("%d",a[k]);
	}
      printf("\n");
      k=0;
      while(k<(i-j)){
	b[k]=0;
	printf("k=%d\n",b[k]);
	k++;
      }
      kk=0;
      b[k]=setnum(s2);
      printf("%d ,%d\n",b[k],k);
      k++;
      for(ii=1;ii<j+1;ii++){
	b[k]=t[ii];
	printf("b=%d ,%d\n",b[k],k);
	k++;
      }
      for(k=0;k<i+1;k++)
	printf("%d ",a[k]);
      printf("\n");
      for(k=0;k<j+1;k++)
	printf("%d ",b[k]);
      printf("\n");
      printf("gajaliahgerugereh\n");
      for(k=0;k<i+1;k++)
	printf("%d,",a[k]-b[k]);
      printf("\n");
    }
    printf("\n");
    if(j>=i){
      b[0]=setnum(s2);
      for(k=1;k<j+1;k++)
	b[k]=t[k];
      k=0;
      while(k<(j-i+1))
	a[k++]=0;

      a[k]=setnum(s1);
      kk=0;
      for(ii=k;ii<i+1;ii++){
	a[ii]=t[kk+1];
	kk++;
      }
      for(k=0;k<i+1;k++)
	printf("%d ",a[k]);
	  printf("\n");
      for(k=0;k<j+1;k++)
	printf("%d ",b[k]);
      printf("\n");
    }
    if(i==j){
      printf("zagitowa\n");
      a[0]=setnum(s1);
      printf("%d\n",a[0]);
      
      for(ii=1;ii<i+1;ii++)
	a[ii]=t[ii];
      b[0]=setnum(s2);
      for(ii=1;ii<j+1;ii++)
	b[ii]=t[ii];
      
      for(k=0;k<i+1;k++)
	printf("%d ",a[k]);
      printf("\n");
      for(k=0;k<i+1;k++)
	printf("%d ",b[k]);
      printf("\n");
      
    }
    
  }

  
void bigmul(char *s1,char *s2){
  int i,j,k,ii,jj,tmp=0;
  int c[640][640]={0},d[1280]={0};

  awase(s1,s2);
//  exit(1);
  ii=ind(s1);
  jj=ind(s2);
  for(i=0;i<ii+1;i++)
    printf("%d,",a[i]);
  printf("\n");
  for(j=0;j<ii+1;j++)
    printf("%d,",b[j]);
  printf("\n");
  //  exit(1);
  for(i=0;i<ii+1;i++){
    for(j=0;j<ii+1;j++)
      c[i][j+i]=a[i]*b[j];
  }
  for(i=0;i<ii+1;i++){
    for(j=0;j<ii+1;j++)
      printf("%u ",c[i][j+i]);
    
        printf("\n");
  }
  for(i=0;i<ii+1;i++){
    for(j=0;j<ii+1;j++)
      d[i+j]+=c[i][j+i];
  }
  for(i=ii+ii+1;i>-1;i--){
    d[i-1]+=d[i]/10000;
    d[i]=d[i]%10000;
  }
  for(i=0;i<ii+ii+1;i++)
    printf("%d,",d[i]);
  printf("\n");
}


aaa(){
int i = -99;

char buf[12];
snprintf(buf, 12, "%d", i);

puts(buf); // "-99"
}

  
bigsub(){
  ///  int a[6400],b[6400]
  int c[640];
  char tmp1[640],*tmp2,tmp0[]="",str[]="";
  int i,k;

  //  awase(str1,str2);
  printf("a=\n");


  for(i=0;i<ind(str1)+1;i++){
    if(a[i]>=b[i])
      c[i]=a[i]-b[i];
    if(a[i]<b[i]){
      k=i;
      c[i-1]--;
      c[i]=10000+a[i]-b[i];
    }
  //    c[0]=a[0]-b[0];
  }
  printf("%d\n",k-1);
  //  c[k-1]=c[k-1]-1;
  //  for(i=0;i<strlen(str1)/4+1;i++)
    //    puts(c)[i];
    for(i=0;i<4;i++){
    if(c[i]>0)
    snprintf(tmp1,640,"%d",c[i]);
    //*str=  *tmp1;
    
    strcpy(tmp0,tmp1);
    tmp2=strcat(str,tmp0);
    *str=*tmp2;
    printf("%s\n",str);
    }

  
  printf("\n");
}


bigadd(char *srt1,char *str2){
  int c[640],i,tmp=0;

  for(i=0;i<640;i++)
    c[i]=0;

  
  awase(str1,str2);

  for(i=0;i<ind(str1)+1;i++){
    c[i]=a[i]+b[i];
    if(c[i]>9999){
      c[i-1]+=c[i]/10000;
      c[i]=c[i]%10000;
    }
   
  }
  for(i=0;i<ind(str1)+1;i++)
    printf("%d,",c[i]);
  printf("\n");
}


int cmp(int aa[],int bb[]){
  int i,j,k,flg=0,n1,n2;


  for(i=0;i<640;i++){
    if(bb[i]>0)
      n1=i;
  }  
  for(i=0;i<640;i++){
    if(aa[i]>0)
      n2=i;
  }


  if(n1>n2){
    n1=n2;
    return n1;
  }
  if(n1<n2)
    return n1;
  if(n1==n2)
    return 0;
    
}




void bigdiv(){
  int i,j,k,c[640][640]={0},d[1280]={0};
  int n1[640],n2[640],r[640];
  int ii,jj,count=0;
  char tank[]="0";
  //char *str[][2]={"1","2","3","4","5","6","7","8","9","10"};
  char str[]="1";
  char *str0,*tmp;
  
  i=keta(str1);
  j=keta(str2);

  printf("%d\n",i);
  printf("%d\n",j);
  printf("%d\n",i-j);
  //  tmp=str[0][0];
  while(count<7){
    str0=strcat(str2,tank);
    *str2=*str0;
    count++;
  }
  count=0;
  printf("%s\n",str2);
    awase(str1,str2);
  bigsub();

  
  exit(1);

  /*
  n1[0]=setnum(s1);
  for(ii=1;ii<i+1;ii++)
    n1[ii]=t[ii];
    
  for(ii=0;ii<i+1;ii++)
    printf("%d,",n1[ii]);
  printf("\n");

    n2[0]=setnum(s2);
  for(ii=1;ii<j+1;ii++)
    n2[ii]=t[ii];
  for(ii=0;ii<j+1;ii++)
    printf("%d,",n2[ii]);
  printf("\n");

printf("n1=%d\n",keta(s1));
printf("n2=%d\n",keta(s2));
  */




  
}



main() {
  int i;

  /*
  setnum(str1);
  for(i=0;i<strlen(str1)/4+1;i++)
    printf("%d ",t[i]);
  printf("\n");
  setnum(str2);
  for(i=0;i<strlen(str2)/4+1;i++)
    printf("%d ",t[i]);
  */
  //bigsub(str1,str2);
  awase(str1,str2);
  printf("\n");
  //  bigadd(str1,str2);  
  //  bigmul(str1,str2);

  bigdiv();



  
}
