# zmodload zsh/zprof

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="af-magic"

zstyle ':omz:plugins:nvm' lazy yes
# Alternative:
# zstyle ':omz:plugins:nvm' autoload yes

plugins=(git z zsh-syntax-highlighting zsh-autosuggestions )

source $ZSH/oh-my-zsh.sh

# aliases
alias vim="nvim"
alias rm="rm -i"
alias logout="loginctl terminate-session"
alias python="python3"

#nala
apt() { 
  command nala "$@"
}
sudo() {
  if [ "$1" = "apt" ]; then
    shift
    command sudo nala "$@"
  else
    command sudo "$@"
  fi
}

# go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/k3ysdev/go/bin
export PATH=$PATH:/home/k3ysdev/Qt/6.5.2/gcc_64/bin

# zprof

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# act path

export PATH=$PATH:/home/k3ysdev/bin/

# gofetch path
export PATH=$PATH:/home/k3ysdev/.local/bin/

