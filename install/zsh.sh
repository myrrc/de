sudo apt install zsh
usermod --shell /bin/zsh myrrc

/bin/zsh -c 'for p (syntax-highlighting autosuggestions) {
    folder="$HOME/.tmp/$p"
    [ ! -d $folder ] && git clone --depth 1 https://github.com/zsh-users/zsh-$p $folder; source $folder/zsh-$p.zsh
}'
