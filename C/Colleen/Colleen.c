#include <stdio.h>
/*
	To use printf
*/
#define TAB 9
#define NEW_LINE 10
#define DOUBLE_QUOTE 34

void	print_source_code()
{
	/*
		String who contains source code
	*/
	char *code = "#include <stdio.h>%2$c/*%2$c%1$cTo use printf%2$c*/%2$c#define TAB 9%2$c#define NEW_LINE 10%2$c#define DOUBLE_QUOTE 34%2$c%2$cvoid%1$cprint_source_code()%2$c{%2$c%1$c/*%2$c%1$c%1$cString who contains source code%2$c%1$c*/%2$c%1$cchar *code = %3$c%4$s%3$c;%2$c%1$cprintf(code, TAB, NEW_LINE, DOUBLE_QUOTE, code);%2$c}%2$c%2$cint main(void)%2$c{%2$c%1$cprint_source_code();%2$c%1$creturn (0);%2$c}";
	printf(code, TAB, NEW_LINE, DOUBLE_QUOTE, code);
}

int main(void)
{
	print_source_code();
	return (0);
}