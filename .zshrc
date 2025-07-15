emulate sh
bindkey -v
bindkey '^R' history-incremental-search-backward

export CLICOLOR=1
export LS_COLORS='di=34:ln=35:so=36:pi=36:ex=32:su=31:*.sh=32'
PROMPT='%F{green}%B❯%b%f '

alias vim=nvim
alias dot='git --git-dir=$HOME/.dot/ --work-tree=$HOME'
alias la='ls -A'
alias ll='ls -l'
