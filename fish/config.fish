if status is-interactive
    # Initializing pyenv
    pyenv init - | source
end

# Aliases
alias c="clear"
alias gg="git status"
alias l="clear && pwd && ls -FGl"
alias ll="ls -lh"
alias u="cd .. && l"
alias vim="nvim"
alias vi="nvim"

~/.local/bin/mise activate fish | source
