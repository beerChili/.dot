bindkey -v

export CLICOLOR=1
export LS_COLORS='di=34:ln=35:so=36:pi=36:ex=32:su=31:*.sh=32'
PROMPT='%F{green}%B❯%b%f '

if FZF_PATH="$(command -v fzf)"; [ -x "$FZF_PATH" ]; then
    export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude .git"
    export FZF_DEFAULT_OPTS="--border --prompt='❯ '"
    eval "$("$FZF_PATH" --zsh)"
    bindkey -r '\ec'
    bindkey '^O' fzf-cd-widget
fi


alias vim=nvim
alias dot='git --git-dir=$HOME/.dot/ --work-tree=$HOME'
alias la='ls -A'
alias ll='ls -l'
