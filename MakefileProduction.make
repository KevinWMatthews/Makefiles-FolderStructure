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

### Name of output file ###
TARGET_NAME=main
TARGET=$(TARGET_DIR)/$(TARGET_NAME)

### Debug (Set to debug, clear for production) ###
DEBUG=

### Compiler tools ###
CCOMPILER=gcc
ASSEMBLER=gcc

### Directory structure ###
SRC_DIR=src
INC_DIR=inc
OBJ_DIR=obj
#TODO add library code
LIB_DIR=lib
DEBUG_DIR=debug
TARGET_DIR=debug

### Automatically detect source code and create object files ###
SRC=$(wildcard $(SRC_DIR)/*.c)
obj_src=$(patsubst %.c,%.o,$(SRC))
OBJ_SRC=$(addprefix $(OBJ_DIR)/,$(obj_src))

### Flags ###
CCOMPILER_FLAGS = -c

### Debug flags ###
ifdef DEBUG
	DEBUG_FLAGS = -g
endif

### Build options ###
.PHONY: rebuild all clean debug help
.PHONY: compile assemble link
.PHONY: filelist

all: $(TARGET)
	@echo "${Yellow}\nExecuting $(TARGET)...${NoColor}"
	$(SILENCE)$(TARGET)
	@echo "\n${Green}...Execution finished!${NoColor}\n"

$(TARGET): $(OBJ_SRC)
	@echo "\n${Yellow}Linking $@...${NoColor}"
	$(SILENCE)mkdir -p $(dir $@)
	$(SILENCE)$(ASSEMBLER) $(CPU) $^ -I$(INC_DIR) -o $@

$(OBJ_DIR)/%.o: %.c
	@echo "\n${Yellow}Compiling $(notdir $<)...${NoColor}"
	$(SILENCE)mkdir -p $(dir $@)
	$(SILENCE)$(CCOMPILER) $(CPU) $(CCOMPILER_FLAGS) $< -I$(INC_DIR) -o $@

clean:
	@echo "${Yellow}Cleaning project...${NoColor}"
	$(SILENCE)rm -rf $(DEBUG_DIR)
	$(SILENCE)rm -rf $(OBJ_DIR)
	@echo "${Green}...Clean finished!${NoColor}\n"

debug:
	@echo "\n${LightRed}TODO learn to use GDB${NoColor}\n"
#	$(SILENCE)make all
#	@echo
#	@echo "Launching GDB..."
#	$(SILENCE)$(DEBUGGER) $(TARGET)

help:
	@echo "\n${LightRed}List what the build options are${NoColor}\n"

filelist:
	@echo "  ${LightPurple}TARGET:${NoColor}"
	@echo "$(TARGET)\n"
	@echo "  ${LightPurple}SRC:${NoColor}"
	@echo "$(SRC)\n"
	@echo "  ${LightPurple}OBJ_SRC:${NoColor}"
	@echo "$(OBJ_SRC)\n"

colortest:
	@echo "${Blue}Blue${NC}"
	@echo "${LightBlue}LightBlue${NC}"
	@echo "${Gray}Gray${NC}"
	@echo "${DarkGray}DarkGray${NC}"
	@echo "${Green}Green${NC}"
	@echo "${LightGreen}LightGreen${NC}"
	@echo "${Cyan}Cyan${NC}"
	@echo "${LightCyan}LightCyan${NC}"
	@echo "${Red}Red${NC}"
	@echo "${LightRed}LightRed${NC}"
	@echo "${Purple}Purple${NC}"
	@echo "${LightPurple}LightPurple${NC}"
	@echo "${Orange}Orange${NC}"
	@echo "${Yellow}Yellow${NC}"
	@echo "${White}White${NC}"
	@echo "${NoColor}NoColor${NC}"

### Color codes ###
Blue       =\033[0;34m
LightBlue  =\033[1;34m
Gray       =\033[0;37m
DarkGray   =\033[1;30m
Green      =\033[0;32m
LightGreen =\033[1;32m
Cyan       =\033[0;36m
LightCyan  =\033[1;36m
Red        =\033[0;31m
LightRed   =\033[1;31m
Purple     =\033[0;35m
LightPurple=\033[1;35m
Yellow     =\033[0;33m
LihtYellow =\033[1;33m
White      =\033[0;37m
NoColor    =\033[0;0m

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
