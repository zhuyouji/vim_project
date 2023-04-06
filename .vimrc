source ~/.vim/bundles.vim
execute pathogen#infect()

" encoding dectection
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

" enable filetype dectection and ft specific plugin/indent
filetype plugin indent on

" enable syntax hightlight and completion
syntax on


" set param
set mouse=a
set sw=2
set ts=2
set softtabstop=2
set et
set smarttab
set smartindent
set number
set lbr
set sm
set selection=inclusive
set wildmenu
set mousemodel=popup
set history=1000
set hlsearch
set incsearch
"语言设置
set langmenu=zh_CN.UTF.8
set helplang=cn
set cmdheight=2
set cul
set shortmess=atI
set clipboard=unnamed
set go=
color monokai
set guifont=Courier_New:h10:cANSI
autocmd InsertEnter *se nocul
set ruler
set mouse=v
set scrolloff=3
set nocompatible
set autoindent
set cindent
set viminfo+=!
set iskeyword+=_,$,@,%,#,-
let mapleader=','
set autoread
set autowrite
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
set noeb
set confirm
set nobackup
set noswapfile
"搜索忽略大小写
set ignorecase
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
set report=0
set selection=exclusive
set selectmode=mouse,key
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
set completeopt=longest,menu




"键盘按键映射
nmap tt :%s/\t/    /g<CR>

nmap tn :tabNext<CR>
nmap te :tabedit<CR>
nmap ts :tabs<CR>
map <S-Left> :tabp<CR>
map <S-Right> :tabn<CR>

map! <C-Z> <Esc>zzi
map! <C-O> <C-Y>,
map <C-A> ggVG$"+y
map <Esc><Esc> :w<CR>
map <F12> gg=G
map <C-w> <C-w>w
imap <C-k> <C-y>,
imap <C-t> <C-q><TAB>
imap <C-j> <ESC>
imap <C-v> <Esc>"*pa
imap <C-a> <Esc>^
imap <C-e> <Esc>$
vmap <C-c> "+y
map <C-s> :w<CR>

"去空行
nnoremap <F2> :g/^\s*$/d<CR>
"比较文件
nnoremap <C-F2> :vert diffsplit
nnoremap <Leader>fu :CtrlPFunky<Cr>
nnoremap <C-n> :CtrlPFunky<Cr>

nmap vp :vsplit<CR>
nmap sp :split<CR>
nmap <leader>q :q<CR>


map <leader>1 :tabnext 1<CR>
map <leader>2 :tabnext 2<CR>
map <leader>3 :tabnext 3<CR>
map <leader>4 :tabnext 4<CR>
map <leader>5 :tabnext 5<CR>
map <leader>6 :tabnext 6<CR>
map <leader>7 :tabnext 7<CR>
map <leader>8 :tabnext 8<CR>
map <leader>9 :tabnext 9<CR>
map bn :bn<CR>
map bp :bp<CR>

map <leader>e :20Lexplore<CR>
set autochdir


au FileType c++ setlocal dict+=~/.vim/dict/c++.dict
au FileType c setlocal dict+=~/.vim/dict/c.dict



