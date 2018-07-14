set encoding=utf-8
" syntax on

" START Bundles
execute pathogen#infect()
execute pathogen#infect('bundle.remote/{}')
" END

" START From  .../usr/share/vim/vim80/vimrc_example.vim 
source $VIMRUNTIME/defaults.vim

set sbr=▷\ \ 
set linebreak
set directory=~/.vim/swap//
" if has('persistent_undo')
"   set undofile  " keep an undo file (undo changes after closing)
" endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

packadd matchit
" END

" Enable more goodies from the distribution
runtime ftplugin/man.vim

" See if_pyth.txt
set pyx=3

" See
" https://stackoverflow.com/questions/7271129/problem-with-vim-omnicomplete-and-system-python
" Disable to hand over to Jedi.vim
" autocmd FileType python setlocal omnifunc=python3complete#Complete

" TODO
" vimwiki
" let g:vimwiki_list = [
"             \ {'path': '~/vimwiki/', 
"             \  'syntax': 'markdown',
"             \  'ext': '.md'
"             \  }]

" Too slow, at least on tablet
" " calendar.vim
" let g:calendar_google_calendar = 1
" let g:calendar_google_task = 1

" let g:seoul256_background = 232
" colo seoul256
set bg=dark
colorscheme chroma

let g:ScreenImpl = 'GnuScreen'

let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 0

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
" njj: matcher_length useful?
" call deoplete#custom#source('_', 'matchers', ['matcher_head', 'matcher_length'])

let g:tagbar_zoomwidth = 0

let g:tagbar_type_rst = {
    \ 'ctagstype': 'rst',
    \ 'ctagsbin' : '~/bin/rst2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
    \ }

" njj: running out of memory??
" let g:easytags_async = 1
" njj: too slow without async
let g:easytags_auto_update = 0

set wildmode=longest:full

set hidden

set tabstop=4
set shiftwidth=4
set expandtab

" === BACKUP SETTINGS === START
" From https://stackoverflow.com/a/38479550/274318
" turn backup OFF
" Normally we would want to have it turned on. See bug and workaround below.
" OBS: It's a known-bug that backupdir is not supporting
" the correct double slash filename expansion
" see: https://github.com/vim/vim/issues/179
set nobackup

" set a centralized backup directory
set backupdir=~/.vim/backup//

" This is the workaround for the backup filename expansion problem.
autocmd BufWritePre * :call SaveBackups()

function! SaveBackups()
  if expand('%:p') =~ &backupskip | return | endif

  " If this is a newly created file, don't try to create a backup
  if !filereadable(@%) | return | endif

  for l:backupdir in split(&backupdir, ',')
    :call SaveBackup(l:backupdir)
  endfor
endfunction

function! SaveBackup(backupdir)
  let l:filename = expand('%:p')
  if a:backupdir =~ '//$'
      let l:backup = escape(substitute(l:filename, '/', '%', 'g')  . &backupext, '%')
  else
      let l:backup = escape(expand('%') . &backupext, '%')
  endif

  let l:backup_path = a:backupdir . l:backup
  :silent! execute '!cp ' . resolve(l:filename) . ' ' . l:backup_path
endfunction
" === BACKUP SETTINGS === END

" MAPPINGS
" From
" http://vim.wikia.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Browse from directory of current file
" From https://github.com/junegunn/fzf.vim/issues/360
nnoremap <silent> <Leader><Leader> :Files <C-R>=expand('%:h')<CR><CR>
