syntax on
set nolist
set number
set laststatus=2
set mouse=a

call plug#begin('~/.vim/plugged')
         
	Plug 'vim-airline/vim-airline'
	Plug 'ryanoasis/vim-devicons'
	Plug 'vim-airline/vim-airline-themes'       
	Plug 'wakatime/vim-wakatime'
	Plug 'morhetz/gruvbox'
	Plug 'wfxr/minimap.vim'

call plug#end()

set background=dark
colorscheme gruvbox

let g:minimap_width = 8
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1

highlight minimapCursor ctermbg=59 ctermfg=228 guibg=#5F5F5F guifg=#FFFF87
highlight minimapRange ctermbg=242 ctermfg=228 guibg=#4F4F4F guifg=#FFFF87

let g:minimap_cursor_color = 'minimapCursor'
let g:minimap_range_color = 'minimapRange'

autocmd ColorScheme * highlight minimapCursor ctermbg=59 ctermfg=228 guibg=#5F5F5F guifg=#FFFF87 |
    \ highlight minimapRange ctermbg=242 ctermfg=228 guibg=#4F4F4F guifg=#FFFF87


if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_theme='base16_gruvbox_dark_hard'
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' ☰ '
let g:airline_symbols.maxlinenr = '  '
let g:airline_symbols.dirty='⚡'
