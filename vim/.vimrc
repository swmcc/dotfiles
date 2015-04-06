set nocompatible
filetype indent plugin on
syntax on
set splitbelow
set splitright
set noswapfile
set hidden

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" everything else at 2 but python at 4
set smartindent
autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
autocmd FileType python set sw=4 sts=4 et

"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>


function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 4 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction

:inoremap <Up> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/local/bin/dict"

execute pathogen#infect()

set relativenumber

highlight ColourColumn ctermbg=red
call matchadd('ColourColumn', '\%81v', 100)

" Getting used to tabs in vim
map <C-S-[> gt
map <C-S-]> gT
map <C-1> 1gt
map <C-2> 2gt
map <C-3> 3gt
map <C-4> 4gt

" ctrl-p
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,,*_site/*,*build/*,*venv*,*bin/*,*db/*,*.pyc,*node_module*,*dist/* 
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|so|swp|zip|pyc)$'

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>   
nmap <silent> <c-j> :wincmd j<CR>  
nmap <silent> <c-h> :wincmd h<CR> 
nmap <silent> <c-l> :wincmd l<CR>


" Shortcut for indentation while inside visual mode
vnoremap < <gv
vnoremap > >gv 

" Handy utility shortcuts - chances are I will be mapping
" ,t to be whatever app I am testing at the time. However
" this will cover most of my use cases, I think
map ,e :tabnew ~/Dropbox/notes.txt<CR>

autocmd BufWritePre *.py :%s/\s\+$//e
inoremap jk <Esc> 

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

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

nnoremap ,<space> :nohlsearch<CR>

abbr #----------------------------------------------------------------------
abbr s@ stephen.mccullough@gmail.com
