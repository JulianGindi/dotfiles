# 
# NOTE: I am in the process of potentially switching to the Fish shell, so this script may be updated in the future
# We are also potentially going to use wezterm as the multiplexer as well,
# so we might not configure tmux anymore. We will still keep the configuration here of course.
#

# Create symlinks

# Fish configs
ln -s $HOME/dotfiles/fish/ $HOME/.config/fish

# Wezterm configs
ln -s $HOME/dotfiles/wezterm/ $HOME/.config/wezterm

# Neovim configs
ln -s $HOME/dotfiles/nvim/ $HOME/.config/nvim

# Change default shell
# Note: Changing the default shell now happens in my wezterm terminal configuration

# Setup some Wezterm workspace stuff
mkdir $HOME/.projects
