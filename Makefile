# WA_Ebola_Outbreak

current: target
-include target.mk

plots: liberia150429.npc.tsplot.Rout.pdf sierraLeone150429.npc.tsplot.Rout.pdf guinea150429.npc.tsplot.Rout.pdf

##################################################################

# make files

Sources = Makefile .gitignore README.md sub.mk LICENSE.md
include sub.mk
# include $(ms)/perl.def

##################################################################

## What is a good way to archive the .csv files?

# newdir: liberia150429.npc.tsplot.Rout

Sources += $(wildcard *.R)

# Hook

liberia150429.npc.tsplot.Rout:
sierraLeone150429.npc.tsplot.Rout:
guinea150429.npc.tsplot.Rout:

## Download and label current versions

liberia150429.csv: 
	wget -O $@ "http://apps.who.int/gho/athena/xmart/DATAPACKAGEID/2015-04-29?format=csv&profile=text&filter=COUNTRY:LBR"

sierraLeone150429.csv: 
	wget -O $@ "http://apps.who.int/gho/athena/xmart/DATAPACKAGEID/2015-04-29?format=csv&profile=text&filter=COUNTRY:SLE"

guinea150429.csv: 
	wget -O $@ "http://apps.who.int/gho/athena/xmart/DATAPACKAGEID/2015-04-29?format=csv&profile=text&filter=COUNTRY:GIN"

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

######################################################################

### Makestuff

## Change this name to download a new version of the makestuff directory
# Makefile: start.makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
