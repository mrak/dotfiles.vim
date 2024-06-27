.PHONY: plugins

plugins:
	git submodule update --remote --init
	nvim -es +'helptags ALL' -cq
