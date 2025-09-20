#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include <string.h>
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
		if(fd == NULL)
		{
			perror("fopen error");
			return(1);
		}
		char *code = "#include <stdio.h>%1$c#include <errno.h>%1$c#include <stdlib.h>%1$c#include <string.h>%1$c#define DOUBLE_QUOTE 34%1$c#define NEW_LINE 10%1$c%1$cint main(void)%1$c{%1$c	int i = %3$d;%1$c	if(i > 0)%1$c	{%1$c		char filename[50];%1$c		char cmd[100];%1$c		if(strstr(__FILE__, %2$cSully.c%2$c) == NULL)%1$c			i--;%1$c		snprintf(filename, sizeof(filename), %2$cSully_%%d.c%2$c, i);%1$c		snprintf(cmd, sizeof(cmd), %2$cclang -Wall -Wextra -Werror Sully_%%d.c -o Sully_%%d && ./Sully_%%d%2$c, i, i, i);%1$c		FILE *fd = fopen(filename, %2$cw%2$c);%1$c		if(fd == NULL)%1$c		{%1$c			perror(%2$cfopen error%2$c);%1$c			return(1);%1$c		}%1$c		char *code = %2$c%4$s%2$c;%1$c%1$c		fprintf(fd, code, NEW_LINE, DOUBLE_QUOTE, i, code);%1$c		fclose(fd);%1$c		system(cmd);%1$c	}%1$c%1$c	return(0);%1$c}";

		fprintf(fd, code, NEW_LINE, DOUBLE_QUOTE, i, code);
		fclose(fd);
		system(cmd);
	}

	return(0);
}