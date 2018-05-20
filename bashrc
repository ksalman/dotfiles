# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i*  ]] && source ~/liquidprompt/liquidprompt

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
PROMPT_COMMAND="$PROMPT_COMMAND; prompt"

stty -ixon
