#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "log.h"
#include "lorem.txt.asset.h" // this file is created at compile time
#include "primes.gen.h"

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

	msg("Byte content of the lorem.txt file that is included in the binary:");
	for (int i = 0; lorem_txt_asset[i] != 0; i++)
		printf("%d ", lorem_txt_asset[i]);
	printf("\n");

	msg("Primes that were calculated by Python at build time:");
	for (size_t i = 0; i < sizeof(primes)/sizeof(primes[0]); i++)
		printf("%d, ", primes[i]);
	printf("\n");

	msg("Goodbye");

	return 0;
}

