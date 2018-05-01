::cd %USERPROFILE%
::git pull http://github.com/sherylynn/vimcode .vim
::cd %USERPROFILE%/.vim
::echo let g:VIMHOME=".vim" > ../.vimrc
::echo source %USERPROFILE%\.vim\config\vimrc >> ../.vimrc

cd %USERPROFILE%
git pull http://github.com/sherylynn/vimcode vimcode
cd %USERPROFILE%/vimcode
echo let g:VIMHOME="vimcode" > ../.vimrc
echo source %USERPROFILE%\vimcode\config\vimrc >> ../.vimrc
::guifont和后面的内容不能有空格
echo set guifont=Courier_new:h15:b >> ../.vimrc
echo set ff=unix >> ../.vimrc


::call cat config/_vimrc > ../.vimrc
::其他设定如果设计后面的，得在source加载前加载

mkdir autoload
cd autoload
call curl -fLo plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
