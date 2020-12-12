./install/keys.sh
./install/git.sh

sudo apt update

sudo apt -y install clang-format
sudo snap install ripgrep --classic

sudo snap install go --classic
go get github.com/bazelbuild/buildtools/buildozer

git clone https://github.com/morhetz/gruvbox.git ~/.vim/pack/default/start/gruvbox
git clone https://github.com/lvht/fzf-mru.vim ~/.vim/pack/default/start/fzf-mru

./install/bashrc
./install/vim
./install/fzf
./install/node.sh
