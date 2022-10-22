" ## ------------------------------------- 
" ## ------------------------------------- 
" ## ------------------------------------- 
" ## ---------------------------------------------------------------------- 
iabbrev ctl ## ----------------------------------------------------------------------
iabbrev ctm ## -------------------------------------
iabbrev cts ## ------------------
iabbrev ctn ##
" ## ---------------------------------------------------------------------- 
" ## math
iabbrev mmbe \begin{aligned}
iabbrev mmen \end{aligned}
iabbrev mm= &=
" ## ---------------------------------------------------------------------- 
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
" ## ---------------------------------------------------------------------- 
vnoremap <C-y> "+y
nnoremap <C-p> "+p
inoremap ;t <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
inoremap ;q <Esc>F<Space>xgi
inoremap ;u <Esc>b~gi
inoremap ;b  <Esc>dF_s_
inoremap ;. <Esc>bi.<Esc>ea
inoremap ;x <Esc>bxgi
" ## ------------------------------------- 
noremap <f2> :NERDTreeToggle<cr>
nnoremap ;v :tabe ~/.vimrc<CR>
nnoremap ;b :tabe ~/.bashrc<CR>
nnoremap ;q :q<CR>
nnoremap ;w :w
nnoremap ;s :source ~/.vimrc
nnoremap ;f :tabe ~/.vim/after/ftplugin/
nnoremap ;sf :source ~/.vim/after/ftplugin/
nnoremap <Space>j 6j
nnoremap <Space>k 6k
nnoremap <Space>gi :NERDTreeFind<CR><C-w><C-w>gi
nnoremap <Space>i :NERDTreeFind<CR>
nnoremap <Space>o :NERDTreeFocus
nnoremap <Space>w <C-w><C-w>
nnoremap tg gT
nnoremap ;e :tabnew<CR>:Startify<CR>
nnoremap ;n :nohlsearch<CR>
" ## ---------------------------------------------------------------------- 
set linespace=10
let g:ale_sign_column_always = 1
let g:ale_fixers = {'Rscript': ['styler']}
set wildmode=longest,list
set path+=~/outline/**
set path+=~/MCnebula/**
set path+=~/utils.tool/**
set path+=~/.vim/after/ftplugin/**
set completeopt-=preview
set spell
" set hlsearch
set ts=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
" autocmd FileType r setlocal indentexpr=RIndent_GVF(v:lnum)
autocmd FileType python setlocal et sta sw=4 sts=4
set scrolloff=5
set nofoldenable
set nu
syntax on
set cursorline
set laststatus=2
set ruler
colorscheme gruvbox   
set bg=dark
filetype plugin on
set guifont=Monospace\ 16
set guioptions-=m
set guioptions-=T

let mapleader = ","
let NERDSpaceDelims=1           
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDCompactSexyComs=1      
let g:NERDDefaultAlign='left' 
" autocmd vimenter * NERDTree

" ## ---------------------------------------------------------------------- 
set nocompatible              
filetype off   
set rtp+=~/.vim/bundle/Vundle.vim
" ## ---------------------------------------------------------------------- 
call vundle#begin()
	Plugin 'gmarik/Vundle.vim'
	Plugin 'scrooloose/nerdtree'
	Plugin 'mhinz/vim-startify' 
	Plugin 'jiangmiao/auto-pairs'
	Plugin 'morhetz/gruvbox'
	Plugin 'whatyouhide/vim-gotham'
	Plugin 'godlygeek/tabular'
	Plugin 'plasticboy/vim-markdown'
	" Plugin 'suan/vim-instant-markdown'
	Plugin 'lervag/vimtex'
	Plugin 'iamcco/markdown-preview.nvim'
	Plugin 'scrooloose/nerdcommenter'
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'dense-analysis/ale'
  Plugin 'mikelue/vim-maven-plugin'
call vundle#end()
filetype indent on
" ## ---------------------------------------------------------------------- 

" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

command! -nargs=1 -complete=file -bang Rename call Rename(<q-args>, '<bang>')

function! Rename(name, bang)
	let l:name    = a:name
	let l:oldfile = expand('%:p')

	if bufexists(fnamemodify(l:name, ':p'))
		if (a:bang ==# '!')
			silent exe bufnr(fnamemodify(l:name, ':p')) . 'bwipe!'
		else
			echohl ErrorMsg
			echomsg 'A buffer with that name already exists (use ! to override).'
			echohl None
			return 0
		endif
	endif

	let l:status = 1

	let v:errmsg = ''
	silent! exe 'silent! saveas' . a:bang . ' ' . l:name

	if v:errmsg =~# '^$\|^E329'
		let l:lastbufnr = bufnr('$')

		if expand('%:p') !=# l:oldfile && filewritable(expand('%:p'))
			if fnamemodify(bufname(l:lastbufnr), ':p') ==# l:oldfile
				silent exe l:lastbufnr . 'bwipe!'
			else
				echohl ErrorMsg
				echomsg 'Could not wipe out the old buffer for some reason.'
				echohl None
				let l:status = 0
			endif

			if delete(l:oldfile) != 0
				echohl ErrorMsg
				echomsg 'Could not delete the old file: ' . l:oldfile
				echohl None
				let l:status = 0
			endif
		else
			echohl ErrorMsg
			echomsg 'Rename failed for some reason.'
			echohl None
			let l:status = 0
		endif
	else
		echoerr v:errmsg
		let l:status = 0
	endif

	return l:status
endfunction
