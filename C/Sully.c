#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define TAB 9
#define DOUBLE_QUOTE 34
#define NEW_LINE 10

int main(void)
{
	int i = 5;
	if(i > 0)
	{
		char filename[50];
		char cmd[100];
		if(strstr(__FILE__, "Sully.c") == NULL)
			i--;
		snprintf(filename, sizeof(filename), "Sully_%d.c", i);
		snprintf(cmd, sizeof(cmd), "clang -Wall -Wextra -Werror Sully_%d.c -o Sully_%d && ./Sully_%d", i, i, i);
		FILE *fd = fopen(filename, "w");
		char *code = "#include <stdio.h>%2$c#include <stdlib.h>%2$c#include <string.h>%2$c#define TAB 9%2$c#define DOUBLE_QUOTE 34%2$c#define NEW_LINE 10%2$c%2$cint main(void)%2$c{%2$c%1$cint i = %4$d;%2$c%1$cif(i > 0)%2$c%1$c{%2$c%1$c%1$cchar filename[50];%2$c%1$c%1$cchar cmd[100];%2$c%1$c%1$cif(strstr(__FILE__, %3$cSully.c%3$c) == NULL)%2$c%1$c%1$c%1$ci--;%2$c%1$c%1$csnprintf(filename, sizeof(filename), %3$cSully_%%d.c%3$c, i);%2$c%1$c%1$csnprintf(cmd, sizeof(cmd), %3$cclang -Wall -Wextra -Werror Sully_%%d.c -o Sully_%%d && ./Sully_%%d%3$c, i, i, i);%2$c%1$c%1$cFILE *fd = fopen(filename, %3$cw%3$c);%2$c%1$c%1$cchar *code = %3$c%5$s%3$c;%2$c%2$c%1$c%1$cfprintf(fd, code, TAB, NEW_LINE, DOUBLE_QUOTE, i, code);%2$c%1$c%1$cfclose(fd);%2$c%1$c%1$csystem(cmd);%2$c%1$c}%2$c%2$c%1$creturn(0);%2$c}";

		fprintf(fd, code, TAB, NEW_LINE, DOUBLE_QUOTE, i, code);
		fclose(fd);
		system(cmd);
	}

	return(0);
}