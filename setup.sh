#!/bin/bash
set -eu

DOTFILE_DIR=$HOME/dotfiles

VIM_DIR=.vim
VIM_RC_DIR=$VIM_DIR/rc
VIM_RCD_DIR=$VIM_DIR/vimrc.d
NEOVIM_DIR=$HOME/.config/nvim

for dir in $HOME/$VIM_RC_DIR $HOME/$VIM_RCD_DIR $NEOVIM_DIR; do
    [ ! -e $dir ] && mkdir -p $dir
done

DOT_FILES=(.gitcommit_template .gitconfig .gitignore_global .tmux.conf .vimrc .bashrc .hyper.js)

VIM_RC_FILES=$(ls $DOTFILE_DIR/$VIM_RC_DIR)
VIM_RCD_FILES=$(ls $DOTFILE_DIR/$VIM_RCD_DIR)

for file in ${DOT_FILES[@]};do
    ln -nfs $HOME/dotfiles/$file $HOME/$file
done

for file in ${VIM_RC_FILES[@]};do
    ln -nfs $HOME/dotfiles/.vim/rc/$file $HOME/.vim/rc/$file
done

for file in ${VIM_RCD_FILES[@]};do
    ln -nfs $HOME/dotfiles/.vim/vimrc.d/$file $HOME/.vim/vimrc.d/$file
done

ln -nfs $DOTFILE_DIR/.vimrc $NEOVIM_DIR/init.vim
