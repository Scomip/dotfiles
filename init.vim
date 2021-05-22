call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'lambdalisue/fern.vim'
Plug 'itchyny/lightline.vim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'scomip/vim-easyescape-plus'
Plug 'easymotion/vim-easymotion'
Plug 'ryanoasis/vim-devicons'
Plug 'elzr/vim-json'
Plug 'vimwiki/vimwiki'
"Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'editorconfig/editorconfig-vim'
Plug 'AndrewRadev/splitjoin.vim'

Plug 'neovim/nvim-lspconfig'

"Plug 'roxma/nvim-yarp'
"Plug 'ncm2/ncm2'
"Plug 'ncm2/ncm2-jedi'
"Plug 'ncm2/ncm2-racer'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'vim-python/python-syntax'
Plug 'Vimjas/vim-python-pep8-indent'

Plug 'fenetikm/falcon'
call plug#end()

set rtp+=~/.config/nvim/yamake
augroup filetypedetect
    au! BufRead,BufNewFile ya.make setfiletype yamake
augroup END
autocmd FileType yamake setlocal nocindent

" let g:python_host_prog = '/usr/bin/python2.7'
" let g:python3_host_prog = '/usr/bin/python3'
let g:python_highlight_all = 1

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
vnoremap . :normal .<CR>


function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
endfunction

" Lightline
let g:falcon_lightline = 1
let g:lightline = {
  \ 'colorscheme': 'falcon',
  \ 'active': {
  \   'left': [['mode', 'paste'], ['readonly', 'filename', 'modified']],
  \   'right': [['lineinfo', 'cocstatus'], ['fileformat', 'fileencoding', 'filetype']],
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
  \   'lineinfo': '%2l:%-2v',
  \   'line': '%l',
  \   'column': '%c',
  \   'close': '%999X X ',
  \   'winnr': '%{winnr()}',
  \ },
  \ 'component_function': {
  \   'cocstatus': 'coc#status',
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

" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

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
" let g:ncm2_jedi#python_version = 3
" autocmd BufEnter * call ncm2#enable_for_buffer()
" set completeopt=noinsert,menuone,noselect

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
" let g:ale_echo_delay = 100
" let g:ale_cache_executable_check_failures = 1
" let g:ale_echo_msg_format = '[%linter%] %code: %%s'
" let g:ale_linters = { 'python': ['flake8'], 'cpp': ['gcc'] }
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

" CoC
set hidden
set updatetime=300
set shortmess+=c
set signcolumn=yes


 " Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
noremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

autocmd FileType python let b:coc_root_patterns = ['.git', '.env']

xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)
