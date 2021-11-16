[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH=$PATH:$HOME/scripts

source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt

eval "$(pyenv init -)"

# pip
export PIP_CERT=~/.ssh/workproxy.pem
eval "$(pyenv virtualenv-init -)"

alias vi=/usr/local/bin/nvim
alias vim=/usr/local/bin/nvim
alias cat=/usr/local/bin/bat
# None of the remote hosts have tmux-256color so let's override TERM before we ssh
alias ssh='TERM=screen-256color ssh'
alias vagrant='TERM=screen-256color vagrant'
export EDITOR=/usr/local/bin/nvim
export TERM=tmux-256color

json-extract() {
    # Extract a given JSON path
    < "$1" python -m json.tool >/dev/null 2>&1|| {echo "Invalid JSON"; return 1;}
    ~/git/show-struct/show_struct.py "$1" | fzf --bind "enter:execute(echo {1} \
        | jq -rf /dev/stdin \"$1\")+abort"
}

if [ -f ~/.workrc ]; then
    source ~/.workrc
fi

# activate zsh completion system
autoload -Uz compinit
compinit
