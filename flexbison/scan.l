%option nodefault noinput nounput noyywrap
%option reentrant bison-bridge

%{
#include <parse.h>
%}

%%


[a-zA-Z0-9]+ {
        yylval->TOK_WORD = strdup(yytext);
	return TOK_WORD;
}

[ \t\r]+ ;

%%

