# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

PS1="[\u@\h \W]\\$ "

# User specific aliases and functions

export PATH=$PATH:$HOME/bin/:$HOME/bin/git-repo

alias savehistory='history >> ~/.history.txt'
alias awstestme='aws s3 ls s3://lgi-onemw-deployment/'
alias top='top -d 0.5'
alias psme='ps -aux|grep abhay'
alias savehistory='history >> ~/.history'
alias vi='vim'
#alias vi='/snap/bin/nvim'
alias gst='git status'
alias gitr='git remote -vv'
alias gmod='git status | grep modified|cut -d ':' -f2'

export COL_BLACK='\e[0;30m';
export COL_RED='\e[0;31m';
export COL_GREEN='\e[0;32m';
export COL_YELLOW='\e[0;33m';
export COL_BLUE='\e[0;34m';
export COL_PURPLE='\e[0;35m';
export COL_CYAN='\e[0;36m';
export COL_WHITE='\e[0;37m';
export COL_RESET='\e[0m'

# pass the arguments to be used with the find command
function findinmeta()
{
  for d in `ls meta-* -1 -d`; do find $d $@; done
}

#last_aws_sync=$(tail -1 /tmp/aws_s3_sync.log)
#today=$(date)
#[[ ${last_aws_sync:0:7} != ${today:0:7} ]] && echo -e "$COL_YELLOW Pleae do AWS Sync (/usr/local/bin/sync_s3.sh) !$COL_RESET"


echo "################################################"
echo "screen -dRR default"
