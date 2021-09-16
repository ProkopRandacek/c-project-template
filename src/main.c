#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char* argv[]) {
	if (argc == 2 && (!strcmp(argv[1], "--version") || !strcmp(argv[1], "-v"))) {
		puts("template project " VERSION " (" COMMIT ")\nCompiled at " __DATE__ " " __TIME__);
		exit(0);
	} else if (argc > 1) {
		puts("usage: r8 [-v|--version]");
		exit(1);
	}

	printf("Hello world\n");
	return 0;
}

