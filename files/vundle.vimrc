set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    " Examples
    " Plugin 'tpope/vim-fugitive'
    " Plugin 'L9'
    " Plugin 'git://git.wincent.com/command-t.git'
    " Plugin 'file:///home/gmarik/path/to/plugin'
    " Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
    " Plugin 'ascenator/L9', {'name': 'newL9'}
    " Plugin 'octol/vim-cpp-enhanced-highlight'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'tfnico/vim-gradle'
    " Plugin 'Valloric/YouCompleteMe' " might not work in OSX
    Plugin 'powerline/fonts'
    Plugin 'elzr/vim-json'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" NERDCommenter
let g:NERDSpaceDelims = 1
map <Leader>c <Plug>NERDCommenterToggle

" airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_theme = 'luna'
let g:airline_exclude_preview = 1
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
set laststatus=2
let g:airline_exclude_preview = 1 " Let airline focus right after preview is closed

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1


" To ignore plugin indent changes, instead use:
"filetype plugin on
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
