Eric Mrak's vim bundle
======================

> This vim "plugin" may contain useful things, but it's really only used by
> myself. Please ignore.

I am currently using [Vundle](https://github.com/gmarik/Vundle.vim) for my
vim/neovim plugins, but this should work with other plugin loaders. All
references here will be using Vundle.

My `~/.vimrc` (actually, I keep it in `~/.config/vim/vimrc`) is only used for
Vundle plugin declarations and settings specific to those plugins. All other
colorschemes, settings, mappings, etc are in this project. I include this
"plugin" in my own `vimrc` and install it using Vundle:

```viml
" ~/.config/vim/vimrc
Plugin 'mrak/mrak.vim'
```

Or, you can fork this repo and remove any things you don't want. They should be
split up in typical vim directores and the files named according to their
contents.
