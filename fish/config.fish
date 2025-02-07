if status is-interactive
    # Initializing pyenv if the shell is interactive
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

# Third-party activations
~/.local/bin/mise activate fish | source
