if status is-interactive
    # Initializing pyenv
    pyenv init - | source
end

# Aliases
alias gg="git status"
alias l="clear && pwd && ls -FGl"
alias u="cd .. && l"
