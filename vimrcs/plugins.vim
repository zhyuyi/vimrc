""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Auto Install Plugin Manager
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Install vim-plug if it's not already installed.
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.github.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install Vudnle if it's not already installed.
if empty(glob('~/.vim/bundle/Vundle.vim'))
	silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	autocmd VimEnter * PluginInstall --sync | source $MYVIMRC
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugin Manager: vim-plug
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" grep tools
" Plug 'vim-scripts/grep.vim'

" hex mode for binary file
Plug 'fidian/hexmode'

" ARM assembly language 
Plug 'ARM9/arm-syntax-vim'

" automatically generate tags in specified location
" e.g. .cache directory.
Plug 'ludovicchabant/vim-gutentags'

" Markdown writting prlugin
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'jcf/vim-latex'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" () [] {} match
Plug 'Raimondi/delimitMate'

" highlight errors and warnings.
Plug 'w0rp/ale'

" for tmux
Plug 'edkolev/tmuxline.vim'

" status-line format and color scheme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" A simple plugin show the last file user has open
Plug 'mhinz/vim-startify' 

" High light the word at all place.
Plug 'lfv89/vim-interestingwords'

" A Git wrapper
Plug 'tpope/vim-fugitive'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'

Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

Plug 'nathanaelkane/vim-indent-guides'

" Using a non-default branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" To find file, press <C-p> please.
Plug 'kien/ctrlp.vim'

" fzf is a general-purpose command-line fuzzy finder.
Plug 'junegunn/fzf', {'do': './install --all' }

" taglist
Plug 'vim-scripts/taglist.vim'

" Tag bar
Plug 'majutsushi/tagbar'

" cscope
Plug 'vim-scripts/cscope.vim'

" Initialize plugin system
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugin Manager: Vundle
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype off  " be iMproved, required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" complete inputs
Plugin 'ycm-core/YouCompleteMe'

" Markdown preview.
Plugin 'JamshedVesuna/vim-markdown-preview'

call vundle#end()

filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugin Configuration
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"- vim-airline ---------------------------------------------

let g:airline_theme='bubblegum'
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1

let g:airline#extensions#tmuxline#enabled = 1

"- YouCompleteMe -------------------------------------------

" open syntax complete
let g:ycm_seed_identifiers_with_syntax=1

set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0

let g:ycm_min_num_identifier_candidate_chars = 2 " the min num chars for trigger completement.
let g:ycm_complete_in_comments = 1  " complete in comments
let g:ycm_complete_in_strings = 1   " complete in strings

" diagnostics information display
let g:ycm_show_diagnostics_ui = 0
" let g:ycm_enable_diagnostic_highlighting = 1

let g:ycm_error_symbol = '>'
let g:ycm_warning_symbol = '-'

let g:ycm_server_python_interpreter='/usr/bin/python'

" let g:ycm_confirm_extra_conf=0
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'

"- ale -----------------------------------------------------

let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'

let g:ale_lint_on_text_changed = 0 " don't hint when change file
let g:ale_lint_on_save = 1 " hint when save file

"- taglist -------------------------------------------------

nnoremap <silent> <leader>t <Esc>:TlistToggle<Cr>
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_One_File = 1
let Tlist_Auto_Open=0
let Tlist_Use_Right_Window = 0


"- nerdtree ------------------------------------------------

nnoremap <silent> <leader>n :NERDTreeToggle<CR>

"- vim-interestingwords ------------------------------------

let g:interestingWordsGUIColors = ['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF']
let g:interestingWordsTermColors = ['154', '121', '211', '137', '214', '222']
let g:interestingWordsRandomiseColors = 1

"- delimitmate ---------------------------------------------

let g:delimitMate_expand_cr = 1

"- markdown preview ----------------------------------------

let vim_markdown_preview_github=1

"- vim-latex -----------------------------------------------

filetype indent on
let g:tex_flavor='latex'
set iskeyword+=:
let g:Tex_CompileRule_pdf='xelatex -interaction=nonstopmode $*'
let g:Tex_DefaultTargetFormat="pdf"
let g:Tex_ViewRule_pdf = 'okular --unique'
let g:livepreview_previewer = 'okular --unique'
autocmd Filetype tex setl updatetime=1

nnoremap <silent> <leader>p <Esc>:LLPStartPreview<CR>

"- ctrlp ---------------------------------------------------

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"- ctags ---------------------------------------------------

let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']


"- gutentags -----------------------------------------------

" stop when meeting such directory.
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

" generate file name.
let g:gutentags_ctags_tagfile = '.tags'

" move generated tags to ~/.cache/tags directory to avoid pollute project directory.
let s:vim_tags = expand('~/.cache/tags')

let g:gutentags_cache_dir = s:vim_tags

" detect wheter ~/.cache/tags exits.
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

"- hexmode -------------------------------------------------

let g:hexmode_patterns = '*.bin,*.exe,*.dat,*.o,*.out,*.img,*iso'

"- arm-syntax-vim ------------------------------------------

au BufNewFile,BufRead *.s,*.S set filetype=arm " arm = armv6/7

"- new plugin ----------------------------------------------

