" Author : X. Rave
" Date   : 03/10/2020
" Object : vim configuration file
" vim: expandtab

"----------------
" COMMON SETTINGS
"----------------
set nocompatible     " vim not compatible with old vi
set noshowmode       " don't show mode (INSERT, NORMAL, ...) on last line
set updatetime=500   " update time in ms
set modeline         " check for modelines at the beginning and end of files
set incsearch        " incremental search
set hlsearch         " highlight search
set tabstop=4        " one tab counts 4 spaces
set softtabstop=4    " number of spaces that a <Tab> counts for while performing editing operations
set shiftwidth=4     " number of spaces for autoindent
set autoindent       " auto indentation is on
set smartindent      " ask auto indentation to be smarter
set autowrite        " auto save files when changing buffer
set laststatus=2     " always show the status line
set backspace=2      " allow backspace over indent eol and start
set spelllang=fr     " spell lang is french
set spellsuggest=5   " number of suggestions for z=
set smarttab         " better use of tabulation
set wildmenu         " possible matches are shown just above the command line
set scrolloff=3      " number of screen lines to keep above and below the cursor
set formatoptions+=j " describes how automatic formatting is to be done
"set viminfo+=%       " save and restore the buffer list"
"set termguicolors    " uses highlight-guifg and highlight-guibg, using 24-bit color
"set t_Co=256         " number of colors for terminal
"set number           " show the line number
"set relativenumber   " show the line number relative to the line with the cursor
"set cmdheight=2      " number of screen lines to use for the command-line
"set cursorline       " highlight the screen line of the cursor with CursorLine
"set mouse=a          " enable the use of the mouse, use <shift> to ponctualy disable
"set ballooneval      " enable balloons for gvim, need mouse=a
"set balloonevalterm  " enable balloons for vim, need mouse=a


" Add subdirectories to path (use with :find)
" ^= prepend and += append, see also setlocal
" see https://gist.github.com/romainl/7e2b425a1706cd85f04a0bd8b3898805
set path=.,,**
set wildignore=*.o,*.pyc

" Jump to the last position when reopening a file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"---------------------------
" BACKGROUND COLORS SETTINGS
"---------------------------
if !has("gui_running")
    set background=dark
else
    set background=light
endif


"-----------------
" PRINTER SETTINGS
"-----------------
set printoptions=paper:A4,syntax:y,wrap:y,duplex:long


"---------------
" SPELL SETTINGS
"---------------
let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'


"----------------
" NETRW SETTINGS
"----------------
" Use :Vexplore or :Sexplore or :Explore to open netrw
let g:netrw_banner = 1
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 25
let g:netrw_altv = 1
let g:netrw_keepdir= 0
let g:netrw_hide= 0
let g:netrw_browsex_viewer= "xdg-open"


"------------------
" FILETYPE SETTINGS
"------------------
syntax on
"syntax enable
filetype plugin indent on " load indentation rules and plugins according to the detected filetype

" Makefile settings
"------------------
autocmd FileType make setlocal noexpandtab

" CMake settings
"---------------
autocmd FileType cmake setlocal expandtab

" Python settings
"----------------
autocmd FileType python setlocal textwidth=79 expandtab

" C,C++ settings
"---------------
autocmd FileType c,cpp setlocal expandtab

" Markdown settings
"------------------
autocmd FileType markdown setlocal expandtab ts=2 sw=2

" VRT settings
"-------------
autocmd! BufNewFile,BufFilePre,BufRead *.vrt setlocal filetype=xml


"-------------------
" TEMPLATES SETTINGS
"-------------------
autocmd BufNewFile * silent! 0r ~/.vim/mytemplates/skeleton.%:e


"--------------
" UNDO SETTINGS
"--------------
set undofile
set undodir=~/tmp


" ------------------
" LEADER KEY SETTING
" ------------------
let mapleader=","


"--------------
" TAGS SETTINGS
"--------------
" Add directories/files to search for tags files
"set tags+=
set tagstack " tags are pushed onto the stack

" key mapping for tags commands
" Go to tag
map  <F7>   <C-]>
map! <F7>   <Esc><C-]>
" Go to tag in new window
map  <C-F7> <C-w><C-]>
map! <C-F7> <Esc><C-w><C-]>
" Go back
map  <S-F7> <C-T>
map! <S-F7> <Esc><C-T>
" Show tag stack
map  <A-F7> :tags<CR>


"----------------
" CSCOPE SETTINGS
"----------------
" key mapping for cscope commands
"   Find symbol         :cs find 0 or s
"   Find definition     :cs find 1 or g
"   Find reference      :cs find 3 or c
"   Find text string    :cs find 4 or t
"   Find egrep pattern  :cs find 6 or e
"   Find path           :cs find 7 or f
"   Find include file   :cs find 8 or i
" Warning: gtags only support C,C++
":cs add .../GTAGS " load cscope database
":cs help
":cs show
set cscopeverbose
nmap <leader>gs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gd :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gr :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gt :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gg :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gp :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>gi :cs find i <C-R>=expand("<cfile>")<CR><CR>


"--------------------
" Completion settings
"--------------------
" Easier tag completion for french keyboard
inoremap <C-x><C-t> <C-x><C-]>


"-------------------
" Shortkeys settings
"-------------------
source $HOME/.vim/myshortkeys.vimrc


"---------------------------------------------------
" LOAD OPTIONAL PACKAGES
" - They are in ~/.vim/pack/mypackages/opt directory
" - Use :helptags ~/.vim/pack/mypackages/opt/<packname>/doc to update help
" - Use :100verbose :helptags ALL to update all
"---------------------------------------------------

" Vim colors
" ----------
" See https://medium.com/@dubistkomisch/how-to-actually-get-italics-and-true-colour-to-work-in-iterm-tmux-vim-9ebe55ebc2be
" git clone --depth=1 https://github.com/bignimbus/pop-punk.vim
" git clone --depth=1 https://github.com/embark-theme/vim embark
" git clone --depth=1 https://github.com/NLKNguyen/papercolor-theme
" git clone --depth=1 https://github.com/srcery-colors/srcery-vim
" git clone --depth=1 https://github.com/eskilop/NorthernLights.vim
" git clone --depth=1 https://github.com/jaredgorski/SpaceCamp
" git clone --depth=1 https://github.com/ParamagicDev/vim-medic_chalk
" git clone --depth=1 https://github.com/joshdick/onedark.vim
" git clone --depth 1 https://github.com/adrian5/oceanic-next-vim
"let g:terminal_ansi_colors = pop_punk#AnsiColors()
let g:embark_terminal_italics = 1
packadd embark
colorscheme embark


" Vim Airline
"------------
" git clone --depth=1 https://github.com/vim-airline/vim-airline
" git clone --depth=1 https://github.com/vim-airline/vim-airline-themes
let g:airline_powerline_fonts = 0
let g:airline_theme = 'embark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#gutentags#enabled = 1
packadd vim-airline
packadd vim-airline-themes
let g:airline_section_z = airline#section#create(['%3p%% %l:%v'])


" Vim Cheat40
"------------
" git clone --depth=1 https://github.com/lifepillar/vim-cheat40
" use <leader>? to open cheat
packadd vim-cheat40


" Vim Mundo
"----------
" Graph your Vim undo tree in style
" git clone --depth=1 https://github.com/simnalamburt/vim-mundo
" use :MundoToggle to open undo tree
packadd vim-mundo


" Vim Repeat
"-----------
" git clone --depth=1 https://github.com/tpope/vim-repeat
packadd vim-repeat


" Vim Matchup
"------------
" extends vim's % key
" git clone --depth=1 https://github.com/andymass/vim-matchup
packadd vim-matchup


" Vim Swap
"---------
" git clone --depth=1 https://github.com/machakann/vim-swap
" g< ou g> ou gs
" h/l to swap items, j/k to choose item, g/G to group/ungroup items, s/S to sort, r to reverse
packadd vim-swap
let g:swap#rules = deepcopy(g:swap#default_rules)
let g:swap#rules += [{
    \   "delimiter": [':'],
    \   "body": '\w\+\(:\w\+\)\+',
    \   }]


" Unicode Vim
"------------
" A Vim plugin for handling unicode and digraphs characters
" git clone --depth=1 https://github.com/chrisbra/unicode.vim
" see also https://x-team.com/blog/inserting-unicode-characters-in-vim/
" see also https://sanctum.geek.nz/arabesque/special-characters-in-vim/
" use :Unicode<tab>
let g:Unicode_no_default_mappings = v:true
packadd unicode.vim


" FZF Vim
"--------
" fzf is a general-purpose fuzzy finder, need fzf 0.22.0 or above
" git clone --depth=1 https://github.com/junegunn/fzf.vim
packadd fzf.vim


" Fern Vim
"---------
" git clone --depth=1 https://github.com/lambdalisue/fern.vim
" :Fern . -drawer and use h,j,k,l to navigate
let g:fern#mark_symbol                       = '●'
let g:fern#renderer#default#collapsed_symbol = '▷ '
let g:fern#renderer#default#expanded_symbol  = '▼ '
let g:fern#renderer#default#leading          = ' '
let g:fern#renderer#default#leaf_symbol      = ' '
let g:fern#renderer#default#root_symbol      = '~ '
let g:fern#disable_drawer_auto_quit = 1
let g:fern#disable_default_mappings = 0
packadd fern.vim


" NerdCommenter
"--------------
" git clone --depth=1 https://github.com/preservim/nerdcommenter
" use <leader>cc to comment, <leader>cu to uncomment
let g:NERDAltDelims_c = 1
packadd nerdcommenter


" Vim Easy Align
"---------------
" git clone --depth=1 https://github.com/junegunn/vim-easy-align
" exemples : vipga= or gaip= or :EasyAlign or gaip*|
packadd vim-easy-align
xmap <leader>a <Plug>(EasyAlign)
nmap <leader>a <Plug>(EasyAlign)


" Tagbar
"-------
" git clone --depth=1 https://github.com/majutsushi/tagbar
" need universal-ctags
let g:tagbar_left = 1
let g:tagbar_sort = 0
let g:tagbar_show_balloon = 0
let g:tagbar_singleclick = 1
let g:tagbar_foldlevel = 2
let g:tagbar_autoshowtag = 1
let g:tagbar_autopreview = 1
packadd tagbar
nnoremap <F2> :TagbarToggle<CR>
inoremap <F2> <ESC>:TagbarToggle<CR>


" Vista
"------
" View and search LSP symbols, tags in Vim
" git clone --depth=1 https://github.com/liuchengxu/vista.vim
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#icons = {"function":"●", "variable":"●", "command":"●"}
packadd vista.vim


" Vim Rooter
"-----------
" git clone --depth=1 https://github.com/airblade/vim-rooter
" see also option autochdir
let g:rooter_targets = '*.c,*.h'
let g:rooter_patterns = ['CMakeLists.txt', 'Makefile', '.git']
packadd vim-rooter


" Vim Gutentags
"--------------
" Gutentags (re)generate tag files as you work, need universal-ctags
" git clone --depth=1 https://github.com/ludovicchabant/vim-gutentags
" see https://www.reddit.com/r/vim/comments/d77t6j/guide_how_to_setup_ctags_with_gutentags_properly
" see https://github.com/skywind3000/gutentags_plus
packadd vim-gutentags
let g:gutentags_modules = ['ctags', 'gtags_cscope']
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['.gutentags', '.git']
let g:gutentags_auto_add_gtags_cscope = 1
let g:gutentags_ctags_extra_args = ['--tag-relative=yes', '--fields=+ailmnS']


" Vim CMake
"----------
" git clone --depth=1 https://github.com/cdelledonne/vim-cmake
"packadd vim-cmake


" Vim Signify
"------------
" Indicate added, modified and removed lines in a file that is managed by a version control system
" git clone --depth=1 https://github.com/mhinz/vim-signify
packadd vim-signify
highlight SignifySignAdd    ctermfg=green  guifg=#00ff00 cterm=NONE gui=NONE
highlight SignifySignDelete ctermfg=red    guifg=#ff0000 cterm=NONE gui=NONE
highlight SignifySignChange ctermfg=yellow guifg=#ffff00 cterm=NONE gui=NONE


" Vim Startify
"-------------
" Show recently used or bookmarked files and persistent sessions
" git clone --depth=1 https://github.com/mhinz/vim-startify
" use :SLoad / :SSave to load / save sessions
autocmd User Startified setlocal cursorline
let g:startify_fortune_use_unicode = 1
let g:startify_files_number = 10
let g:startify_session_autoload = 1
let g:startify_bookmarks = [ '~/Developpement/Cnes/CO3D/dataref-water-master/deprecated/ALCD' ]
let g:startify_commands =  [  ['Load Vimspector', ':packadd vimspector'] ]
packadd vim-startify


" ALE
"----
" Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support
" git clone --depth=1 https://github.com/dense-analysis/ale
" Python : pylint (linter), pyls (LSP, linter and completion)
" C/C++ : clangd (clang-tools) for C/C++ langage server
" See ale_linters/python pour python linters
" use :ALEInfo for info and use :lopen to see warnings and errors
" move mouse over errors to display balloons
" Warning: disable jedi completion if you use ale completion
"let g:ale_linters_explicit = 1 " use on listed linters
"let g:ale_linters = {'python': ['pyls']}
let g:ale_completion_enabled=0 " must be before packadd ale
let g:ale_set_balloons = 1 " must be before packadd ale
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_set_highlights = 0
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_python_pylint_options = '--disable=C0301'
let g:ale_python_pyls_config = {
\  'pyls': {
\      'plugins': {
\          'pycodestyle': {
\              'enabled': v:true,
\              'ignore': [ "E501" ]
\      }
\    }
\  }
\}
packadd ale

"highlight SignColumn guibg=DarkGray


" Vim Jedi
"---------
" Awesome Python autocompletion with VIM
" git clone --depth=1 --recursive https://github.com/davidhalter/jedi-vim
" Warning: disable ale completion if you use jedi completion
let g:jedi#completions_command = "<C-Space>"
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 1
"let g:jedi#use_splits_not_buffers = "top"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 1
let g:jedi#show_call_signatures = 2
let g:jedi#show_call_signatures_delay = 0
"let g:jedi#goto_command = "<leader>jd"
"let g:jedi#goto_assignments_command = "<leader>jg"
"let g:jedi#goto_stubs_command = "<leader>js"
"let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#max_doc_height = 30
"let g:jedi#usages_command = "<leader>jn"
let g:jedi#rename_command = "<leader>jr"
packadd jedi-vim


" Vim Slime
"----------
" You can type text in a file, send it to a live REPL
" git clone https://github.com/jpalardy/vim-slime.git
" Use :SlimeConfig to choose and start REPL
" Use C-c C-c to send paragraph to REPL interpreter
let g:slime_target = "vimterminal"
let g:slime_no_mappings = 1
let g:slime_python_ipython = 1
let g:slime_vimterminal_config = {"term_finish": "close"}
"let g:slime_vimterminal_cmd = "python3"
packadd vim-slime
xmap <c-c><c-c> <Plug>SlimeRegionSend
nmap <c-c><c-c> <Plug>SlimeParagraphSend


"
" Vimspector
"-----------
" Python and C/C++ debugger
" git clone --depth=1 https://github.com/puremourning/vimspector
" cd ~/.vim/pack/mypackages/opt/vimspector
" ./install_gadget.py --enable-python --enable-c" => install debugpy and vscode-cpptools
" Vimspector need a .vimspector.json file to work, in
"   ~/.vim/pack/.../vimspector/configurations/...
" To run vimspector :
" :call vimspector#Launch()
" :set mouse=a
"let g:vimspector_enable_mappings = 'HUMAN'
"packadd vimspector