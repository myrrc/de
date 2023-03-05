wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb -O nvim.deb
sudo dpkg -i nvim.deb; rm nvim.deb
git clone --depth 1 https://github.com/wbthomason/packer.nvim  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
mkdir ~/.config/nvim/spell; wget http://ftp.vim.org/pub/vim/runtime/spell/ru.utf-8.spl -P ~/.config/nvim/spell
