#include <stdio.h>
#define MAIN int main(void)
#define BODY {FILE *fd = fopen("Grace_kid.c", "w"); char *code = "#include <stdio.h>%c#define MAIN int main(void)%c#define BODY {FILE *fd = fopen(%cGrace_kid.c%c, %cw%c); char *code = %c%s%c; fprintf(fd, code, 10, 10, 34, 34, 34, 34, 34, code, 34, 10, 10, 10, 10); fclose(fd); return(0);}%c#define PROGRAM MAIN BODY%c%c// Call to the macro that contains the entire program%cPROGRAM"; fprintf(fd, code, 10, 10, 34, 34, 34, 34, 34, code, 34, 10, 10, 10, 10); fclose(fd); return(0);}
#define PROGRAM MAIN BODY

// Call to the macro that contains the entire program
PROGRAM