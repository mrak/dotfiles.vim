.PHONY: plugins update-plugins sync-plugins root.vimrc clean-plugins

plugins: sync-plugins clean-plugins

sync-plugins:
	git submodule update -j 8 --init
	nvim -es +'helptags ALL' -cq

update-plugins:
	git submodule update -j 8 --remote --init
	nvim -es +'helptags ALL' -cq

root.vimrc:
	sudo cp root.vimrc /root/.vimrc

clean-plugins:
	git clean -dffx pack/submodules
