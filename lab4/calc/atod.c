#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <string.h>

int atod(char *a){
 int ans = 0;
 int i;
 int length = strlen(a);
 for (i=0; i<length; i++){
   ans = ans*10;
   ans = ans + (a[i]);
   ans = ans - '0';
 }
 return ans;
}