#! /bin/sh
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

ln -sfn ~/dotfiles/.vimrc ~/.vimrc
ln -sfn ~/dotfiles/.zshrc ~/.zshrc
ln -sfn ~/dotfiles/.bashrc ~/.bashrc
ln -sfn ~/dotfiles/.tmux.conf ~/.tmux.conf

curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > a.sh
sh ./a.sh
rm a.sh
