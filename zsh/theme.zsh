# ls colors
if [ $PLATFORM = FreeBSD ] || [ $PLATFORM = Darwin ]; then
  CLR_DIR=Ex
  CLR_SYM_LINK=Gx
  CLR_SOCKET=Fx
  CLR_PIPE=dx
  CLR_EXE=Cx
  CLR_BLOCK_SP=Dx
  CLR_CHAR_SP=Dx
  CLR_EXE_SUID=hb
  CLR_EXE_GUID=ad
  CLR_DIR_STICKY=Ex
  CLR_DIR_WO_STICKY=Ex
  LSCOLORS="$CLR_DIR$CLR_SYM_LINK$CLR_SOCKET$CLR_PIPE$CLR_EXE$CLR_BLOCK_SP"
  LSCOLORS="$LSCOLORS$CLR_CHAR_SP$CLR_EXE_SUID$CLR_EXE_GUID$CLR_DIR_STICKY"
  LSCOLORS="$LSCOLORS$CLR_DIR_WO_STICKY"
  export LSCOLORS
  export CLICOLOR="YES"
fi

# Correcting Tmux Colors
alias tmux="TERM=screen-256color-bce tmux"

# Base16 Colorscheme
BASE16_SHELL="$HOME/dotfiles/zsh/colors/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
