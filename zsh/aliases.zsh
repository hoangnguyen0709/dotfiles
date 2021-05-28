alias reload!='. ~/.zshrc'

# General
alias cl=clear
alias ll="ls -lrhtG"
alias lstree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

alias sbashrc="source ~/.bash_profile"
alias vbashrc="vi ~/.bash_profile"
alias cbashrc="cat ~/.bash_profile"

# grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;37;41'

# vim
alias vifile="vim -X ~/.vifile"
alias vimrc="vim -X ~/.vimrc"

## Git completion
# [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
# source ~/.git-completion.bash

# Java related
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# Add rabitmq
HOMEBREW_RABBITMQ=/usr/local/Cellar/rabbitmq/3.7.16/sbin/
PATH=$PATH:$HOMEBREW_RABBITMQ

# Add lint
PATH=$PATH:/Users/htnguyen/go/bin/

# Golang
export GIT_TERMINAL_PROMPT=1
export GOPRIVATE="git.taservs.net/ecom"

export PERL5LIB=/Users/hoangnguyen/Work/gdc-common-min/lib/:/Users/hoangnguyen/Work/gdc-bear/common/lib:/home/hoang.nguyen/gdc-bear/common/t:/Users/hoangnguyen/Work/gdc-bear/resources/lib:/Users/hoangnguyen/Work/gdc-bear/resources/t:/Users/hoangnguyen/Work/gdc-bear/common/blib:/opt/common/lib:/opt/common/t:/opt/resources/lib:/opt/resources/t:/opt/common/lib

# Config ssh-add
ssh-add -L > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Run ssh-add: "
#     ssh-add
    ssh-add ~/.ssh/id_rsa
fi

# Alias python3
alias pip3="python3 -m pip"

# Add my-utils
export PATH=$PATH:$HOME/Work/my-utils/utils/

# Company utils
export PATH=$PATH:$HOME/Work/my-utils/utils/axon

# Instance access
alias pi_conf="cat ~/work/my-utils/utils/pi_conf.sh"
alias vpi_conf="vim ~/work/my-utils/utils/pi_conf.sh"
alias box_conf="cat ~/work/my-utils/utils/axon/box_conf.sh"
alias vbox_conf="vim ~/work/my-utils/utils/axon/box_conf.sh"
alias crt="echo /Users/htnguyen/Work/EVP/crt"

## add more alias here
alias git_cfg_local="git config --local user.email \"thehoang0709@gmail.com\" && git config --local user.name \"Hoang Nguyen\""
alias work="cd ~/Work/"
DV1_NOC=qus1uw2lnoc001
alias dv1_lnoc="ssh $DV1_NOC"
US2_NOC=sus2uw1lnoc001
alias us2_lnoc="ssh $US2_NOC"
US4_NOC=pus4uw2lnoc001
alias us4_lnoc="ssh $US4_NOC"
UK2_NOC=puk2es1lnoc001
alias uk2_lnoc="ssh $UK2_NOC"
NL1_NOC=pnl1we1lnoc001
alias nl1_lnoc="ssh $NL1_NOC"
EU1_NOC=peu1ew1lnoc001
alias eu1_lnoc="ssh $EU1_NOC"
BR1_NOC=pbr1se1lnoc001
alias br1_lnoc="ssh $BR1_NOC"

alias ag1_noc="ssh qag1ge1lnoc001"

alias qa_heimdall="ssh qus1uw2lhdl001"

alias deploy="/Users/htnguyen/Work/improvement-toolbox/misc-scripts/deploy.sh"

export TWOBOX_NUMBER=709

alias centos="ssh htnguyen@localhost -p 2222"
alias centos8="ssh htnguyen@localhost -p 1111"
# alias practice="cd ~/Work/practice/"
# alias bear="cd ~/Work/gdc-bear/"
# alias md="cd ~/Work/gdc-metadata/"
# alias rolapps="cd ~/Work/rolapps"

# alias centos="ssh -A -p 8022 hoangnguyen@127.0.0.1"

export PATH=$PATH:/usr/local/go/bin
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# if [ -f ~/.zshrc ]; then
#     . ~/.zshrc
# fi

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH"

export PATH="/usr/local/opt/node@12/bin:$PATH"

# fzf
# [ -f ~/.fzf.bash ] && source ~/.fzf.bash

# jira
alias jira="python3 /Users/htnguyen/Work/my-utils/jira_report/main.py"
alias evp_report="cd /Users/htnguyen/Work/EVP/management/sprint_planning/2021/EVP"
alias vp_report="cd /Users/htnguyen/Work/EVP/management/sprint_planning/2021/VIC"

function plookup() {
  python3 -W /Users/htnguyen/Work/EVP/upstream/improvement-toolbox/misc-scripts/pid-lookup/plookup.py $1
}
export PATH="/usr/local/opt/python@3.8/bin:$PATH"

alias axatom="python3 /usr/local/bin/axatom"
