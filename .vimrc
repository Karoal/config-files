" poor man's package manager
execute pathogen#infect()

" basic options
set expandtab
set tabstop=4
set softtabstop=4   " when backspacing delete 4 spaces
set shiftwidth=4    " when using >>
set smartindent     " keeps current indents
set number          " line numbers
set cursorline      " highlights current line
set wildmenu        " visual autocomplete for commands
" set rnu             " relative line numbers
" map jk to escape in ins mode
inoremap jk <esc>

" split options
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" search + syntax options
set incsearch       " search as characters are entered
set hlsearch        " highlight matches

filetype indent on  " load filetype-specific indent files
syntax on           " syntax highlighting

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" colorscheme torte
" colorscheme zenburn
" colorscheme freya
" colorscheme herald2
" colorscheme mustang
" colorscheme impact
" colorscheme asuldark
" colorscheme print_bw
" colorscheme jellybeans
" colorscheme maroloccio
" colorscheme wombat256
" colorscheme elflord
colorscheme solarized
