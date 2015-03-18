# Shell Prompt

# Git information
_git_prompt () {
  test -z "$(pwd | egrep '/\.git(/|$)')" || return
  local _git_branch="`git branch 2>/dev/null | egrep '^\*' | sed 's/^\* //'`"
  test -z "$_git_branch" && return
  local _git_status=`git status --porcelain | sort | awk '
    BEGIN { modified = 0; staged = 0; new = 0; }
    /^ / { modified += 1 }
    /^[^\? ]/ { staged += 1 }
    /^\?/ { new += 1 }
    END {
      if (staged) { print "o"; exit }
      if (modified) { print "x"; exit }
      if (new) { print "x"; exit }
      else { print "o"; exit }
    }'`
  if [[ -n $_git_status ]]; then
    _git_status=" %F{green}$_git_status%f"
  else
    _git_status="  "
  fi

  echo "%F{green}on%{$reset_color%} git:%F{magenta}$_git_branch%f$_git_status"
}

export PROMPT='
%(?..[%{$fg[red]%}%?%{$reset_color%}] )%{$fg[magenta]%}%m%{$reset_color%}: %{$fg[cyan]%}%~ \
$(_git_prompt)
%{$fg[yellow]%}$%{$reset_color%} '

RPROMPT=""

setopt PROMPT_SUBST # perform substitution/expansion in prompts
