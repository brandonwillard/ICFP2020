#
# Export org files.
#
# Inspired by https://github.com/leanprover/presentations/blob/master/org-reveal.mk#L9
#
.PHONY: all clean install-cask %.pdf %.tex

CASK_BIN ?= ${HOME}/.cask/bin/cask
EMACS_BIN ?= emacs

SRC_DIR = $(realpath $(dir $<))
DEST_DIR = $(abspath ../../output)
FIG_DIR = $(abspath ../../figures)
TEX_DIR = $(abspath ../tex)

CASK_LIB_DIR ?= ${SRC_DIR}/.cask

IGNORE_FILES := ${SRC_DIR}/latex-setup.org latex-setup.org

ORG_FILES := $(filter-out ${IGNORE_FILES}, $(wildcard *.org))
TEX_FILES := $(addsuffix .tex, ${TEX_DIR}/$(basename ${ORG_FILES}))

.PRECIOUS: ${TEX_DIR}/%.tex

all: $(patsubst %.org, ${DEST_DIR}/%.pdf, ${ORG_FILES})

install-cask:
	curl -fsSkL https://raw.github.com/cask/cask/master/go | python

${TEX_DIR}/%.tex: %.org .cask org-export-init.el
	@if [ ! -f ${CASK_BIN} ]; then echo "Cask not found; do 'make install-cask' first."; exit 1; fi
	PUB_FILE=$< FIG_DIR=${FIG_DIR} TEX_DIR=${TEX_DIR} CASK_LIB_DIR=${CASK_LIB_DIR} \
		$(EMACS_BIN) --quick --batch -l org-export-init.el --visit $< -f org-publish-current-file

${DEST_DIR}/%.pdf: ${TEX_DIR}/%.tex
	make -C ${TEX_DIR} -f Makefile $@

.cask: Cask
	@EMACS=$(EMACS_BIN) $(CASK_BIN)
	@touch .cask

clean:
	-make -C ${TEX_DIR} -f Makefile clean

# Just some convenience targets...
%.pdf: ${DEST_DIR}/%.pdf ;

%.tex: ${TEX_DIR}/%.tex ;
