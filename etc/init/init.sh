
# install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install Homebrew-file
brew install rcmdnk/file/brew-file

# install packages via Homebrew-file
brew file install

# use zsh
sudo echo /usr/local/bin/zsh >> /etc/shells
chsh -s /usr/local/bin/zsh

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# dircolors solarized
git clone https://github.com/seebi/dircolors-solarized.git ~/dircolors-solarized

# vim neobundle
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
