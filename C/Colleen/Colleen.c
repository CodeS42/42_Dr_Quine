/*
	Colleen
*/
#include <stdio.h>
#define NEW_LINE 10
#define DOUBLE_QUOTE 34

void	print_code()
{
	char *code = "/*%1$c	Colleen%1$c*/%1$c#include <stdio.h>%1$c#define NEW_LINE 10%1$c#define DOUBLE_QUOTE 34%1$c%1$cvoid	print_code()%1$c{%1$c	char *code = %2$c%3$s%2$c;%1$c	printf(code, NEW_LINE, DOUBLE_QUOTE, code);%1$c}%1$c%1$cint	main(void)%1$c{%1$c	/*%1$c		Call the function that prints the code%1$c	*/%1$c	print_code();%1$c	return (0);%1$c}";
	printf(code, NEW_LINE, DOUBLE_QUOTE, code);
}

int	main(void)
{
	/*
		Call the function that prints the code
	*/
	print_code();
	return (0);
}