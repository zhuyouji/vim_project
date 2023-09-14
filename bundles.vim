set nocompatible               " be iMproved
filetype off                   " required!
let mapleader=','
syntax on

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
"-------------
" 基础包工具
"-------------
"管理插件
Bundle 'gmarik/vundle'
Bundle 'L9'
Bundle 'hecal3/vim-leader-guide'
"-------------
"美化工具,对齐作用
"-------------
Bundle 'godlygeek/tabular'


"-------------
" markdown功能
"-------------
Bundle 'preservim/vim-markdown'
Bundle 'instant-markdown/vim-instant-markdown'
"--------------
" Color Schemes
"--------------
Bundle 'tpope/vim-vividchalk'
Bundle 'chriskempson/vim-tomorrow-theme'
"Bundle 'ghifarit53/tokyonight-vim'
"set termguicolors
"let g:tokyonight_style = 'night' " available: night, storm
"let g:tokyonight_enable_italic = 0
"let g:lightline = {'colorscheme' : 'tokyonight'}
"let g:airline_theme = 'tokyonight'
"
"-------------
" 折叠工具
"-------------
Bundle 'tpope/vim-fugitive'
set foldmethod=indent
set foldlevel=99
set foldcolumn=2
nnoremap <Space> @=(foldclosed(line('.')) < 0 ? 'zc' : 'zo')<CR>

"-------------
" git工具
"-------------
Bundle 'gregsexton/gitv'
Bundle 'zivyangll/git-blame.vim'
Bundle 'Xuyuanp/nerdtree-git-plugin'
Bundle 'airblade/vim-gitgutter'
nnoremap <Leader>gb :<C-u>call gitblame#echo()<CR>

"-------------
" 标尺对齐工具
"-------------
Bundle 'Yggdroot/indentLine'
let g:indentLine_enabled = 1
let g:indentLine_color_term = 230
"let g:indentLine_char_list = ['|', '¦', '┆', '┊','|'] 会出现光标的错行，慎用
"let g:indentLine_char_list = ['|', '¦', '¦', '¦']

"-------------
" 状态栏
"-------------
Bundle 'powerline/powerline-fonts'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'

let g:airline_powerline_fonts = 1   " 使用powerline打过补丁的字体
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '▶'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

"-------------
" 快速注释工具
"-------------
Bundle 'The-NERD-Commenter'

"-------------
"去除空格
"-------------
Bundle 'bronson/vim-trailing-whitespace'
map <leader><space> :FixWhitespace<cr>

"-------------
"目录工具nerd_tree
"-------------
Bundle 'scrooloose/nerdtree'
let NERDTreeIgnore=['\.pyc']
"let NERDTreeChDirMode=3
nmap <silent> <F9> <ESC>:Tlist<RETURN>
"列出当前目录文件
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
"打开树状文件目录
map <C-F3> \be
autocmd vimenter * if !argc() | NERDTree | endif
" 只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowBookmarks = 1
let NERDTreeChDirMode=2
nnoremap <leader>n :NERDTree .<CR>
augroup DIRCHANGE
  au!
  autocmd DirChanged global :NERDTreeCWD
augroup END

"-------------
" 文件搜素工具
"-------------
Bundle 'vim-scripts/FuzzyFinder'
Bundle 'tacahiroy/ctrlp-funky'
Bundle 'kien/ctrlp.vim'
Bundle 'jasoncodes/ctrlp-modified.vim'
Bundle 'mileszs/ack.vim'
Bundle 'rking/ag.vim'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif,bazel*    " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.pyc,*.png,*.jpg,*.gif  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\v\.(exe|so|dll)$'
let g:ctrlp_extensions = ['funky']
let g:ctrlp_root_markers  =['build.sh']
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:20'
let g:ctrlp_by_filename = 1
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 1
endif

"ack
"<Leader>c进行搜索，同时不自动打开第一个匹配的文件
nmap <Leader>c :Ack!<CR>

let g:ack_root_path = getcwd()
function! SearchWord()
  let name = input("Please enter word: ")
  execute 'Ack!' shellescape(name) ' ' shellescape(g:ack_root_path)
endfunction
nnoremap <C-f> :call SearchWord()<CR>


"调用ag进行搜索
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"if executable('rg')
"let g:ackprg = 'rg --vimgrep'
"endif
"高亮搜索关键词
let g:ackhighlight = 1
"修改快速预览窗口高度为15
let g:ack_qhandler = "botright copen 15"
"在QuickFix窗口使用快捷键以后，自动关闭QuickFix窗口
let g:ack_autoclose = 1
"使用ack的空白搜索，即不添加任何参数时对光标下的单词进行搜索，默认值为1，表示开启，置0以后使用空白搜索将返回错误信息
let g:ack_use_cword_for_empty_search = 1
"部分功能受限，但对于大项目搜索速度较慢时可以尝试开启
"let g:ack_use_dispatch = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags的设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let Tlist_Sort_Type = "name"    " 按照名称排序
let Tlist_Use_Right_Window = 1  " 在右侧显示窗口
let Tlist_Compart_Format = 1    " 压缩方式
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Exist_OnlyWindow = 1  " 如果只有一个buffer，kill窗口也kill掉buffer
""let Tlist_File_Fold_Auto_Close = 0  " 不要关闭其他文件的tags
""let Tlist_Enable_Fold_Column = 0    " 不要显示折叠树
"let Tlist_Show_One_File=1            "不同时显示多个文件的tag，只显示当前文件的
"设置tags
nmap <leader>tg :!ctags --langmap=c++:+.inl --c++-kinds=+px  --extra=+q --fields=+aiKSz --exclude=bazel* -R *<CR>
set tags=tags;
"set autochdir
nmap tl :Tlist<cr>



"tagbar
Bundle 'majutsushi/tagbar'
let g:tagbar_ctags_bin = 'ctags' " tagbar 依赖 ctags 插件
let g:tagbar_width     = 30      " 设置 tagbar 的宽度为 30 列，默认 40 列
let g:tagbar_autofocus = 1       " 打开 tagbar 时光标在 tagbar 页面内，默认在 vim 打开的文件内
"let g:tagbar_left      = 1       " 让 tagbar 在页面左侧显示，默认右边
"let g:tagbar_sort      = 0       " 标签不排序，默认排序
" <leader>tb 打开 tagbar 窗口，在左侧栏显示
map <leader>tb :TagbarToggle<CR>
"taglist
Bundle 'majutsushi/taglist.vim'
let Tlist_Show_One_File           = 1    " 只显示当前文件的tags
let Tlist_GainFocus_On_ToggleOpen = 1    " 打开 Tlist 窗口时，光标跳到 Tlist 窗口
let Tlist_Exit_OnlyWindow         = 1    " 如果 Tlist 窗口是最后一个窗口则退出 Vim
let Tlist_Use_Left_Window         = 1    " 在左侧窗口中显示
let Tlist_File_Fold_Auto_Close    = 1    " 自动折叠
let Tlist_Auto_Update             = 1    " 自动更新
" <leader>tl 打开 Tlist 窗口，在左侧栏显示
map <leader>tl :TlistToggle<CR>

"-------------
" 语法检查工具
"-------------
Bundle 'dense-analysis/ale.git'

"-------------
" 括号工具
"-------------
Bundle 'vim-scripts/Auto-Pairs'
Bundle 'kien/rainbow_parentheses.vim'
"-------------
"系统剪切板
"-------------
"Bundle 'CaptureClipboard'

"-------------
" c h文件跳转
"-------------
Bundle 'vim-scripts/a.vim'
nmap <leader>a :A<CR>

"-------------
" 语法高亮
"-------------
Bundle 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1


"-------------
" 真彩色
"-------------
Bundle 'tpope/vim-sensible'
"-------------
" ycm
"-------------
Bundle 'ycm-core/YouCompleteMe'
set completeopt=longest,menu "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>" "回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
set termguicolors
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示
let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=1 " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0 " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1 " 语法关键字补全
let g:ycm_show_diagnostics_ui = 0
let g:ycm_global_ycm_extra_conf = {'semantic_triggers': ['async_completion', 'update_semanticdb', 'trigger_character']}
let g:ycm_cache_omnifunc = 1
let g:ycm_cache_omnifunc_timeout = 86400
let g:ycm_semantic_cache_size = 500
let g:ycm_use_ultisnips_completer = 1
let g:ycm_autoclose_preview_window_after_completion = 1 "自动关闭预览窗口
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_collect_identifiers_from_tags_files_limit = 5000


let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_colored_diagnostics = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_error_symbol = '✖'
let g:ycm_warning_symbol = '⚠'
let g:ycm_default_highlight_style = 'highlight'
nnoremap <leader>lo :lopen<CR> "open locationlist
nnoremap <leader>lc :lclose<CR> "close locationlist
let g:ycm_filetype_whitelist = {
			\ "c":1,
			\ "cpp":1,
			\ "objc":1,
			\ "sh":1,
			\ "zsh":1,
			\ }
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_collect_identifiers_from_tags_files = 1
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'

"-------------
" c++format
"-------------
Bundle "rhysd/vim-clang-format"
vmap fm :ClangFormat<CR>
nmap fm :ClangFormat<CR>


"-------------
" log 高亮
"-------------
Bundle 'MTDL9/vim-log-highlighting'

"-------------
" c.vim
"-------------
Bundle 'c.vim'

"-------------
" vim-rooter.vim
"-------------
Bundle 'airblade/vim-rooter'
let g:rooter_manual_only = 1

" Set the rooter patterns to identify the project root
let g:rooter_patterns = ['build.sh']
" Exclude some directories or files from matching
"let g:rooter_patterns += ['!/.git/*', '!/build/*']
" Set the rooter silent mode to avoid output messages
let g:rooter_silent_chdir = 1
" Set the rooter action for non-project files to change to file's directory
let g:rooter_change_directory_for_non_project_files = 'home'


"-------------
" vim-rooter.vim
"-------------
Bundle 'prabirshrestha/vim-lsp'
Bundle 'mattn/vim-lsp-settings'
Bundle 'prabirshrestha/async.vim'
Bundle 'prabirshrestha/asyncomplete.vim'
Bundle 'prabirshrestha/asyncomplete-lsp.vim'
Bundle 'jackguo380/vim-lsp-cxx-highlight'
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
" 启用 LSP 功能
au User lsp_setup call lsp#register_server({
    \ 'name': 'clangd',
    \ 'cmd': {server_info->['clangd', '--background-index']},
     \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': {
      \   'cacheDirectory': '~/.cache',
      \   'highlight': { 'enabled' : v:true },
      \   'emitInactiveRegions': v:true
      \ },
    \ 'whitelist': ['cpp', 'c','h','cc','hpp'],
    \ })

"-------------
" vim-rooter.vim
"-------------
Bundle 'mattn/vim-chatgpt'
au BufNewFile,BufRead *.cpp,*.cxx,*.cc,*.C,*.hh,*.hxx,*.h,*.moc set filetype=cpp
au BufNewFile,BufRead *.hpp,*.hxx,*.hh set filetype=cpp-header

Bundle 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['python', 'ruby', 'perl']
let g:polyglot_load_plugins = ['c', 'cpp', 'rust']
syn match cCppMemberFunc /\<\w\+::\w\+\>/
let g:cpp_experimental_template_highlight = 1


set runtimepath^=~/.vim/syntax/
set runtimepath+=~/.vim
filetype plugin indent on     " required!
