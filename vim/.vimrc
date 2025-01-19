syntax on
set nolist
set number
set laststatus=2
set mouse=a
set nowrap
call plug#begin('~/.vim/plugged')
         
	"Plug 'vim-airline/vim-airline'
	"Plug 'ryanoasis/vim-devicons'
	"Plug 'vim-airline/vim-airline-themes'       
	Plug 'wakatime/vim-wakatime'
	"Plug 'morhetz/gruvbox'
	"Plug 'wfxr/minimap.vim'
  Plug 'nordtheme/vim'

call plug#end()

set background=dark
colorscheme nord

"hi MinimapCurrentLine ctermfg=Green guifg=#50FA7B guibg=#32302f
"let g:minimap_width = 8
"let g:minimap_auto_start = 1
"let g:minimap_auto_start_win_enter = 1
"let g:minimap_cursor_color = 'MinimapCurrentLine'

"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif
"let g:airline_theme='base16_nord'
"" powerline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ' ☰ '
"let g:airline_symbols.maxlinenr = '  '
"let g:airline_symbols.dirty='⚡'
