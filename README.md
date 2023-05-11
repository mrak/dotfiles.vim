Eric Mrak's vim bundle
======================

> This vim "plugin" may contain useful things, but it's really only used by
> myself. Please ignore.

I am currently using [vim-plug](https://github.com/junegunn/vim-plug) for my
vim/neovim plugins, but this should work with other plugin loaders. All
references here will be using vim-plug.

My init file is only used for plugin declarations and settings specific to those
plugins. All other augroups, settings, mappings, etc are in this project. I
include this "plugin" in my own init script and install it using a plugin
manager:

```viml
Plug 'mrak/mrak.vim'
```

Or, you can fork this repo and remove any things you don't want. They should be
split up in typical vim directores and the files named according to their
contents.
