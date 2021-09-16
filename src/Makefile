# included from ../Makefile

DIRS += $(shell find src/ -type d)      # all folders
SRCS += $(shell find src/ -name \*.c)   # c sources
OBJS  = $(sort $(SRCS:src/%.c=obj/%.o)) # object files
DEPS  = $(sort $(SRCS:src/%.c=obj/%.d)) # makefile dependency files

# Include all source directories so we don't have to use relative paths in includes
CFLAGS += $(addprefix -I,$(DIRS))

# object building rule
$(OBJS): obj/%.o: src/%.c
	@mkdir -p -- $(dir $@)
	@echo -e "CC\t$(notdir $@)"
	@$(CC) $(CFLAGS) -MD -o $@ -c $<

# executable linking rule
$(TARGET): $(LIBRARIES) $(OBJS)
	@mkdir -p -- $(dir $@)
	@echo -e "LD\t$(notdir $@)"
	@$(CC) $(CFLAGS) -o $@ $(OBJS) $(LDLIBS) $(LDFLAGS)

clean::
	$(RM) -r -- obj/

-include $(DEPS)

