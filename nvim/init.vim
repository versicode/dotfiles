" Plugins {
    call plug#begin('~/.local/share/nvim/plugged')

    Plug 'flazz/vim-colorschemes'

    Plug 'StanAngeloff/php.vim'
    Plug 'othree/html5.vim'
    Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
    Plug 'cakebaker/scss-syntax.vim'
    "Plug 'lumiliet/vim-twig'
    Plug 'nelsyeung/twig.vim'
    Plug 'pangloss/vim-javascript'
    Plug 'tpope/vim-repeat'

    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'scrooloose/nerdcommenter'
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-surround'
    Plug 'jiangmiao/auto-pairs'
    Plug 'Yggdroot/indentLine'
    Plug 'mattn/emmet-vim'
    Plug 'majutsushi/tagbar'
    Plug 'mtscout6/vim-tagbar-css'

    Plug 'vim-php/tagbar-phpctags.vim'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'vim-syntastic/syntastic'
    Plug 'Valloric/YouCompleteMe'

    Plug 'arnaud-lb/vim-php-namespace'
    Plug 'shawncplus/phpcomplete.vim'
    Plug 'tobyS/pdv'
    Plug 'tobyS/vmustache'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'xolox/vim-easytags'
    Plug 'xolox/vim-misc'
    Plug 'joonty/vdebug'

    Plug 'captbaritone/better-indent-support-for-php-with-html'

    "Plug 'mhinz/vim-startify'

    call plug#end()
" }


" Basic vim config {
    " Main settings {
        set background=light
        set completeopt=menu,menuone,noinsert,noselect,preview
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
        set nowrap
        if has('persistent_undo')      "check if your vim version supports it
            set undofile                 "turn on the feature  
            set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
        endif     
        
        " fix russian
        set keymap=russian-jcukenwin
        set iminsert=0
        set imsearch=0
        highlight lCursor guifg=NONE guibg=Cyan
        "setlocal spell spelllang=ru_yo,en_us

        " On pressing tab, insert 4 spaces
        set expandtab

        " Let Vim walk up directory hierarchy from CWD to root looking for tags file
        set tags=tags;/

        " speed optimizations
        set regexpengine=1
        set lazyredraw
    " }

    " FileType settings {
        let php_var_selector_is_identifier = 1
        let php_htmlInStrings = 1
        "let php_sql_query=1
        "Better use $q = <<<SQL SELECT * FROM table; SQL;

        if has("autocmd")
            autocmd BufRead *.sql set filetype=mysql
        endif

    " }

    " Keymaps {
        inoremap <C-h> <Left>
        "inoremap <C-j> <Down>
        "inoremap <C-k> <Up>
        inoremap <C-l> <Right>

        " For html files press \Enter to jump between tag pairs
        inoremap <leader><CR> <CR><C-o>==<C-o>O

        " Use caps lock no exit from vim terminal
        tnoremap <esc><esc> <c-\><c-n><c-w>w

        " Move to function name
        "inoremap <C-e> <C-o>F(<C-o>h<C-X><C-O>

        "nnoremap <leader><leader> :noh<CR>
        noremap <silent> <c-l> :nohls<cr><c-l>

        " Save file using C-S
        noremap <silent> <C-S> :update<CR>
        vnoremap <silent> <C-S> <C-C>:update<CR>
        "inoremap <silent> <C-S> <C-O>:update<CR>
        inoremap <silent> <C-S> <esc>:update<CR>

        " Mover between buffers
        nnoremap <Tab> :bnext<CR>
        nnoremap <S-Tab> :bprevious<CR>

        "noremap <space> :

        " Remove tab symbol in insert mode when S-Tab
        inoremap <S-Tab> <C-d>

        " Stop using arrows, learning
        noremap <Up> <NOP>
        noremap <Down> <NOP>
        noremap <Left> <NOP>
        noremap <Right> <NOP>
    " }

    " Functions {
        function! NumberToggle()
          if(&relativenumber == 1)
            set number
          else
            set relativenumber
            set number
          endif
        endfunc
    " }
" }



" Plugins config {

    " vim-colorschemes {
        colorscheme lumione
    " }

    " nerdtree {
        "autocmd vimenter * NERDTree

        map <C-n> :NERDTreeToggle<CR>
    " }

    " nerdcommenter {
        noremap <C-\> :call NERDComment(0, "toggle")<CR>
    " }

    " vim-syntastic/syntastic {
        let g:syntastic_scss_checkers = ['sassc']
    " }

    " vim-easymotion {
        "nmap ; <Plug>(easymotion-s)

        " s{char}{char} to move to {char}{char}
        map s <Plug>(easymotion-s2)
        map <leader>s <Plug>(easymotion-s)

        " New search
        map  / <Plug>(easymotion-sn)
        omap / <Plug>(easymotion-tn)

        "map  n <Plug>(easymotion-next)
        "map  N <Plug>(easymotion-prev)

    " }

    " emmet-vim {
        let g:user_emmet_expandabbr_key='<Tab>'
        let g:user_emmet_install_global = 1

        " Makes emmet expand on Tab
        imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

        " Better identation for scss files
        "autocmd FileType scss imap <tab> <plug>(emmet-expand-abbr)<C-o>==
    " }

    " auto-pairs {
        let g:AutoPairsMapCh = 0

        " Make work twig {%%}
        autocmd FileType twig let g:AutoPairs['%']='%'
        autocmd FileType twig let g:AutoPairsParens['%']='%'
    " }

    " Tagbar
        let g:tagbar_autoclose=1

        nnoremap <C-m> :TagbarToggle<CR>
        "nnoremap <silent> <F9> :TagbarToggle<CR>
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

        autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
        autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
    " }

    " UtilSnips {
        let g:UltiSnipsExpandTrigger="<C-j>"
    " }

    " YCM {
        "let g:ycm_auto_trigger = 0
        let g:ycm_autoclose_preview_window_after_insertion = 1
        let g:ycm_key_list_select_completion = ['<Down>']
        let g:ycm_key_list_previous_completion = ['<Up>']

    " }

    " FZF {
        map <C-p> :FZF<cr>
    " }

    " AirLine {
        let g:airline_theme='tomorrow'
        let g:airline_powerline_fonts = 1
        let g:airline_right_sep = ''
        let g:airline_left_sep = ''

        " Enable the list of buffers
        let g:airline#extensions#tabline#enabled = 1

        " Show just the filename
        let g:airline#extensions#tabline#fnamemod = ':t'
    " }

    " EasyTags {
        "Tell EasyTags to use the tags file found by Vim
        let g:easytags_dynamic_files = 1
        let g:easytags_events = ['BufWritePost']
        let g:easytags_auto_highlight = 0
        let g:easytags_async=1
    " }

    " indentLine {
        let g:indentLine_color_term = 253
    " }

    " vdebug {
        hi default DbgBreakptLine term=reverse ctermfg=Black ctermbg=Green guifg=#b2b2b2 guibg=#b2b2b2
        hi default DbgBreakptSign term=reverse ctermfg=Black ctermbg=Green guifg=#b2b2b2 guibg=#b2b2b2
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

    " Execute macro on multiple lines using visual selection and @ key {
        xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

        function! ExecuteMacroOverVisualRange()
          echo "@".getcmdline()
          execute ":'<,'>normal @".nr2char(getchar())
        endfunction
    " }

" }
"
"Custom {
    nnoremap <leader><leader><F7> :call RunInBrowser() <CR>
    "nnoremap <F12>c :exe ':silent !chromium-browser '<CR>
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
"}

syntax on
filetype plugin indent on
