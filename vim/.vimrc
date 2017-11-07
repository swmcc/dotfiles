set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree.git'
Plugin 'Buffergator'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'elixir-editors/vim-elixir'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'

filetype plugin indent on

set splitbelow
set splitright
set noswapfile
set columns=80
set ruler

augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

map <C-n> :NERDTreeToggle<CR>

syntax on
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

imap <S-CR>    <CR><CR>end<Esc>-cc
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

:set number relativenumber

autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ts=2 sw=2 sts=2 et
autocmd FileType python set sw=4 sts=4 et

set wildignore+=*/tmp/*,*_site/*,*build/*,*venv*,*bin/*,*db/*,*.pyc,*node_module*,*dist/*
let g:ctrlp_custom_ignore = '\v[\/]\.(hg|svn|so|swp|zip|pyc)$'

nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>

map ,gawp :!git add . && git commit -m 'WIP' && git push origin master<cr>
map ,gaw :!git add . && git commit -m 'WIP'<cr>
map ,gw :!git commit -am 'WIP'<cr>
nmap <silent> ./ :nohlsearch<CR>
nmap <silent> <c-l> :wincmd l<CR>

set listchars=tab:▸\ ,eol:¬
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

nmap <leader>l :set list!<CR>

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

set guifont=Space_Mono:11
set encoding=utf8
let g:airline_powerline_fonts = 1

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
