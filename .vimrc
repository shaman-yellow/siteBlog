source ~/.vim/after/ftplugin/.vimrc

set vb t_vb=
au GuiEnter * set t_vb=

set mouse =
let g:translator_outputype='popup'
let g:translator_channel='youdao'
set linespace=10
let g:ale_sign_column_always = 1
let g:ale_fixers = {'Rscript': ['styler']}
set wildmode=longest,list
set path+=~/outline/**
set path+=~/MCnebula2/**
" set path+=~/utils.tool/**
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
let R_assign = 2
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
" Plugin 'plasticboy/vim-markdown'
Plugin 'lervag/vimtex'
Plugin 'iamcco/markdown-preview.nvim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'dense-analysis/ale'
Plugin 'mikelue/vim-maven-plugin'
Plugin 'jalvesaq/Nvim-R'
Plugin 'tpope/vim-unimpaired'
Plugin 'bujnlc8/vim-translator'
" Plugin 'Yggdroot/indentLine'
Plugin 'easymotion/vim-easymotion'
Plugin 'preservim/tagbar'
Plugin 'ZSaberLv0/ZFVimIM'
Plugin 'ZSaberLv0/ZFVimJob'
Plugin 'ZSaberLv0/ZFVimIM_openapi'
Plugin 'shaman-yellow/pinyinDB'
Plugin 'pseewald/vim-anyfold'
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


nnoremap <C-n> :call Insert_line()<CR>i
function! Insert_line()
  let this = getline('.')
  if matchstrpos(this, "^\\s*$")[1] >= 0
    let this = 0
  else
    let this = 1
  endif
  let next = getline(line('.') + 1)
  if matchstrpos(next, "^\\s*$")[1] >= 0
    let next = 0
  else
    let next = 1
  endif
  if this == 1 && l:next == 1
    execute "normal 3o"
    execute "normal k"
  elseif this == 1 && l:next == 0
    execute "normal 2o"
  elseif this == 0 && l:next == 0
    execute "normal o"
  elseif this == 0 && l:next == 1
    execute "normal 2o"
    execute "normal k"
  endif
endfunction

" function! s:myLocalDb()
"   let db = ZFVimIM_dbInit({
"         \   'general' : 'pinyinDB',
"         \ })
"   call ZFVimIM_cloudRegister({
"         \   'mode' : 'local',
"         \   'dbId' : db['general'],
"         \   'repoPath' : '/home/echo/.vim/after/ftplugin/pinyinDB',
"         \   'dbFile' : '/pinyin_huge.txt',
"         \   'dbCountFile' : '/pinyin_huge_count.txt', 
"         \ })
" endfunction
" autocmd User ZFVimIM_event_OnDbInit call s:myLocalDb()

let g:zf_git_user_email='shaman-yellow@foxmail.com'
let g:zf_git_user_name='shaman-yellow'
let g:zf_git_user_token='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'

let g:ZFVimIM_symbolMap = {
            \   '`' : ['·'],
            \   '!' : ['！'],
            \   '$' : ['￥'],
            \   '^' : ['……'],
            \   '-' : [''],
            \   '_' : ['——'],
            \   '(' : ['（'],
            \   ')' : ['）'],
            \   '[' : ['【'],
            \   ']' : ['】'],
            \   '<' : ['<'],
            \   '>' : ['>'],
            \   '\' : ['、'],
            \   '/' : ['/'],
            \   ';' : ['；'],
            \   ':' : ['：'],
            \   ',' : ['，'],
            \   '.' : ['。'],
            \   '?' : ['？'],
            \   "'" : ['‘', '’'],
            \   '"' : ['“', '”'],
            \ }

" let &statusline='%{ZFVimIME_IMEStatusline()}'.&statusline
let g:ZFVimIM_autoAddWordLen=12


