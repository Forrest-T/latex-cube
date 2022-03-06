
TARGETS = animation

###################
# Compile Options #
###################

MK_DVI = latex
MK_SVG = dvisvgm

BLDDIR = bld
MK_DVI_OPTS = -output-directory=$(BLDDIR)
MK_SVG_OPTS = --output="%f.svg"

#####################
# Phony Target Defs #
#####################

.PHONY: all clean $(TARGETS)

all: $(TARGETS)
clean:
	@echo "Cleaning up..."
	@rm -rf $(BLDDIR) *.svg *.pdf
	@echo "Build artifacts removed."

animation: cube-animation.svg

######################
# Individual Targets #
######################

cube-animation.svg: cube-animation.tex
	mkdir -p $(BLDDIR)
	$(MK_DVI) $(MK_DVI_OPTS) $<
	$(MK_SVG) $(MK_SVG_OPTS) $(BLDDIR)/*.dvi
