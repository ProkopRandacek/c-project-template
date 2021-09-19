#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "log.h"
#include "lorem.txt.asset.h" // this file is created at compile time

#ifndef VERSION
#define VERSION "?"
#endif

#ifndef COMMIT
#define COMMIT "?"
#endif

int main(void) {
	msg("Hello world from template project %s compiled from commit %s!", VERSION, COMMIT);

#ifdef LINUX
	msg("I'm the Linux build!");
#endif
#ifdef WINDOWS
	msg("I'm the Windows build!");
#endif

	msg("Byte content of the lorem.txt file:");
	for (int i = 0; i < lorem_txt_asset_size; i++)
		printf("%d ", lorem_txt_asset_bytes[i]);
	printf("\n");

	return 0;
}

