# the rest of this file is commented out.

export EDITOR=vi

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

# do the same with MANPATH
#if [ -d ~/man ]; then
#    MANPATH=~/man${MANPATH:-:}
#    export MANPATH
#fi

#PS1='${PWD}@`hostname`: '
export PATH=$PATH:/u/qa/tools:/usr/X11R6/bin:/u/qa/lab/scripts
export SVN_EDITOR=/u/qa/tools/svn-editor

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

#export TERM=screen-256color

# make sure terminals wrap lines correctly after resizing them
shopt -s checkwinsize

ssh() {
    /usr/bin/ssh -oStrictHostKeyChecking=no -oCheckHostIP=no -oUserKnownHostsFile=/dev/null "$@"
}
rsync() {
/usr/bin/rsync --archive --numeric-ids --progress -e \
  "ssh -oStrictHostKeyChecking=no -oCheckHostIP=no
  -oUserKnownHostsFile=/dev/null" \
  "$@"
}
export -f ssh
ct() { /u/qa/tools/cycle.sh "$1" && /u/qa/tools/telnetcon "$1"; }
cmdfu() {
  wget -qO - "http://www.commandlinefu.com/commands/matching/$@/$(echo -n "$@" | openssl base64)/plaintext"
}
ipinfo () {
  cat /u/ksalman/public_html/ip
}
r() {
  if [[ -n $TMUX ]]; then
    NEW_SSH_AUTH_SOCK=$(tmux showenv | grep ^SSH_AUTH_SOCK|cut -d = -f 2)
    if [[ -n $NEW_SSH_AUTH_SOCK ]] && [[ -S $NEW_SSH_AUTH_SOCK ]]; then 
      export SSH_AUTH_SOCK=$NEW_SSH_AUTH_SOCK  
    fi
  fi
}
function ipgrab()  
{
  read line; echo $line | grep -E -o '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}';  
  while read line; do echo $line | grep -E -o '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'; done  
  echo $line | grep -E -o '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}';  
}
function json-vlab-host()
{
  wget -qO - http://json/v2/resources/$1
}
function cached-json-vlab-host()
{
  cat ~/work/jsondump/all-vlabs | jq -r ".[].\"$1\" // empty"
}
deblive() {
  /u/qa/lab/scripts/pxeit.pl $1 deblive
}
define() {
  curl dict://dict.org/d:$1
}
passcmp () {
  P1=`grep ^$1: /u/distrib/Templates/passwd.tmpl | cut -d: -f2`
  if [ -z "$P1" ]; then
    echo Password does not exist on shattuck
    return
  fi
  P2=`ssh root@$2 grep ^$1: /etc/shadow 2>/dev/null| cut -d: -f2`
  if [ -z "$P2" ]; then
    echo Password does not exist on $2
    return
  fi
  if [ "$P1" == "$P2" ]; then
    echo Password for $1 matches between shattuck and $2
  else
    echo Password for $1 does not match between shattuck and $2
  fi
}

alias fact="elinks -dump randomfunfacts.com | sed -n '/^| /p' | tr -d \|"
alias irssi="TERM=xterm-color irssi"
alias parallel="parallel --no-notice"


export HISTIGNORE="&:ls:[bf]g:exit"
export HISTFILESIZE=5000

# don't put duplicate lines in history
export HISTCONTROL=ignoreboth
export VI_USERNAME=ksalman
#export HISTSIZE=5000

set -o vi

#last_result() { echo -e $?; }
#PROMPT_COMMAND=last_result

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

if [ "$HOSTNAME" == "overseer" ] || [ "$HOSTNAME" == "foreman" ]; then
  umask g+w
fi

source ~/.git_merge

# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
