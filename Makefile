.PHONY : all clean

TARGET ?= template-project

VERSION     ?= v0.0.0
COMMIT_HASH ?= $(shell git rev-parse --short HEAD)

DEFS = -DVERSION="\"$(VERSION)\"" -DCOMMIT="\"$(COMMIT_HASH)\""

WARNS ?= \
	-Wall -Wextra -Wunused-parameter -Wundef -Wunreachable-code \
	-Wno-misleading-indentation -Wenum-conversion -Wswitch-enum \
	-Wenum-compare -Wswitch -Wswitch-enum -Wno-free-nonheap-object \
	-Wmissing-field-initializers -Wno-multichar -Warray-bounds \
	-Wunused-macros -Wdangling-else -Wstrict-prototypes

CFLAGS = -O3 -pipe -std=c11 $(DEFS) $(WARNS)
LDLIBS = -lm -ldl -lpthread



# cross compile variables are prefixed with "X_"
X_CC     ?= x86_64-w64-mingw32-gcc
X_TARGET ?= $(TARGET).exe
X_CFLAGS  = $(CFLAGS)
X_LDLIBS  = -lm -Ldl -lpthread

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

include helper/Makefile
include src/Makefile

