#include <stdio.h>
/*To use printf*/

void    print_source_code()
{
    //String who contains source code
    char *code = "#include <stdio.h>%c/*To use printf*/%c%cvoid    print_source_code()%c{%c    //String who contains source code%c    char *code = %c%s%c;%c    printf(a, 10, 10, 10, 10, 10, 10, 34, a, 34, 10, 10, 10, 10, 10, 10, 10, 10);%c}%c%cint main(void)%c{%c    print_source_code();%c    return (0);%c}";
    printf(code, 10, 10, 10, 10, 10, 10, 34, code, 34, 10, 10, 10, 10, 10, 10, 10, 10);
}

int main(void)
{
    print_source_code();
    return (0);
}