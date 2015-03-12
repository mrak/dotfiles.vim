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

## Using XDG_CONFIG_HOME for your `vimrc`

I like to use the
[XDG Base Directory](http://standards.freedesktop.org/basedir-spec/latest/)
specification to keep things in `~/.config`, `~/.local`, `~/.cache`, etc instead
of polluting my home directory with dot-directories galore. To accomplish this,
some of my vim settings (in `plugin/settings.vim`) point to these locations.

To get vim to recognize `~/.config/vim/vimrc` you will need to add the following
to your shell rc file (assuming POSIX `sh` below):

```sh
# ~/.profile
: ${XDG_CONFIG_HOME:="$HOME/.config"}
: ${XDG_DATA_HOME:="$HOME/.local/share"}
: ${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME XDG_DATA_HOME XDG_CACHE_HOME
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
```
