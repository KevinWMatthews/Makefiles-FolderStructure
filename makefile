#General makefile that can be used for launching either test or production code

#Set to execute test code, clear to execute production code
TEST=

ifdef TEST
all: UnityTest

rebuild: UnityRebuild

clean: UnityClean

debug: UnityDebug

flags: UnityFlags

filelist: UnityFileList

help: UnityHelp
else
all: Production

rebuild: ProductionRebuild

clean: ProductionClean

debug: ProductionDebug

flags: ProductionFlags

filelist: ProductionFileList

help: ProductionHelp
endif


### Prerequisite definitions ###
#-f or --file=
#-i or --ignore-errors continues makefile execution if part of a recipe fails (say, rm *.o)
### Production ###
Production:
	make -f MakefileProduction.make

ProductionAll:
	make -f MakefileProduction.make all

ProductionRebuild:
	make -f MakefileProduction.make clean
	make -f MakefileProduction.make

ProductionClean:
	make -f MakefileProduction.make clean

ProductionDebug:
	make -f MakefileProduction.make debug

ProductionFlags:
	make -f MakefileProduction.make flags

ProductionFileList:
	make -f MakefileProduction.make filelist

ProductionHelp:
	make -f MakefileProduction.make help

### Unity prerequisite definitions ###
UnityTest:
	@echo TODO

UnityRebuild:
	@echo TODO

UnityClean:
	@echo TODO

UnityDebug:
	@echo TODO

UnityFlags:
	@echo TODO

UnityFileList:
	@echo TODO

UnityHelp:
	@echo TODO
