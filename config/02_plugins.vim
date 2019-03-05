call plug#begin(expand($BUNDLE))
let mapleader = ' '
let g:mapleader = ' '
" Make sure you use single quotes
"----------------------------------------
"Plug 'jceb/vim-orgmode'
"Plug 'akstrfn/vim-orgmode'
"augroup orgmode
"  au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
"  "好像没生效
"  autocmd BufEnter *.org unmap <tab>h
"  autocmd BufEnter *.org unmap <tab>j
"  autocmd BufEnter *.org unmap <tab>k
"  autocmd BufEnter *.org unmap <tab>l
"augroup END
"太旧，兼容性有问题
"Plug 'hsitz/VimOrganizer'
"augroup orgmode
"  au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
"  autocmd BufEnter *.org call org#SetOrgFileType()
"augroup END
"Plug 'vim-voom/VOoM'
"-------------------------------------
" Plugin options
" 原先的gocode不再支持
" Plug 'nsf/gocode', { 'rtp': 'vim','for':'go' }
Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' ,'for':'go'}
"为了启动时间-------------------------------
"Plug 'tweekmonster/startuptime.vim'
"Plug 'junegunn/vim-easy-align'
"快速对齐
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
"vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
"nmap <Leader>a <Plug>(EasyAlign)
"rpg game for vimer
"Plug 'sherylynn/vimer-rpg' ,{ 'do': 'sudo apt install fonts-noto-color-emoji' }
" game
"Plug 'sherylynn/vim-game-snake'
"Plug 'thinca/vim-painter'
"-------------------------------------------
" emacs
"Plug 'sherylynn/vim-elisp' , {'for':['org','elisp']}
set shortmess=at
Plug 'sherylynn/vim-elisp' 
augroup orgmode
  autocmd!
  autocmd BufNewFile,BufRead *.org set filetype=org
augroup END
" nodejs
Plug 'sherylynn/vim-nodejs'
" auto update 
Plug 'sherylynn/vim-update'
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
"浏览树
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"浏览树显示git状态插件
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-scripts/Tagbar'
"Bundle 'minibufexpl.vim'
"------------------------------web-----------------------
"Plug 'https://github.com/burnettk/vim-angular.git'
"jsx插件
"Plug 'mxw/vim-jsx',{'for':['javascript','jsx']}
Plug 'mxw/vim-jsx'
"css color
"Plug 'ap/vim-css-color',{'for':['html','javascript']}
Plug 'ap/vim-css-color'
"zencoding 改名为了 Emmet
"Plug 'https://github.com/luofei614/Emmet.vim',{'for':['html','javascript']}
Plug 'https://github.com/luofei614/Emmet.vim'
"Plug 'vim-scripts/WebAPI.vim',{'for':['html','javascript']}
Plug 'vim-scripts/WebAPI.vim'
" jquery , angularjs 等语法
"Plug 'https://github.com/othree/javascript-libraries-syntax.vim.git'
Plug 'https://github.com/othree/javascript-libraries-syntax.vim.git'

"css私有前缀
Plug 'vim-scripts/prefixer.vim'
"能缩减HTML代码
Plug 'vim-scripts/xml.vim'
"安装此插件解决macvim下没有加号寄存器的问题。
"Plug 'https://github.com/kana/vim-fakeclip.git'
"Plug 'posva/vim-vue',{'for':'vue'}
Plug 'posva/vim-vue'
"微软typerscript支持，高亮
"Plug 'leafgarland/typescript-vim',{'for':'ts'}
Plug 'leafgarland/typescript-vim'
Plug 'OmniSharp/omnisharp-vim',{'for':'cs'}
"ts的功能插件
"Plug 'Quramy/tsuquyomi',{'for':'ts'}
Plug 'Quramy/tsuquyomi'
"------------------------------web-------------------------
"模糊搜索软件
if has('win32') || has('win64')
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'go build && mv ./main.exe ./bin/fzf.exe' }
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
endif
Plug 'junegunn/fzf.vim'
"国人出品 flygrep 功能类似the-silver-searcher
"Plug 'wsdjeg/flygrep.vim'
"nnoremap <silent> <Leader>s :FlyGrep<CR>

"Plug 'tomasr/molokai'
"Plug 'lifepillar/vim-solarized8'
"vscode dark
"原作者的不能使用了 发现换一个人也不行 原来是colorschemey应该放外面
"Plug 'tomasiser/vim-code-dark'
"Plug 'dunstontc/vim-code-dark'
"Plug 'DNonov/vim-code-dark'
Plug 'sherylynn/vim-code-dark'
Plug 'rafi/awesome-vim-colorschemes'

"Plug 'dunstontc/vim-vscode-theme'
"colorscheme dark_plus

"bookmark  mm 添加书签,  mn 移动书签  mp 移动到前一个书签  ma 删除所有书签
"Plug 'MattesGroeger/vim-bookmarks'


"Bundle 'JavaScript-syntax'
"Plug 'pangloss/vim-javascript',{'for':['html','javascript']}
Plug 'pangloss/vim-javascript'

if g:completor=='asyncomplete'||g:completor=='autocomplpop'
  "tern js 补全
"  Plug 'ternjs/tern_for_vim', {'do': 'npm install','for':'javascript'}
  Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
endif

"Plug 'terryma/vim-multiple-cursors'

"snippets
"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'tomtom/tlib_vim'
"Plug 'garbas/vim-snipmate'
"Plug 'https://github.com/bonsaiben/bootstrap-snippets.git'

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'


"切换到 ale
Plug 'w0rp/ale'
" {}
Plug 'jiangmiao/auto-pairs'
"</>
Plug 'alvan/vim-closetag'
"beauty
Plug 'vim-scripts/matchit.zip'
"python-mode
Plug 'sherylynn/python-mode',{'branch':'develop'}
let g:pymode_python='python3'
"Go 插件
Plug 'fatih/vim-go' , { 'do': ':GoInstallBinaries','for':'go' }
let g:go_highlight_types=1
let g:go_highlight_fields=1
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_operators=1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_metailinter_autosave=1
"git 插件
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"增强了搜索，需要映射键位
Plug 'haya14busa/incsearch.vim'
"v模式下选词 +键扩展 -键缩减
Plug 'terryma/vim-expand-region'
"异步执行命令
Plug 'skywind3000/asyncrun.vim'
"编译任务插件
"Plug 'skywind3000/vimmake'
"-------------------------特殊项目---------------
"Plug 'hsanson/vim-android'
"Plug 'chemzqm/wxapp.vim'
"-----------------------------------------------j
"彩虹括号
Plug 'luochen1990/rainbow'
"插件在切换buffer时有问题，所以设定成关闭然后手动呼唤
let g:rainbow_active=1
"markdown
Plug 'tpope/vim-markdown',{'for':'markdown'}
"markdown preview
Plug 'iamcco/mathjax-support-for-mkdp',{'for':'markdown'}
Plug 'iamcco/markdown-preview.vim',{'for':'markdown'}
"formate js
"Plug 'prettier/vim-prettier', { 'do': 'npm install','for':'javascript' }
Plug 'prettier/vim-prettier', { 'do': 'npm install'}
"中文排版规范化用法  :PanGu
Plug 'hotoo/pangu.vim'
"异步补全，需要python3
if has('python3')
  if g:completor=="deoplete"
    if has('nvim')
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
      Plug 'Shougo/deoplete.nvim'
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc',{'do':'pip3 install neovim'}
    endif
  "  "注释部分为flow补全---------------------
  "  "Plug 'wokalski/autocomplete-flow',{'do':'npm i -g flow-bin'}
  "  "Plug 'Shougo/neosnippet'
  "  "Plug 'Shougo/neosnippet-snippets'
  "  "---------------------------------------
  "  "--------ternjs-----------------
"    Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' ,'for':'javascript'}
    Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
    let g:deoplete#sources#ternjs#types = 1

    let g:deoplete#sources#ternjs#depths = 1
    let g:deoplete#sources#ternjs#docs = 1
    let g:deoplete#sources#ternjs#filter = 0
    "下面三个设定是为了配合tern_for_vims使用的，但是一直有问题
    let g:tern#command =["tern"]
    "let g:tern#arguments =["--persistent"]
    "用了这个参数还是不行啊，还是会产生.tern_port
    "下一步尝试把autocmd 设置进入的时候直接删掉目录中的.tern_port
    "那么还是可以用的，得了解vim如何探测目录
    let g:tern#arguments =["--no-port-file"]
    "-------------------------------------------
    Plug 'mhartington/nvim-typescript'
    "-------------------------------------------
    "go
    Plug 'zchee/deoplete-go', { 'do': 'make','for':'go'}
    let g:deoplete#enable_at_startup = 1
  elseif g:completor=="completor"
    Plug 'maralla/completor.vim',{'do':'pip3 install jedi'}
  endif
endif
"----------------------------补全器的依赖分开来弄
if has('job')||has('job_start')
  if g:completor=="asyncomplete"
    "echom "开启asyncomplete"
    "纯vimscript异步补全
    Plug 'prabirshrestha/async.vim'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/vim-lsp',{'do':'sudo pip3 install python-language-server pycodestyle'}
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'prabirshrestha/asyncomplete-buffer.vim'
    Plug 'prabirshrestha/asyncomplete-file.vim'
    Plug 'prabirshrestha/asyncomplete-gocode.vim'
    Plug 'yami-beta/asyncomplete-omni.vim'
    Plug 'runoshun/tscompletejob'
    Plug 'prabirshrestha/asyncomplete-tscompletejob.vim'
    if executable('pyls')
      "sudo pip install python-language-server
      au User lsp_setup call lsp#register_server({
        \ 'name':'pyls',
        \ 'cmd':{server_info->['pyls']},
        \ 'whitelist':['python'],
        \ })
    endif
    au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name':'buffer',
    \ 'whitelist':['*'],
    \ 'blacklist':['go'],
    \ 'completor':function('asyncomplete#sources#buffer#completor'),
    \ }))
    au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \  'name':'file',
    \  'whitelist':['*'],
    \  'priority':10,
    \  'completor':function('asyncomplete#sources#file#completor')
    \  }))
    au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#gocode#get_source_options({
    \  'name':'gocode',
    \  'whitelist':['go'],
    \  'completor':function('asyncomplete#sources#gocode#completor'),
    \  'config':{
    \    'gocode_path':expand('~/go/bin/gocode')
    \  }
    \  }))
    au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
    \ 'name': 'omni',
    \ 'whitelist': ['*'],
    \ 'blacklist': ['html'],
    \ 'completor': function('asyncomplete#sources#omni#completor')
    \  }))
    au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#tscompletejob#get_source_options({
    \ 'name': 'tscompletejob',
    \ 'whitelist': ['typescript'],
    \ 'completor': function('asyncomplete#sources#tscompletejob#completor'),
    \ }))
    "----------------flow----------
    " Plug 'prabirshrestha/async.vim'
    " Plug 'prabirshrestha/asyncomplete-flow.vim',{'do':'npm install -g flow-bin'}
    " au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#flow#get_source_options({
    " \ 'name': 'flow',
    " \ 'whitelist': ['javascript'],
    " \ 'completor': function('asyncomplete#sources#flow#completor'),
    " \ }))
    "------------------------------
    "补全方式换异步
    let g:asyncomplete_auto_popup =1
    func! s:check_back_space() abort
      let col = col('.') -1
      return !col || getline('.')[col-1]=~ '\s'
    endfunc
    set completeopt+=preview
    inoremap <silent><expr> <TAB>
      \ pumvisible() ?"\<C-n>":
      \ <SID>check_back_space() ? "\<TAB>":
      \ asyncomplete#force_refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
  endif
else
  "老版本补全
  if g:completor=='autocomplpop'
    Plug 'vim-scripts/AutoComplPop'
    autocomplpop 设置
    let g:AutoComplPop_IgnoreCaseOption=1
    function! InsertTabWrapper()
      let col=col('.')-1
      if !col || getline('.')[col-1] !~ '\k'
        return "\<TAB>"
      else
        return "\<C-x>\<C-o>"
      endif
    endfunction
    "按tab键，全能提示，
    "注意要用inoremap，不能用map！，如果用map！在命令模式下tab键没有提示功能。
    inoremap <TAB> <C-R>=InsertTabWrapper()<CR>
    "shift+tab 展开代码片段
    imap <S-TAB> <Plug>snipMateNextOrTrigger
  endif
endif

call plug#end()
