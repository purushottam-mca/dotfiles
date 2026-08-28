syntax on                   " Enable syntax highlighting
set number                  " Show line numbers

set tabstop=4               " A tab is 4 spaces
"set softtabstop=4          " Editing a tab uses 4 spaces
set shiftwidth=4            " Indent by 4 spaces
set expandtab               " Use spaces instead of tabs
set autoindent              " Auto-indent new lines
set smartindent             " Smarter auto-indenting

"set cursorline             " Highlight current line
set showmatch               " Highlight matching brackets
set scrolloff=5             " Keep 5 lines above/below cursor

set mouse=a                 " Enable mouse support
set wildmenu                " Better command-line completion
set clipboard=unnamedplus   " Use system clipboard

set showcmd                 " Show partial commands
set ruler                   " Show cursor position
set ignorecase              " Case-insensitive search...
set incsearch               " Show matches as you type
set hlsearch                " Highlight all matches

set noswapfile              " Don't use swap files

" Turn Off Annoying Beep Sound
set visualbell
set t_vb= 

" Custom Key Mappings"
"inoremap jk <Esc>           " Exit insert mode with 'jk'
"nnoremap <Tab> gt           " Switch to next tab
"nnoremap <S-Tab> gT         " Switch to previous tab
"nnoremap <C-q> :q<CR>       " Quit with Ctrl+q