%option nodefault noinput nounput noyywrap nounistd
%option reentrant bison-bridge
%option prefix="e_yy"

%{
#define YYSTYPE E_YYSTYPE
#include <parse.h>
%}

%%


[a-zA-Z0-9]+ {
        yylval->TOK_WORD = strdup(yytext);
	return TOK_WORD;
}

[ \t\r]+ ;

%%

