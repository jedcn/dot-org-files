#!/bin/bash

DOT_ORG_FILES=`git rev-parse --show-toplevel`
DOF=$DOT_ORG_FILES

if [ ! -f ~/.zshrc ]
then
  echo "Linking ~/.zshrc"
  ln -s $DOF/real/.zshrc ~/.zshrc
fi

if [ ! -f ~/.oh-my-zsh/custom/jedcn.zsh-theme ]
then
  echo "Linking ~/.oh-my-zsh/custom/jedcn.zsh-theme"
  ln -s $DOF/real/oh-my-zsh/custom/jedcn.zsh-theme ~/.oh-my-zsh/custom/jedcn.zsh-theme
fi
