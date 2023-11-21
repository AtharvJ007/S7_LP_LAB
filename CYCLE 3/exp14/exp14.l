%{
#include "y.tab.h"
%}

%%
"for"       { return FOR; }
[0-9]+      { return NUM; }
[a-zA-Z][a-zA-Z0-9_]* { return IDENTIFIER; }
"&&"        {return AND;}
"||"        {return OR;}
"++"        { return PLUSPLUS; }
"--"        { return MINUSMINUS; }
"<="        { return LESSEQUAL; }
"<"         { return LESS; }
">="        { return GREATEREQUAL; }
">"         { return GREATER; }
"=="        { return EQUAL; }
"!="        { return NOTEQUAL; }
[ \t]     ;  // Ignore whitespace 
.           ;  {return yytext[0];}

%%

int yywrap() {
    return 1;
}
