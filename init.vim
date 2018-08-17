call plug#begin()
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'w0rp/ale'
Plug 'zhou13/vim-easyescape'
Plug 'easymotion/vim-easymotion'
Plug 'ryanoasis/vim-devicons'
Plug 'elzr/vim-json'

Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-jedi'
call plug#end()

set rtp+=~/.config/nvim/yamake
augroup filetypedetect
    au! BufRead,BufNewFile ya.make setfiletype yamake
augroup END

let g:python_host_prog = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/bin/python3'

" Colors
set termguicolors
set background=dark
colorscheme deep-space
hi MatchParen guibg=NONE guifg=NONE gui=bold

" Keys
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" Airline
let g:airline_powerline_fonts=1
let g:airline_theme='deep_space'
set noshowmode

" NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$', '\.a$', 'test-results', '\.egg-info$']
let NERDTreeNaturalSort=1
let NERDTreeMinimalUI=1

set number
set tabstop=4
set softtabstop=4
set expandtab
set smarttab
set shiftwidth=4
set autoindent
set cindent
set cursorline

set encoding=utf-8

set mouse=a

" See :help ft-vim-indent
let g:vim_indent_cont = 0

let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 100
cnoremap jk <esc>

" EasyMotion
let g:EasyMotion_do_mapping = 0
nmap t <Plug>(easymotion-s)

" ncm2
let g:ncm2_jedi#python_version=2
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" Deoplete
" set completeopt-=preview
"let g:deoplete#enable_at_startup = 1
" call deoplete#custom#option("sources", { python": ["jedi"], rust": ["rust"], })
" call deoplete#custom#source("jedi", "show_docstring", 0)
" call deoplete#custom#source("jedi", "python_path", "/usr/bin/python2.7")
" call deoplete#custom#source("rust", "racer_binary", "$HOME/.cargo/bin/racer")
" call deoplete#custom#source("rust", "rust_source_path", "$HOME/.cargo/registry/src")
" call deoplete#custom#source("rust", "disable_keymap", 1)
" call deoplete#custom#source("clang", "libclang_path", "/usr/lib/llvm-3.8/lib/libclang.so")
" call deoplete#custom#source("clang", "libclang_path", "/usr/lib/llvm-3.8/include/clang")

" ALE
let g:ale_echo_delay = 100
let g:ale_cache_executable_check_failures = 1
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_linters = { 'python': ['flake8'], 'cpp': ['gcc'] }
"let g:ale_sign_error = ' •'
"highlight ALEErrorSign ctermbg=bg ctermfg=darkred
"highlight AleWarningSign ctermbg=bg ctermfg=red
"highlight SignColumn ctermbg=bg

" DevIcons
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" vim-json
let g:vim_json_syntax_conceal = 0
