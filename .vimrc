" nnoremap <C-l> :py3 ZoomIn()<CR>
" nnoremap <C-j> :py3 SaveAll()<CR>
" nnoremap <C-i> :py3 SummarizeWebPage()<CR>
" nnoremap <C-h> :py3 InsertRandomHash()<CR>
" nnoremap <C-k> :py3 WriteBack()<CR>
" nnoremap <C-o> :py3 WriteBack()<CR>zo
" nnoremap <C-e> :py3 print(current_file_name())<CR>

set tabstop=2
set shiftwidth=2

set autoindent
set foldmethod=indent

nnoremap ;k :execute "normal! " . winheight(0) . "k"<CR>
nnoremap ;j :execute "normal! " . winheight(0) . "j"<CR>

nnoremap ;w :w<CR>
nnoremap ;a :echo "no need to do this"<CR>
nnoremap ;q :q<CR>

nnoremap ;p :pwd<CR>
nnoremap ;x :Explore<CR>

nnoremap ;e :e<CR>

set number

set colorcolumn=80

function! s:insert_gates()
  let gatename = substitute(toupper(expand(("%:r"))), "\/", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename . " "
  execute "normal! Go#endif /* " . gatename . " */"
  normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

nmap ;h :py3 SwitchFileType('h')<CR>
nmap ;c :py3 SwitchFileType('cc')<CR>
nmap ;t :py3 SwitchFileType('test')<CR>
nmap ;b :py3 SwitchFileType('b')<CR>

" nmap ,h :find %:t:r.h<CR>
" nmap ,c :find %:t:r.cc<CR>
" nmap ,b :find %:p:h:t/BUILD<CR>

set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/live.vim

set hidden

" nmap <C-j> :CtrlPBuffer<CR>
nmap <C-j> :CtrlPMRU<CR>

nmap ;f :! clang-format -i %<CR>

nnoremap ;s :%s/\<<C-r><C-w>\>/

