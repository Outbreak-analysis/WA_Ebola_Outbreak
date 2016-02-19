msrepo = https://github.com/dushoff
gitroot = ../
export ms = $(gitroot)/makestuff

-include local.mk
-include $(gitroot)/local.mk
export ms = $(gitroot)/makestuff
-include $(ms)/os.mk

Makefile: $(ms) 

$(ms):
	cd $(dir $(ms)) && git clone $(msrepo)/$(notdir $(ms)).git
