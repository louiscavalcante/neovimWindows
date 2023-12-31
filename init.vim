" ----------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

" Plugins
Plug 'Yggdroot/indentLine'
Plug '907th/vim-auto-save'
Plug 'mhinz/vim-startify'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'
Plug 'preservim/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'godlygeek/tabular'
Plug 'joshdick/onedark.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" ----------------------------------------------------------------------------

filetype off
filetype plugin on
"filetype plugin indent on

" ----------------------------------------------------------------------------

" Remaped Keys
nnoremap <C-\> :NERDTreeToggle<cr> " CTRL+\ Opens / Closes NERDTree
nnoremap <space> za " SPACE Folds / Unfolds your code under your cursor line
nnoremap <C-I> :bn<cr> " CTRL+TAB Goes to the next buffer
nnoremap <C-S-I> :bp<cr> " CTRL+SHIFT+TAB Goes to the previous buffer
nnoremap <C-x> :bp \|bd #<cr> " CTRL+x Closes the current buffer if saved
nnoremap <C-z> :Startify<cr> " CTRL+z Opens Startify
map cc <Plug>NERDCommenterInvert " cc Comment / Uncomment the line under your cursor
nmap <silent> <C-j> <Plug>(ale_previous_wrap) " CTRL+j Next line of code error
nmap <silent> <C-k> <Plug>(ale_next_wrap) " CTRL+k Previous line of code error
nmap <F2> <Plug>(coc-rename) " Renames every usable instance of the word

" ----------------------------------------------------------------------------

" General Configs
syntax on
set mouse=
set history=500
set autoindent
set smartindent
set shiftwidth=2 tabstop=2 softtabstop=2 shiftround expandtab
set backspace=eol,start,indent " Makes backspace a bit nicer
set nofoldenable
set foldmethod=indent
set foldlevel=99
set number
set encoding=utf-8
set clipboard=unnamedplus " Makes desktop clipboard work
set guifont=FantasqueSansMono_NF:h11
set noswapfile
set nocompatible

" ----------------------------------------------------------------------------

" Searching
set ignorecase
set smartcase
set gdefault
set hlsearch
set showmatch
set incsearch
set hidden " Enable jumping into files in a search buffer

" ----------------------------------------------------------------------------

" Gvim Visual Configs
set guioptions-=m " Removes menu bar
set guioptions-=T " Removes toolbar
set guioptions-=r " Removes right-hand scroll bar
set guioptions-=L " Removes left-hand scroll bar
highlight Normal guifg=white guibg=gray15
set background=dark

" ----------------------------------------------------------------------------

" Colors
set termguicolors
colorscheme onedark

" ----------------------------------------------------------------------------

" IndentLine Configs
let g:indentLine_char_list = ['┆']

" ----------------------------------------------------------------------------

" Autosave Configs
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1
let g:auto_save_events = ["InsertLeave", "CursorHold"]

" ----------------------------------------------------------------------------

" Startify Configs
let g:startify_files_number = 21
let g:startify_custom_header = []

" ----------------------------------------------------------------------------

" Airline Configs
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_statusline_ontop=0
let g:airline_theme='deus'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#ale#enabled = 1 " Working with Ale

" ----------------------------------------------------------------------------

" Ale Configs
let g:ale_linters = {'python': ['flake8', 'pylint'], 'javascript': ['eslint']}
let g:ale_completion_enabled = 0
set updatetime=300
let g:ale_disable_lsp = 1
let g:ale_javascript_eslint_suppress_missing_config = 1

" ----------------------------------------------------------------------------

" Nerdcommenter Configs
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" ----------------------------------------------------------------------------

" Ctrlp Configs
let g:ctrlp_show_hidden = 1
let g:ctrlp_user_command = 'dir %s /-n /b /a-d' " previous command = 'dir %s /-n /b /s /a-d'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" ----------------------------------------------------------------------------

" NERDTree Configs
cd C:\\ " Root folder for NERDTree
let g:NERDTreeShowHidden=1

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" ----------------------------------------------------------------------------

" Coc Configs
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-sh',
  \ 'coc-python',
  \ 'coc-jedi',
  \ 'coc-snippets',
  \ 'coc-git',
  \ 'coc-emmet',
  \ 'coc-eslint',
  \ 'coc-sql'
  \ ]
  
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" ----------------------------------------------------------------------------
