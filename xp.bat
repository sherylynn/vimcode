cd %USERPROFILE%/vimcode
call cat config/_vimrc > ../.vimrc
mkdir autoload
cd autoload
call curl -fLo plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
