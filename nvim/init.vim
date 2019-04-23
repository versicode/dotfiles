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
    Plug 'inside/vim-search-pulse'

    " Syntax
    Plug 'StanAngeloff/php.vim', {'for': 'php'}
    Plug 'othree/html5.vim'
    Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
    Plug 'cakebaker/scss-syntax.vim', {'for': 'scss'}
    Plug 'nelsyeung/twig.vim'
    Plug 'pangloss/vim-javascript', {'for': 'javascript'}
    Plug 'captbaritone/better-indent-support-for-php-with-html'
    Plug 'elzr/vim-json'
    Plug 'aklt/plantuml-syntax'
    Plug 'posva/vim-vue'
    "Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
    "Plug 'HerringtonDarkholme/yats.vim', {'for': 'typescript'}
    Plug 'Quramy/vim-js-pretty-template'
    Plug 'jason0x43/vim-js-indent'
    Plug 'nikvdp/ejs-syntax'
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
    Plug 'vim-php/tagbar-phpctags.vim', {'for': 'php'}
    Plug 'easymotion/vim-easymotion'

    " Utils
    Plug 'tpope/vim-repeat'
    Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-surround'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tyru/open-browser.vim'
    Plug 'JamshedVesuna/vim-markdown-preview', {'for': 'markdown'}
    Plug 'weirongxu/plantuml-previewer.vim'
    Plug 'eshion/vim-sync'
    Plug 'xolox/vim-session'
    Plug 'AndrewRadev/sideways.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'benmills/vimux'
    Plug 'joonty/vdebug'
    Plug 'godlygeek/tabular'

    " Php
    "Plug 'arnaud-lb/vim-php-namespace'
    Plug 'tobyS/pdv', {'for': 'php'}
    Plug 'tobyS/vmustache', {'for': 'php'}
    Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'}
    Plug 'vim-php/vim-php-refactoring', {'for': 'php'}
    "Plug 'docteurklein/vim-symfony'

    " JavaScript
    Plug 'heavenshell/vim-jsdoc',
    Plug 'ternjs/tern_for_vim', {'for': 'javascript', 'do': 'npm install'}

    " Autocomplete
    Plug 'SirVer/ultisnips'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'honza/vim-snippets'
    Plug 'mattn/emmet-vim'
    Plug 'phpactor/phpactor' ,  {'for': 'php', 'do': 'composer install'}
    Plug 'roxma/nvim-completion-manager'
    " Plug 'mhartington/nvim-typescript',
    Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
    Plug 'roxma/ncm-phpactor', {'for': 'php'}

    Plug 'jceb/vim-orgmode'
    Plug 'tpope/vim-speeddating'
    Plug 'mattn/calendar-vim'
    Plug 'skywind3000/asyncrun.vim'
    Plug 'eshion/vim-sync'

    Plug 'tpope/vim-dadbod'
    Plug 'kristijanhusak/vim-js-file-import'
    " Plug 'galooshi/vim-import-js'
    Plug 'chrisbra/NrrwRgn'
    Plug 'lyokha/vim-xkbswitch'
    let g:XkbSwitchEnabled = 1

    Plug 'justinmk/vim-sneak'
    Plug 'mhinz/vim-signify'
    Plug 'justinmk/vim-sneak'

    Plug 'diepm/vim-rest-console'

    " Omni-completion
    autocmd FileType php setlocal omnifunc=phpactor#Complete

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
        set mouse=a

        " Always show sign column
        set signcolumn=yes

        " speed optimizations
        set regexpengine=1
        set lazyredraw

        "set omnifunc=syntaxcomplete#Complete
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

        " Custom help
        set runtimepath^=~/.local/share/nvim/doc/

        " Let Vim walk up directory hierarchy from CWD to root looking for tags file
        set tags=./tags;
        set path=.

        " The ^[ is a single character. You enter it by pressing Ctrl+v and then ESC.
        "set t_8f=^[[38;2;%lu;%lu;%lum
        "set t_8b=^[[48;2;%lu;%lu;%lum

        " Change the color scheme here.
        "colorscheme gruvbox

        " This is what sets vim to use 24-bit colors. It will also work for any version of neovim
        " newer than 0.1.4.
        "set termguicolors
    " }

    " FileType settings {
        let php_var_selector_is_identifier = 1
        let php_htmlInStrings = 1

        "let php_sql_query=1
        "Better use $q = <<<SQL SELECT * FROM table; SQL;

        autocmd BufNewFile,BufRead *.html.twig set syntax=html.twig

        autocmd FileType yaml setl tabstop=2|setl shiftwidth=2|setl expandtab

        " autocmd BufNewFile,BufRead *.yaml setl tabstop=2|setl shiftwidth=2|setl expandtab

        autocmd BufNewFile,BufRead *.md set tw=80
        "autocmd FileType html.twig.js.css let b:deoplete_ignore_sources = ['omni']

        if has("autocmd")
            autocmd BufRead *.sql set filetype=mysql
        endif
    " }

    " Keymaps {
        " Alt-l to switch lang from anywhere
        nnoremap <A-l> i<C-^><Esc>l
        inoremap <A-l> <C-^>
        cnoremap <A-l> <C-^>
        inoremap <A-Space> <C-^>

        " sort javascript imports in {  }
        map <leader>isi ^f{vi{<leader>nr:%s/^ \+// <CR> :%s/\s\+$//e <CR> :s/,//g <CR> :s/\s\+/\r/g <CR> :'[,sort <CR> :,']j <CR> :s/ /, /g <CR> :noh <CR> ^i <Esc>A <Esc>^ :wq <CR>

        " insert debugger statement and run debugger for current line
        nnoremap <leader>d Odebugger<esc>:w<CR>:VimuxRunCommand('node inspect ./bin/dev')<CR>
" dd:w<CR>

        " Alt-w to use php-cs-fixer
        map <A-w> :vnew \| 0read ! php-cs-fixer fix # --dry-run --diff --rules=@Symfony<CR><CR>
        " <leader>ts to test using codecept
        "map <leader>ts :vnew \| 0read ! bin/codecept run #<CR><CR>

        autocmd FileType php map <leader>ts :VimuxRunCommand('clear; bin/codecept run ' . bufname("%"))<CR>

        autocmd FileType javascript map <leader>ts  :echo 'Testing current buffer...' <CR> :VimuxRunCommand('clear; npm test ' . bufname("%"))<CR>
        autocmd FileType javascript map <leader>tsa :echo 'Testing all...' <CR> :VimuxRunCommand('clear; npm test')<CR>

        map <leader>pwd :cd %:p:h<CR>

        " Move in insert mode using C-h and C-l
        nnoremap <M-J> :m .+1<CR>==
        nnoremap <M-K> :m .-2<CR>==
        inoremap <M-J> <Esc>:m .+1<CR>==gi
        inoremap <M-K> <Esc>:m .-2<CR>==gi
        vnoremap <M-J> :m '>+1<CR>gv=gv
        vnoremap <M-K> :m '<-2<CR>gv=gv

        " Resize windows with leader + and -
        nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
        nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

        " Visually select whole line
        noremap vil ^vg_

        " Use A-p to paste from 0 register
        "noremap P "0p
        noremap <A-p> "0p
        " vnoremap <A-p> "_dP

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

        " Long dash – use xcape for now
        "inoremap <A-g> <C-k>-N

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

        " http://vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
        inoremap <c-u> <c-g>u<c-u>
        inoremap <c-w> <c-g>u<c-w>

        autocmd FileType php noremap <leader><F7> :w!<CR>:!/usr/bin/php %<CR>

        noremap <A-g> :set nopaste <CR>

        " Better scroll
        map <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
        map <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>

    " }

" }

" Plugins config {

    " ternjs {
        " autocmd FileType javascript map <A-]> :TernDef<CR>
        autocmd FileType javascript map <A-]> <leader>ig
        autocmd FileType javascript map <leader>tr :TernRename<CR>
        autocmd FileType javascript map <leader>tt :TernType<CR>
        autocmd FileType javascript map <leader>td :TernType<CR>
    " }

    " vim-dadbod {
        map <A-q> :%DB mongodb:///localhost<CR>
    " }

    " jsdoc {
        nmap <silent> <leader>jd <Plug>(jsdoc)
        let g:jsdoc_allow_input_prompt = 1
        let g:jsdoc_input_description = 1
        let g:jsdoc_enable_es6 = 1
        let g:jsdoc_return = 0
    " }

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

        let g:NERDTreeMapJumpNextSibling = '<Nop>'
        let g:NERDTreeMapJumpPrevSibling = '<Nop>'
    " }

    " nerdcommenter {
        noremap <C-\> :call NERDComment(0, "toggle")<CR>

        " Add spaces after comment delimiters by default
        let g:NERDSpaceDelims = 1
    " }

    " undotree {
        noremap <A-t> :UndotreeToggle <CR>
    " }

    " vim-easymotion {
        " s{char}{char} to move to {char}{char}
        " map s <Plug>(easymotion-s2)
        " map <leader>s <Plug>(easymotion-s)

        " New search p.s. temporary use default vim search
        "map  / <Plug>(easymotion-sn)
        "omap / <Plug>(easymotion-tn)
    " }

    " emmet-vim {
        let g:user_emmet_leader_key='<Leader><Leader><Leader>'
        "let g:user_emmet_expandabbr_key='<Tab>'
        let g:user_emmet_install_global = 0

        autocmd FileType html,css,twig,scss,htmldjango.twig,php,xml EmmetInstall

        " Makes emmet expand on Tab
        imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
    " }

    " auto-pairs {
        let g:AutoPairsMapCh = 0

        let g:AutoPairsShortcutToggle = ''

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
        "function! IPhpInsertUse()
            "call PhpInsertUse()
            "call feedkeys('a',  'n')
        "endfunction

        "autocmd FileType php inoremap <A-u> <Esc>:call IPhpInsertUse()<CR>
        "autocmd FileType php noremap <A-u> :call PhpInsertUse()<CR>

        "function! IPhpExpandClass()
            "call PhpExpandClass()
            "call feedkeys('a', 'n')
        "endfunction

        "autocmd FileType php inoremap <A-e> <Esc>:call IPhpExpandClass()<CR>
        "autocmd FileType php noremap <A-e> :call PhpExpandClass()<CR>
    " }

    " phpactor {
        autocmd FileType php inoremap <A-u> <Esc>:call phpactor#UseAdd()<CR>
        autocmd FileType php noremap <A-u> :call phpactor#UseAdd()<CR>

        autocmd FileType php inoremap <A-e> <Esc>:call phpactor#ClassExpand()<CR>
        autocmd FileType php noremap <A-e> :call phpactor#ClassExpand()<CR>

        autocmd FileType php map <Leader>pfm :call phpactor#MoveFile()<CR>
        autocmd FileType php map <Leader>pfc :call phpactor#CopyFile()<CR>
        autocmd FileType php map <Leader>tt :call phpactor#Transform()<CR>
        autocmd FileType php map <Leader>cc :call phpactor#ClassNew()<CR>
        autocmd FileType php map <A-]> :call phpactor#GotoDefinition()<CR>
    " }

    " UtilSnips {
        autocmd BufRead,BufNewFile,BufEnter *.php UltiSnipsAddFiletypes php-symfony2
        autocmd BufRead,BufNewFile,BufEnter *.php UltiSnipsAddFiletypes php-symfony3

        "let g:UltiSnipsExpandTrigger="<C-j>"
        "let g:UltiSnipsJumpForwardTrigger="<c-j>"
        "let g:UltiSnipsJumpBackwardTrigger="<c-z>"

        let g:UltiSnipsExpandTrigger="<C-b>"
        let g:UltiSnipsJumpForwardTrigger="<C-b>"
        let g:UltiSnipsJumpBackwardTrigger="<C-z>"
    " }

    " FZF {
        let $FZF_DEFAULT_COMMAND = 'ag -g ""'

        " change focus if nerdtree opened not to open file in nerdtree window
        nnoremap <silent> <expr> <C-p> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"
        nnoremap <silent> <expr> <C-f> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Buffers\<cr>"
        nnoremap <silent> <expr> <C-b> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Tags\<cr>"

        " run fzf with word under cursor
        noremap <A-y> :call fzf#vim#tags(expand('<cword>')) <CR>
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
        hi default DbgBreakptLine term=reverse ctermfg=Black ctermbg=105 guifg=#b2b2b2 guibg=#b2b2b2
        hi default DbgBreakptSign term=reverse ctermfg=Black ctermbg=105 guifg=#b2b2b2 guibg=#b2b2b2
        hi default DbgCurrentLine term=reverse ctermfg=Black ctermbg=70 guifg=#b2b2b2 guibg=#b2b2b2
        hi default DbgCurrentSign term=reverse ctermfg=Black ctermbg=70 guifg=#b2b2b2 guibg=#b2b2b2

        let g:vdebug_options = {'ide_key': 'PHPSTORM'}
        let g:vdebug_options = {'break_on_open': 0}
        let g:vdebug_options = {'server': '127.0.0.1'}
        let g:vdebug_options = {'port': '10000'}
    " }
    
    " vim-markdown-preview {
        let vim_markdown_preview_toggle=1
        let vim_markdown_preview_hotkey='<leader><leader><F8>'
    " }

    " esearch {
        let g:esearch = {
        \ 'adapter': 'ack',
        \ 'backend': 'nvim',
        \ 'out':     'win',
        \}
        map <A-f> :NERDTreeClose <CR>
        call esearch#map('<A-f>', 'esearch')
        call esearch#out#win#map('o',       'open')
        " let g:esearch#out#win#open = 'win'
    " }

    " vim-gutentags {
        "set statusline+=%{gutentags#statusline('[Indexing...]')}
    " }

    " language show {

        "function! SetStatusLineLang()
            "let cur_lang = 'EN'

            "if iminsert == 0
                "cur_lang = 'EN'
            "else
                "cur_lang = 'RU'
            "endif

            "set statusline+=cur_lang
        "endfunction

        "autocmd VimEnter * SetStatusLineLang()
    " }

    " vim-session {
        let g:session_autoload = 'no'
        let g:session_autosave = 'no'
        let g:session_command_aliases = 1
    " }

    " neomake {
        " augroup my_neomake_highlights
            " au!
            " autocmd ColorScheme *
                        " \ hi link NeomakeError SpellBad |
                        " \ hi link NeomakeWarning SpellCap
        " augroup END

        let g:neomake_javascript_enabled_makers = ['eslint_d']
        let g:neomake_php_enabled_makers = ['php', 'phpmd']
        let g:neomake_jsx_enabled_makers = ['eslint_d']
        let g:neomake_javascript_eslint_exe='eslint_d'
        let g:neomake_warning_sign={'text': '⚠', 'texthl': 'NeomakeWarningSign'}
        let g:neomake_error_sign={'text': '✖', 'texthl': 'NeomakeErrorSign'}

        autocmd! BufWritePost * Neomake
    " }

    " deoplete {
        "let g:deoplete#enable_at_startup = 1
    " }

    " echodoc {
        "let g:echodoc#enable_at_startup = 1
    " }

    " padawan {
        "command! PadawanStart call deoplete#sources#padawan#StartServer()
        "command! -bang PadawanGenerate call deoplete#sources#padawan#Generate(<bang>0)
        "command! PadawanStop call deoplete#sources#padawan#StopServer()
    " }

    " vim-tmux-navigator {
        let g:tmux_navigator_no_mappings = 1

        nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
        nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
        nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
        nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
        nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
    " }

    " vim-search-pulse {
        let g:vim_search_pulse_color_list = [251, 252, 253, 254, 255]
        let g:vim_search_pulse_mode = 'pattern'
    " }

    " vim-php-refactoring-toolbox {
        let g:php_refactor_command='php /usr/bin/refactor.phar'
    " }

    " diepm/vim-rest-console {
        let g:vrc_trigger = '<A-r>'
        let g:vrc_show_command = 0
        let g:vrc_curl_opts = {
        \ '-i': '',
        \}
        " Поддержка русского языка
        let g:vrc_auto_format_uhex = 1
        " autocmd FileType rest map <buffer> <C-G> ...
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

        noremap <leader>c :call CloseThisBuffer() <CR>
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

    function! XDisplayColor(color)
        let displaycommand = "display -size 300x300 xc:'" . a:color . "'"
        execute "silent !" . displaycommand . " 2>&1 >/dev/null &"
        :redraw!
        return 1
    endfunction

    function! ShowHexColorUnderCursor()
        let wordundercursor = expand("<cword>")
        :call XDisplayColor('\#' . wordundercursor)
        return 1
    endfunction

    map <A-s> :call ShowHexColorUnderCursor()<CR>

    " Damian Conway's Die Blinkënmatchen: highlight matches
    "nnoremap <silent> n n:call HLNext(0.1)<cr>
    "nnoremap <silent> N N:call HLNext(0.1)<cr>

    "function! HLNext (blinktime)
        "let target_pat = '\c\%#'.@/
        "let ring = matchadd('ErrorMsg', target_pat, 101)
        "redraw
        "exec 'sleep ' . float2nr(a:blinktime * 500) . 'm'
        "call matchdelete(ring)
        "redraw
    "endfunction
    "hi DiffAdd         ctermbg=235  ctermfg=108  guibg=#262626 guifg=#87af87 cterm=reverse        gui=reverse
    "hi DiffChange      ctermbg=235  ctermfg=103  guibg=#262626 guifg=#8787af cterm=reverse        gui=reverse
    "hi DiffDelete      ctermbg=235  ctermfg=131  guibg=#262626 guifg=#af5f5f cterm=reverse        gui=reverse
    "hi DiffText        ctermbg=235  ctermfg=208  guibg=#262626 guifg=#ff8700 cterm=reverse        gui=reverse
    hi DiffAdd    ctermfg=233 ctermbg=194 guifg=#003300 guibg=#DDFFDD gui=none cterm=none
    hi DiffChange ctermfg=236 ctermbg=254  guibg=#ececec gui=none   cterm=none
    hi DiffText   ctermfg=233  ctermbg=189  guifg=#000033 guibg=#DDDDFF gui=none cterm=none
    hi DiffDelete ctermfg=252 ctermbg=224   guifg=#DDCCCC guibg=#FFDDDD gui=none    cterm=none

    "let g:symfony_enable_shell_mapping = 0 "disable the mapping of symfony console

    "" Use your key instead of default key which is <C-F>
    "map <leader>sf :execute ":!"g:symfony_enable_shell_cmd<CR>


    noremap <A-g> :set nopaste <CR>

    fun! NumWindows()
        let num_wins = 0
        let current_win = winnr()

        windo let num_wins += 1
        
        :exe current_win . "wincmd w"

        return num_wins
    endfun

    fun! NumBuffers()
        return len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
    endfun

    function! IsNerdTreeEnabled()
        return exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
    endfunction

    fun! CloseCurrentWindow()
        if NumWindows() > 2
            :q
        elseif NumWindows() == 2
            if (bufname('#') =~ '^fugitive:' || bufname('%') =~ '^fugitive:')
                :echo 'closing fugitive window'
                :q
            else
                if IsNerdTreeEnabled()
                    if NumBuffers() > 1
                        :call CloseThisBuffer()
                    else
                        :NERDTreeToggle
                    endif
                else
                    :q
                endif
            endif
        else
            :bd
            ":echo "Sorry, can't close - this is a last window!"
        endif
    endfun

    function! IsNerdTreeEnabled()
        return exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
    endfunction

    noremap <A-c> :call CloseCurrentWindow() <CR>

    " Vue for nerdcomments
    let g:ft = ''
    function! NERDCommenter_before()
        if &ft == 'vue'
            let g:ft = 'vue'
            let stack = synstack(line('.'), col('.'))
            if len(stack) > 0
                let syn = synIDattr((stack)[0], 'name')
                if len(syn) > 0
                    exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
                endif
            endif
        endif
    endfunction
    function! NERDCommenter_after()
        if g:ft == 'vue'
            setf vue
            let g:ft = ''
        endif
    endfunction
"}

" neomake spinner
let s:spinner_index = 0
let s:active_spinners = 0
" let s:spinner_states = ['|', '/', '--', '\', '|', '/', '--', '\']
" let s:spinner_states = ['┤', '┘', '┴', '└', '├', '┌', '┬', '┐']
        let g:neomake_warning_sign={'text': '⚠', 'texthl': 'NeomakeWarningSign'}
        let g:neomake_error_sign={'text': '✖', 'texthl': 'NeomakeErrorSign'}
" let s:spinner_states = ['←', '↖', '↑', '↗', '→', '↘', '↓', '↙']
" let s:spinner_states = ['←', '↑', '→', '↓']
" let s:spinner_states = ['d', 'q', 'p', 'b']
" let s:spinner_states = ['.', 'o', 'O', '°', 'O', 'o', '.']
let s:spinner_states = ['■', '□', '▪', '▫', '▪', '□', '■']

function! StartSpinner()
    let b:show_spinner = 1
    let s:active_spinners += 1
    if s:active_spinners == 1
        let s:spinner_timer = timer_start(1000 / len(s:spinner_states), 'SpinSpinner', {'repeat': -1})
    endif
endfunction

function! StopSpinner()
    let b:show_spinner = 0
    let s:active_spinners -= 1
    if s:active_spinners == 0
        :call timer_stop(s:spinner_timer)
    endif
endfunction

function! SpinSpinner(timer)
    let s:spinner_index = float2nr(fmod(s:spinner_index + 1, len(s:spinner_states)))
endfunction

function! SpinnerText()
    if get(b:, 'show_spinner', 0) == 0
        return " "
    endif

    return s:spinner_states[s:spinner_index]
endfunction

augroup neomake_hooks
    au!
    autocmd User NeomakeJobInit :call StartSpinner()
    " autocmd User NeomakeJobInit :echom "Build started"
    autocmd User NeomakeFinished :call StopSpinner()
    " autocmd User NeomakeFinished :echom "Build complete"
augroup END

function! MyPlugin(...)
    if &filetype == 'javascript'
        let w:airline_section_c = '%{SpinnerText()}'
        let g:airline_variable_referenced_in_statusline = 'foo'
    endif
endfunction

call airline#add_statusline_func('MyPlugin')
