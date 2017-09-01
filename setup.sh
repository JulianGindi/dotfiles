# Create links

ln -s tmux/tmux.conf $HOME/.tmux.conf
ln -s vim/vimrc $HOME/.vimrc
ln -s zsh/zshrc $HOME/.zshrc

# Change default shell
chsh -s $(which zsh)
