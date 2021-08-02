[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH=$PATH:$HOME/scripts

source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt

eval "$(pyenv init -)"

export PIP_CERT=~/.ssh/netskope_certadmin.crt
eval "$(pyenv virtualenv-init -)"

alias vi=/usr/local/bin/nvim
alias vim=/usr/local/bin/nvim
alias cat=/usr/local/bin/bat

json-extract() {
    # Extract a given JSON path
    < "$1" python -m json.tool >/dev/null 2>&1|| {echo "Invalid JSON"; return 1;}
    ~/git/show-struct/show_struct.py "$1" | fzf --bind "enter:execute(echo {1} \
        | jq -rf /dev/stdin \"$1\")+abort"
}
