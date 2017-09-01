# Create links

ln -s tmux/tmux.conf $HOME/.tmux.conf
ln -s vim/vimrc $HOME/.vimrc
ln -s zsh/zshrc $HOME/.zshrc
ln -s git/gitconfig $HOME/.gitconfig

# Change default shell
chsh -s $(which zsh)

# Removing old vim package manager and reinstall
rm -rf vim/Vundle.vim

# Clone new Vundle
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/dotfiles/vim/Vundle.vim

# Install vim plugins
vim +PluginInstall +qall

# Installing some needed packages to make everything work nicely
sudo apt-get install python python-pip python3
sudo apt-get install python-virtualenv

# Install virtualenvwrapper with pip
pip install virtualenvwrapper

# Refresh zsh
exec zsh
