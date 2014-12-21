SILENCE=@

TARGETNAME=main
TARGET=$(DBGDIR)/$(TARGETNAME)

#TODO auto-detect source code
#TODO auto-detect include files
SRC=$(SRCDIR)/main.c $(SRCDIR)/module.c
INC=$(INCDIR)/module.h

SRCDIR=./src
INCDIR=./inc
OBJDIR=./obj
#TODO add library code
LIBDIR=./lib
DBGDIR=debug

.PHONY: all clean

all:
	gcc $(SRC) -I$(INCDIR) -o $(TARGET)
	@echo "\nExecuting $(TARGET)..."
	$(SILENCE)./$(TARGET)
	@echo "\n...Execution finished!\n"

#$(TARGET): $(SRC)

srctest:
	echo $(src_files)

clean:
	@echo "Cleaning project..."
	$(SILENCE)rm -f $(TARGET)
	@echo "Clean finished!\n"

#$(call fcn,$1,$2,...)
#make sure you put a comma directly after fcn. If you don't it won't work.

#$(wildcard <pattern ...>)
#is replaced with a space-separated list of names that match the pattern.
src_files = $(wildcard $(SRCDIR)/*.c)
