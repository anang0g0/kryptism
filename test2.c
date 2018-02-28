#include <stdio.h>
#include <stdlib.h>
#include <string.h>




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





void awase(char *s1,char *s2){
  
    int i,j,k=0,ii=0,kk=0;

    i(=strlen(s1)/4);
    j=strlen(s2)/4;
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

    for(i=0;i<4;i++){
    printf("%d\n",c[i]);
    }

  
  printf("\n");
}






void bigdiv(){
  int i,j,k,c[640][640]={0},d[1280]={0};
  int n1[640],n2[640],r[640];
  int ii,jj,count=0;
  char tank[]="0";
  char str[]="1";
  char *str0,*tmp;
  
  i=strlen((str1));
  j=strlen(str2);

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
  
}



main() {
  int i;

  awase(str1,str2);
  printf("\n");

  bigdiv();
  
}
