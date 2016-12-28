#! /bin/sh
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf

curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > a.sh
sh ./a.sh
rm a.sh
