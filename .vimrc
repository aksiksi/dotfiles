" Instructions:
"
"   1. :PlugInstall to install plugins
"   2. Get patched Fira Mono for vim-airline:
"      https://github.com/powerline/fonts/tree/master/FiraMono
"   3. macOS -> Font Book, Linux -> ~/.local/share/fonts

" Install vim-plug if not available
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plug for plugin management
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'godlygeek/tabular'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'jeffkreeftmeijer/vim-numbertoggle' " Toggles relative numbering in insert mode
Plug 'tpope/vim-fugitive'
Plug 'ntpeters/vim-better-whitespace' " Highlight trailing spaces
Plug 'vim-airline/vim-airline' " Airline status bar
Plug 'vim-airline/vim-airline-themes' " Collection of Airline themes
Plug 'tpope/vim-commentary' " Commenting (binding: gcc)
Plug 'tpope/vim-surround' " Surround (binding: gs)
Plug 'airblade/vim-gitgutter' " Git diff in gutter
Plug 'rust-lang/rust.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Vim color schemes
Plug 'morhetz/gruvbox'

call plug#end()

" Vim options
set tabstop=4 shiftwidth=4 expandtab " Tab = 4 spaces
" set number relativenumber " Display line numbers
set number " Display line numbers
syntax enable " Enable syntax highlighting
set backspace=indent,eol,start " Make backspace behave like normal
set incsearch
set hlsearch
set colorcolumn=80 " Marker at 80 cols
set encoding=utf-8
set autoread
set wildmenu
set wildmode=longest:full,full
set wildignore+=*/.git/*,*/.hg/*,*/.svn/* " Ignore VCS directories
set showcmd

" Color scheme
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
set background=dark

" GVim options
set guioptions-=m " Hide menubar
set guioptions-=T " Hide toolbar
set guioptions-=L " Hide left scrollbar
set guioptions-=r " Hide right scrollbar

"" Platform-dependent GUI options
if has("gui_running")
  if has("gui_gtk2") || has("gui_gtk3")
    " Linux GUI
    set guifont=Fira\ Mono\ for\ Powerline\ 12,DejaVu\ Sans\ Mono\ 11
  elseif has("gui_macvim")
    " MacVim
    set guifont=Fira\ Mono\ for\ Powerline\ 12,Menlo\ Regular:h12
  elseif has("gui_win32")
    " Win32/64 GVim
  endif
else
  " Autoload buffer on focus
  au FocusGained,BufEnter * :silent! !

  " Autosave buffer on focus lost
  au FocusLost,WinLeave * :silent! wa
endif

" Language indent options
autocmd FileType javascript,html,css,yaml setlocal ts=2 sts=2 sw=2 expandtab

" Jenkinsfile detection
autocmd BufRead,BufNewFile Jenkinsfile set syntax=groovy

" Remaps
" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Map Enter to clear highlight in normal mode
nnoremap <CR> :noh<CR><CR>

" Cscope setup
if has('cscope')
  set csverb

  " Cscope mappings
  nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
  nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
  nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
  nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
  nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
  nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
  nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
  nmap <C-_>a :cs find a <C-R>=expand("<cword>")<CR><CR>
endif

" Tmux cursor switching (normal vs. insert mode)
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Airline config
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'

" Custom shortcuts
map <C-n> :NERDTreeToggle<CR>

" Tagbar key
nmap <F7> :TagbarToggle<CR>

" Run rustfmt on save
let g:rustfmt_autosave = 1
