Eric Mrak's (neo)vim configuration
==================================

This configuration assumes you are using [Neovim](https://neovim.io/), but
should work with Vim, too.

```
mkdir -p ~/.config
git clone --recursive-submodules -j8 https://github.com/mrak/dotfiles.vim ~/.config/nvim
```

`init.vim` is the entrypoint and configures plugins using the native vim plugin
system. There is a symlink for `vimrc` pointing to `init.vim`. It is assumed you
have a symlink at `~/.vim` or `~/.config/vim` pointing to `~/.config/nvim`. This
allows the same repository to be used for both Vim and Neovim.

Includes my personal `mrak` colorscheme derived from the base16 family.

See the included `mrak.txt` doc for more information.
