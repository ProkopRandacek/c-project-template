// vim: ft=c
#ifndef UTIL_H
#define UTIL_H

#include <stdarg.h>

#define die(...) \
	fputs("FATAL ERROR: ", stdout), \
	printf("%s:%s:%-4d - ", __FILE__, __func__, __LINE__), \
	printf(__VA_ARGS__),putchar('\n'),exit(1)

#define msg(...) \
	printf("%s:%s:%-4d - ", __FILE__, __func__, __LINE__), \
	printf(__VA_ARGS__),putchar('\n')

#endif

