%expect 0

%code requires
{
#ifndef YY_TYPEDEF_YY_SCANNER_T
#define YY_TYPEDEF_YY_SCANNER_T 
typedef void *yyscan_t;
#endif
}

%code provides
{
  void yyerror (yyscan_t scanner, const char *msg, ...);
}

%code top
{
#include <stdio.h> 
}

%define api.pure full
%define api.prefix {yy}
%define api.token.prefix {TOK_}
%define api.value.type union
%param {yyscan_t scanner}

%token <char *>WORD

%%

input:
       word
       | input word
;

word: WORD {
	printf("Got a word: %s\n", $1);
	free($1);
 }
;

%%

void
yyerror (yyscan_t scanner, 
         const char *msg, ...)
{
}

