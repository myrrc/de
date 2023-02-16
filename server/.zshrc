set -o emacs

setopt GLOB_COMPLETE
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

bindkey "^R" history-incremental-search-backward

export HISTFILE=$HOME/.tmp/histfile HISTSIZE=10000 SAVEHIST=10000
export PS1='%F{blue}%# %f' RPS1='%F{green}%/'
export EDITOR=nvim

source /etc/profile

export INFRA_DIR=${CONF}/

for p (syntax-highlighting autosuggestions) {
    folder="$HOME/.tmp/$p"
    [ ! -d $folder ] && git clone --depth 1 https://github.com/zsh-users/zsh-$p $folder; source $folder/zsh-$p.zsh
}

check-ssh-agent() { [ -S "$SSH_AUTH_SOCK" ] && { ssh-add -l >& /dev/null || [ $? -ne 2 ]; } }
check-ssh-agent || export SSH_AUTH_SOCK=$HOME/.tmp/ssh-agent.sock
check-ssh-agent || eval "$(ssh-agent -s -a $HOME/.tmp/ssh-agent.sock)" > /dev/null

alias pc='xclip -selection clipboard'
alias pp='xclip -selection clipboard -o'

alias gst="git status"
alias gco="git checkout"
alias ga="git add"
alias gc="git commit"
alias gl="git pull"
alias gp="git push"
alias gr="git rebase --interactive HEAD~"

alias ls="ls --color"
alias l="ls -a"

alias vpn_up="sudo wg-quick up wg0"
alias vpn_down="sudo wg-quick down wg0"

alias v=nvim
alias vs='nvim -S Session.vim'
# alias vsb='nvim -S Session_$(git branch).vim'
