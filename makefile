#This makefile...
#		auto-detects source fcode
#		does not build object code or dependency list, but we want to
#		places executable in the debug folder
#		does not yet have a library
#		does reference the inc folder
#		check to see if include file and/or src code file changes trigger a rebuild
#		think about what to do with obj/./src and so on. Do we want/need the extra '.'s?
#		Place helper functions in a separate makefile so that we ensure that they are build first. Order matters!!
#		Create STUFF_TO_CLEAN
#		Separate "build" from "all". Build should only build. All will execute the code too.
#		Add colors to output
#		Add dependency files

SILENCE=

CCOMPILER=gcc

TARGETNAME=main
TARGET=$(DBGDIR)/$(TARGETNAME)

#TODO auto-detect include files
SRC=$(all_src_files_w_dir)
#INC=$(INCDIR)/module.h
OBJ=$(all_obj_files_w_dir)

SRCDIR=./src
INCDIR=./inc
OBJDIR=./obj
#TODO add library code
LIBDIR=./lib
DBGDIR=./debug

### Helper Functions and Intermediate Variables ###
all_src_files_w_dir = $(wildcard $(SRCDIR)/*.c)
obj_files = $(patsubst %.c,%.o,$(SRC))
all_obj_files_w_dir = $(addprefix $(OBJDIR)/,$(obj_files))

.PHONY: all clean rebuild debug fulldebug

#I think the top one executes by default
rebuild:
	make clean
	make all

all: $(TARGET)
	@echo "\nExecuting $(TARGET)..."
	$(SILENCE)$(TARGET)
	@echo "\n...Execution finished!\n"

$(TARGET): $(OBJ)
	@echo "\nLinking $@..."
#Create the directory for the executable, if needed
	$(SILENCE)mkdir -p $(dir $@)
	$(SILENCE)$(CCOMPILER) $^ -I$(INCDIR) -o $@

$(OBJDIR)/%.o: %.c
	@echo "\nCompiling $(notdir $<)..."
#Create the directory for the object file, if needed
	$(SILENCE)mkdir -p $(dir $@)
#Create the object file
	$(SILENCE)$(CCOMPILER) -c $< -I$(INCDIR) -o $@

debug:
	@echo SRC:
	@echo "$(SRC)\n"
	@echo OBJ:
	@echo "$(OBJ)\n"

fulldebug:
	@echo all_src_files_w_dir:
	@echo "$(all_src_files_w_dir)\n"
	@echo obj_files:
	@echo "$(obj_files)\n"
	@echo all_obj_files_w_dir:
	@echo "$(all_obj_files_w_dir)\n"

clean:
	@echo "Cleaning project..."
#Delete the debug folder!!
	$(SILENCE)rm -rf $(DBGDIR)
#Delete the obj folder
	$(SILENCE)rm -rf $(OBJDIR)
	@echo "Clean finished!\n"


### Documentation for built-in functions ###
# $@	the name of the target
# $<	the name of the first prerequisite
# $^	the names of all prerequisites separated by a space

# $(call fcn,$1,$2,...)
# make sure you put a comma directly after fcn. If you don't it won't work.

# $(wildcard <pattern ...>)
# is replaced with a space-separated list of names that match the pattern.

# $(patsubst <pattern>,<replacement>,<text_to_search>)

# $(addprefix <prefix>,<names_to_edit>)

# $(notdir <names ...>)
# extract the non-directory part of each filename

#TODO look up documentation again
# mkdir -p
# creates all parent directories?
