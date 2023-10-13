%{
#include"parser.tab.h"
extern int yylval;
%}

%%

"+"     {return PLUS;}
"*"     {return MULT;}
"("     {return LPAREN;}
")"     {return RPAREN;}
"id"    {return ID;}
[a-zA-Z]+ {yylval=yytext[0];return ID;} 
.       { /* Ignore other characters */ }

%%