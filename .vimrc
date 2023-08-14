set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Fold code 
Plugin 'tmhedberg/SimpylFold'

" Auto complete
Bundle 'Valloric/YouCompleteMe'

" Theme
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

" Autoformat
Plugin 'tell-k/vim-autopep8'

" File explorer
Plugin 'scrooloose/nerdtree'

" Syntax checking/highlighting
Plugin 'vim-syntastic/syntastic'

" Auto indentation
Plugin 'vim-scripts/indentpython.vim'

" Power bar
Plugin 'https://github.com/bling/vim-airline'

" Distinct parentheses
Plugin 'kien/rainbow_parentheses.vim'

" latex
Plugin 'lervag/vim-latex'
Plugin 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}

" RERL window
Plugin 'sillybun/vim-repl'
			
" Supertab
Plugin 'ervandew/supertab'

" Black autoformatter
Plugin 'ambv/black'

" Show code structure
Plugin 'majutsushi/tagbar'

" Github copilot
Plugin 'github/copilot.vim'

" Debug
Plugin 'puremourning/vimspector'

call vundle#end()


set nonumber
filetype plugin indent on
set ic
set hlsearch
set fileencodings=utf-8,ucs-bom,GB2312,big5
set cursorline
set autoindent
set smartindent
set scrolloff=4
set showmatch
set encoding=utf-8
set nu
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap < <><ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i

" move around split window
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" fold code with <space>
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" PEP8 indentation for python	
au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" Full stack development indentation
au BufNewFile, BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

let g:mapleader=' '

let python_highlight_all=1
syntax on

" Autorun
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'cpp'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'java'
                exec "!javac %"
                exec "!time java %<"
        elseif &filetype == 'sh'
                :!time bash %
        elseif &filetype == 'python'
                exec "!clear"
                exec "!time python3 %"
        elseif &filetype == 'html'
                exec "!firefox % &"
        elseif &filetype == 'go'
                " exec "!go build %<"
                exec "!time go run %"
        elseif &filetype == 'mkd'
                exec "!~/.vim/markdown.pl % > %.html &"
                exec "!firefox %.html &"
        endif
endfunc

map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

let g:SimpylFold_docstring_preview=1

let g:rbpt_colorpairs = [
                        \ ['brown',       'RoyalBlue3'],
                        \ ['Darkblue',    'SeaGreen3'],
                        \ ['darkgray',    'DarkOrchid3'],
                        \ ['darkgreen',   'firebrick3'],
                        \ ['darkcyan',    'RoyalBlue3'],
                        \ ['darkred',     'SeaGreen3'],
                        \ ['darkmagenta', 'DarkOrchid3'],
                        \ ['brown',       'firebrick3'],
                        \ ['gray',        'RoyalBlue3'],
                        \ ['darkmagenta', 'DarkOrchid3'],
                        \ ['Darkblue',    'firebrick3'],
                        \ ['darkgreen',   'RoyalBlue3'],
                        \ ['darkcyan',    'SeaGreen3'],
                        \ ['darkred',     'DarkOrchid3'],
                        \ ['red',         'firebrick3'],
                        \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

nnoremap <leader>r :REPLToggle


let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quiczaix_mode=0
set conceallevel=1
let g:tex_conceal="abdmg"
let g:Tex_CompileRule_pdf='xelatex -synctex=1 --interaction=nonstopmode $*'
let g:vimtex_compiler_latexmk_engines={'_':'-xelatex'}
let g:vimtex_compiler_latexrun_engines={'_':'xelatex'}

" Set theme
if has('gui_running')
	set background=dark
	colorscheme solarized
else
	colorscheme zenburn
endif
hi Normal guibg=NONE ctermbg=NONE

call togglebg#map("<F7>")
xnoremap <leader>p :w !python<cr>

" Map F8 to opening tag bar
nmap <F8> :TagbarToggle<CR>
