#include <stdio.h>
#include <string.h>

  char str1[] = "1123456789022222222222222222211111111111111111111111111111110001011";
  char str2[] = "9999999999999999999999999999999999999999999999999999999999999999912";


void setnum(char *str){
  char buf[6400]; 
  unsigned short t[6400],t2[6400];

  int i;

  if(strlen(str)%4==0)
      printf("len/4=%d\n",strlen(str)/4);
    if(strlen(str)%4>0)
      printf("len/4=%d\n",strlen(str)/4+1);
    if(strlen(str)%4==0){
      for(i=0;i<strlen(str)/4;i++){
	strncpy( buf, str+0, 4 ); //strの先頭+3の位置から5文字をtにコピー
	buf[4] = '\0';            //取り出した文字数分の最後に'\0'を入れ
	t[i]=strtoul(buf,NULL,10);
	printf( "%d ", t[i] );
      }
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
	  t[i]=strtoul(buf,NULL,10);
	  printf( "%d ", t[i] );	
	}
      }
      printf("\n");

    }
    //9 9999 9999 9999 9999 9999 9999 9999 9999 9999 9999 9999 9999 9999 9999 9999 
  
}

main() {

  setnum(str1);
  setnum(str2);
    

    printf("\n");
    
}
