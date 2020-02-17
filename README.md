# .vim
A `.vim` repository that can help you plug and play and write codes wherever you are.

## Set Up the Environment(Ubuntu 16.04 and later)
```
sudo apt install build-essential cmake python3-dev
```


## How to Use
* Clone this repository into your home directory
```
git clone https://github.com/jimlinntu/.vim ~/.vim
```

* (on `master` branch) Rename the `bundle/YouCompleteMe`
```
mv ~/.vim/bundle/YouCompleteMe/ ~/.vim/bundle/YouCompleteMe-bak/
```

* (on `master` branch) Clone the YouCompleteMe repository and move the file inside `bundle/YouCompleteMe-bak`
```
git clone https://github.com/ycm-core/YouCompleteMe ~/.vim/bundle/YouCompleteMe
mv ~/.vim/bundle/YouCompleteMe-bak/.ycm_extra_conf.py ~/.vim/bundle/YouCompleteMe
```

* (on `master` branch) Update the YouCompleteMe repository's submodule
```
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
```

* (on `master` branch) Install Vundle
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```
* (on `master` branch) run `install.py` in the YouCompleteMe folder
```
cd ~/.vim/bundle/YouCompleteMe
python3 ./install.py --clang-completer
```

* (on `master` branch) change directory to `~/.vim/doc` and generate tags file. (<https://www.vim.org/scripts/script.php?script_id=273>)
```
cd $HOME/.vim/doc
vim
:helptags .
```
