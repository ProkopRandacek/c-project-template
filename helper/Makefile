BIEM = ./helper/biem

$(BIEM): helper/biem.c
	@echo -e "CC\t$@"
	@$(CC) -Ofast -s $< -o $@

clean::
	$(RM) $(BIEM)

