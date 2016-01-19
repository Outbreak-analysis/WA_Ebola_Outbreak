# WA_Ebola_Outbreak
### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: liberia150429.npc.tsplot.Rout 

##################################################################

# make files

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md
include stuff.mk
# include $(ms)/perl.def

##################################################################

## What is a good way to archive the .csv files?

newdir: liberia150429.npc.tsplot.Rout

Sources += $(wildcard *.R)

# Hook

liberia150429.npc.tsplot.Rout:

## Content

liberia150429.csv: 
	wget -O $@ "http://apps.who.int/gho/athena/xmart/DATAPACKAGEID/2015-04-29?format=csv&profile=text&filter=COUNTRY:LBR"

sierraLeone150429.csv: 
	wget -O $@ "http://apps.who.int/gho/athena/xmart/DATAPACKAGEID/2015-04-29?format=csv&profile=text&filter=COUNTRY:SLE"

guinea150429.csv: 
	wget -O $@ "http://apps.who.int/gho/athena/xmart/DATAPACKAGEID/2015-04-29?format=csv&profile=text&filter=COUNTRY:GIN"

%.npc.Rout: %.read.Rout npc.R
	$(run-R)

%.read.Rout: %.csv read.R
	$(run-R)

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
