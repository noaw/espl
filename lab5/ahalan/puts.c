int write(int,const char*,int);

int puts(const char *s){
   //return write(1,"hello",5);
   return write(1,s,length(s));
}


int length(char *s) {
	char *t = s;
	while(*t) ++t;
	return t-s;
}
