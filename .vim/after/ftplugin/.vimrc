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
noremap - <Nop>
noremap - ;
" ## ------------------------------------- 
noremap <Down>t :terminal<CR>
" ## ------------------------------------- 
nnoremap <C-j> :call Tab_switch()<CR>
tnoremap <C-j> <C-w>w:res 13<CR>
nnoremap <C-m> :res 20<CR>
nnoremap <C-b> :%s/\n\{3,\}/\r\r/<CR>
tnoremap <C-v> <C-w>N

function! Tab_switch()
  if winheight(0) >= 13
    execute "wincmd w"
  endif
  execute ":res 13"
"   let l:buff = buffer_name()
  " if l:buff == '!R'
  "   if mode() == 'n'
  "     execute 'normal i'
  "   endif
  " endif
endfunction

" ## ---------------------------------------------------------------------- 
vnoremap <C-y> "+y
nnoremap <C-p> "+p
" inoremap ;t <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
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
nnoremap <Tab>i :Tc<CR>
nnoremap <Tab>k :T
" ## ---------------------------------------------------------------------- 
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
