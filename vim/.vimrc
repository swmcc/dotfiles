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
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'jakedouglas/exuberant-ctags'
Plugin 'elixir-lang/vim-elixir'
Plugin 'avdgaag/vim-phoenix'
Plugin 'mmorearty/elixir-ctags'
Plugin 'mattreduce/vim-mix'
Plugin 'BjRo/vim-extest'
Plugin 'frost/vim-eh-docs'
Plugin 'slashmili/alchemist.vim'
Plugin 'tpope/vim-endwise'
Plugin 'jadercorrea/elixir_generator.vim'
Plugin 'AnsiEsc.vim'
Plugin 'sjl/badwolf'
Plugin 'tomasr/molokai'
Plugin 'morhetz/gruvbox'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plugin 'junegunn/limelight.vim'
Plugin 'mkarmona/colorsbox'
Plugin 'romainl/Apprentice'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'chriskempson/base16-vim'
Plugin 'w0ng/vim-hybrid'
Plugin 'AlessandroYorba/Sierra'
Plugin 'daylerees/colour-schemes'
Plugin 'effkay/argonaut.vim'
Plugin 'ajh17/Spacegray.vim'
Plugin 'atelierbram/Base2Tone-vim'
Plugin 'colepeters/spacemacs-theme.vim'
Plugin 'majutsushi/tagbar'

let g:elite_mode=1

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

set wildignore+=*/tmp/*,*_site/*,*build/*,*venv*,*bin/*,*db/*,*.pyc,*node_module*,*dist/,*lib/*
let g:ctrlp_custom_ignore = '\v[\/]\.(hg|svn|so|swp|zip|pyc)$'

nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>

map ,gawp :!git add . && git commit -m 'WIP' && git push origin master<cr>
map ,gaw :!git add . && git commit -m 'WIP'<cr>
map ,gw :!git commit -am 'WIP'<cr>
map ,j :%!jq '.'<cr>
nmap <silent> ./ :nohlsearch<CR>
nmap <silent> <c-l> :wincmd l<CR>

set listchars=tab:▸\ ,eol:¬
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

nmap <leader>l :set list!<CR>

" Theme and Styling
set t_Co=256
set background=dark
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme spacegray
let g:spacegray_underline_search = 1
let g:spacegray_italicize_comments = 1

if (has("termguicolors"))
  set termguicolors
endif

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

set guifont=Knack_Regular_Nerd_Font_Complete:14
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

" Elixir Tagbar Configuration
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ]
    \ }

    
autocmd FileType elixir nnoremap <buffer> <leader>h :call alchemist#exdoc()<CR>
autocmd FileType elixir nnoremap <buffer> <leader>d :call alchemist#exdef()<CR>

