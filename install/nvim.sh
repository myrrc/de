wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb -ovim; dpkg -i vim; rm vim
git clone --depth 1 https://github.com/wbthomason/packer.nvim  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim --headless +PackerSync +qa


