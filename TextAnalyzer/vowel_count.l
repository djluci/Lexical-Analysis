/*
Duilio Lucio, CS333, Project 2, 10/03/2024
*/

%{
#include <stdio.h>

int char_count = 0; // number of characters
int line_count = 0; // number of rows
int a_count = 0; // count for each vowel
int e_count = 0;
int i_count = 0;
int o_count = 0;
int u_count = 0;

%}

%%
[aA]    { a_count++; char_count++; }
[eE]    { e_count++; char_count++; }
[iI]    { i_count++; char_count++; }
[oO]    { o_count++; char_count++; }
[uU]    { u_count++; char_count++; }
.       { char_count++; } // Matching any other character
\n      { line_count++; char_count++;} // Matching newline and increment line 
%%

int yywrap() { // Informs scanner know when it has finished reading input
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

    // Output
    printf("Total characters: %d\n", char_count);
    printf("Total Lines: %d\n", line_count);
    printf("Number of 'a': %d\n", a_count);
    printf("Number of 'e': %d\n", e_count);
    printf("Number of 'i': %d\n", i_count);
    printf("Number of 'o': %d\n", o_count);
    printf("Number of 'u': %d\n", u_count);

    return 0;

}