/*
Duilio Lucio, CS333, Project 2, 10/03/2024
*/

%{
#include <stdio.h>

int newline = 0; // Tracks whether the last character printed was a newline
%}

%%

"<!--"[^-]*"-->"                ;  // Match single-line HTML comments and ignore them
"<"[^>]*">"                     ;  // Match and ignore any HTML tag
[ \t]+                          ;  // Match and collapse multiple spaces and tabs into a single space
\n                              { if (!newline) { putchar('\n'); newline = 1; } }  // Handle newlines
.                               { printf("%s", yytext); newline = 0; }  // Print any other character and reset newline

%%    

int main(int argc, char *argv[]) {
    if (argc > 1) {
        // Open the input file
        yyin = fopen(argv[1], "r");
        if (!yyin) {
            perror("Error opening file");
            return 1;
        }
    }

    yylex();  // Start the lexical analyzer
    return 0;
}