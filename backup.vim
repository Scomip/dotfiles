call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'scomip/vim-easyescape-plus'
Plug 'easymotion/vim-easymotion'
Plug 'ryanoasis/vim-devicons'
Plug 'elzr/vim-json'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'
Plug '~/git/fzf'
Plug 'junegunn/fzf.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'editorconfig/editorconfig-vim'

Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-racer'

Plug 'Vimjas/vim-python-pep8-indent'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

Plug 'fenetikm/falcon'
call plug#end()

set rtp+=~/.config/nvim/yamake
augroup filetypedetect
    au! BufRead,BufNewFile ya.make setfiletype yamake
augroup END
autocmd FileType yamake setlocal nocindent

let g:python_host_prog = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/bin/python3'

" Colors
set termguicolors
let g:falcon_background = 1
let g:falcon_inactive = 1
let g:falcon_airline = 1
colorscheme falcon

" Keys
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" Lightline
let g:falcon_lightline = 1
let g:lightline = {
  \ 'colorscheme': 'falcon',
  \ 'active': {
  \   'left': [['mode', 'paste'], ['readonly', 'filename', 'modified']],
  \   'right': [['line'], ['lineinfo'], ['fileformat', 'fileencoding', 'filetype']],
  \ },
  \ 'inactive': {
  \   'left': [['filename']],
  \   'right': [['lineinfo']],
  \ },
  \ 'tabline': {
  \   'left': [['tabs']],
  \   'right': [['close']],
  \ },
  \ 'tab': {
  \   'active': ['tabnum', 'filename', 'modified'],
  \   'inactive': ['tabnum', 'filename', 'modified'],
  \ },
  \ 'component': {
  \   'mode': '%{lightline#mode()}',
  \   'absolutepath': '%F',
  \   'relativepath': '%f',
  \   'filename': '%t',
  \   'modified': '%M',
  \   'bufnum': '%n',
  \   'paste': '%{&paste?"PASTE":""}',
  \   'readonly': '%R',
  \   'charvalue': '%b',
  \   'charvaluehex': '%B',
  \   'fileencoding': '%{&fenc!="" && &fenc!="utf-8"?&fenc:""}',
  \   'fileformat': '%{&ff}',
  \   'filetype': '%{&ft!=#""?&ft:"no ft"}',
  \   'percent': '%3p%%',
  \   'percentwin': '%P',
  \   'spell': '%{&spell?&spelllang:""}',
  \   'lineinfo': '%3l:%-2v',
  \   'line': '%l',
  \   'column': '%c',
  \   'close': '%999X X ',
  \   'winnr': '%{winnr()}',
  \ },
  \ 'component_visible_condition': {
  \   'modified': '&modified||!&modifiable',
  \   'readonly': '&readonly',
  \   'paste': '&paste',
  \   'spell': '&spell',
  \   'fileencoding': '&fenc != "" && &fenc != "utf-8"',
  \ },
  \ 'mode_map': {
  \   'n' : 'N',
  \   'i' : 'I',
  \   'R' : 'R',
  \   'v' : 'V',
  \   'V' : 'V',
  \   "\<C-v>": 'V',
  \   'c' : 'C',
  \   's' : 'S',
  \   'S' : 'S',
  \   "\<C-s>": 'S',
  \   't': 'T',
  \ },
  \ 'separator': {'left': "\uE0B0", 'right': ''},
  \ 'subseparator': {'left': '|', 'right': '|'},
  \ }

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'falcon'
let g:airline_mode_map = {
  \ '__': '-',
  \ 'n': 'N',
  \ 'c': 'C',
  \ 't': 'T',
  \ 'i': 'I', 'ic': 'I', 'ix': 'I',
  \ 'R': 'R', 'Rv': 'R',
  \ 'v': 'V', 'V' : 'V', '': 'V',
  \ 's': 'S', 'S' : 'S', '': 'S',
  \ }
set noshowmode

" NERDTree
let NERDTreeIgnore = ['\.pyc$', '\~$', '\.a$', 'test-results', '\.egg-info$', '__pycache__']
let NERDTreeNaturalSort = 1
let NERDTreeMinimalUI = 1

set number
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set cindent
set cursorline
set inccommand=nosplit

set mouse=a

" See :help ft-vim-indent
let g:vim_indent_cont = 2

let mapleader = ","

let g:easyescape_string = "jk"
let g:easyescape_timeout = 100
cnoremap jk <esc>

" EasyMotion
let g:EasyMotion_do_mapping = 0
nmap t <Plug>(easymotion-s)

" ncm2
let g:ncm2_jedi#python_version = 3
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
" let g:ale_sign_error = ' •'
" highlight ALEErrorSign ctermbg=bg ctermfg=darkred
" highlight AleWarningSign ctermbg=bg ctermfg=red
" highlight SignColumn ctermbg=bg

" DevIcons
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" vim-json
let g:vim_json_syntax_conceal = 0

" LanguageClient
" set hidden
" let g:LanguageClient_serverCommands = {
"     \ 'python': ['/usr/local/bin/pyls'],
"     \ }
" let g:LanguageClient_diagnosticsDisplay = {
"     \ 1: { "name": "Error", "texthl": "ALEError", "signText": "✖", "signTexthl": "ALEErrorSign" },
"     \ 2: { "name": "Warning", "texthl": "ALEWarning", "signText": "⚠", "signTexthl": "ALEWarningSign" },
"     \ 3: { "name": "Information", "texthl": "ALEInfo", "signText": "ℹ", "signTexthl": "ALEInfoSign", },
"     \ 4: { "name": "Hint", "texthl": "ALEInfo", "signText": "➤", "signTexthl": "ALEInfoSign", },
"     \ }

" VimWiki
let g:vimwiki_list = [{"path": "~/.vimwiki/"}]
