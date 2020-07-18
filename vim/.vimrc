set tabstop=2
set shiftwidth=2
set autoindent
set laststatus=2

nnoremap ;k :execute "normal! " . winheight(0) . "k"<CR>
nnoremap ;j :execute "normal! " . winheight(0) . "j"<CR>

nnoremap ;w :w<CR>
nnoremap ;a :echo "no need to do this"<CR>
nnoremap ;q :qa<CR>

nnoremap ;p :pwd<CR>
nnoremap ;x :Explore<CR>

nnoremap ;e :e<CR>
vnoremap ;r :s/^/\/\//<CR>
vnoremap ,r :s/^..//<CR>

nnoremap ;v :terminal<CR>

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

nnoremap <C-f> :FZF<CR>
nnoremap <C-j> :FZFMru<CR>
nnoremap <C-k> :NERDTreeToggle<CR>

colorscheme gruvbox
set bg=dark

set hidden

nmap ;f :! js-beautify -r %<CR>
nmap ;g :! clang-format -i %<CR>
nmap ;d :! fixdeps %<CR>

nnoremap ;s :%s/\<<C-r><C-w>\>/

autocmd BufNewFile,BufRead *.vue set syntax=html

" autocmd BufNewFile,BufRead * execute "Goyo 80"

set noswapfile

" If installed using git
set rtp+=~/.fzf
