" Pathogen configuration
execute pathogen#infect()
scriptencoding utf-8
set encoding=utf-8
set list
"set listchars=eol:~,tab:>-,trail:~,extends:>,precedes:<
"set listchars=tab:>-,trail:>-
set listchars=tab:>-,trail:~,precedes:<,extends:>,eol:$
let g:customasciiart = [
    \ " __       __            __       ",
    \ "|  \\     /  \\          |  \\      ",
    \ "| $$\\   /  $$  ______  | $$____  ",
    \ "| $$$\\ /  $$$ /      \\ | $$    \\ ",
    \ "| $$$$\\  $$$$|  $$$$$$\\| $$$$$$$\\",
    \ "| $$\\$$ $$ $$| $$    $$| $$  | $$",
    \ "| $$ \\$$$| $$| $$$$$$$$| $$  | $$",
    \ "| $$  \\$ | $$ \\$$     \\| $$  | $$",
    \ " \\$$      \\$$  \\$$$$$$$ \\$$   \\$$",
    \ "                                 ",
    \ "                                 "
\]
syntax on
set t_Co=16
let g:solarized_termcolors=16
set background=dark
colorscheme solarized
filetype plugin indent on

" Enable line numbers
set number

" Use relative line numbers
" set relativenumber

" Highlight the current line
set cursorline

" Auto-indentation settings
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

" Show matching parentheses
set showmatch

" Enable incremental search
set incsearch

" Case-insensitive search unless uppercase is used
set ignorecase
set smartcase

" Enable clipboard support
set clipboard=unnamedplus

" Improve the appearance of the command line
set cmdheight=2

" Status line settings
set laststatus=2
set statusline=%F%m%r%h%w\ [%{&ff}]\ %y\[%p%%]\ %l,%c%V\ %L

" Configure backups and undos
set backup
set backupdir=~/.vim/backup//
set writebackup
set undofile
set undodir=~/.vim/undo//

" Example keybindings
" Search files (requires fzf plugin)
nnoremap <leader>ff :Files<CR>
" Switch buffers (requires fzf plugin)
nnoremap <leader>bb :Buffers<CR>

" Plugin management with Pathogen
" Make sure you have installed Pathogen and plugins in the ~/.vim/bundle directory

" Pathogen requires that plugins are installed in ~/.vim/bundle
" Here are some example plugins you can manually install:
" git clone https://github.com/tpope/vim-sensible.git ~/.vim/bundle/vim-sensible
" git clone https://github.com/junegunn/fzf.vim.git ~/.vim/bundle/fzf.vim
" git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree
" NERDTree settings
autocmd vimenter * NERDTree | wincmd p " Open NERDTree automatically when Vim starts
nnoremap <leader>n :NERDTreeToggle<CR>  " Map <leader>n to toggle NERDTree
let NERDTreeShowHidden=1                 " Show hidden files in NERDTree
let NERDTreeMinimalUI=1                  " Use a minimal UI for NERDTree
let NERDTreeDirArrows=1                  " Show directory arrows in NERDTree

" Function to insert a custom header from a template with precise alignment
function! InsertCustomHeader()
    let l:filename = expand('%:t')
    let l:username = $USER
    let l:email = "your_email@example.com"
    let l:date = strftime("%Y/%m/%d %H:%M:%S")

    " Read the template file
    let l:template = readfile(expand("~/.vim/templates/c_header.tpl"))

    " Replace placeholders with actual values
    call map(l:template, 'substitute(v:val, "<filename>", l:filename, "g")')
    call map(l:template, 'substitute(v:val, "<username>", l:username, "g")')
    call map(l:template, 'substitute(v:val, "<email>", l:email, "g")')
    call map(l:template, 'substitute(v:val, "<date>", l:date, "g")')

    " Insert the processed template at the top of the buffer
    call append(0, l:template)
endfunction

" Command to manually insert the header
command! InsertHeader call InsertCustomHeader()

" Automatically insert the header on new C files
autocmd BufNewFile *.c call InsertCustomHeader()
