alias reload!='. ~/.zshrc'

##### General
alias cl=clear
alias ll="ls -lrhtG"
alias lstree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

alias sbashrc="source ~/.bash_profile"
alias vbashrc="vi ~/.bash_profile"
alias cbashrc="cat ~/.bash_profile"

alias vifile="vim -X ~/.vifile"
alias vimrc="vim -X ~/.vimrc"

alias git_cfg_local="git config --local user.email \"thehoang0709@gmail.com\" && git config --local user.name \"Hoang Nguyen\""

# grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;37;41'

# gsed
# export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
alias gsed="/usr/local/opt/gnu-sed/libexec/gnubin/sed"

# coreutils gnubin
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# python
alias pip3="python3 -m pip"

# java
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# pkgconfig
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH"

# node
export PATH="/usr/local/opt/node@12/bin:$PATH"

# kustomize
# should before golang path which is in /usr/local/go/bin/go
export PATH="/usr/local/bin:$PATH"

# golang
export GIT_TERMINAL_PROMPT=1
export GOPRIVATE="git.taservs.net/ecom"
export PATH=$PATH:/Users/htnguyen/go/bin/
export PATH=/usr/local/go/bin:$GOROOT/bin:$PATH

# promtool
export PATH=~/Work/upstream/prometheus:$PATH

# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

##### Company
#### GDC
alias pi_conf="cat ~/work/my-utils/utils/pi_conf.sh"
alias vpi_conf="vim ~/work/my-utils/utils/pi_conf.sh"


#### Axon
alias w="cd ~/Work/"
alias t="cd ~/tmp/"
alias centos="ssh htnguyen@localhost -p 2222"
alias centos8="ssh htnguyen@localhost -p 1111"
alias box_conf="cat ~/work/my-utils/utils/axon/box_conf.sh"
alias vbox_conf="vim ~/work/my-utils/utils/axon/box_conf.sh"
alias deploy="/Users/htnguyen/Work/improvement-toolbox/misc-scripts/deploy.sh"
alias crt="echo /Users/htnguyen/Work/EVP/crt"
alias axatom="~/Library/Python/3.8/bin/axatom"

alias jira="python3 /Users/htnguyen/Work/my-utils/jira_report/main.py"
alias evp_report="cd /Users/htnguyen/Work/EVP/management/sprint_planning/2021/EVP"
alias vp_report="cd /Users/htnguyen/Work/EVP/management/sprint_planning/2021/VIC"

alias qa_heimdall="echo qus1uw2lhdl001"
alias dv1_lnoc="ssh qus1uw2lnoc001"
alias us2_lnoc="ssh sus2uw1lnoc001"
alias us4_lnoc="ssh pus4uw2lnoc001"
alias uk2_lnoc="ssh puk2es1lnoc001"
alias nl1_lnoc="ssh pnl1we1lnoc001"
alias eu1_lnoc="ssh peu1ew1lnoc001"
alias br1_lnoc="ssh pbr1se1lnoc001"
alias ag1_lnoc="ssh qag1ge1lnoc001"
alias la1_lnoc="ssh pla1bs1lnoc001"

export TWOBOX_NUMBER=709

# Config ssh-add
ssh-add -L > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Run ssh-add: "
    ssh-add ~/.ssh/id_rsa
fi

export PATH=$PATH:$HOME/Work/my-utils/utils/axon
export PATH=$PATH:$HOME/Work/my-utils/utils/
export PATH="~/Library/Python/3.8/bin:$PATH"

function plookup() {
  python3 -W /Users/htnguyen/Work/EVP/upstream/improvement-toolbox/misc-scripts/pid-lookup/plookup.py $1
}

##### Backup
## Git completion
# [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
# source ~/.git-completion.bash

# if [ -f ~/.zshrc ]; then
#     . ~/.zshrc
# fi

