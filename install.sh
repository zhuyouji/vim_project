#!/bin/sh

echo "start install vim module"

#公司vpn
export http_proxy=http://gfw.gs-robot.cn:6780
export https_proxy=$http_proxy

#安装所需的系统工具
sudo apt-get install clang-format vim vim-gtk3 exuberant-ctags silversearcher-ag ack-grep

#update git module
git submodule update --init --recursive

echo "vim助手正在努力为您安装bundle程序" > vim_install
echo "安装完毕将自动退出" >> vim_install
echo "请耐心等待" >> vim_install
vim vim_install -c "BundleInstall" -c "q" -c "q"
rm vim_install

cd bundle/YouCompleteMe
git submodule update --init --recursive
python3 install.py --clangd-completer
cd ../..
ln -s .vimrc ~/
source ~/.vimrc
