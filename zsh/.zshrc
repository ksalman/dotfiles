export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="gruvbox"
#
# Uncomment one of the following lines to change the auto-update behavior
 zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time
#
# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"
#
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    timer
    dotenv
)

source $ZSH/oh-my-zsh.sh

# User configuration

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
export HOMEBREW_NO_AUTO_UPDATE=1

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

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
