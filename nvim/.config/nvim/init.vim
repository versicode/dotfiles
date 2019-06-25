" vim:fdm=marker

""""""""""""""""""""""""""
""" Author: VERSICODE """"
"" github.com/versicode ""
""""""""""""""""""""""""""
""""""""""""""""""""""""""

" Plugins {{{
  runtime macros/matchit.vim
  call plug#begin('~/.local/share/nvim/plugged')

  " Draft {{{

    function! OpenPluginAtGithub()
      let line = getline('.')
      let plugin_name = substitute(line, '.*Plug \([a-zA-Z/\.-]\)*', "", "")
      :echo substitute(getline('.'), ".*Plug '\([a-zA-Z/\.\-]*\)'", "\1", "")
    endfunction

  " }}}

  " Motions and text manipulation {{{
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-rsi' " terminal keys in insert/command mode (emacs like)
    Plug 'tommcdo/vim-exchange'
    Plug 'nelstrom/vim-visual-star-search' " @todo use function instead?(visual)
    Plug 'breuckelen/vim-resize'
      let g:vim_resize_disable_auto_mappings = 1
      let g:resize_count=5
    Plug 'AndrewRadev/sideways.vim'
      omap aa <Plug>SidewaysArgumentTextobjA
      xmap aa <Plug>SidewaysArgumentTextobjA
      omap ia <Plug>SidewaysArgumentTextobjI
      xmap ia <Plug>SidewaysArgumentTextobjI
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat' " @todo test
    Plug 'tommcdo/vim-lion'
  " }}}

  " Visual {{{
    Plug 'powerman/vim-plugin-AnsiEsc'
    Plug 'machakann/vim-highlightedyank'
    Plug 'sheerun/vim-polyglot' " syntax
    Plug 'Shougo/echodoc.vim'
      set noshowmode
      let g:echodoc#enable_at_startup = 1
    Plug 'unblevable/quick-scope'
    Plug 'Yggdroot/indentLine'
        let g:indentLine_color_term = 253
        let g:indentLine_concealcursor=""
    Plug 'inside/vim-search-pulse'
      let g:vim_search_pulse_disable_auto_mappings = 1
      let g:vim_search_pulse_color_list = [251, 252, 253, 254, 255]
      " let g:vim_search_pulse_color_list = [227, 228, 229, 230, 231]
      let g:vim_search_pulse_mode = 'pattern'
    Plug 'mbbill/undotree'
    Plug 'majutsushi/tagbar'
      let g:tagbar_autoclose=1
    Plug 'itchyny/lightline.vim'
    Plug 'sinetoami/lightline-neomake' " @todo is it really necessary?
      let g:lightline = {
      \ 'enable' :{
      \   'tabline': 1,
      \   'statusline': 1
      \ },
      \ 'colorscheme': 'one',
      \ 'active': {
      \    'left':  [ ['mode', 'paste'],
      \             ['readonly', 'filename', 'modified'], ['tagbar', 'currentfunction'] ],
      \    'right': [ [ 'cocstatus' ], [ 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype'  ] ],
      \ },
      \ 'inactive': {
      \   'left': [ [ 'filename', 'modified' ] ],
      \ },
      \ 'component': {
      \   'tagbar': '%{tagbar#currenttag("%s", "", "")}',
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }
  " }}}

  " External tools {{{
    Plug 'benmills/vimux'
    Plug 'wellle/tmux-complete.vim'
    Plug 'christoomey/vim-tmux-navigator'
      let g:tmux_navigator_no_mappings = 1
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-dadbod'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'on': 'MarkdownPreview'  }
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
      let g:fzf_preview_layout = 'belowright split new'
      let g:fzf_preview_grep_cmd = 'rg --line-number --no-heading'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'diepm/vim-rest-console'
      let g:vrc_set_default_mapping = 0
      let g:vrc_curl_opts = {
      \ '-i': '',
      \ '-s': '',
      \}
      " Support russian language
      let g:vrc_auto_format_uhex = 1
      let g:vrc_split_request_body = 1
      let g:vrc_show_command = 1
    Plug 'joonty/vdebug', { 'for': 'php' }
      let g:vdebug_options = {}
      let g:vdebug_options['ide_key']='PHPSTORM'
      let g:vdebug_options['server']='127.0.0.1'
      let g:vdebug_options['port']='9000'
      let g:vdebug_options['break_on_open']=1
      let g:vdebug_options['debug_file_level']=2
      let g:vdebug_options['debug_file']='~/vdebug.log'
      let g:vdebug_options['path_maps']={}
      let g:vdebug_keymap={}
      let g:vdebug_keymap['eval_under_cursor']='<M-e>'
      let g:vdebug_keymap['eval_visual']='<S-M-e>'
    Plug 'neomake/neomake'
      let g:neomake_php_enabled_makers = ['php', 'phpmd',]
      let g:neomake_warning_sign={'text': '⚠', 'texthl': 'NeomakeWarningSign'}
      let g:neomake_error_sign={'text': '✖', 'texthl': 'NeomakeErrorSign'}
    Plug 'skywind3000/asyncrun.vim'
      let g:asyncrun_silent = 0
      autocmd User AsyncRunPre   echo 'preparing for upload to the server!'
      autocmd User AsyncRunStart echo 'uploading to the server...'
      " @todo fix - it's little buggy
      autocmd User AsyncRunStop if getqflist({'nr' : '$'}).nr > 0 | colder | endif | echo 'upload done!'
    Plug 'eshion/vim-sync' 
    "@todo leader sd and leader su
    Plug 'tyru/open-browser.vim'
    Plug 'weirongxu/plantuml-previewer.vim'
    Plug 'alvan/vim-php-manual'
  " }}}

  " Git {{{
    Plug 'aacunningham/vim-fuzzy-stash'
    Plug 'tpope/vim-fugitive'
    Plug 'mhinz/vim-signify'
  " }}}

  " Organization {{{
    Plug 'vimwiki/vimwiki'
      let g:vimwiki_list = []
      let g:vimwiki_conceallevel=3
      let g:vimwiki_hl_cb_checked=2
      let g:vimwiki_diary_months = {
            \ 1: 'Январь', 2: 'Февраль', 3: 'Март',
            \ 4: 'Апрель', 5: 'Май', 6: 'Июнь',
            \ 7: 'Июль', 8: 'Август', 9: 'Сентябрь',
            \ 10: 'Октябрь', 11: 'Ноябрь', 12: 'Декабрь'
            \ }
      let g:vimwiki_table_mappings = 0
    Plug 'mattn/calendar-vim'
      let g:calendar_focus_today = 1
      let g:calendar_monday = 1
      let g:calendar_navi_label = 'Пред,Сегодня,След'
      let g:calendar_mruler = 'Янв,Фев,Мар,Апр,Май,Июн,Июл,Авг,Сен,Окт,Ноя,Дек'
      let g:calendar_wruler = 'Вс Пн Вт Ср Чт Пт Сб'
  " }}}

  " Filesystem {{{
    Plug 'justinmk/vim-dirvish'
     let g:dirvish_mode = ':sort ,^.*[\/],'
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  " }}}

  " Autocomplete {{{
    Plug 'tmsvg/pear-tree' " auto-pair
      " call add(g:pear_tree_pairs, {'closer': '`'}) " @todo think about it (js)
    Plug 'SirVer/ultisnips'
      let g:UltiSnipsJumpForwardTrigger="<tab>"
      let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
      let g:UltiSnipsEditSplit='context'
      let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']
    Plug 'honza/vim-snippets' " snippets for ultisnips
    Plug 'arnaud-lb/vim-php-namespace'
    Plug 'shawncplus/phpcomplete.vim' " {
      let g:phpcomplete_parse_docblock_comments = 1
      let g:phpcomplete_enhance_jump_to_definition = 1
      let g:phpcomplete_parse_docblock_comments = 1

      let g:phpcomplete_mappings = {
            \ 'jump_to_def': '<leader><C-]>',
            \ 'jump_to_def_split': '<leader><C-W>\',
            \ 'jump_to_def_vsplit': '<leader><C-W>]',
            \ 'jump_to_def_tabnew': '<C-W><C-[>',
            \} " @todo test
    Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
  " }}}
  
  call plug#end()
" }}}

" Basic stuff and settings {{{
  " My help
  set runtimepath^=~/.config/nvim/doc

  " Use system clipboard by deafult
  set clipboard=unnamedplus

  " Allow switch windows while buffer unsaved
  set hidden

  let mapleader = " "

  " Identation
  set wrap
  set tabstop=2
  set shiftwidth=2
  set expandtab
  set smartindent

  " Completion
  set completeopt-=preview

  " UI
  set splitbelow
  set termencoding=utf-8
  set list
  set listchars=tab:▸‒,trail:·,extends:→,precedes:←,space:·
  set relativenumber
  set number

  " Command prompt case
  set ignorecase
  set smartcase
  set infercase

  " Hide vim hello
  set shortmess+=I

  " Turn on mouse support
  set mouse=a

  " Always show sign column
  set signcolumn=yes

  " Speed optimizations
  set regexpengine=1
  set lazyredraw

  " Persistent undo
  set undofile

  " Fix russian
  " set keymap=russian-jcukenwin
  set iminsert=0
  set imsearch=0
  highlight lCursor guifg=NONE guibg=Cyan

  " o and O - without comment, <CR> makes new comment
  set formatoptions-=o

  " Path is current dir
  set path=.

  " New basic tools
  set inccommand=nosplit

  " Open tag in split right
  set splitright

  " Keep indents on wrap
  set breakindent

 " Keep some lines before zt
  set scrolloff=3

  " Italic font {
    set t_ZH=[3m
    set t_ZR=[23m
  " }

  augroup basic_stuff
    autocmd!
    autocmd BufWritePre,FileWritePre * call mkdir(expand('<afile>:p:h'), 'p')

    " Jump to the last position when reopening a file (except Git commit)
    autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  augroup END
" }}}

" FileType {{{

  " PHP {{{

    " Some syntax optimizations
    let php_htmlInStrings = 1
    let php_html_load=0
    let php_html_in_heredoc=0
    let php_html_in_nowdoc=0

    let php_sql_query=0
    let php_sql_heredoc=0
    let php_sql_nowdoc=0

    augroup filetype_php
      autocmd!
      autocmd FileType php setlocal iskeyword+=$

      " for tpope/vim-commentary
      autocmd FileType php setlocal commentstring=//\ %s

      " Keymaps
      autocmd FileType php inoremap <leader>i <Esc>:call IPhpInsertUse()<CR>
      autocmd FileType php inoremap <leader>e <Esc>:call IPhpExpandClass()<CR>
      autocmd FileType php nnoremap <leader>i :call PhpInsertUse()<CR>
      autocmd FileType php nnoremap <leader>e :call PhpExpandClass()<CR>

      autocmd FileType php nnoremap <A-w> :call FindPHPUsages()<CR>

      autocmd FileType php highlight! link phpFunction phpRegion
      autocmd FileType php highlight! link phpMethod phpRegion

      autocmd FileType php let g:php_manual_online_search_shortcut = '<leader>K'

      autocmd BufWritePre *.php %s/\s\+$//e

      " go to local definition
      autocmd FileType php nmap gd "byiw[[/\<b\><CR>

      " @todo bug - cannot select from function defitinion without `j` move
      " omap af :<C-u>normal! j[[$V%<cr>
      " omap if :<C-u>normal! j[[$jVk%k<cr>
      " nmap vif :<C-u>normal! j[[$jVk%k$<cr>
      " nmap vaf :<C-u>normal! j[[$V%<cr>
      "
      " nmap vif j[[$jVk%k$
      " nmap vaf j[[$V%
      " omap af  j[[$V%
      " omap if  j[[$jVk%k

      " nmap vif j[[$jVk%k$
      " nmap vaf j[[$V%

      " select inside function
      nmap vif ]][[/{<CR>:noh<CR>jVk%k

      " select all function
      nmap vaf ]][[/{<CR>:noh<CR>V%

    augroup END

  " }}}

  " vimwiki {{{
    augroup filetype_vimwiki
      autocmd!
      autocmd FileType vimwiki set nowrap
      autocmd FileType vimwiki set concealcursor=nc
      autocmd FileType vimwiki setlocal textwidth=70
      autocmd FileType vimwiki setlocal spell spelllang=ru_yo,en_us
      autocmd FileType vimwiki let g:indentLine_enabled = 0

      " some colors"
      autocmd FileType vimwiki call matchadd('QAnswer', '>>')
      autocmd FileType vimwiki call matchadd('phpStringSingle', '\[.*&&')
      autocmd FileType vimwiki call matchadd('Error', 'bug')
      autocmd FileType vimwiki call matchadd('phpStringSingle', '\-[0-9.]*\-[0-9.]*\-') 
      autocmd FileType vimwiki call matchadd('VimwikiComment', '\[.*@@')

      autocmd FileType vimwiki syn region VimwikiArchive start="#---#" end="\#---#" | hi def link VimwikiArchive Comment

      " add new checklist item with file name
      autocmd FileType vimwiki nnoremap <buffer> <A-n> o- [ ] <C-r>=expand('%:r')<CR> 

      " create pomodoro snippet
      autocmd FileType vimwiki nnoremap <buffer> <leader>wpc A -0--<left>

      " add pomodoro
      autocmd FileType vimwiki nnoremap <buffer> ++ md$3b<C-x>`d:echo 'Pomodoro done!'<CR>

      " remove pomodoro
      autocmd FileType vimwiki nnoremap <buffer> -- md$3b<C-a>`d:echo 'Pomodoro minus!'<CR>

      autocmd FileType vimwiki vnoremap <buffer> <leader>wl c[[<C-r>"]]<Esc>bb

      autocmd FileType vimwiki nmap <F13> <Plug>VimwikiNextLink
      autocmd FileType vimwiki nmap <F14> <Plug>VimwikiPrevLink

      autocmd FileType vimwiki nmap <C-n> <Plug>VimwikiNextLink
      autocmd FileType vimwiki nmap <F14> <Plug>VimwikiPrevLink
      autocmd FileType vimwiki nmap <A-=> <Plug>VimwikiAddHeaderLevel
      autocmd FileType vimwiki nmap <leader>wtl <Plug>VimwikiTableMoveColumnLeft
      autocmd FileType vimwiki nmap <leader>wtr <Plug>VimwikiTableMoveColumnRight
      autocmd FileType vimwiki nmap <leader>w-  <Plug>VimwikiRemoveHeaderLevel
      autocmd FileType vimwiki nmap <leader>ah <Plug>VimwikiAddHeaderLevel
      autocmd FileType vimwiki nmap <leader>c <Plug>VimwikiToggleListItem
      autocmd FileType vimwiki vmap <leader>c <Plug>VimwikiToggleListItem

      " Cool idea for small snippets, I never use ; with letter after it
      autocmd FileType vimwiki inoremap <buffer> ;` ```<cr><cr>```<Up>

    augroup END
  " }}}

  " mysql {{{
    autocmd BufRead *.sql set filetype=mysql
  " }}}

  " json {{{
    autocmd FileType json syntax match Comment +\/\/.\+$+ 
  " }}}

  " twig {{{
    autocmd BufNewFile,BufRead *.html.twig set syntax=html.twig
  " }}}

  " rest {{{
    " manipulate on curl output
    autocmd FileType rest nnoremap <leader>e ggVGy:enew<CR>pggdd
  " }}}

  " Markdown {{{
    " Spellcheck for *.md files
    autocmd FileType markdown setlocal spell spelllang=ru_yo,en_us

    " Set max text width
    autocmd FileType markdown setlocal textwidth=770

    autocmd BufWritePre *.md %s/\s\+$//e
  " }}}

  " Dirvish {{{
    autocmd FileType dirvish nnoremap <buffer><silent> <c-p> :FZF<cr>
    " @todo do it!
    " autocmd FileType dirvish nnoremap <buffer><silent> <A-f> yy:Rag <C-r>"<C-a><A-f><right>
  " }}}

  " Fugitive {{{
    autocmd FileType gitcommit set fileencoding=utf-8
  " }}}

  " cpp {{{
    autocmd FileType cpp setlocal commentstring=//\ %s
  " }}}

  " typescript {{{
    autocmd FileType typescript inoremap <silent><expr> <C-X><C-O> coc#refresh()
    autocmd FileType typescript nmap <C-]> <Plug>(coc-definition)
    autocmd FileType typescript nmap <leader>u <Plug>(coc-references)
    autocmd FileType typescript nmap <leader>r <Plug>(coc-rename)
  " }}}

" }}}

" Colors {{{
  set background=light
  let g:one_allow_italics = 1
  colorscheme lumione

  hi Search cterm=NONE ctermfg=grey ctermbg=230
  hi IncSearch cterm=NONE ctermfg=grey ctermbg=230

  " Vdebug @todo duplicate?
  hi default DbgBreakptLine term=reverse ctermfg=Black ctermbg=105 guifg=#b2b2b2 guibg=#b2b2b2
  hi default DbgBreakptSign term=reverse ctermfg=Black ctermbg=105 guifg=#b2b2b2 guibg=#b2b2b2
  hi default DbgCurrentLine term=reverse ctermfg=Black ctermbg=70 guifg=#b2b2b2 guibg=#b2b2b2
  hi default DbgCurrentSign term=reverse ctermfg=Black ctermbg=70 guifg=#b2b2b2 guibg=#b2b2b2

  " Diff
  hi DiffAdd    ctermfg=233 ctermbg=194 guifg=#003300 guibg=#DDFFDD gui=none cterm=none
  hi DiffChange ctermfg=236 ctermbg=254  guibg=#ececec gui=none   cterm=none
  hi DiffText   ctermfg=233  ctermbg=189  guifg=#000033 guibg=#DDDDFF gui=none cterm=none
  hi DiffDelete ctermfg=252 ctermbg=224   guifg=#DDCCCC guibg=#FFDDDD gui=none    cterm=none

  hi DiffAdded    ctermfg=233 ctermbg=194 guifg=#003300 guibg=#DDFFDD gui=none cterm=none
  hi DiffRemoved  ctermfg=240 ctermbg=224   guifg=#DDCCCC guibg=#FFDDDD gui=none    cterm=none

  " ALE"
  hi ALEError ctermfg=167 cterm=underline
  hi ALEErrorSign ctermfg=167
  hi ALEWarning ctermfg=4 cterm=underline
  hi ALEWarningSign ctermfg=4

  " Vdebug @todo duplicate?
  hi default DbgBreakptLine term=reverse ctermfg=Black ctermbg=81 guifg=#b2b2b2 guibg=#b2b2b2
  hi default DbgBreakptSign term=reverse ctermfg=Black ctermbg=81 guifg=#b2b2b2 guibg=#b2b2b2
  hi default DbgCurrentLine term=reverse ctermfg=Black ctermbg=72 guifg=#b2b2b2 guibg=#b2b2b2
  hi default DbgCurrentSign term=reverse ctermfg=Black ctermbg=72 guifg=#b2b2b2 guibg=#b2b2b2

  " QuickScope
  highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=172
  highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=21

  highlight HighlightedyankRegion ctermbg=254 gui=reverse

  augroup neomake_highlights
      autocmd!
      autocmd ColorScheme *
                  \ hi link NeomakeError SpellBad |
                  \ hi link NeomakeWarning SpellCap
  augroup END
" }}}


" Commands and Functions {{{

  " windo that backs to original window
  command! -nargs=+ -complete=command Windo 
      \ let s:currentWindow = winnr() |
      \ execute "windo <args>" |
      \ exe s:currentWindow . "wincmd w"

  function! IPhpInsertUse()
      call PhpInsertUse()
      call feedkeys('a',  'n')
  endfunction
  function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
  endfunction

  " zz only when leaves screen
  function! s:maybe_zz(cmd) abort
    let topline = line('w0')
    try
      exe a:cmd
    catch /E486:/
      echohl ErrorMsg | echom matchstr(v:exception, 'E486:.*') | echohl None
    endtry
    if topline != line('w0')
      normal! zz
    endif
  endfunction

  " @todo optimize Rg searches
  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number -F --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%', '?'),
    \   <bang>0)

  " pcre2 regex engine
  command! -bang -nargs=* Rgp
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case --pcre2 '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%', '?'),
    \   <bang>0)

  " 'what-to-search' 'where-to-search' - rg location
  command! -bang -nargs=+ -complete=file Rgl
    \ call fzf#vim#grep(
    \   'rg --column --line-number -F --no-heading --color=always --smart-case '.<q-args>, 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%', '?'),
    \   <bang>0)

  command! -bang -nargs=+ -complete=file Rglp
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case --pcre2 '.<q-args>, 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%', '?'),
          \   <bang>0)

  " Theme developing
  function! SynStack()
    if !exists("*synstack")
      return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
  endfunc

  " Close all buffers except this one :)
  function! CloseAllBuffersExceptThisOne()
    execute ":%bd|e#"
  endfunction

  command! CloseAllBuffersExceptThisOne call CloseAllBuffersExceptThisOne()

  " Toggle ignore file for Rg/Ack/Ag search
  function! ToggleIgnoreFile()
    if filereadable(".ignore")
      echo "Turn ignore file -OFF-"
      silent execute "!mv .ignore .toggle-ignore"
    else
      echo "Turn ignore file -ON-"
      silent execute "!mv .toggle-ignore .ignore"
    endif
  endfunction

  command! ToggleIgnoreFile call ToggleIgnoreFile()

  " Universal closing behavior
  function! CloseSplitOrDeleteBuffer()
    if winnr('$') > 1
      wincmd c
    else
      execute 'bdelete'
    endif
  endfunction 

  " visual star ? :) /<C-r>=VisualSelection()<CR><CR>
  function! VisualSelection()
    if mode()=="v"
      let [line_start, column_start] = getpos("v")[1:2]
      let [line_end, column_end] = getpos(".")[1:2]
    else
      let [line_start, column_start] = getpos("'<")[1:2]
      let [line_end, column_end] = getpos("'>")[1:2]
    end
    if (line2byte(line_start)+column_start) > (line2byte(line_end)+column_end)
      let [line_start, column_start, line_end, column_end] =
            \   [line_end, column_end, line_start, column_start]
    end
    let lines = getline(line_start, line_end)
    if len(lines) == 0
      return ''
    endif
    let lines[-1] = lines[-1][: column_end - 1]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
  endfunction

  " Poor man's find usages
  function! FindPHPUsages()
    let line_content=getline('.')

    if (line_content =~ ' private ')
      " private method
      norm *n
      echo 'private method'
    elseif (line_content =~ ' static ')
      " static method
      norm! mzgg/classeeyiw`z
      echo 'static method'

      execute 'Rgp '.getreg('0').'::'.expand('<cword>').'\('
    elseif (line_content =~ ' function')
      " @todo protected static method

      norm! mzgg/classeeyiw`z
      echo 'method'

      execute 'FRef '.getreg('0').':'.expand('<cword>')
    elseif (line_content =~ 'function ')
      " function
      echo 'function'
      execute 'Rgp (?<!function )'.expand('<cword>').'\('
    elseif (line_content =~ 'const')
      " class constant
      echo 'constant'
      norm! mzgg/classeeyiw`z
      execute 'Rgp '.getreg('0').'::'.expand('<cword>').'|self::'.expand('<cword>')
    elseif (line_content =~ 'define')
      " constant
      echo 'constant'
      execute 'Rg '.expand('<cword>')
    elseif (line_content =~ 'class ')
      " class
      echo 'class'
      execute 'Rgp new .*'.expand('<cword>')
    elseif (line_content =~ '$')
      " object variable

      echo 'looks like object variable'
      if(confirm('is it object variable?', 2) == 1) 
        norm! gewl"xywmzgg/classeeyiw`z
        execute 'FRef '.getreg('0').':'.getreg('x')
      endif

    endif
  endfunction

  function! GetClassFn()
    " Save some registers
    let l:r_a = @a
    let l:r_b = @b

    normal! mv

    " Get the method string into the regsiter a
    normal! "ayiw

    " Start at the top of the file
    normal! GG

    " Search for the class definition
    /^class
    " Get the class string into the regsiter b
    normal! f l"bye

    let full = @b . ':' . @a
    echo full

    " Restore registers
    let @a = l:r_a
    let @b = l:r_b

    normal! `v
    " echo full
    return full
  endfunction

  function! GetNamespaceAndClassFn()
    " Save some registers
    let l:r_a = @a
    let l:r_b = @b
    let l:r_c = @c

    normal! mv

    " Get the method string into the regsiter c
    normal! "cyiw

    " Start at the top of the file
    normal! GG

    " Search for the first "namespace" occurence
    /namespace
    " Get the namespace string into the regsiter a
    normal! f l"ayt;

    " Search for the class definition
    /^class
    " Get the class string into the regsiter b
    normal! f l"bye

    " Print the result
    echo @a . '\' . @b . '::' . @c . ' copied to clipboard!'

    :let @+=@a . '\' . @b . '::' . @c

    " Restore registers
    let @a = l:r_a
    let @b = l:r_b
    let @c = l:r_c

    normal! `v
  endfunction

  command! GetNamespaceAndClassAndMethod call GetNamespaceAndClassFn()

  function! GetFunctionName()
    " Save some registers
    let l:r_a = @a
    let l:r_v = @v

    normal mv[[2fnw"ayw'v


    let function_name = @a

    " Restore registers
    let @a = l:r_a
    let @v = l:r_v

    return function_name
  endfunction

  " Highlight all instances of word under cursor, when idle.
  " Useful when studying strange source code.
  function! AutoHighlightToggle()
    let @/ = ''
    if exists('#auto_highlight')
      au! auto_highlight
      augroup! auto_highlight
      setl updatetime=4000
      echo 'Highlight current word: off'
      return 0
    else
      augroup auto_highlight
        au!
        au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
      augroup end
      setl updatetime=500
      echo 'Highlight current word: ON'
      return 1
    endif
  endfunction

  " Usage: visual select all table, then :SumColumn 1 then :SumColumn 2
  command! -range=% -nargs=1 SumColumn <line1>,<line2>!awk -F '-' '{print; sum+=$('<args>' + 1)} END {print "Total: "sum}'

  function! DivideTwoNumbers(num1, num2, ...)
    let l:precision = get(a:, 1, 2)
    return trim(system('echo "scale='.l:precision.'; '.a:num1.'/'.a:num2.'" | bc -l'))
  endfunction

  function! CalculatePerDay(num)
    let @o = DivideTwoNumbers(a:num, 5)
    execute 'norm! "op'
  endfunction

  command! -nargs=1 CalculatePerDay call CalculatePerDay(<f-args>)

  function! CalculatePercent(num1, num2)
    let @o = DivideTwoNumbers(a:num1, a:num2)
    execute 'norm! "ophhxea%'
  endfunction

  command! -nargs=+ CalculatePercent call CalculatePercent(<f-args>)

  " Allows local debugging @todo
  " function! VdebugTogglePathMaps()
    " if (g:vdebug_options == {})
      " :VdebuOpt path_maps = vdebug_path_maps<CR>
    " else
      " :VdebuOpt path_maps = {}<CR>
    " endif
  " endfunction

  " yank selection into new buffer
  command! -range=% -nargs=? -complete=file Enew silent <line1>,<line2>yank x | enew | put! x | $d_ | if(<q-args> != '') | silent write <args> | endif

" }}}

" My Plugins {{{
  " Viewer mode - to make people see better what are you doing {{{
    augroup cursorline
        autocmd!
        autocmd WinEnter * exe g:viewer_mode == 1 ? "set cursorline" : "set nocursorline"
    augroup END

    let g:viewer_mode = 0
    function! ToggleViewerMode()
      if g:viewer_mode == 0
        set cursorline
        let g:viewer_mode = 1
      else
        Windo set nocursorline
        set nocursorline
        let g:viewer_mode = 0
      endif
    endfunction

    command! ToggleViewerMode call ToggleViewerMode()
  " }}}

  " Diff mode - windo toggle to diff all tab windows {{{
    let g:diff_mode = 0
    function! ToggleDiffMode()
      if g:diff_mode == 0
        windo diffthis
        let g:diff_mode = 1
      else
        Windo diffoff
        let g:diff_mode = 0
      endif
    endfunction

    command! ToggleDiffMode call ToggleDiffMode()
  " }}}
" }}}"

" Keymaps {{{

  " Basic stuff {{{

    " yank on big Y
    nnoremap Y yg_

    " no overwrite paste
    xnoremap p "_dP

    " delete without affecting unnamed register like 'remove'
    nnoremap s "_d
    vnoremap s "_d

    " yank last ex-command into system clipboard
    nnoremap y: :let @+=@:<CR>

    " repeat last ex-command
    nnoremap g. @:

    " motions to change in brackets and quotes
    nnoremap cin( f(ci(
    nnoremap cinb f(cib
    nnoremap cinB f{ciB
    nnoremap cin' ci'
    nnoremap cin" ci"

    " Clear search highlight and paste mode
    noremap <silent> gb :nohls<CR>:set nopaste<CR>

    " Remove tab symbol in insert mode when S-Tab
    inoremap <S-Tab> <C-d>

    " zT - close all folds
    nnoremap zT :set foldlevel=0<CR>

    " Maximize current window
    map <C-w>f <C-w>\|<C-w>_

    " Better scroll
    map <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
    map <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>

    " Move in insert mode using C-h and C-l
    nnoremap <M-J> :m .+1<CR>==
    nnoremap <M-K> :m .-2<CR>==
    inoremap <M-J> <Esc>:m .+1<CR>==gi
    inoremap <M-K> <Esc>:m .-2<CR>==gi
    vnoremap <M-J> :m '>+1<CR>gv=gv
    vnoremap <M-K> :m '<-2<CR>gv=gv

    " Delete function under cursor
    nnoremap dsf diw<esc>%x``x

    " Cycle through quickfix list
    nnoremap ]q :cn<CR>
    nnoremap [q :cp<CR>

    " Cycle through location list
    nnoremap ]l :lne<CR>
    nnoremap [l :lp<CR>

    " Mark position before search ('s to back)
    nnoremap / ms/

    nnoremap mS :echo "Global mark S added!"<CR>mS
    nnoremap mM :echo "Global mark M added!"<CR>mM

    vnoremap <leader>ym :s/[^\n]\zs\n\ze[^\n]/ /g<CR>gv:s/\n\n/\r/g<CR>gvyu:nohlsearch<CR>:echo 'Lines without newlines copied!'<CR>

    nnoremap zq :setlocal foldlevel-=1<CR>
    nnoremap zp :setlocal foldlevel+=1<CR>

    " change word under cursor with dot repeat
    nnoremap c* *Ncgn
    nnoremap c# #NcgN

    " visual selection search
    " vnoremap <A-/> <Esc>/\%V

    vnoremap <A-/> :g//#<left><left>

    " vnoremap <A-/> :g//#<left><left>
    " vnoremap <A-/> :lopen<CR>:vimgrep/\%(\%'<\|\%>'<\%<'>\|\%'>\)/ %<left><left><left>
    " @todo + add location list
    " vnoremap <A-/> :vimgrep/\%(\%'<\\|\%>'<\%<'>\\|\%'>\)/ %<left><left><left>
    " vnoremap <A-/> :call SearchForPatternInFunction()

    " function! SearchForPatternInFunction()
    " let search = input('Enter search pattern: ')

    " execute ":vimgrep/\%(\%'<\\|\%>'<\%<'>\\|\%'>\)" . search . "/ %"
    " endfunction

    nnoremap y<C-g> :let @+=expand("%") . ':' . line(".")<CR>:echo "File path and line copied to clipboard!"<CR>
    " @todo y1<C-g> possible too
  " }}}

  nnoremap <silent> <M-left>  :CmdResizeLeft<CR>
  nnoremap <silent> <M-down>  :CmdResizeDown<CR>
  nnoremap <silent> <M-up>    :CmdResizeUp<CR>
  nnoremap <silent> <M-right> :CmdResizeRight<CR>

  nnoremap <silent> <C-p> :FZF<CR>
  nnoremap <silent> <C-f> :Buffers<CR>

  nnoremap <silent> <leader>S :Tags<CR>
  nnoremap <silent> <leader>s :BTags<CR>

  nnoremap <silent> <leader>l :BLines<CR>

  nnoremap <C-w>\ <C-w>]
  nnoremap <C-w>] :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

  nnoremap <A-<> :SidewaysLeft<cr>
  nnoremap <A->> :SidewaysRight<cr>

  nnoremap <silent> <BS>  :TmuxNavigateLeft<cr>
  nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
  nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
  nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
  nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

  nnoremap <silent> Q :call CloseSplitOrDeleteBuffer()<CR>
  nnoremap <silent> <leader>Q :qa!<CR>

  nnoremap <leader><F10> :ToggleIgnoreFile<CR>

  " Search
  imap <c-x><c-f> <plug>(fzf-complete-path) 

  " nnoremap n nzz<Plug>Pulse
  " nnoremap N Nzz<Plug>Pulse

  nnoremap <silent> n :<C-U>call <SID>maybe_zz('norm! '.v:count1.'Nn'[v:searchforward])<CR><Plug>Pulse
  nnoremap <silent> N :<C-U>call <SID>maybe_zz('norm! '.v:count1.'nN'[v:searchforward])<CR><Plug>Pulse

  nnoremap * *Nzz<Plug>Pulse
  nnoremap # #Nzz<Plug>Pulse
  nnoremap g* g*Nzz<Plug>Pulse
  nnoremap g# g#Nzz<Plug>Pulse

  " Pulses cursor line on first match
  " when doing search with / or ?
  cmap <silent> <expr> <enter> search_pulse#PulseFirst()


  nnoremap <space>q :Rg <C-r><C-w><CR>
  xnoremap <space>q :<C-u>let @a=VisualSelection()<CR> :Rg <C-r>a<CR> 

  nnoremap <leader>gc :GetNamespaceAndClassAndMethod<CR>

  nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>

  nnoremap q<Space> :History:<CR>

  nnoremap <A-m> :TagbarToggle<CR>

  nnoremap <leader>do :silent execute 'g/'.g:vdebug_options["marker_closed_tree"]."/normal \<lt>CR>"<CR>

  " Save file using C-S
  " noremap  <silent> <C-S> :update<CR>
  " vnoremap <silent> <C-S> <C-C>:update<CR>
  " imap <C-S> <Plug>(PearTreeFinishExpansion):update<CR>
  " imap <esc> <Plug>(PearTreeFinishExpansion)

  nnoremap gs :update<CR>
  nnoremap gS :bufdo update<CR>

  " toggle comment state for current and next line tpope/vim-commentary
  nmap gC gccjgcck

  " output php result in near window
  "@todo put this in some menu
  " nnoremap <M-e> <C-w>lggVGd:silent r!php /tmp/sandbox.php<CR><C-w>h

  "<leader>i F_T import thing (package, namespace, filepath)
  "<leader>e F_T expand thing (package, namespace, filepath)

  " substitute word under cursor
  nnoremap <leader>cw :s:<C-r><C-w>::g<left><left>

  " substitute visual selection
  vnoremap <leader>cw :s:::g<left><left>

  nnoremap <C-w>n :tabnew<CR>



" }}}

" Spell {{{
  inoreabbrev emoji:) 😊
  inoreabbrev emoji:thumbsup: 👍
  inoreabbrev emoji:clock: ⏳
  inoreabbrev emoji:? ⁉️
" }}}


if (filereadable(expand("~/.config/nvim/init.local.vim")))
  silent source ~/.config/nvim/init.local.vim
endif
