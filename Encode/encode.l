/*
Duilio Lucio, CS333, Project 2, 10/03/2024
*/

%{
#include <stdio.h>
%}

%%
[a-z]    { /* Shift lowercase letters */
            char shift = (*yytext - 'a' + 13) % 26 + 'a';
            printf("%c", shift);
          }
[A-Z]    { /* Shift uppercase letters */
            char shift = (*yytext - 'A' + 13) % 26 + 'A';
            printf("%c", shift);
          }
.|\n     { /* Any other character that is not part of the alphabet */
            printf("%s", yytext);
          }
%%

int yywrap() { //Makes scanner know when it has finished reading input
    return 1;
}

int main(int argc, char *argv[]) {
    if (argc > 1) {
        // Open the input file
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            perror("Error opening file");
            return 1;
        }
        yyin = file; // Making Flex input to the file
    }

    yylex(); // Calling scanner
    return 0;
}