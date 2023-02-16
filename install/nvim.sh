wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
sudo dpkg -i nvim-linux64.deb
rm nvim-linux64.deb
git clone --depth 1 https://github.com/wbthomason/packer.nvim  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
mkdir ~/.configs/nvim/spell
cd ~/.configs/nvim/spell
wget http://ftp.vim.org/pub/vim/runtime/spell/ru.utf-8.spl
