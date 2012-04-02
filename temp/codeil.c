/* Copyright (C) Hola 2012
 *
 * Welcome to TheCodeIL.com Challenge!
 *
 * RULES:
 * - A perfect solution by 15-Mar-12 gets you 2,000 NIS! (Israel residents only)
 * - For a good answer (but not perfect), we'll send you some comments to help
 *   you to make it perfect. A perfect (2nd time) answer gets you 1,000 NIS.
 *
 * GUIDELINES:
 * - Look at main(): it calls various functions.
 * - You are asked to implement two functions: str_cpy() and str_cat(). No need
 *   to implement str_printf() and str_free().
 * - Reading main() carefully will allow to understand str_cpy() and str_cat()
 *   signature and usage.
 * - The code you write needs to be "library quality"; as good as you would
 *   expect a good libc to implement such functions.
 * - At the top of the page, you see 3 includes - indicating the functions that
 *   can be used to implement str_cpy() and str_cat().
 * - You have 15 minutes to implement the whole solution.
 *
 * FYI: it is possible to implement str_cpy() and str_cat() efficiently in no
 *      more than 7 lines of code per function, and in less than 5 minutes.
 *
 * Copy/paste solution and send to jobs@hola.org. We get back within a day.
 *
 * Good luck!
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// copies str2 to str1
char **str_cpy(char** str1, char* str2){
  char **temp = str1;
  while (*str2!='\0'){
    *temp++ = str2++;
  }
  //*temp++;
  //*temp = '\0';
  return str1;
}


char **str_cat(char** str1, char* str2){
  int i = 0;
  char **temp = str1 + 4*strlen(*str1);
  printf("hello\n");
 printf("temp:%s\n",*temp);
 printf("str1:%s\n",*str1);
 
  while (*str2!='\0'){
	printf("from str2:%c\n",*str2);
	// *temp++ = str2++;
	**temp = *str2;
	*temp++;
	str2++;
	}
 
  printf("str1:%s\n",*str1);
  printf("str2:%s\n",str2);
  printf("temp:%s\n",*temp);
  
  for (i = 0; i<4; i++){
	/*printf("%d, -%c-\n",i,**temp);
	if (**temp=='\0')
		printf("space!");
	printf("%d, -%s-\n",i,*temp);
	*/
	*temp--;
	}
	printf("%s\n",*temp);
  //printf("%s\n",*ans);
  //while(*str1++ == str2++);s
  
  //**temp = **(temp+size-1);
  //**(temp+size-3) = 'a';
  
  //str_cpy(temp,str2);
  /*
  printf("back to strcat\n");
  while (*(temp+1)!='\0'){
    printf("%c\n",**temp);
    *temp++;
  }
  
  printf("printing str1?\n");
  while (*str1!='\0'){
    printf("%c\n",**str1);
    *str1++;
  }
  */
  /*
  *temp = '\0';
  while (*str2!='\0'){
    *temp++ = str2++;
  }
  */
  //*temp = '\0';
  printf("\n");
  return str1;
}

int main(int argc, char *argv[])
{
    char *s = NULL;
    str_cpy(&s, "That Thmp");
    puts(s);
    str_cpy(&s, s+5);
    puts(s);
    str_cat(&s, " is");
    puts(s);
    //str_printf(&s, "%s a test!", s);
    //puts(s); /* result: "This is a test!" */
    //str_free(&s);
    return 0;
}
