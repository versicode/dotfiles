" Install and setup plug {
    let shouldInstallBundles = 0

    if !filereadable($HOME . "/.vim/autoload/plug.vim")
        echo "~≥ Installing vim-plug \n"
        silent !curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        let shouldInstallBundles = 1
    endif
"}

" Plugins {
    call plug#begin('~/.local/share/nvim/plugged')

    " Libs
    Plug 'xolox/vim-misc'

    " Visual
    Plug 'flazz/vim-colorschemes'
    Plug 'Yggdroot/indentLine'

    " Syntax
    Plug 'StanAngeloff/php.vim'
    Plug 'othree/html5.vim'
    Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
    Plug 'cakebaker/scss-syntax.vim'
    Plug 'nelsyeung/twig.vim'
    Plug 'pangloss/vim-javascript'
    Plug 'captbaritone/better-indent-support-for-php-with-html'
    Plug 'elzr/vim-json'
    Plug 'aklt/plantuml-syntax'

    Plug 'neomake/neomake'

    " UI
    Plug 'eugen0329/vim-esearch'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'mbbill/undotree'
    Plug 'majutsushi/tagbar'
    Plug 'vim-php/tagbar-phpctags.vim'
    Plug 'easymotion/vim-easymotion'

    " Utils
    Plug 'tpope/vim-repeat'
    Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-surround'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tyru/open-browser.vim'
    Plug 'JamshedVesuna/vim-markdown-preview'
    Plug 'weirongxu/plantuml-previewer.vim'
    Plug 'eshion/vim-sync'
    Plug 'xolox/vim-session'
    Plug 'AndrewRadev/sideways.vim'
    Plug 'tpope/vim-fugitive'

    " Php
    Plug 'arnaud-lb/vim-php-namespace'
    Plug 'tobyS/pdv'
    Plug 'tobyS/vmustache'
    Plug 'joonty/vdebug'

    " Autocomplete
    Plug 'SirVer/ultisnips'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'honza/vim-snippets'
    Plug 'mattn/emmet-vim'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'padawan-php/deoplete-padawan', { 'do': 'composer install' }
    Plug 'Shougo/echodoc.vim'

    call plug#end()
" }

" Install plguins if they not installed {
    if shouldInstallBundles == 1
        echo "~> Installing plugs\n"
        :PlugInstall
    endif
" }

" Basic vim config {

    " Main settings {
        syntax on
        filetype plugin indent on

        set background=light

        "set completeopt=menu,menuone,noinsert,noselect,preview
        set completeopt=menu,menuone,noinsert,noselect
        set completeopt-=preview

        set splitbelow
        set termencoding=utf-8
        set fileencodings=utf8,cp1251
        set encoding=utf8
        set tabstop=4
        set shiftwidth=4
        set list
        set listchars=tab:▸‒,trail:·,extends:→,precedes:←,space:·
        set relativenumber
        set number
        set clipboard=unnamedplus
        set ignorecase
        set smartcase
        set nostartofline
        set shortmess+=I
        set smartindent
        let g:vim_json_syntax_conceal = 0
        set expandtab
        set noshowmode

        " speed optimizations
        set regexpengine=1
        set lazyredraw

        set omnifunc=syntaxcomplete#Complete
        if has('persistent_undo')      "check if your vim version supports it
            set undofile                 "turn on the feature  
            set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
        endif     

        " fix russian
        set keymap=russian-jcukenwin
        set iminsert=0
        set imsearch=0
        highlight lCursor guifg=NONE guibg=Cyan

        autocmd BufRead *.md setlocal spell spelllang=ru_yo,en_us

        " o and O - without comment, <CR> makes new comment
        autocmd BufRead,BufNewFile * set formatoptions-=o

        " do not close terminal buffer on buffer switch
        autocmd TermOpen * set bufhidden=hide

        " Custom help //TODO::implement
        "set runtimepath^=~/.local/share/nvim/plugged/myhelp/

        " Let Vim walk up directory hierarchy from CWD to root looking for tags file
        set tags=./tags;
        set path=.
    " }

    " FileType settings {
        let php_var_selector_is_identifier = 1
        let php_htmlInStrings = 1

        "let php_sql_query=1
        "Better use $q = <<<SQL SELECT * FROM table; SQL;

        autocmd BufNewFile,BufRead *.html.twig set syntax=html.twig

        autocmd BufNewFile,BufRead *.md set tw=80
        autocmd FileType html.twig.js.css let b:deoplete_ignore_sources = ['omni']

        if has("autocmd")
            autocmd BufRead *.sql set filetype=mysql
        endif
    " }

    " Keymaps {
        " Alt-l to switch lang from anywhere
        nnoremap <A-l> i<C-^><Esc>l
        inoremap <A-l> <C-^>

        " Move in insert mode using C-h and C-l
        inoremap <C-h> <Left>
        inoremap <C-l> <Right>

        " Visually select whole line
        noremap vil ^vg_

        " For html files press \Enter to jump between tag pairs
        inoremap <leader><CR> <CR><C-o>==<C-o>O

        " Use caps lock no exit from vim terminal
        tnoremap <esc> <c-\><c-n>

        " Clear search highlight
        noremap <silent> <A-k> :nohls<CR>

        " Save file using C-S
        noremap <silent> <C-S> :update<CR>
        vnoremap <silent> <C-S> <C-C>:update<CR>
        inoremap <silent> <C-S> <esc>:update<CR>

        " move in edits hostory
        noremap <A-o> <C-O>
        noremap <A-i> <C-I>

        " Long dash
        inoremap <A-g> <C-k>-N

        " Remove tab symbol in insert mode when S-Tab
        inoremap <S-Tab> <C-d>

        " Stop using arrows!
        noremap <Up> <NOP>
        noremap <Down> <NOP>
        noremap <Left> <NOP>
        noremap <Right> <NOP>

        " folding. zf{motion} - create fold; za - toggle fold; 
        " zR - open all folds; zi - toggle enable/disable;
        " better to use zR and set foldlevel=0
        " zT - close all folds
        nnoremap zT :set foldlevel=0<CR>
    " }

" }

" Plugins config {

    " vim-colorschemes {
        colorscheme lumione
    " }

    " sideways.vim {
        nnoremap <A-<> :SidewaysLeft<cr>
        nnoremap <A->> :SidewaysRight<cr>
        omap aa <Plug>SidewaysArgumentTextobjA
        xmap aa <Plug>SidewaysArgumentTextobjA
        omap ia <Plug>SidewaysArgumentTextobjI
        xmap ia <Plug>SidewaysArgumentTextobjI
    " }

    " nerdtree {
        map <A-v> :NERDTreeToggle<CR>
        map <A-b> :NERDTreeFind<CR>
    " }

    " nerdcommenter {
        noremap <C-\> :call NERDComment(0, "toggle")<CR>
    " }

    " undotree {
        noremap <A-t> :UndotreeToggle <CR>
    " }

    " vim-easymotion {
        " s{char}{char} to move to {char}{char}
        map s <Plug>(easymotion-s2)
        map <leader>s <Plug>(easymotion-s)

        " New search
        map  / <Plug>(easymotion-sn)
        omap / <Plug>(easymotion-tn)
    " }

    " emmet-vim {
        let g:user_emmet_leader_key='<Leader><Leader><Leader>'
        let g:user_emmet_expandabbr_key='<Tab>'
        let g:user_emmet_install_global = 0

        autocmd FileType html,css,twig,scss,htmldjango.twig,php,xml EmmetInstall

        " Makes emmet expand on Tab
        imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
    " }

    " auto-pairs {
        let g:AutoPairsMapCh = 0

        " Make work twig {%%}
        autocmd FileType twig let g:AutoPairs['%']='%'
        autocmd FileType twig let g:AutoPairsParens['%']='%'
    " }

    " Tagbar
        let g:tagbar_autoclose=1

        nnoremap <A-m> :TagbarToggle<CR>
    " }

    " pdv {
        let g:pdv_template_dir = $HOME ."/.local/share/nvim/plugged/pdv/templates_snip"

        nnoremap <Leader>cd :call pdv#DocumentWithSnip()<CR>
    " }

    " vim-php-namespace {
        function! IPhpInsertUse()
            call PhpInsertUse()
            call feedkeys('a',  'n')
        endfunction

        autocmd FileType php inoremap <A-u> <Esc>:call IPhpInsertUse()<CR>
        autocmd FileType php noremap <A-u> :call PhpInsertUse()<CR>

        function! IPhpExpandClass()
            call PhpExpandClass()
            call feedkeys('a', 'n')
        endfunction

        autocmd FileType php inoremap <A-e> <Esc>:call IPhpExpandClass()<CR>
        autocmd FileType php noremap <A-e> :call PhpExpandClass()<CR>
    " }

    " UtilSnips {
        autocmd BufRead,BufNewFile,BufEnter *.php UltiSnipsAddFiletypes php-symfony2
        autocmd BufRead,BufNewFile,BufEnter *.php UltiSnipsAddFiletypes php-symfony3

        let g:UltiSnipsExpandTrigger="<C-j>"
        let g:UltiSnipsJumpForwardTrigger="<c-b>"
        let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    " }

    " FZF {
        let $FZF_DEFAULT_COMMAND = 'ag -g ""'

        " change focus if nerdtree opened not to open file in nerdtree window
        nnoremap <silent> <expr> <C-p> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"
        nnoremap <silent> <expr> <C-k> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Buffers\<cr>"
        nnoremap <silent> <expr> <C-l> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Tags\<cr>"
    " }

    " AirLine {
        let g:airline_theme='tomorrow'
        let g:airline_powerline_fonts = 1
        let g:airline_right_sep = ''
        let g:airline_left_sep = ''
        let g:airline_detect_spell=1
        let g:airline_detect_spelllang=1

        " Enable the list of buffers
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#show_tabs = 0

        " Show just the filename
        let g:airline#extensions#tabline#fnamemod = ':t'

        let g:airline#extensions#keymap#enabled = 0
        let g:airline#extensions#neomake#enabled = 1
    " }

    " indentLine {
        let g:indentLine_color_term = 253
    " }

    " vdebug {
        hi default DbgBreakptLine term=reverse ctermfg=Black ctermbg=Green guifg=#b2b2b2 guibg=#b2b2b2
        hi default DbgBreakptSign term=reverse ctermfg=Black ctermbg=Green guifg=#b2b2b2 guibg=#b2b2b2
    " }
    
    " vim-markdown-preview {
        let vim_markdown_preview_toggle=1
        let vim_markdown_preview_hotkey='<leader><leader><F8>'
    " }

    " esearch {
        let g:esearch = {
        \ 'backend': 'nvim',
        \ 'out':     'qflist',
        \}
        call esearch#map('<A-f>', 'esearch')
        call esearch#out#win#map('o',       'open')
    " }

    " vim-gutentags {
        set statusline+=%{gutentags#statusline('[Indexing...]')}
    " }

    " vim-session {
        let g:session_autoload = 'no'
        let g:session_autosave = 'no'
        let g:session_command_aliases = 1
    " }

    " neomake {
        augroup my_neomake_highlights
            au!
            autocmd ColorScheme *
                        \ hi link NeomakeError SpellBad |
                        \ hi link NeomakeWarning SpellCap
        augroup END

        autocmd! BufWritePost * Neomake
        let g:neomake_javascript_enabled_makers = ['eslint']
        let g:neomake_php_enabled_makers = ['php', 'phpmd']
        let g:neomake_jsx_enabled_makers = ['eslint']
        let g:neomake_javascript_eslint_exe='eslint'
    " }

    " deoplete {
        let g:deoplete#enable_at_startup = 1
    " }

    " echodoc {
        let g:echodoc#enable_at_startup = 1
    " }

    " padawan {
        command! PadawanStart call deoplete#sources#padawan#StartServer()
        command! -bang PadawanGenerate call deoplete#sources#padawan#Generate(<bang>0)
        command! PadawanStop call deoplete#sources#padawan#StopServer()
    " }

" }

" Functions {

    " Theme developing {
        function! SynStack()
          if !exists("*synstack")
            return
          endif
          echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
        endfunc
    " }

    " Close all buffers except this one :) {
        function! CloseAllBuffersExceptThisOne()
          execute ":%bd|e#"
        endfunction

        command! CloseAllBuffersExceptThisOne call CloseAllBuffersExceptThisOne()
    " }

    " Execute macro on multiple lines using visual selection and @ key {
        xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

        function! ExecuteMacroOverVisualRange()
          echo "@".getcmdline()
          execute ":'<,'>normal @".nr2char(getchar())
        endfunction
    " }

    " Close buffer but not touch layout (tab) {
        function! CloseThisBuffer()
            execute ":bp|bd # "
        endfunction

        noremap <A-c> :call CloseThisBuffer() <CR>
    " }

    " Nerdtree helpers {
        function! IsNerdTreeOpened()
            return exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
        endfunction

        function! CloseNerdTreeThenExecute(executeString)
            :execute a:executeString
        endfunction
    " }

" }

"Other {
    nnoremap <leader><leader><F7> :call RunInBrowser() <CR>

    autocmd FileType php noremap <leader><F7> :w!<CR>:!/usr/bin/php %<CR>

    function! RunInBrowser()
        let path = expand('%:p')
        let arr_path = split(path, '/')
        let i = remove(arr_path, 3)
        let i = remove(arr_path, 1)
        let i = remove(arr_path, 0)
        let normalized_path = join(arr_path, '/')

        execute ':silent !google-chrome ' . normalized_path 
    endfunc

    function XDisplayColor(color)
        let displaycommand = "display -size 300x300 xc:'" . a:color . "'"
        execute "silent !" . displaycommand . " 2>&1 >/dev/null &"
        :redraw!
        return 1
    endfunction

    function ShowHexColorUnderCursor()
        let wordundercursor = expand("<cword>")
        :call XDisplayColor('\#' . wordundercursor)
        return 1
    endfunction

    map <A-s> :call ShowHexColorUnderCursor()<CR>

    " Better scroll
    map <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
    map <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>
"}
