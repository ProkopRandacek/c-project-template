.PHONY : all clean

TARGET = template-project

VERSION     ?= v0.0.0
COMMIT_HASH ?= $(shell git rev-parse --short HEAD)

DEFS = -DVERSION="\"$(VERSION)\"" -DCOMMIT="\"$(COMMIT_HASH)\""

CFLAGS += -O3 -pipe -std=c11 $(DEFS)
LDLIBS += -lm -ldl -lpthread

WARNS ?= \
	-Wall -Wextra -Wunused-parameter -Wundef -Wunreachable-code \
	-Wno-misleading-indentation -Wenum-conversion -Wswitch-enum \
	-Wenum-compare -Wswitch -Wswitch-enum -Wno-free-nonheap-object \
	-Wunused-macros -Wdangling-else -Wstrict-prototypes \
	-Wmissing-field-initializers -Wno-multichar

CFLAGS += $(WARNS) $(FFLAGS)

# append your *.a libraries to this variable
# and somewhere rule how to make them
LIBRARIES =

all: $(TARGET)

run: $(TARGET)
	./$(TARGET)

clean::
	$(RM) $(TARGET)

include src/Makefile

