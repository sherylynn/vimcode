"vimgrep查询时排除composer的vendor目录,排除前端bower和node的包文件目录,CommandT也不会查到他们
set wildignore=vendor/**,bower_components/**,node_modules/**


let g:used_javascript_libs = 'jQuery,AngularJS,AngularUI,RequireJS'

set ignorecase smartcase

let g:acp_behaviorKeywordCommand="\<C-n>"

"设置NERDTreetagbar的宽度

let g:NERDTreeWinSize = 20
let g:tagbar_width=20
"自动打开nerdtree
"autocmd vimenter * NERDTree
"颜色主题设置
set background=dark
"colorscheme solarized8
colorscheme codedark
let g:airline_theme='codedark'
let g:tcc="codedark"
" Allow to trigger colorscheme
  function! ToggleCC() 
    " Inversion 
    if g:tcc== "solarized8" 
      colorscheme codedark
      let g:tcc="codedark"
      let g:airline_theme='codedark'
      echom g:tcc
    elseif g:tcc== "codedark"
      colorscheme solarized8
      "let g:airline_theme='solarized'
      "let g:airline_solarized_bg='light'
      let g:tcc="solarized8"
    endif 
  endfunction 
" Allow to trigger background 
  function! ToggleBG() 
    let s:tbg = &background 
    " Inversion 
    if s:tbg == "dark" 
      set background=light 
    else 
      set background=dark 
    endif 
  endfunction 
"是否支持真彩色
if $COLORTERM == 'truecolor'
  "设置终端真彩色
  set termguicolors
elseif has('win32') || has('win64')
  set termguicolors
  "设置256色
  "似乎windows不安装ubuntu前是色不全，安装后色全了
else
  set t_Co=256
endif
nnoremap <leader>tb :call ToggleBG()<CR>
"toggle rainbow
nnoremap <leader>tr :RainbowToggle<CR>
nnoremap <leader>tc :call ToggleCC()<CR>
inoremap jk <ESC>
"删除了半天的插件后得出的结论
"普通模式会对j进行一个判断，判断后面没跟k才会输出j，结果就造成了看上去往下走的时候最后一个键卡顿的效果
"map jk  <ESC>
"命令模式还是可以用
cnoremap jk <ESC>
"emmet 设置

let g:user_emmet_expandabbr_key = '<C-Y>'
let g:use_emmet_complete_tag = 1
let g:user_emmet_settings = {"lang":"zh-cn"}

"silent是指执行后面的命令时不显示在命令栏
nnoremap <silent> <Leader>f :Files<CR>
"nnoremap <silent> <Leader>ft :NERDTreeToggle<CR>
nnoremap <silent> <Leader>g :Ag<CR>
"leader search help
nnoremap <silent> <Leader>sh yiw:h <C-R>"<CR>
"mobile leader>t 已经被test占用,windows qwe 代表左中右
nnoremap <silent> <Leader>wq :NERDTreeToggle<CR>
nnoremap <silent> <Leader>ft :NERDTreeToggle<CR>
nnoremap <silent> <Leader>ww :call asyncrun#quickfix_toggle(8)<cr>
nnoremap <silent> <Leader>we :TagbarToggle<cr>
"terminal
"if has terminal
if has('terminal') || has('nvim')
  tnoremap jk <c-\><c-n>
  nnoremap <silent><leader>' :terminal<CR>
  nnoremap <silent><leader>tt :terminal<CR>
endif
"editor
nnoremap <silent> <Leader>fed :call Edit_vimcode()<cr>
nnoremap <silent> <Leader>feR :call Reload_vimcode()<cr>
nnoremap <silent> <Leader>ee :call Edit_vimcode()<cr>
nnoremap <silent> <Leader>er :call Cd_source()<cr>
"edit load editfile
nnoremap <silent> <Leader>el :source %<cr>
"add comment to vimrc
nnoremap <silent> <Leader>ec 0i"<Esc>
"change comment to  command vimrc
nnoremap <silent> <Leader>ei 0x
"nnoremap <silent> <Leader>v :Tags<CR>



nnoremap <c-]> g<c-]>

vnoremap <c-]> g<c-]>

"多行光标键位解绑
let g:multi_cursor_use_default_mapping=0
" Default mapping
"let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"理解了下寄存器 命令模式需要C-R"才能粘贴 可视模式复制剪切
"内部寄存器是"，外部是+
cnoremap <leader>v <C-R>"
nnoremap <leader>v "+p
vnoremap <leader>c "+y
nnoremap <silent><leader>cd :lcd %:p:h<CR>
vnoremap <leader>x "+x
"添加括号
"这个规则和下个规则实际效果一致
"nnoremap <leader>' viw<esc>a'<ESC>hbi'<Esc>lel
"映射了连续操作，成对的引号插件不生效不影响
"原来的方式在词首会通过b直接到上一词,同理就算换e也可能在词尾跑到下一词,viw可以限制在本词
nnoremap <leader>" viw<esc>a"<ESC>hbi"<Esc>lel
nnoremap <leader>( viw<esc>a)<ESC>hbi(<Esc>lel
"nnoremap <leader>" bi"<ESC>ea"<ESC>
"nnoremap <leader>( bi(<ESC>ea)<ESC>
"快速关闭单个窗口
nnoremap <leader>q <C-W>q
"强退当前窗口 <C-W>q!
nnoremap <leader>Q :q!<CR>
"快速关闭
map <S-Q> :qa<CR>
"多窗口切换
"ctrl是修饰键可以按住不动的使用
"leader只生效一次，需要不断重新敲击
nmap <Leader>h <C-W><C-H>
nmap <Leader>j <C-W><C-J>
nmap <Leader>k <C-W><C-K>
nmap <Leader>l <C-W><C-L>
nmap <Leader>wh <C-W><C-H>
nmap <Leader>wj <C-W><C-J>
nmap <Leader>wk <C-W><C-K>
nmap <Leader>wl <C-W><C-L>
"tab窗口的切换移动
nmap <silent><tab>h :tabp<cr>
nmap <silent><tab>j :tabclose<cr>
nmap <silent><tab>k :tabnew<cr>
nmap <silent><tab>l :tabn<cr>
nmap <silent><s-tab> :tabnext<cr>
" 分割出的窗口 在下边或右边
set splitbelow
set splitright
" gvim 不显示工具/菜单栏
set guioptions-=T
set guioptions-=m
set guioptions-=L
set guioptions-=r
set guioptions-=b
" 使用内置tab样式而不是gui样式
set guioptions-=e
set nolist
" git Command git使用
" gca 开启提交 cc进入commit :wq保存提交
" gp 推送
nnoremap gcm :AsyncRun git checkout master<CR>
nnoremap gc. :AsyncRun git checkout .<CR>
nnoremap gca :Gcommit -a -v<CR>
nnoremap gcf :AsyncRun git commit -m "fix" -a<CR>
"nnoremap gp  :Gpush <CR>
"git push 这步阻塞太痛苦了，改成异步的
nnoremap gr :bufdo :e!<CR>
nnoremap gl :AsyncRun git pull<CR>
nnoremap gs :Gstatus<CR>
nnoremap gp :AsyncRun git push<CR>
"当有消息时自动弹出消息窗
augroup vimrc
  autocmd QuickFixCmdPost * botright copen 8
augroup END

"leader+0~9 快捷键设置
"在tree中t就可以新建一个tab来编辑
nmap <Leader>1 :NERDTreeToggle<CR>
"vim中的map中的!代表了插入模式和命令模式
"而在后两者的模式的输入中对空格本身的判断延时会影响使用
"所以去掉
"nmap! <Leader>3 <Esc>:NERDTreeToggle<CR>
"leader2 操控quickfixc窗口
nnoremap <Leader>2 :call asyncrun#quickfix_toggle(8)<cr>
"leader 3 打开 tagbar
nnoremap <leader>3 :TagbarToggle<CR>
"leader 4 打开 Tags
nnoremap <leader>4 :AsyncRun ctags -R --fields=+S .<CR>
"ctrl+s为保存
map <C-S> :w<CR>
inoremap <C-S> <C-O>:w<CR>

"ctrl+z撤销

map <C-Z> :u<CR>

map! <C-Z> <C-O>:u<CR>

"双击时高亮

map <2-leftmouse> \m
inoremap <2-leftmouse> <Esc>\m

"ctrl+鼠标左键跳转

"--------------------
" Function: Open tag under cursor in new tab
" Source:   http://stackoverflow.com/questions/563616/vimctags-tips-and-tricks
"--------------------
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"--------------------
" Function: Remap keys to make it more similar to firefox tab functionality
" Purpose:  Because I am familiar with firefox tab functionality
" 切换tab页 用gt
"--------------------
map     <C-T>       :tabnew<CR>

map <A-LeftMouse> <C-]>

map! <A-LeftMouse> <Esc><C-]>
"在mac下iterm终端标题中中显示文件名称
"===============================================
"autocmd BufEnter *.* exe 'silent ! echo -ne "\033];%:t\007"'
"原来这么久的闪屏是因为这个
"===============================================
"支持鼠标

set mouse=a


" 多行缩进

vnoremap <Tab> >

vnoremap <S-Tab> <

"语法高亮
syntax enable
syntax on
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
"加快速度
"set synmaxcol=200
set ttyfast " u got a fast terminal
set lazyredraw " to avoid scrolling problems
"删除键
set backspace=eol,start,indent

"基本设置

set encoding=utf-8

set fileencoding=utf-8

set fileencodings=ucs-bom,utf-8,chinese

set ambiwidth=double

set wrap "自动换行

"设置无备份

set nobackup

set nowritebackup

"vim-closetag 
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js"
"十字线高亮
set cursorcolumn          " highlight current column
set cursorline            " highlight current line

"设置jsx插件对js也解析
let g:jsx_ext_required = 0

" 代码折叠
set foldenable
"set foldmarker={,}
" 缩进折叠
set foldmethod=indent
" 语法折叠
"set foldmethod=syntax
"标记折叠
"set foldmethod=marker
" 折叠栏 太丑了我都瞎了
"set foldcolumn=4
set foldlevel=99
"退出后不清空
"set t_ti= t_te=
set relativenumber " show relative line number
set number         " show absolute number with relativenumber
set ruler          " show the current line number and column number
set scrolloff=9    " Set  lines to the cursor - when moving vertically using j/k"
"代码提示 配合scrooloose/syntastic
"npm i -g eslint eslint-config-airbnb babel-eslint eslint-plugin-react
"eslint-plugin-react-native

"test2
"Pangu chinese
func! PanGu_self()
  "把非段首的空白全部删除
  "搜索空白 反向不匹配句首连续空白
  :%s/\v (^ *)@<!//g
  :call PanGuSpacing()
endfunc 
func! PanGu_Full()
  :call PanGuSpacing()
  "段首加俩全角空格
  :g!/^$/s/^/　　/
endfunc 
nnoremap <leader>pg :call PanGu_self()<CR>
"nmap <leader>p <Plug>(Gpush)
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>pc :PlugClean<CR>
"leader6 刷新编辑器
nnoremap <leader>6 :call Cd_source()<CR> 
if !exists("*Reload_vimcode")
func Reload_vimcode()
  :source $MYVIMRC
endfunc
endif
if !exists("*Edit_vimcode")
func Edit_vimcode()
  :lcd $VIMHOME
  :tabedit $VIMHOME/config/01_base.vim
  silent :sp $VIMHOME/config/02_plugins.vim
  wincmd k
  silent :vs $VIMHOME/config/03_config.vim
  wincmd j
  silent :vs $VIMHOME/nvim/coc-settings.json
endfunc
endif
if !exists("*Cd_source")
  func Cd_source()
    :cd -
    :source $MYVIMRC
endfunc
endif
"leader+5 编辑vimrc
map <leader>5 :call Edit_vimcode()<CR>
"leader+7 预览markdown 需要python和插件支持
nnoremap <leader>7 :MarkdownPreview<cr>
augroup batcmd
  autocmd!
  autocmd FileType bat nnoremap <leader>r :!cmd.exe %
augroup END
augroup cscmd
  autocmd!
  autocmd FileType cs nmap <leader>r :AsyncRun dotnet run<CR>
  autocmd FileType cs nmap <leader>b :AsyncRun dotnet build<CR>
augroup END
augroup bashcmd
  autocmd!
  autocmd FileType sh nmap <leader>r :AsyncRun bash %<CR>
augroup END
if g:completor=='autocomplpop'
  augroup gocmd
    autocmd!
    autocmd FileType go nmap <leader>t <Plug>(go-test)
    autocmd FileType go nmap <leader>b <Plug>(go-build)
    autocmd FileType go nmap <leader>r <Plug>(go-run)
    autocmd FileType go let g:go_highlight_types =1
  augroup END
  augroup pycmd 
    autocmd!
    autocmd FileType py let g:pymode_run =1
    autocmd FileType py let g:pymode_run_bind = '<leader>r'
  augroup END
else
  augroup gocmd
    autocmd!
    autocmd FileType go nmap <leader>t :AsyncRun go test<CR>
    autocmd FileType go nmap <leader>b :AsyncRun go build<CR>
    autocmd FileType go nmap <leader>r :AsyncRun go run %<CR>
  augroup END
  augroup pycmd 
    autocmd!
    autocmd FileType py nmap <leader>r :AsyncRun python %<CR>
  augroup END
endif
augroup NodeJS
  autocmd!
  if !exists("*NodeJSable")
    func! NodeJSable(dir,filename)
      "其实这里的功能也可以直接用vim内置的 isdirectory 或者 filereadable
      let l:dir_command='ls ' . a:dir
      "注意，这里检索不到package.json的时候依然会出现  ls: cannot access 'package.json': No such file or directory ,
      "依然检索package.json永远会检测到
      let l:status=matchstr(system(l:dir_command),'\m\(' . a:filename . '\)\|\(such\)')
      if l:status==a:filename
        nnoremap <leader>t :AsyncRun npm test<CR>
        nnoremap <leader>i :AsyncRun npm install<CR>
        nnoremap <leader>b :AsyncRun npm run build<CR>
        nnoremap <leader>r :AsyncRun npm run start<CR>
        nnoremap <leader>d :AsyncRun npm run dev<CR>
      elseif l:status=="such"
      else
      endif
    endfunc
  endif
  autocmd VimEnter,BufNewFile,BufRead * nested call NodeJSable(expand('%:h'),"package.json")
augroup END

if g:completor=='autocomplpop'
  "显示
  "tabline
  "let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#ale#enabled = 1
  "自动完成
  let g:ale_completion_enabled = 1
  let g:ale_linters = { 'cs': ['OmniSharp'] }
  let g:ale_fixers = {
  \   'javascript': ['eslint'],
  \}
  "自动纠正
  let g:ale_fix_on_save = 1
  "保持打开栏目
  let g:ale_sign_column_always = 1
endif
"--------------------------------------------------
"incsearch
"--------------------------------------------------
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
"搜索后自动关闭高亮
" :h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
if g:completor=='asyncomplete'||g:completor=='autocomplpop'
  "echom "开启js文件探测:wq"
  " ----------------------------------------------------------------------------
  " tern_for_vim
  " ----------------------------------------------------------------------------
  let tern_show_signature_in_pum = 1
  let tern_show_argument_hints = 'on_hold'
  autocmd FileType javascript setlocal omnifunc=tern#Complete
  "不晓得什么用，先注销
  "autocmd FileType javascript nnoremap <leader>d :TernDef<CR>
endif


if g:completor=='coc'
  if executable('go')
    if executable('bingo')
    else
      :! go get -u github.com/saibing/bingo
    endif
  endif
  "coc airline
"  let g:airline_extension=['branch','hunks','coc']
  let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
  let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
  let g:lightline={
        \'colorscheme':'wombat',
        \'active':{
        \  'left':[['mode','paste'],
        \    ['cocstatus','readonly','filename','modified']]
        \},
        \'component_function':{
        \  'cocstatus':'coc#status'
        \}
        \}
endif
if g:completor=='asyncomplete'
  let g:lsp_signs_enabled = 1         " enable signs
  let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
  let g:lsp_signs_error = {'text': '✗'}
endif
let g:AutoUpdate=1
if g:AutoUpdate==1 
"  if !exists("*GitPullable")
"    silent :PlugInstall<CR>
"  else
    augroup LynnPlugUpdate
      autocmd!
      autocmd VimEnter * nested call GitPullable(expand('$HOME/vimcode'))
      autocmd VimEnter * nested call GitPullable(expand('$HOME/vimcode/plugged/vimer-rpg'))
      autocmd VimEnter * nested call GitPullable(expand('$HOME/vimcode/plugged/vim-elisp'))
      autocmd VimEnter * nested call GitPullable(expand('$HOME/vimcode/plugged/vim-nodejs'))
      autocmd VimEnter * nested call GitPullable(expand('$HOME/vimcode/plugged/vim-update'))
      autocmd VimEnter * nested call GitPullable(expand('.'))
    augroup end
"  endif
endif
