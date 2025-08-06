# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

PS1="[\u@\h \W]\\$ "

# User specific aliases and functions

export PATH=$PATH:$HOME/bin/:$HOME/bin/git-repo

alias savehistory='history >> ~/.history.txt'
alias awstestme='aws s3 ls s3://-onemw-deployment/'
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

# pass the arguments to be used with the find command
function findinmeta(){
  # EXAMPLE: find meta--flutter/ -path meta-flutter/.git -prune -o -type f -exec grep flutter-minimal-image  {} \; -print
  for d in `ls meta-* -1 -d`; do find $d -path $d/.git -prune -o $@; done
}

# function to generate commit snapshot of the onemw
function dumpgithashonemw(){
  local TempFile=$(mktemp)
  echo "this will dump all the git hash in to the $TempFile file"
  [[ -e .repo ]] || return 1;
  #echo "do find"
  for d in `find . -maxdepth 5 -type d -name .git|sort`; do cd $d > /dev/null;basename "$(dirname `pwd`)";git log -1 --oneline; cd - > /dev/null; done > $TempFile
}

function manifest_dump_name_path(){
  # dumping the name and path from $1
  echo 'cat //manifest/project/@name|//manifest/project/@path' | xmllint --shell $1 | grep -E 'path|name' | paste -d ' ' - -
}

function dump_repo_snapshot(){
  repo forall -c 'echo -n $REPO_PROJECT && echo " | $REPO_PATH" && git branch && git log -1 --oneline && echo "----------------"'
}

#last_aws_sync=$(tail -1 /tmp/aws_s3_sync.log)
#today=$(date)
#[[ ${last_aws_sync:0:7} != ${today:0:7} ]] && echo -e "$COL_YELLOW Pleae do AWS Sync (/usr/local/bin/sync_s3.sh) !$COL_RESET"


echo "################################################"
echo "screen -dRR default"
