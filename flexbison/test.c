#include <stdio.h>
#include <parse.h>

int main(int argc, char *argv)
{
	char *string = "This is a bunch of words";
	yyscan_t scanner;
	int state;
	
	if (yylex_init(&scanner) != 0) {
		fprintf(stderr, "Error initializing yylex\n");
		return 1;
	}
	state = yy_scan_string(string, scanner);
	if (yyparse(scanner) != 0) {
		fprintf(stderr, "Error in yyparse\n");
		return 1;
	}
	yy_delete_buffer(state, scanner);
	yylex_destroy(scanner);
	
	return 0;
}
