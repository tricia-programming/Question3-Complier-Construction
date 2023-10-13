%{
#include<stdio.h>
#include<stdlib.h>

// To avoid warning, we include below definitions:
int yylex();
void yyerror(const char *s);
%}

%token PLUS MULT LPAREN RPAREN ID
%left PLUS
%left MULT

%%

E: E PLUS T  { printf("E -> E + T\n"); }
 | T         { printf("E -> T\n"); }
 ;

T: T MULT F  { printf("T -> T * F\n"); }
 | F         { printf("T -> F\n"); }
 ;

F: LPAREN E RPAREN { printf("F -> ( E )\n"); }
 | ID            { printf("F -> id\n"); }
 ;

%%

#include"lex.yy.c"
int main() {
    yyparse();
    return yylex();
}
void yyerror(const char *s){ printf("\nERROR\n"); }
int yywrap(){ return 1; }
