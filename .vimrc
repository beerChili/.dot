syntax on

" Navigation & usability improvements
set number relativenumber

set scrolloff=10 " Keeps cursor at least 10 lines from edge of screen
set nowrap       " Disable line wrapping
set showmatch    " Highlight matching parentheses

" Enable auto-indentation and set tab behavior to spaces
set autoindent    " Automatically indent new lines
set expandtab     " Use spaces instead of tabs
set shiftwidth=4  " Set indentation width for > and < commands
set tabstop=4     " Set the number of spaces a tab represents
set softtabstop=4 " Set number of spaces inserted when pressing <Tab> in insert mode

filetype plugin indent on " Enable filetype plugins and indentation

" Search settings for better usability
set ignorecase smartcase " Ignore case when searching, unless starts with uppercase
set hlsearch incsearch  " Highlight search results and show matches as you type

" --- Miscellaneous Settings ---
set clipboard=unnamed   " Enable system clipboard access
set nobackup noswapfile " Disable backup and swap files for cleaner file management
