PYTHON_VERSION=3.10

git clone https://github.com/vim/vim.git -b v9.0.1400 ~/vim
cd ~/vim/src
./configure --with-features=huge --enable-python3interp --with-python3-config-dir=/usr/lib/python${PYTHON_VERSION}/config-${PYTHON_VERSION}m-x86_64-linux-gnu
make -j 20
mkdir ~/.local/bin -p
ln -s $(pwd)/vim ~/.local/bin/vim

# vim-plug

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp ~/setting/.vimrc ~/.vimrc

# Powerlevel 10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


git clone https://github.com/wting/autojump.git
cd autojump
python3 ./install.py

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

cp ~/setting/.zshrc ~/.zshrc
cp ~/setting/.p10k.zsh ~/.p10k.zsh
