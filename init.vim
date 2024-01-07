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
Plug 'vim-airline/vim-airline-themes'
Plug 'craigemery/vim-autotag'
Plug 'alvan/vim-closetag'
Plug 'junegunn/fzf'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'github/copilot.vim'
Plug 'uarun/vim-protobuf'
Plug 'vim-test/vim-test'
Plug 'codota/tabnine-nvim', { 'do': './dl_binaries.sh' }
" Plug 'rhysd/reply.vim', { 'on': ['Repl', 'ReplAuto'] }

"" colorscheme
Plug 'fatih/molokai'
call plug#end()

"  -----------------------------------------
"  ctags settings
set tags=tags;/

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
" airline#extensions#tabline#enabled settings
let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme = 'hatsunemiku'

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

" tabnine
" lua <<EOF
" require('tabnine').setup({
"   disable_auto_comment=true,
"   accept_keymap="<Tab>",
"   dismiss_keymap = "<C-]>",
"   debounce_ms = 800,
"   suggestion_color = {gui = "#808080", cterm = 244},
"   exclude_filetypes = {"TelescopePrompt"},
"   log_file_path = nil, -- absolute path to Tabnine log file
" })
" EOF


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
" let g:rehash256 = 1
" let g:molokai_original = 1
" colorscheme molokai
if !has('gui_running') && has('termguicolors')
  " Use true colors (recommended)
  set termguicolors
endif
syntax enable

" for dark theme
colorscheme hatsunemiku

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
"

function PipeGPT(task)
	" backup current yanked text
	let l:old_reg = @@

	" get selected text
	let [line_start, col_start] = getpos("'<")[1:2]
	let [line_end, col_end] = getpos("'>")[1:2]

	" yank the visually selected text
	execute 'normal! ' . line_start . 'G' . col_start . '|v' . line_end . 'G' . col_end . '|y'
	let l:content = @@

	" run pipegpt
	let l:tmpfile = trim(system("mktemp"))
	" save the content to a tmp file
	call writefile(split(l:content, "\n"), l:tmpfile)
	let l:output = system("cat " . l:tmpfile . " | pipegpt " . a:task)

	" write the output
	call writefile(split(l:output, "\n"), l:tmpfile)

	" open the tmp file
	execute "vsplit " . l:tmpfile
	setlocal filetype=markdown
	setlocal wrap

	" restore the yanked text
	let @@ = l:old_reg
endfunction

command -range MikuReview call PipeGPT("review")
command -range MikuExplain call PipeGPT("explain")
command -range MikuTestcode call PipeGPT("testcode")
command -range MikuRefactor call PipeGPT("refactor")
command -range MikuComplete call PipeGPT("complete")

" adjust split size
noremap <silent> <C-S-Left> :vertical resize +2<CR>
noremap <silent> <C-S-Right> :vertical resize -2<CR>
noremap <silent> <C-S-Up> :resize +2<CR>
noremap <silent> <C-S-Down> :resize -2<CR>
