# WA_Ebola_Outbreak
## This is WA_Ebola_Outbreak, a screens project directory
## makestuff/project.Makefile

current: target
-include target.mk

# include makestuff/perl.def

######################################################################

# liberia.npc.tsplot.Rout:

current: target
-include target.mk

sierraLeone.npc.Rout.csv:

liberia150429.npc.tsplot.Rout.pdf:

plots: liberia150429.npc.tsplot.Rout.pdf sierraLeone150429.npc.tsplot.Rout.pdf guinea150429.npc.tsplot.Rout.pdf

##################################################################

## WHO part of the pipeline is broken, see Dropbox

Sources += liberia150429.csv

sierraLeone150429.csv: 
	ln -fs ~/Dropbox/academicWW/WHO_Ebola_data/$@

##################################################################

# make files

Sources += $(wildcard *.R)

# Hook

liberia150429.npc.tsplot.Rout:
sierraLeone150429.npc.tsplot.Rout:
guinea150429.npc.tsplot.Rout:

## Download and label current versions

## liberia.npc.tsplot.Rout-1.pdf

Ignore += liberia150429.csv
## iberia150429.csv: 
## wget -O $@ "http://apps.who.int/gho/athena/xmart/DATAPACKAGEID/2015-04-29?format=csv&profile=text&filter=COUNTRY:LBR"

Ignore += sierraLeone150429.csv
## sierraLeone150429.csv: 
## wget -O $@ "http://apps.who.int/gho/athena/xmart/DATAPACKAGEID/2015-04-29?format=csv&profile=text&filter=COUNTRY:SLE"

Ignore += guinea150429.csv
guinea150429.csv: 
	wget -O $@ "http://apps.who.int/gho/athena/xmart/DATAPACKAGEID/2015-04-29?format=csv&profile=text&filter=COUNTRY:GIN"

Ignore += liberia.csv sierraLeone.csv guinea.csv
liberia.csv: liberia150429.csv
	$(copy)

sierraLeone.csv: sierraLeone150429.csv
	$(copy)

guinea.csv: guinea150429.csv
	$(copy)

liberia.npc.Rout: npc.R

.PRECIOUS: %.read.Rout
%.read.Rout: %.csv read.R
	$(run-R)

liberia1%.R: liberia.R
	$(link)

.PRECIOUS: %.npc.Rout
%.npc.Rout: %.read.Rout %.Rout npc.R
	$(run-R)

liberia.npc.tsplot.Rout:  tsplot.R
%.tsplot.Rout: %.Rout tsplot.R
	$(run-R)

sierraLeone.npc.tsplot.Rout:  tsplot.R
%.tsplot.Rout: %.Rout tsplot.R
	$(run-R)

######################################################################

vim_session:
	bash -cl "vmt"

######################################################################

### Makestuff

Sources += Makefile

Ignore += makestuff
msrepo = https://github.com/dushoff
Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls $@

-include makestuff/os.mk
-include makestuff/wrapR.mk
-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk
