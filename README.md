# HTCondor Submit file syntax file for VIM/Neovim
A simple VIM/Neovim plugin that brings syntax highlighting to
[HTCondor](https://htcondor.org/) Submit files.

# Installation

## VIM

### [vundle](https://github.com/VundleVim/Vundle.vim)
```vim
vundle#begin()
Plugin 'carmelopellegrino/htc.vim'
vundle#end()
```

## Neovim

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
    'carmelopellegrino/htc.vim',
},
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
    'carmelopellegrino/htc.vim',
},
```

### [vim-plug](https://github.com/junegunn/vim-plug)

```lua
Plug 'carmelopellegrino/htc.vim'
```
