
let g:vim_markdown_folding_level=2
let g:vim_markdown_folding_disabled=0

let @x='/{.comment-start?\[d%d%/{.comment-end?\[d%d%'
let @c='di[la{.comment-startlaP`]a[la{.comment-end?{.comment-startb'
let @d='/{\.deletion?\[d%d%'
let @i='/{\.insertiond%?\[%x``x'
let @u='/{.underline?\[%x``x/{.underlined%'
let @n=':s/\v^/>&/g'
let @k='a'

function! Search_citeError()
      /\v([^\[])@<=\^[0-9\-]*\^
endfunction

iabbrev mdper [person]:<Esc>
iabbrev mdarm [arms]:<Esc>
iabbrev mdmag [magic]:<Esc>
iabbrev mda [annotation]: main: main:<Esc>

iabbrev ffig {@fig:}{nolink=True}<Esc>F:
iabbrev sfig S{@s.fig:}{nolink=True}<Esc>F:
iabbrev stab S{@s.tab:}{nolink=True}<Esc>F:
iabbrev mdc [citation]:
iabbrev nsp &ensp;&ensp;

" inoremap <Space>1 ·
" inoremap <Space>9 :
" set foldexpr=getline(v:lnum)=~'^[^&#]'
" set fdm=expr
"
vnoremap ;cu :s/#\'[^a-z]\{0,1\}//g<CR>
vnoremap ;cc :s/^/#\' /g<CR>

inoremap <C-j> <Esc>:call Insert_line()<CR>i

inoremap ;t <C-R>='[writeTime]: ' . strftime("%H:%M:%S %Y-%m-%d")<CR>
inoremap // “”<Left>
inoremap <C-l> <Right>

nnoremap <C-j> gj
nnoremap <C-k> gk
nnoremap <C-f> {v}gq

function! ChineseCount() range
	let save = @z
	silent exec 'normal! gv"zy'
	let text = @z
	let @z = save
	silent exec 'normal! gv'
	let cc = 0
	for char in split(text, '\zs')
		if char2nr(char) >= 0x2000
			let cc += 1
		endif
	endfor
	echo "Count of Chinese charasters is:" . cc
	echo cc
endfunc

vnoremap ;c :call ChineseCount()<cr>

