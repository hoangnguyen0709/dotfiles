#!/bin/bash
# - Git config global (cannot cat directly to ~/.bash_profile ??)
# - Update bash_profile

bash_profile=".bashrc"
vifile=".vifile"
vimrc=".vimrc"
usr="Hoang Nguyen"
mail="htnguyen@axon.com"

command -v git >/dev/null 2>&1 ||
{ echo >&2 "Git is not installed. Installing..";
  sudo yum install -y git
}

cd ~
# Git
echo ""
echo ""
echo "Git first time config - Start"
git config --global user.name "$usr"
git config --global user.email "$mail"
git config --global alias.lg "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)'"
git config --global alias.last "log -n 1 --name-status"
git config --global alias.br "branch"
git config --global alias.st "status"
git config --global alias.co "checkout"
git config --global core.editor "vim"
echo "Git first time config - Done"
echo "Content: "
git config --global -l

# VIM
echo "Update VIM setting"
cd ~
/bin/cat <<EOM >> $vifile
" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function! Make_Comments()
   if(&ft == "asm")                                "asm
     :s/^/; /
   elseif ((&ft == "verilog") || (&ft == "sc"))    "verilog
     :s/^/\/\/ /
   elseif ((&ft == "c") || (&ft == "cpp"))         "C
     :s/^/\/\/ /
   elseif (&ft == "vim")                           "vim
     :s/^/" /
   elseif (&ft == "matlab")                        "Matlab
     :s/^/% /
   elseif (&ft == "psl")                           "PSL
     :s/^/\/\/ /
   else                                            "csh, perl, tcl
     :s/^/# /
   endif
":%s/a/b/g
":%s/b/2/g
":%s/c/3
endfunction
":com Make_Comments call Make_Comments()
:map <C-W><C-D> :call Make_Comments()<CR>
" ---------------------------------------------------------

" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function! Make_Uncomments()
  if(&ft == "asm")                               " asm
    if( getline('.') =~ '^ *;')                " if line start with zero or more spaces followed by ;
      :s/^\( *\); \=/\1/
    endif
  elseif ((&ft == "verilog") || (&ft == "sc"))    "verilog
    if( getline('.') =~ '^ *\/\/')             " if line start with zero or more spaces followed by //
      :s/^\( *\)\/\/ \=/\1/
    endif
  elseif ((&ft == "c") || (&ft == "cpp"))         "C
    if( getline('.') =~ '^ *\/\/')             " if line start with zero or more spaces followed by //
      :s/^\( *\)\/\/ \=/\1/
    endif
  elseif (&ft == "vim")                           " vim
    if( getline('.') =~ '^ *"')
      :s/^\( *\)" \=/\1/
    endif
  elseif (&ft == "matlab")                        " Matlab
    if( getline('.') =~ '^ *%')
      :s/^\( *\)% \=/\1/
    endif
  elseif (&ft == "psl")                           " PSL
    if( getline('.') =~ '^ *\/\/')
      :s/^\( *\)\/\/ \=/\1/
    endif
  else                                            " csh, perl, tcl
    if( getline('.') =~ '^ *#')                " if line start with zero or more spaces followed by #
      :s/^\( *\)# \=/\1/
    endif
  endif
endfunction
:map <C-W><C-F> :call Make_Uncomments()<CR>

EOM

/bin/cat <<EOM >> $vimrc

:so ~/.vifile
" Disable ELP
:let g:loaded_logipat = 1
" :set noap
"80 char
:let &colorcolumn=join(range(81,999),",")
:set wildmode=list
:set foldenable
:set sm
:set ts=4
:set cwh=1
:set wiw=1
":set textwidth=80
:set cindent shiftwidth=4
:set autoindent
" Display the number of <line>,<column>
" at the Right-Bottom of the screen.
:set ruler
:set ai
":set expandtab
" Display command that are typing.
:set showcmd
" Display a line that indicate where the cursor is.
"
":set cursorline " VIM7 only
"
":set cursorcolumn
" Display line number on the left of each line.
" :set number
" set the Width of a number (when :set number)
":set numberwidth=4
:set hlsearch
:set incsearch
" set <backspace> key can delete all.
:set bs=2
:%retab!
:filetype plugin on
:highlight ColorColumn ctermbg=7 guibg=#2c2d27
if !exists("syntax_on")
  syntax on
endif
" enable mouse
:se mouse=a
:filetype plugin on
"
"set vimdiff color
:se t_Co=256
"set display color for diff
" :highlight Comment  ctermfg=darkblue
:highlight Keyword start=t_if stop=t_end
:highlight   Search      term=reverse    cterm=underline         ctermbg=9
:highlight   DiffText    term=reverse    cterm=bold,underline    ctermbg=15
":highlight   CursorLine  term=reverse  cterm=none             ctermbg=11
":highlight   Cursorcolumn  term=reverse  cterm=bold  ctermbg=lightred
:highlight   Cursorcolumn  term=reverse  cterm=bold ctermfg=white ctermbg=Grey
:highlight Pmenu ctermbg=15 ctermfg=darkcyan
:highlight PmenuSel term=reverse ctermbg=15 ctermfg=yellow
" ===============================================
:au BufNewFile,BufRead   *.sh        set filetype=csh
:au BufNewFile,BufRead   *.sv        set filetype=verilog_systemverilog
:au BufNewFile,BufRead   *.v        set filetype=verilog
:au BufNewFile,BufRead   *.psl       set filetype=psl
:au BufNewFile,BufRead   *.log       set filetype=help
:au BufNewFile,BufRead   *.exrc      set filetype=vim
:au BufNewFile,BufRead   *.vimrc     set filetype=vim
:au BufNewFile,BufRead   *.vifile    set filetype=vim
:au BufNewFile,BufRead   *.program    set filetype=plex
:au BufNewFile,BufRead   *.sparam    set filetype=plex
:au BufNewFile,BufRead   *.ssurv    set filetype=plex

" ===============================================
" au FileType verilog set mps+=<:>

" ===============================================
if !exists("syntax_on")
  source ~/.vim/syntax/psl.vim
  source ~/.vim/syntax/verilog_systemverilog.vim
  source ~/.vim/syntax/plex.vim
endif

" ===============================================
:filetype plugin on
:abbreviate #b //****************************************//
:abbreviate #d use Data::Dumper;
:abbreviate #p print "Line - " . __LINE__ . ":" . Dumper() . "\n";

EOM

# ~/.bash_profile
echo "Update $bash_profile"
cd ~
/bin/cat <<EOM >> $bash_profile
# --- Global
alias cl=clear
alias ll="ls -lrht"
alias sbashrc="source ~/$bash_profile"
alias vbashrc="vi ~/$bash_profile"
alias cbashrc="cat ~/$bash_profile"
alias vifile="vim -X ~/.vifile"
alias vimrc="vim -X ~/.vimrc"

# ---
function start_box() {
    sudo salt-cloud -a start dus1uw2lbox"\$1" dus1uw2wbox"\$1"
}

function stop_box() {
    sudo salt-cloud -a stop dus1uw2lbox"\$1" dus1uw2wbox"\$1"
}

function reboot_box() {
    sudo salt-cloud -a reboot dus1uw2lbox"\$1" dus1uw2wbox"\$1"
}

function set_hostname() {
    sudo hostnamectl set-hostname dus1uw2lbox"$1".taservs.net
}

export PATH=\$PATH:\$HOME/work/Plumbus/lboxTools

# PS1
RED_WO_ESC="\e[31m"
GREEN_WO_ESC="\e[1;32m"
YELLOW_WO_ESC="\e[1;33m"
CYAN_WO_ESC="\e[0;36m"

NO_COLOR="\[\033[00m\]"
RED="\[$RED_WO_ESC\]"
GREEN="\[$GREEN_WO_ESC\]"
YELLOW="\[$YELLOW_WO_ESC\]"
LIGHT_BLUE="\[\e[1;34m\]"
CYAN="\[$CYAN_WO_ESC\]"
WHITE="\[\e[1;37m\]"

OPEN_PARANTHESE="$WHITE("
CLOSE_PARANTHESE="$WHITE)"

DASH="\342\224\200"

# SPECIAL_CHAR_LINE1="\342\224\214"
# SPECIAL_CHAR_LINE2="\342\224\224\342\206\222>"
SPECIAL_CHAR_LINE1=$DASH
SPECIAL_CHAR_LINE2="$DASH$DASH>>"

function parse_git_branch ()
{
    local GITDIR=`git rev-parse --show-toplevel 2>&1` # Get root directory of git repo
    if [[ "$GITDIR" != '~' ]] # Don't show status of home directory repo
    then
        # Figure out the current branch, wrap in brackets and return it
        local BRANCH=`git branch 2>/dev/null | sed -n '/^\*/s/^\* //p'`
        if [ -n "$BRANCH" ]; then
            echo -e "($BRANCH) "
        fi
    else
        echo ""
    fi
}

if [ -z $PS1_org_flag ]; then
    PS1_backup=$PS1
    PS1_org_flag=1
fi

function ps1_default ()
{
    PS1=$PS1_backup
}

function ps1_update1 () {

    local EC=\$?

    PS1='\n'$WHITE''$SPECIAL_CHAR_LINE1''$OPEN_PARANTHESE'\
'$YELLOW'$?\
'$CLOSE_PARANTHESE''$DASH''$OPEN_PARANTHESE'\
`if [ "'$EC'" = 0 ]; then echo "'$GREEN'✔"; else echo "'$RED'✘"; fi`\
'$CLOSE_PARANTHESE''$DASH''$OPEN_PARANTHESE'\
`if [[ ${EUID} == 0 ]]; then echo "'$RED'\h"; else echo "'$LIGHT_BLUE'\u@\h"; fi`\
'$CLOSE_PARANTHESE''$DASH''$OPEN_PARANTHESE'\
'$LIGHT_BLUE'\@ \d\
'$CLOSE_PARANTHESE''$DASH''$OPEN_PARANTHESE'\
'$YELLOW'\w\
'$CLOSE_PARANTHESE''$DASH''$OPEN_PARANTHESE'\
'$GREEN'`ls -1 | wc -l | sed "s: ::g"` files, `ls -lah | grep -m 1 total | sed "s/total //"`b\
'$CLOSE_PARANTHESE''$DASH'\n\
'$WHITE''$SPECIAL_CHAR_LINE2' \
'$GREEN'$(parse_git_branch)'$NO_COLOR''
# \[$(git_color)\]$(parse_git_branch)'$NO_COLOR''
}

ps1_update1

EOM
echo ""
echo ""
echo "Update $bash_profile - Done"
echo "Content: "
/bin/cat $bash_profile
source $bash_profile

mkdir ~/work 2> /dev/null

# lbox tool
plumbus="https://git.taservs.net/jgriffith/Plumbus.git"

cd ~/work
git clone $plumbus
