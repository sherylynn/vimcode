" Basics {
set nocompatible        " Must be first line
" }
"补全软件的选择k可以在这里设置
if has('nvim')
  let g:completor='coc'
elseif has('job')
  let g:completor='asyncomplete'
else
  let g:completor='autocomplpop'
endif
if has('nvim')
  if has('python3')
  else
    !pip3 install neovim --user
  endif
  let g:filemanager='defx'
else
  let g:filemanager='nerdtree'
endif
"let g:completor='deoplete'
"let g:completor='LanguageClient-neovim'
"let g:completor='completor'
"let g:lsp='true'
"bingo 似乎一定要项目在gopath下
"let g:vim_lsp_go='go-langserver'
let g:vim_lsp_go='gopls'
"加载路径
let $VIMHOME=expand("$HOME/vimcode")
let $BUNDLE =expand("$VIMHOME/plugged")
let $PLUG_DIR=expand("$VIMHOME/autoload")
let $PLUG_VIM=expand("$PLUG_DIR/plug.vim")
if empty(glob($PLUG_VIM))
  if has('win32')||has('win64')
    cd $VIMHOME
    let $PLUG_VIM="autoload/plug.vim"
  else
    "如果是其他系统不需要调整路径
  endif
    silent !curl -fLo $PLUG_VIM --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif
source $PLUG_VIM
" Windows Compatible {
" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier.
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
  "禁用win下alt快捷键,只在gui下生效，不实用
  set winaltkeys=no
  " Be nice and check for multi_byte even if the config requires
  " multi_byte support most of the time
  if has("multi_byte")
    " Windows cmd.exe still uses cp850. If Windows ever moved to
    " Powershell as the primary terminal, this would be utf-8
    set termencoding=cp850
    " Let Vim use utf-8 internally, because many scripts require this
    set encoding=utf-8
    setglobal fileencoding=utf-8
    " Windows has traditionally used cp1252, so it's probably wise to
    " fallback into cp1252 instead of eg. iso-8859-15.
    " Newer Windows files might contain utf-8 or utf-16 LE so we might
    " want to try them first.
    set fileencodings=ucs-bom,utf-8,utf-16le,cp1252,iso-8859-15,chines
    set guifont=Consolas:h12
    "解决菜单乱码
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    "解决consle输出乱码
    language messages zh_CN.utf-8
  endif
endif
" }
