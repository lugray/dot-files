execute pathogen#infect()

syntax on
filetype plugin indent on

" Themeing
:colorscheme cobalt
hi Normal ctermbg=none guibg=none

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
function! SetMaxWidth(width)
execute "2match OverLength /\\%" . (a:width + 1) . "v.\\+/"
endfunction
command! -nargs=1 Smw call SetMaxWidth(<f-args>)
call SetMaxWidth(120)

set ruler
set number
set termguicolors
set number relativenumber
set nohlsearch

:let mapleader = "-"

augroup gitrebase
  autocmd FileType gitrebase command -range RebasePick <line1>,<line2>s/^\w\+ /pick /
  autocmd FileType gitrebase command -range RebaseReword <line1>,<line2>s/^\w\+ /reword /
  autocmd FileType gitrebase command -range RebaseEdit <line1>,<line2>s/^\w\+ /edit /
  autocmd FileType gitrebase command -range RebaseSquash <line1>,<line2>s/^\w\+ /squash /
  autocmd FileType gitrebase command -range RebaseFixup <line1>,<line2>s/^\w\+ /fixup /
  autocmd FileType gitrebase command -range RebaseExec <line1>,<line2>s/^\w\+ /exec /
  autocmd FileType gitrebase command -range RebaseDrop <line1>,<line2>s/^\w\+ /drop /

  autocmd FileType gitrebase map rp :RebasePick<CR>
  autocmd FileType gitrebase map rr :RebaseReword<CR>
  autocmd FileType gitrebase map re :RebaseEdit<CR>
  autocmd FileType gitrebase map rs :RebaseSquash<CR>
  autocmd FileType gitrebase map rf :RebaseFixup<CR>
  autocmd FileType gitrebase map rx :RebaseExec<CR>
  autocmd FileType gitrebase map rd :RebaseDrop<CR>
augroup END

set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Use share yank/paste with MacOS clipboard
set clipboard=unnamed

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

nnoremap <Leader>a :Ack!<Space>

" Navigate panes with C-motion
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Arrow keys
nnoremap <Up> :m .-2<cr>
nnoremap <Down> :m .+1<cr>
nnoremap <Left> <<
nnoremap <Right> >>

" Visual Arrow keys
vnoremap <Left> <gv
vnoremap <Right> >gv
vnoremap <Up> :m '<-2<CR>gv
vnoremap <Down> :m '>+1<CR>gv

" Shiftless command mode
nnoremap ; :
vnoremap ; :

" Commenting
" Apparently <C-_> maps <C-/>
nmap <C-_> <Plug>CommentaryLine
vmap <C-_> <Plug>Commentary

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

nnoremap <Leader>g :CtrlPBranchModified<CR>
nnoremap <Leader>d :CtrlPModified<CR>
let g:ctrlp#modified#excludes = "^vendor"
let g:gitgutter_diff_base = "origin/HEAD"
let g:gitgutter_diff_args = '-w'
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk<Paste>

nnoremap <Leader>m :wa <bar> make<CR>

function! QuickFixToggle()
  let curr = winnr()
  for i in range(1, winnr('$'))
    let bnum = winbufnr(i)
    if getbufvar(bnum, '&buftype') == 'quickfix'
      if curr != i
        copen
        return
      endif
      cclose
      return
    endif
  endfor
  copen
endfunction 
nnoremap <c-i> :call QuickFixToggle()<cr>

:set fillchars+=vert:⎸
:hi VertSplit guibg=bg guifg=#555555

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

set mouse=a


function! s:stripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")

  %s/\s\+$//e

  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
augroup stripTrailingWhitespacesPluginDetect
  autocmd FileType ruby,python,javascript autocmd BufWritePre <buffer> :call <SID>stripTrailingWhitespaces()
augroup END

function! Count(pattern)
  redir => cnt
    try
      silent exe '%s/' . a:pattern . '//gn'
    catch /E486:/
      0
    endtry
  redir END
  let res = strpart(cnt, 0, stridx(cnt, " "))
  return res
endfunction
highlight BadIndent ctermbg=red guibg=#db3d3d
function! SetBadIndent(char)
  try
    call matchdelete(3942)
  catch /E803:/
  endtry
  call matchadd('BadIndent', '^' . a:char . '\+', 10, 3942)
endfunction
function! DetectBadIndent()
  let l:tabs =  Count('^\t')
  let l:spaces =  Count('^ ')
  if l:tabs > l:spaces
    call SetBadIndent(' ')
  else
    call SetBadIndent('\t')
  endif
endfunction
augroup badIndentDetect
  autocmd BufRead * :call DetectBadIndent()
augroup END

:highlight Unapproachable ctermbg=red guibg=#db3d3d
call matchadd('Unapproachable', '\c\<\(obviously\|basically\|simply\|of course\|clearly\|just\|everyone knows\|however\|easy\)\>')
