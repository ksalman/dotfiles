# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i*  ]] && source ~/liquidprompt/liquidprompt

chproj () {
  OS_PROJECT_NAME=$1
  export OS_PROJECT_NAME
}

prompt () {
  if [ -n "$OS_PROJECT_NAME" ]; then
    PS1="$PS1($OS_PROJECT_NAME) "
  else
    PS1=$PS1
  fi
}
PROMPT_COMMAND="$PROMPT_COMMAND; prompt"

stty -ixon
