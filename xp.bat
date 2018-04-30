cd %USERPROFILE%
git pull http://github.com/sherylynn/vimcode .vim
cd %USERPROFILE%/.vim
::call cat config/_vimrc > ../.vimrc
echo let g:VIMHOME=".vim" > ../.vimrc
::其他设定如果设计后面的，得在source加载前加载
echo source %USERPROFILE%\.vim\config\vimrc >> ../.vimrc
mkdir autoload
cd autoload
call curl -fLo plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim