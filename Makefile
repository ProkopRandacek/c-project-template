.PHONY : all clean

TARGET ?= template-project

VERSION     ?= v0.0.0
COMMIT_HASH ?= $(shell git rev-parse --short HEAD)

DEFS = -DVERSION="\"$(VERSION)\"" -DCOMMIT="\"$(COMMIT_HASH)\""

WARNS ?= -Wall -Wextra -Wundef -Wunreachable-code -Wno-misleading-indentation \
		 -Wenum-conversion -Wswitch-enum -Wenum-compare -Wswitch -Wswitch-enum \
		 -Wno-free-nonheap-object -Wmissing-field-initializers -Wno-multichar \
		 -Warray-bounds -Wdangling-else -Wstrict-prototypes \
		 -Wduplicated-branches -Wduplicated-cond -Wfloat-equal -Wstack-protector

INCLUDE =

CFLAGS = -O3 -std=c11 -g $(DEFS) $(WARNS) $(INCLUDE) \
		 -fpic -fstack-protector-strong

LDLIBS = -lm



# cross compile variables are prefixed with "X_"
X_CC     ?= x86_64-w64-mingw32-gcc
X_TARGET ?= $(TARGET).exe
X_CFLAGS  = $(CFLAGS)
X_LDLIBS  = -lm

# append your *.a libraries here.
LIBS   =
X_LIBS =



all:     $(TARGET) $(X_TARGET)
default: $(TARGET)
cross:   $(X_TARGET)

run: $(TARGET)
	./$(TARGET)

clean::
	$(RM) $(TARGET)
	$(RM) $(X_TARGET)

include src/Makefile

