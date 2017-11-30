# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i*  ]] && source ~/liquidprompt/liquidprompt

chproj () {
  OS_PROJECT_NAME=$1
  export OS_PROJECT_NAME
}

prompt () {
  if [ -n "$OS_PROJECT_NAME" ]; then
    LP_PS1_POSTFIX="($OS_PROJECT_NAME) "
  else
    LP_PS1_POSTFIX=""
  fi
}
PROMPT_COMMAND="prompt; $PROMPT_COMMAND"

stty -ixon
