" Fisa-vim-config, a config for both Vim and NeoVim
" http://vim.fisadev.com
" version: 12.0.1

" To use fancy symbols wherever possible, change this setting from 0 to 1
" and use a font from https://github.com/ryanoasis/nerd-fonts in your terminal 
" (if you aren't using one of those fonts, you will see funny characters here. 
" Turst me, they look nice when using one of those fonts).
let fancy_symbols_enabled = 1

set encoding=utf-8
let using_neovim = has('nvim')
let using_vim = !using_neovim

" ============================================================================
" Vim-plug initialization
" Avoid modifying this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')

if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.config/nvim/autoload
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" Obscure hacks done, you can now modify the rest of the config down below 
" as you wish :)
" IMPORTANT: some things in the config are vim or neovim specific. It's easy 
" to spot, they are inside `if using_vim` or `if using_neovim` blocks.

" ============================================================================
" Active plugins
" You can disable or add new ones here:

" this needs to be here, so vim-plug knows we are declaring the plugins we
" want to use
call plug#begin("~/.config/nvim/plugged")


" editor: Folding
Plug 'tmhedberg/SimpylFold'
" editor: commentary
Plug 'tpope/vim-commentary'
" editor: Indent line
Plug 'junegunn/vim-easy-align'
" editor: todo list
Plug 'fisadev/FixedTaskList.vim'
" editor: indentLine
Plug 'Yggdroot/indentLine'
" editor: change reativenumber 0 to current line number
Plug 'myusuf3/numbers.vim'
" editor: Automatically close parenthesis, etc
Plug 'Townk/vim-autoclose'
" editor: Surround
Plug 'tpope/vim-surround'
" editor: Indentation based movements
Plug 'jeetsukumaran/vim-indentwise'
" editor: Paint css colors with the real color
Plug 'lilydjwg/colorizer'
" editor: Highlight matching html tags
Plug 'valloric/MatchTagAlways'
" editor: Generate html in a simple way
Plug 'mattn/emmet-vim'
" editro: Completion from other opened files
Plug 'Shougo/context_filetype.vim'


" util: NERDTree
Plug 'scrooloose/nerdtree'
" util: file structure
Plug 'majutsushi/tagbar'
" util: Index Search redfine /, ?, #, n, N, *
Plug 'vim-scripts/IndexedSearch'
" util: directory configuration.
Plug 'arielrossanigo/dir-configs-override.vim'
" util: fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" util: git signify color
Plug 'mhinz/vim-signify'
" util: language packets
Plug 'sheerun/vim-polyglot'
" util: Git integration
Plug 'tpope/vim-fugitive'
" util: Git tree
Plug 'rbong/vim-flog'
" util: Ack code search (requires ack installed in the system)
Plug 'mileszs/ack.vim'


" appearance: vim-monokai-tasty
Plug 'patstockwell/vim-monokai-tasty'
" appearance: Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" appearance: icons
Plug 'ryanoasis/vim-devicons'


" Async autocompletion
Plug 'Shougo/deoplete.nvim', {'do': ':autocmd VimEnter * UpdateRemotePlugins'}
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" python: autocompletion
Plug 'deoplete-plugins/deoplete-jedi'
" python: jupynb binding
Plug 'hanschen/vim-ipython-cell'
" python: jedi goto, ...
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
Plug 'davidhalter/jedi-vim'

call plug#end()

" ============================================================================
" Install plugins the first time vim runs

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

" ============================================================================
" remove ugly vertical lines on window division
set fillchars+=vert:\ 

" use 256 colors when possible
if has('gui_running') || using_neovim || (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256')
    if !has('gui_running')
        let &t_Co = 256
    endif
    colorscheme vim-monokai-tasty
else
    colorscheme delek
endif

" needed so deoplete can auto select the first suggestion
set completeopt+=noinsert
" comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" disabled by default because preview makes the window flicker
set completeopt-=preview

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" save as sudo
ca w!! w !sudo tee "%"

" ================== tab navigation mappings ==================
map tt :tabnew 
map <M-Right> :tabn<CR>
imap <M-Right> <ESC>:tabn<CR>
map <M-Left> :tabp<CR>
imap <M-Left> <ESC>:tabp<CR>


" clear empty spaces at the end of lines on save of python files
autocmd BufWritePre *.py :%s/\s\+$//e

" fix problems with uncommon shells (fish, xonsh) and plugins running commands
" (neomake, ...)
set shell=/bin/zsh

" Ability to add python breakpoints
" (I use ipdb, but you can change it to whatever tool you use for debugging)
au FileType python map <silent> <leader>b Oimport ipdb; ipdb.set_trace()<esc>

" ============================================================================
" Plugins settings and mappings
" Edit them as you wish.

" ==========================  Tagbar ==========================
" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1



" ========================= Tasklist  =========================
" show pending tasks list
map <F2> :TaskList<CR>




" ========================== Deoplet ==========================
" Use deoplete.
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
\   'ignore_case': v:true,
\   'smart_case': v:true,
\})
" complete with words from any opened file
let g:context_filetype#same_filetypes = {}
let g:context_filetype#same_filetypes._ = '_'



" ========================== Ack.vim ==========================
" mappings
nmap ,r :Ack 
nmap ,wr :execute ":Ack " . expand('<cword>')<CR>



" ========================== Signify ==========================
" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = ['git', 'hg']
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete cterm=bold ctermbg=none ctermfg=167
highlight DiffChange cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd cterm=bold ctermbg=237 ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237 ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237 ctermfg=227



" ========================= Autoclose =========================
" Fix to let ESC work as espected with Autoclose plugin
" (without this, when showing an autocompletion window, ESC won't leave insert
"  mode)
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}



" ========= Include user's custom nvim configurations =========
let custom_configs_path = "~/.config/nvim/custom.vim"

if filereadable(expand(custom_configs_path))
  execute "source " . custom_configs_path
endif
