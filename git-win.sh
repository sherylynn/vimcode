#!/bin/bash
cd ~
git pull https://github.com/sherylynn/vimcode vimcode
cd vimcode
echo let g:VIMHOME=\"vimcode\" > ../.vimrc
echo 'source ~/vimcode/config/vimrc' >> ../.vimrc
#guifont和后面的内容不能有空格
#echo set guifont=Courier_new:h15:b >> ../.vimrc
echo set ff=unix >> ../.vimrc

#   for neovim in unix
rm -rf ../.config/nvim
mkdir -p ../.config/nvim
cp ../.vimrc ../.config/nvim/init.vim
cp config/coc-settings.json ../.config/nvim/

#   for neovim in windows
#   或许还是要考虑环境变量$XDG_CONFIG_HOME
rm -rf ../AppData/Local/nvim
mkdir -p ../AppData/Local/nvim
cp ../.vimrc ../AppData/Local/nvim/init.vim
cp config/coc-settings.json ../AppData/Local/nvim/

#call cat config/_vimrc > ../.vimrc
#其他设定如果设计后面的，得在source加载前加载

mkdir autoload
cd autoload
curl -fLo plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
