ASM		= nasm -f elf64
# name of the library
LIBNAME = libasm.so

# use
COUNT=1
NBSOURCES= $(shell find src/ -type f -name '*.asm' | wc -l)

# change these to proper directories where each file should be
SRCDIR   = src
OBJDIR   = obj
BINDIR   = .

# Sources, Includes and Objects
SOURCES  := $(wildcard $(SRCDIR)/*.asm)
OBJECTS  := $(SOURCES:$(SRCDIR)/%.asm=$(OBJDIR)/%.o)
RM       = rm -rf

# Linker
LINKER	:= ld -shared # -w is for removing the warnings (when using printf with null pointer)
NOWARNINGS := no

# if debug is set to yes, add -w flag (remove all warnings on compilation)
ifeq ($(NOWARNINGS),yes)
        LINKER += -w
endif 


$(BINDIR)/$(LIBNAME):	$(OBJECTS)
				@$(LINKER) -o $(LIBNAME) $(OBJECTS)
				@chmod 755 $(LIBNAME)
				@echo "\033[94mLibrary $(LIBNAME) created successfully!\033[0m"

$(OBJECTS):		$(OBJDIR)/%.o : $(SRCDIR)/%.asm
				@mkdir -p $(dir $@)
				@$(ASM) -o $@ $<
				@echo "[\033[95m$(COUNT)\033[0m/\033[93m$(NBSOURCES)\033[0m][\033[92m$<\033[0m]"
				@$(eval COUNT=$(shell echo $$(($(COUNT)+1))))

all:			$(BINDIR)/$(LIBNAME)

.PHONY:			test
test:			$(OBJECTS)
				@echo "\033[94mLaunching Tests!\033[0m"
				@$(MAKE) -C tests/
				@$(MAKE) -C ./ fclean

.PHONY: 		clean
clean:
				@$(RM) $(OBJECTS)
				@$(RM) $(OBJDIR)
				@echo "\033[93mCleanup complete!\033[0m"

.PHONY: 		fclean
fclean: 		clean
				@$(RM) $(LIBNAME)
				@echo "\033[93mExecutable removed!\033[0m"

re:	fclean $(BINDIR)/$(LIBNAME)
