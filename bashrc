# Only load Liquid Prompt in interactive shells, not from a script or from scp
#[[ $- = *i*  ]] && source ~/liquidprompt/liquidprompt

power () {
  /u/qa/lab/scripts/flagit.pl --resource $1 --removeflags nopower
}

projname () {
  unset OS_PROJECT_ID
  OS_PROJECT_NAME=$1
  export OS_PROJECT_NAME
}

projid () {
  unset OS_PROJECT_NAME
  OS_PROJECT_ID=$1
  export OS_PROJECT_ID
}

prompt () {
  if [ -n "$OS_PROJECT_ID" ]; then
    PS1="$PS1($OS_PROJECT_ID) "
  elif [ -n "$OS_PROJECT_NAME" ]; then
    PS1="$PS1($OS_PROJECT_NAME) "
  else
    PS1=$PS1
  fi
}
#PROMPT_COMMAND="$PROMPT_COMMAND; prompt"

stty -ixon
# undefine werase so it can be controlled via ~/.inputrc
stty werase undef

if [[ "$OSTYPE" == "msys" ]]; then
  alias python='winpty python.exe'
fi

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# Path to the bash it configuration
export BASH_IT="$HOME/.bash_it"

# Lock and Load a custom theme file.
# Leave empty to disable theming.
# location /.bash_it/themes/
export BASH_IT_THEME='atomic'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='weechat'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Uncomment this to make Bash-it create alias reload.
# export BASH_IT_RELOAD_LEGACY=1

# Load Bash It
source "$BASH_IT"/bash_it.sh

# My changes to bash-it - ksalman
# Since I don't need a password to sudo, themes always show sudo specific PS1 all the time - disable it
export THEME_SHOW_SUDO=false

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

HISTCONTROL=ignoreboth
complete -C '/usr/local/bin/aws_completer' aws
