  set nocompatible  "break compatibility with vi

  """"""""" vim options
  let mapleader=","   "all custom commands start with ,

  "UI SETTINGS
  " set termguicolors
  colorscheme monokai_pro "set the right colorscheme
  let g:lightline = {'colorscheme': 'monokai_pro', }
  "BUFFER MANAGEMENT`
  set hid           "Hides the current buffer instead of unloading
  set swb=usetab    "Quickfix will switch to the tab/split that the error is in
                    "instead of replacing the current buffer
  "let bclose_multiple = 0
                    " BClose does not close a buffer displayed in multiple
                    " windows.

  "" set term=dtterm   "So that the console vim has color
  
  set ru			"Show ruler (current line number, column number)
  set bs=2          "Allow backspacing over indents, lines, and start of insert
  set ww+=<,>,h,l	"Allow left and right movements to move to diff lines
  
  set dip+=vertical,iwhite   "diffs vertically by default, ignore whitespaces
  
  set nu            "Turn on line numbers
  
  set wmh=0         "Set minimum window height to 0 so that collapsed windows dont show 1 line of code
  set cin			"Use C-style auto-indentation
  set expandtab		"Use spaces instead of a tab (to insert tab anyway, in insert mode type Ctrl-V,Tab)
  set tabstop=4		"Manual tab indentation size
  set smartindent   "Smart indentation
  set shiftwidth=4	"Auto-indentation size

  "FILE TYPES"
  autocmd Filetype html       setlocal ts=2 sw=2 expandtab
  autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
  autocmd Filetype make       setlocal ts=4 sw=4 noexpandtab "Keep tabs for Makefiles


  "AUTOCOMPLETION
  set wildmode=longest,list 
  set complete-=i   "Ignores included files for autocompletion; makes if faster
  
  "SEARCH
  set ic			"ignore case in searches
  set smartcase		"don't ignore case in searches with any uppercase letters
  set incsearch     "jumps to search word as you type
  set hlsearch      "keep searched items highlighted

  syn on			"enable syntax highlighting

  set listchars=tab:»·,trail:·	"show »··· for each tab, · for each trailing space
  "set list			"display whitespace characters (\n, \t)
  
  "LINE LENGTH
  set nowrap           "dont wrap long lines
  set tw=79            "force lines to be 80 chars
  set wm=1             "wrap lines 1 char from 80  
  "set fo+=t           "wrap lines after 80 chars
  set colorcolumn=80   "draw a margin on line 80
  
  set sh=/bin/bash "use bash for shell
 
  "MOVEMENT
  nnoremap j gj
  nnoremap k gk

  "hilight parts of lines that are wider then textwidth
  au BufEnter *.c,*.cpp,*.f,*.h if &textwidth > 0 | exec 'match Todo /\%>' .  &tw . 'v.\+/' | endif
  
  "set silent (no beep)
  set vb t_vb=".
  
  "ignore certain filetypes in tab complete
  set wildignore=*.o,*.obj,*.bak,*.exe

  set makeprg=build.sh

  "set what is saved by mksession
  set sessionoptions=blank,buffers,curdir,folds,resize,tabpages,winpos,winsize 

  "enable doxygen comment syntax highlighting
  let g:load_doxygen_syntax=1

  "alternate between header and body
  "map <Leader>a :AS<CR><C-W>_
  map <Leader>a :AS<CR>
  
  "save and restore sessions
  map <Leader>q :mksession!<CR>:qa<CR>
  map <Leader>Q :source Session.vim<CR>

  """""""""" for enhcommentify
  let g:EnhCommentifyRespectIndent = 'Yes'
  let g:EnhCommentifyTraditionalMode = 'No'
  let g:EnhCommentifyFirstLineMode = 'Yes'
  
  """""""""" for vcscommand
  let g:VCSCommandMapPrefix = '<Leader>s'

  """""""""" for omnicppcomplete
  set nocp            "turn off compatible mode
  filetype plugin on  " turn on filetype detection
  "close the preview window after autocompletion
  autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
  autocmd InsertLeave * if pumvisible() == 0|pclose|endif
  
  """""""""" tags parser
  let Tlist_Ctags_Cmd = "ctags"
  let Tlist_Close_On_Select = 1
  let Tlist_Exit_OnlyWindow = 1
  let Tlist_Show_One_File = 1
  let Tlist_GainFocus_On_ToggleOpen = 1
  
  """"""""" CUSTOM KEYBINDINGS
  "map ; to : 
  nnoremap ; :
  
  " ESC with 'jj'
  inoremap jj <ESC>

  "brings up my .vimrc
  map <Leader>v :sp ~/.vimrc<CR><C-W>_
  
  "reloads it -- making all changes active (have to save first)
  map <silent> <Leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

  "INSERT NEWLINE WITHOUT ENTERING INSERT MODE
  map <C-S-Enter> o<Esc>
  map <Enter> i
  "map <CR> o<Esc>

  "Insert new line from current pos

  "Insert space from current pos and moves forward
  map <Space> i l

  "runs the current file through indent
  "map  <Leader>I :w<CR>:! indent %<CR>L:e<CR>
  "vmap <Leader>i !indent -st<CR>
  "map  <Leader>i !!indent -st<CR>
  
  "so you can use ctrl+hjkl to switch split windows
  map <C-k> <C-W>k<C-W>_
  map <C-j> <C-W>j<C-W>_
  map <C-h> <C-W>h
  map <C-l> <C-W>l
  
  "use space and backspace to go between tabs
  "map <Space> :tabn<CR>
  map <Backspace> :tabp<CR>
  
  "save all and make
  map <Leader>m :wa<CR>:mak<CR>
  
  "if this is the tab has no splits, vsp it else open a new tab and vsp that
  function TabSplit()
  	if tabpagewinnr( tabpagenr(), "$") != 1
          exec ":tabnew"
  	endif
      exec ":vsp"
  endfunction
  map <Leader>t :call TabSplit()<CR>
  
  "split in quarters
  map <Leader>T :tabnew<CR>:vsp<CR>:sp<CR><C-W>l:sp<CR>
  
  "toggle tags window
  "map <Leader>w :TlistToggle<CR>
  
  "recreate tags file for current file or for whole codebase
  map <Leader>e :!ctags -f /home/stefy/tags -a --langmap=c++: --fields=+iaS --extra=+q --c-kinds=+p --c++-kinds=+p %:p<CR>
  map <Leader>E :!ctags -f /home/stefy/tags -R --langmap=c++: --fields=+iaS --extra=+q --c-kinds=+p --c++-kinds=+p /home/stefy/<CR>
  
  "alternate between header and body
  map <Leader>a :AS<CR><C-W>_
  
  "save and restore sessions
  map <Leader>q :mksession!<CR>:qa<CR>
  map <Leader>Q :source Session.vim<CR>
  
  "remap shift-backspace in insert mode to actually do backspace (instead of
  "printing <S-Del>)
  imap <S-Del> <Backspace>
  
  "search for selected text, forwards or backwards
  vnoremap <silent> * :<C-U>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      \gvy/<C-R><C-R>=substitute(
      \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
      \gV:call setreg('"', old_reg, old_regtype)<CR>
  vnoremap <silent> # :<C-U>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      \gvy?<C-R><C-R>=substitute(
      \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
      \gV:call setreg('"', old_reg, old_regtype)<CR>
  
  "copy a header from a .h to a .cpp
  map <Leader>d :GHPH<CR>
  
  "make Y yank to end of line like C or X
  map Y y$
  
  "map Alt-< and Alt-> to jump the the prev/next line with same indentation
  nn <M-,> k:call search ("^". matchstr (getline (line (".")+ 1), '\(\s*\)') ."\\S", 'b')<CR>^ 
  nn <M-.> :call search ("^". matchstr (getline (line (".")), '\(\s*\)') ."\\S")<CR>^
  
  "make shift-insert paste
  "map <S-Insert> "+gP
  
  "make Shift-Insert behave like the xterm mouse middle button
  map <S-Insert> <MiddleMouse>
  imap <S-Insert> <Esc><S-Insert>a
  cmap <S-Insert> <C-R>+
  
  map <Leader>, :cp<CR>
  map <Leader>. :cn<CR>
  
  "grep for the word under the cursor (or last searched) in the code files in cur dir
  map <Leader>g :gr "<C-R><C-W>" -i *.c *.h *.cpp *.f *.inc<CR>
  map <Leader>G :gr "<C-R>/" -i *.c *.h *.cpp *.f *.inc<CR>
  
  "split a string at the 80th col
  map <Leader>l 81\|Bi"<CR>"<Esc>
  map <Leader>L Jhxxx
  
  map <Leader>/ :%s/\<<C-R><C-W>\>/

  set laststatus=2

  " CUSTOM COMMANDS
  "
  " FILTER
  command! -nargs=? Filter let @a='' | execute 'g/<args>/y A' | new | setlocal bt=nofile | put! a
