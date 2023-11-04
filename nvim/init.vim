set encoding=UTF-8

call plug#begin()

Plug 'lervag/vimtex'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.3' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'nordtheme/vim'
Plug 'numToStr/Comment.nvim'
Plug 'rktjmp/lush.nvim'
Plug 'mhinz/vim-startify'
Plug 'mcchrish/zenbones.nvim'
"Plug 'SirVer/ultisnips'
"   let g:UltiSnipsExpandTrigger = '<tab>'
"   let g:UltiSnipsJumpForwardTrigger = '<tab>'
"   let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
call plug#end()

" Somewhere after plug#end()
lua require('Comment').setup()

let g:airline_theme='sol'

let g:startify_custom_header = [
  \ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
  \ '⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
  \ '⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
  \ '⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
  \ '⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
  \ '⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
  \ '⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢻⣿⣿⣿⣿⡇⠈⠙⠳⠀⠀⠀⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
  \ '⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡌⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠈⠙⢿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
  \ '⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢸⣿⣿⣿⣿⣿⣿⣤⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
  \ '⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⣀⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⢀⣀⡀⣾⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
  \ '⠠⣽⣿⣿⣿⣿⣿⣿⣿⣿⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⢸⣿⣿⣿⣿⠉⠛⠷⣦⣤⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
  \ '⠃⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠘⣿⣿⣿⣿⠀⠀⠀⠈⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
  \ '⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⡇⠀⠀⠙⠻⢿⣿⣄⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀',
  \ '⣼⡟⣿⣿⣿⣿⣿⣿⣿⣿⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠆⠉⠻⣷⣶⣾⣿⣿⣶⣿⢿⣿⣶⣄⡀⠀⡿⠋⠙⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀',
  \ '⣿⡇⢻⣿⣿⣿⣿⣿⣿⣿⡁⠠⢈⣉⣉⣉⠉⠉⠉⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠞⡟⢻⠛⠉⢏⠁⠀⠠⣿⣿⣿⣿⣷⣿⠂⢂⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀',
  \ '⣿⡇⢸⣿⣿⣿⣿⣿⣿⣿⡿⢿⠿⡷⠶⢶⠖⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢡⠈⠁⠀⠘⡀⠀⢰⣿⣿⣿⣿⣿⣿⣀⡸⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀',
  \ '⣿⣇⢸⣿⣿⣿⣿⣿⣿⠿⣇⠈⡄⠱⠀⠈⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠣⡀⠀⢠⠁⠀⢸⣿⣿⣿⣿⣿⡷⠄⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀',
  \ '⠸⣿⡼⣿⣿⡿⠟⢹⣿⡆⠙⣦⠈⢆⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠈⠀⠁⠀⣀⣼⣿⣿⣿⣿⣿⠗⣡⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠢⡀⠀⠀⠀',
  \ '⠀⠈⠛⢿⠋⠀⠀⢸⣿⣿⡄⠀⢀⡀⢉⠂⠉⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠋⠁⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⠀⠑⠠⡀',
  \ '⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⡄⠈⠈⠈⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠈',
  \ '⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠁⠀⠀⠀⠀⠀⠀',
  \ '⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣷⣶⣤⣤⣄⣀⣀⡀⠀⠀⠀⠀⠀⠀⠂⠀⠀⠀⠀⣀⠤⠒⢹⣿⣿⣿⣿⡿⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠐⠄⠀',
  \ '⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⠒⠒⠒⠂⠀⠒⠺⡁⠀⠀⢠⣿⣿⣿⣿⠏⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠈⠢',
  \ '⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⡿⠁⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠑⡄⢀⣾⣿⣿⡿⠁⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⡠⠄⠤⠄⡀⠀⠀⠀⠀⠀',
  \ '⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⠃⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠘⣾⣿⣿⡏⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⡝⣿⣿⣿⣿⠃⡔⠁⠀⠀⠀⠈⢢⠀⠀⠀⠀',
  \ '⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⠏⠀⠀⠀⠈⢛⠿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⠟⡑⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣜⠿⢛⣁⠔⠁⠀⠀⠀⠀⠀⠀⠑⠤⡀⠀',
  \ '⠀⠀⠀⠀⠀⠀⢻⣿⣿⡏⠀⠀⠀⠀⡠⠀⣼⣿⣿⣿⣿⠇⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡅⡗⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⡟⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈',
  \ '⠀⠀⠀⠀⠀⠀⠘⣿⡟⠀⠀⠀⠀⠔⠀⣼⣿⣿⣿⣿⡟⠀⠸⠀⠀⠀⠀⠀⠀⠀⠀⢀⠔⠜⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠔⠂⠀⠀⠀',
  \ '⠀⠀⠀⠀⠀⠀⠀⠘⠇⠀⠀⢀⠊⠀⣼⣿⣿⣿⣿⣿⠇⠀⠀⢇⠀⠀⠀⠀⠀⠀⢠⢃⠎⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⢀⠤⠒⠉⠀⣀⡄⠀⠀⠀',
  \ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠁⠀⣼⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠉⠢⣀⠀⠀⠀⢨⠃⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⡠⠊⢁⡠⠄⠒⠉⠀⠀⠀⠀⠀',
  \ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⡐⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⡆⠑⠀⠀⠆⠀⠀⠀⠀⠀⠀⢰⣿⢻⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⡌⠀⠎⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀',
  \ '⠀⠀⠀⠀⠀⠀⠀⠀⢠⠁⠀⢠⣿⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠰⡀⠀⠀⠈⢢⠀⠀⠀⠀⢀⣿⢏⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠰⠁⡜⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
  \ '⠀⠀⠀⠀⠀⠀⠀⠀⡄⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠁⠢⡀⠀⠣⣀⠀⠀⠀⢸⡿⢸⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
  \ '       <NeoVim: hyperextensible Vim-based text editor>          ',]
"⠀⠀⠀
"NerdTree settings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeShowHidden=1
" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
let g:vimtex_compiler_method = 'latexmk'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = ","

" Settings for Vim
set number
set relativenumber
set guifont=JetBrainsMono\ Nerd\ Font\ 10
set termguicolors
set background=light " or dark

colorscheme zenbones

hi Normal guibg=NONE ctermbg=NONE
hi Comment guifg=#353839

