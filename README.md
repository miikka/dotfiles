# Miikka's dotfiles

This repository holds the configuration files for some programs I frequently
use. I haven't commented them or anything, so don't expect to learn much from
them. I just like to use Github as a place to host them.

Below is a list of some handy extensions I use.

## Shell utilities

* [autojump](https://github.com/joelthelion/autojump) or
  [z](https://github.com/rupa/z) for quickly changing directories.
* [v](https://github.com/rupa/v) for opening recently edited files in Vim.
* [rbenv](https://github.com/sstephenson/rbenv) for dealing with Ruby versions.

## Vim setup

Vim plugins are managed with [Vundle](https://github.com/gmarik/vundle). This
way, you only need to install Vundle and it pulls in the rest.

Install Vundle:

    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle 
    vim -u ~/code/dotfiles/bundles.vim +BundleInstall +qall
