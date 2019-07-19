set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
" Plugin 'gmarik/Vundle.vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'elzr/vim-json'
Plugin 'plasticboy/vim-markdown'
Plugin 'majutsushi/tagbar'

" vim scripts
Plugin 'vim-scripts/taglist.vim'

" git script
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Lokaltog/vim-powerline'

" Color schemes
Plugin 'tomasr/molokai'
Plugin 'flazz/vim-colorschemes'

" golang 
Plugin 'fatih/vim-go'
Plugin 'SirVer/ultisnips'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"------------------------------------------------------------------------------
"autocmd vimenter * NERDTree
map <F2> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <silent> <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"------------------------------------------------------------------------------
"
"
"------------------------------------------------------------------------------
" YouCompleteMe
" Python Semantic Completion
let g:ycm_python_binary_path = 'usr/local/bin/python3'
" C family Completion Path
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" 跳转快捷键
nnoremap <c-k> :YcmCompleter GoToDeclaration<CR>|
nnoremap <c-h> :YcmCompleter GoToDefinition<CR>| 
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|
" 停止提示是否载入本地ycm_extra_conf文件
let g:ycm_confirm_extra_conf = 0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files = 1
" 从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=2
" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" 在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" 弹出列表时选择第1项的快捷键(默认为<TAB>和<Down>)
let g:ycm_key_list_select_completion = ['<TAB>','<VimEnter>']
"let g:ycm_key_list_select_completion = ['', '']
"let g:ycm_key_list_previous_completion = ['']
"let g:ycm_key_invoke_completion = '<fn-Space>'
" 弹出列表时选择前1项的快捷键(默认为<S-TAB>和<UP>)
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" 主动补全, 默认为<C-Space>
"let g:ycm_key_invoke_completion = ['<C-Space>']
" 停止显示补全列表(防止列表影响视野), 可以按<C-Space>重新弹出
"let g:ycm_key_list_stop_completion = ['<C-y>']
"
"---------------------------------UltiSnips setting---------------------------------------------
let g:UltiSnipsExpandTrigger="<S-Enter>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"------------------------------------------------------------------------------
"
"
"
" map setting golang
let mapleader = ","
" vim-go custom mappings
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)

let g:go_fmt_command = "goimports"
let g:ycm_log_level = 'debug'
"------------------------------------------------------------------------------

" setting
syntax on
autocmd BufRead,BufNewFile *.java set filetype=java
autocmd BufRead,BufNewFile *.py set filetype=python
autocmd BufRead,BufNewFile *.cpp set filetype=c++
autocmd BufRead,BufNewFile *.c  set filetype=c
autocmd BufRead,BufNewFile *.go set filetype=go
autocmd BufRead,BufNewFile *.json set filetype=json
autocmd BufRead,BufNewFile *.md   set filetype=markdown
colorscheme molokai

" " Backspace deletes like most programs in insert mode
set backspace=2
" Show the cursor position all the time
"set vb t_vb=
set ruler
set tabstop=4
set softtabstop=4
set laststatus=1
set shiftwidth=4
set expandtab
set t_Co=256
" Display incomplete commands
set showcmd
" Set fileencodings
set fileencodings=ucs-bom,utf-8,cp936,gb2312,gb18030,big5
set background=dark
set encoding=utf-8
set fenc=utf-8
set smartindent
set autoindent
set cul
set linespace=2
set showmatch
set hlsearch
set ignorecase
set smartcase
"set lines=47 columns=90
"set transparency=7
"
" 备份文件
set nobackup
set noswapfile
set noerrorbells
set visualbell
set autoread

set wildmenu
set wildmode=longest:list,full

" Number
set number
"set numberwidth=5

" font and size
set guifont=Meslo\ LG\ M\ for\ Powerline:h13

if has("gui_running")
    set guioptions-=m
    set guioptions-=T
    set guioptions-=L
    set guioptions-=r
    set guioptions-=b
    set showtabline=0
endif

if has('mouse')
  set mouse=a
endif

if &t_Co > 2 || has("gui_running")
syntax on
endif

"""""""""""""""""""" read me """"""""""""""""""""
" 1. install plugins:
"    Launch vim and run :PluginInstall
"    To install from command line: vim +PluginInstall +qall
" 2. 查看vim加载的是哪个配置文件
"    :echo $MYVIMRC
" 3. vim-go的go snippet定义在这里
"    -- .vim/bundle/vim-go/gosnippets/snippets/go.snip
