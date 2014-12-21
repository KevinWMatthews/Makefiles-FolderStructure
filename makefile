#This makefile...
#		auto-detects source fcode
#		does not build object code or dependency list, but we want to
#		places executable in the debug folder
#		does not yet have a library
#		does reference the inc folder
#		check to see if include file and/or src code file changes trigger a rebuild

SILENCE=@

TARGETNAME=main
TARGET=$(DBGDIR)/$(TARGETNAME)

#TODO auto-detect include files
SRC=$(wildcard $(SRCDIR)/*.c)
#INC=$(INCDIR)/module.h

SRCDIR=./src
INCDIR=./inc
OBJDIR=./obj
#TODO add library code
LIBDIR=./lib
DBGDIR=./debug

.PHONY: all clean rebuild

#I think the top one executes by default
rebuild:
	make clean
	make all

all: $(TARGET)
	@echo "\nExecuting $(TARGET)..."
	$(SILENCE)./$(TARGET)
	@echo "\n...Execution finished!\n"

$(TARGET): $(SRC)
	gcc $^ -I$(INCDIR) -o $@

clean:
	@echo "Cleaning project..."
	$(SILENCE)rm -f $(TARGET)
	@echo "Clean finished!\n"

#$(call fcn,$1,$2,...)
#make sure you put a comma directly after fcn. If you don't it won't work.

#$(wildcard <pattern ...>)
#is replaced with a space-separated list of names that match the pattern.
