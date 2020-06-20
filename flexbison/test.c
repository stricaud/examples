#include <stdio.h>
#include <parse.h>

int main(int argc, char *argv)
{
	char *string = "This is a bunch of words";
	yyscan_t scanner;
	int state;
	
	if (e_yylex_init(&scanner) != 0) {
		fprintf(stderr, "Error initializing yylex\n");
		return 1;
	}
	state = e_yy_scan_string(string, scanner);
	if (e_yyparse(scanner) != 0) {
		fprintf(stderr, "Error in yyparse\n");
		return 1;
	}
	e_yy_delete_buffer(state, scanner);
	e_yylex_destroy(scanner);
	
	return 0;
}
