#include <stdio.h>
#include <errno.h>
#define FT(x) int main(void) {FILE *fd = fopen("Grace_kid.c", "w"); if(fd == NULL){perror("fopen error"); return(1);} char *code = x; fprintf(fd, code, DOUBLE_QUOTES, NEW_LINE, code); fclose(fd); return(0);}
#define DOUBLE_QUOTES 34
#define NEW_LINE 10

/*
	Call to the macro that contains the entire program
*/
FT("#include <stdio.h>%2$c#include <errno.h>%2$c#define FT(x) int main(void) {FILE *fd = fopen(%1$cGrace_kid.c%1$c, %1$cw%1$c); if(fd == NULL){perror(%1$cfopen error%1$c); return(1);} char *code = x; fprintf(fd, code, DOUBLE_QUOTES, NEW_LINE, code); fclose(fd); return(0);}%2$c#define DOUBLE_QUOTES 34%2$c#define NEW_LINE 10%2$c%2$c/*%2$c	Call to the macro that contains the entire program%2$c*/%2$cFT(%1$c%3$s%1$c)")