#!/bin/bash

#
#
# Init home directory from dotfiles
#
#
HOME_DIR="/home/${USER}";
SRC_DIR="${HOME_DIR}/src";
DOTFILES_SRC_DIR="${SRC_DIR}/dotfiles";
DOTFILES_HOME_DIR="${HOME_DIR}/.dotfiles";

# check and create symlink to dotfile folder
if [ -d "${DOTFILES_SRC_DIR}" ];then
	ln -sfnv  "${DOTFILES_SRC_DIR}" "${DOTFILES_HOME_DIR}";
else
	echo "Clone dotfiles folder before init homedir!";
	exit 1;
fi

# create symlink to dotfiles

# SHELL
ln -sfv "${DOTFILES_HOME_DIR}/aliases" "${HOME_DIR}/.aliases";
ln -sfv "${DOTFILES_HOME_DIR}/profile" "${HOME_DIR}/.profile";
curl -Lo /tmp/install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh /tmp/install.sh
ln -sfv "${DOTFILES_HOME_DIR}/zshrc" "${HOME_DIR}/.zshrc";

# SSH
ln -sfnv "${DOTFILES_HOME_DIR}/ssh" "${HOME_DIR}/.ssh";


# GIT
ln -sfv "${DOTFILES_HOME_DIR}/gitconfig" "${HOME_DIR}/.gitconfig";

# VIM
ln -sfv "${DOTFILES_HOME_DIR}/vimrc" "${HOME_DIR}/.vimrc";
ln -sfnv "${DOTFILES_HOME_DIR}/vim" "${HOME_DIR}/.vim";
