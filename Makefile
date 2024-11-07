.PHONY: update-plugins sync root.vimrc clean-plugins

sync:
	git submodule update -j 8 --init
	nvim -es +'helptags ALL' -cq

update-plugins:
	git submodule update -j 8 --remote --init
	nvim -es +'helptags ALL' -cq

root.vimrc:
	sudo cp root.vimrc /root/.vimrc

clean-plugins:
	git clean -dfx pack/submodules
