set nocompatible
filetype off

" plugins
call plug#begin('~/.vim/plugged')

" language integration
Plug 'fatih/vim-go'
Plug 'leafgarland/typescript-vim'
Plug 'thanethomson/vim-jenkinsfile'
Plug 'tianon/vim-docker'
Plug 'hashivim/vim-terraform'
Plug 'thecodesmith/vim-groovy'

" useful plugins
Plug 'vim-airline/vim-airline'
Plug 'craigemery/vim-autotag'
Plug 'alvan/vim-closetag'
Plug 'junegunn/fzf'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'github/copilot.vim'
Plug 'Yggdroot/indentLine'
Plug 'uarun/vim-protobuf'
Plug 'vim-test/vim-test'

"" colorscheme
Plug 'fatih/molokai'
call plug#end()

filetype plugin indent on


"  -----------------------------------------
"  ctags settings
set tags=tags;/

"  -----------------------------------------
" ycm settings
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion  = 1
let g:ycm_language_server =
  \ [
  \   {
  \     'name': 'gopls',
  \     'cmdline': [ 'gopls' , "-rpc.trace" ],
  \     'filetypes': [ 'go' ],
  \     "project_root_files": [ "go.mod" ]
  \   }
  \ ]

"  -----------------------------------------
" gopls settings
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

"  -----------------------------------------
" terraform settings
let g:terraform_align=1
let g:terraform_fmt_on_save=1

"  -----------------------------------------
" vim-closetag settings
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_filetypes = 'html,xhtml,phtml'

"  -----------------------------------------
" map ctrl+p to fzf
nmap <C-P> :FZF<CR>

"  -----------------------------------------
" copilot settings
let g:copilot_filetypes = {
	\ '*': v:true,
	\ }


" -----------------------------------------
" aireline settings
let g:airline#extensions#tabline#enabled = 1
" not working
map <C-Tab> :bn<CR>
map <C-S-Tab> :bp<CR>

"  -----------------------------------------
"  coc
"
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"  -----------------------------------------
"  vim-test
" make test commands execute using dispatch.vim
" let test#strategy = "neovim"

"  -----------------------------------------
" non plugin settings
set tabstop=2
set hlsearch
set softtabstop=2
set shiftwidth=2
set noexpandtab

autocmd FileType php set tabstop=4|set softtabstop=4|set shiftwidth=4|set expandtab
autocmd FileType ruby set tabstop=2|set softtabstop=2|set shiftwidth=2|set expandtab
autocmd FileType yaml set tabstop=2|set softtabstop=2|set shiftwidth=2|set expandtab
autocmd FileType erb set tabstop=2|set softtabstop=2|set shiftwidth=2|set expandtab
autocmd FileType make set tabstop=4|set softtabstop=4|set shiftwidth=4|set noexpandtab
autocmd FileType cpp set tabstop=2|set softtabstop=2|set shiftwidth=2|set expandtab
autocmd FileType c set tabstop=2|set softtabstop=2|set shiftwidth=2|set expandtab
autocmd FileType cs set tabstop=4|set softtabstop=4|set shiftwidth=4|set noexpandtab
autocmd FileType lua set tabstop=2|set softtabstop=2|set shiftwidth=2|set expandtab
autocmd FileType javascript set tabstop=2|set softtabstop=2|set shiftwidth=2|set expandtab
autocmd FileType json set tabstop=2|set softtabstop=2|set shiftwidth=2|set expandtab
autocmd FileType html set tabstop=4|set softtabstop=4|set shiftwidth=4|set expandtab
autocmd FileType batch set tabstop=2|set softtabstop=2|set shiftwidth=2|set expandtab
autocmd FileType python set tabstop=4|set softtabstop=4|set shiftwidth=4|set expandtab
autocmd FileType groovy set tabstop=2|set softtabstop=2|set shiftwidth=2|set expandtab

autocmd FileType go set tabstop=4|set softtabstop=4|set shiftwidth=4|set noexpandtab
autocmd BufRead,BufNewFile *.go set filetype=go

autocmd FileType cftemplate set tabstop=2|set softtabstop=2|set shiftwidth=2|set expandtab
autocmd BufRead,BufNewFile *.template set filetype=cftemplate

autocmd FileType proto set tabstop=2|set softtabstop=2|set shiftwidth=2|set expandtab
autocmd BufRead,BufNewFile *.proto set filetype=proto

autocmd FileType typescript set tabstop=2|set softtabstop=2|set shiftwidth=2|set expandtab
autocmd BufRead,BufNewFile *.ts set filetype=typescript

set ai
set si

set nowrap
set listchars=extends:>,precedes:<
set showmatch
set scrolloff=3

set nu
set ru
set nostartofline

if has("multi_byte")
	set encoding=utf-8
	setglobal fileencoding=utf-8
	"setglobal bomb
	set fileencodings=utf-8,euc-jp
	set termencoding=utf-8

	if &termencoding == ""
		let &termencoding = &encoding
	endif
endif

"" colorscheme
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
	" Preparation: save last search, and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")
	" Do the business:
	%s/\s\+$//e
	" Clean up: restore previous search history, and cursor position
	let @/=_s
	call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

set laststatus=2
" set clipboard=exclude:.*


" disable json conceal
let g:indentLine_setConceal = 0 |
let g:vim_json_syntax_conceal = 0
