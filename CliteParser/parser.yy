/*
Duilio Lucio, CS333, Project 2, 10/02/2024
*/

%{
#include <stdio.h>
%}

%%

[0-9]+                  {printf("Integer-%s\n", yytext);} // Matches integers and prints them as Integer-<value>
[0-9]+"."[0-9]+         {printf("Float-%s\n", yytext);} // Matches floating-point numbers and prints them as Float-<value>
"if"|"else"|"while"|"for"|"int"|"float"  {printf("Keyword-%s\n", yytext);} // Matches keywords and prints them as Keyword-<value>
[a-zA-Z_][a-zA-Z0-9_]*  {printf("Identifier-%s\n", yytext);} // Matches identifiers and prints them as Identifier-<value>
"="                     {printf("Assignment\n");} // Matches the assignment operator and prints Assignment
"=="|"<"|">"|"<="|">="  {printf("Comparison-%s\n", yytext);} // Matches comparison operators and prints them as Comparison-<value>
"+"|"-"|"*"|"/"         {printf("Operator-%s\n", yytext);} // Matches arithmetic operators and prints them as Operator-<value>
"{"                     {printf("Open-bracket\n");} // Matches the open bracket and prints Open-bracket
"}"                     {printf("Close-bracket\n");} // Matches the close bracket and prints Close-bracket
"("                     {printf("Open-paren\n");} // Matches the open parenthesis and prints Open-paren
")"                     {printf("Close-paren\n");} // Matches the close parenthesis and prints Close-paren
"//"[^"\n"]*            // Matches single-line comments, does nothing with them
"/*"(.|\n)*?"*/"        // Matches multi-line comments, does nothing with them
[ \t\n]+                // Matches whitespace characters, does nothing with them

%%

int main (int argc, char *argv[]) {	
    if (argc > 1) // If there is more than one argument, open the file
        yyin = fopen(argv[1], "r");
    yylex(); // Start the lexical analyzer
    return 0;
}
