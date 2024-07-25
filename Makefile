.PHONY: plugins

plugins:
	git submodule update -j 8 --remote --init
	nvim -es +'helptags ALL' -cq
