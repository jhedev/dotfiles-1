" ===================================================
"
" THE BASICS
" Much of this section has been borrowed from YADR:
" https://github.com/skwp/dotfiles
"
"====================================================

set nocompatible                "Use Vim settings instead of vi settings
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
let mapleader=","               "Use , as leader

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" =============== Vundle Initialization ===============
" This loads all the plugins specified in ~/.vim/vundles.vim
" Use Vundle plugin to manage all other plugins
if filereadable(expand("~/.vim/vundles.vim"))
  source ~/.vim/vundles.vim
endif

" ================ Turn Off Swap Files ============== 
set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" ================ Folds ============================
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Load custom plugin settings
so ~/.vim/settings.vim


" ===================================================
"
" TCP CUSTOMS
" This section consists of customisations written
" by my very own self WOW
"
"====================================================

" ================ Appearance ========================
if has('gui_running')                    " ---------------------------------
  set guifont=Nitti\ Light:h19           " I <3 Nitti; you can use InconsolataTCP (included in this repo)
endif                                    " ---------------------------------
set wrap                                 " ---------------------------------
set nolist                               " Word wrap without linebreaks
set linebreak                            " ---------------------------------
set noshowmode                           " Don’t show mode - we use Lightline for that
set guioptions=gm                        " Disable graphical tabs
syntax enable                            " Syntax highlighting
set hlsearch                             " Highlight search matches
set background=dark                      " ---------------------------------
colorscheme solarized                    " Solarized colourscheme config
if has("gui_running")                    " Gui only options:
  let g:solarized_contrast="normal"      " Default value is normal
  let g:solarized_bold=1                 " Use bold
  let g:solarized_menu=0                 " Disable Solarized menu
endif                                    " ---------------------------------

" Toggle background light/dark with CTRL-B
nnoremap <C-b> :let &background = ( &background == "dark" ? "light" : "dark" )<CR>

" A brighter visual selection
hi Visual guifg=#D33682 guibg=#cccccc ctermfg=33 ctermbg=230

" Change Lightline theme based on background setting
augroup LightLineColorscheme
  autocmd!
  autocmd ColorScheme * call s:lightline_update()
augroup END
function! s:lightline_update()
  if !exists('g:loaded_lightline')
    return
  endif
  try
    if g:colors_name =~# 'wombat\|solarized\|landscape\|jellybeans\|Tomorrow'
      let g:lightline.colorscheme =
            \ substitute(substitute(g:colors_name, '-', '_', 'g'), '256.*', '', '') .
            \ (g:colors_name ==# 'solarized' ? '_' . &background : '')
      call lightline#init()
      call lightline#colorscheme()
      call lightline#update()
    endif
  catch
  endtry
endfunction

" =============== Movement ===============
nmap <CR> o<Esc>                         " CR in normal mode for newline without insert
nmap <S-Enter> O<Esc>                    " Shift-CR for above, but before current line
nnoremap <C-t> :tabnew<CR>               " ---------------------------------
nnoremap <C-w> :tabclose<CR>             " Tab new/close/prev/next
nnoremap <C-h> gT                        " using CTRL-t/w/h/l
nnoremap <C-l> gt                        " ----------------------------------

" =============== Behaviour ==============
set timeoutlen=1000 ttimeoutlen=0        " Reduce delay of ESC switching out of Insert mode (terminal Vim)
