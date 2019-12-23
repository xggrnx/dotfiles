export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="pocahontas"


plugins=(git zsh-autosuggestions nvm)

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

export PATH=$PATH:/usr/local/go/bin
export TERM='xterm-256color'
export APP_STATUS=1

if [ -f ~/.zshalias ]; then
    source ~/.zshalias
else
    print "404: ~/.zshalias not found."
fi

if [ -f ~/.zshpath ]; then
    source ~/.zshpath
else
    print "404: ~/.zshpath not found."
fi



PATH=$PATH:~/.local/bin

export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python3"
export WORKON_HOME="~/.pyenv/versions/"
source ~/.local/bin/virtualenvwrapper.sh

alias ta="tmux attach"


#Scritps
alias pull_all="~/src/dotfiles/bin/pull_all.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh 

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

PATH=$PATH:~/.local/bin

export PATH="$PATH:/usr/lib/dart/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

export ANDROID_SDK="~/Android/Sdk"
export PATH="~/Android/Sdk/platform-tools:$PATH"
export PATH="~/Android/Sdk/emulator:$PATH"
export PATH="~/Android/Sdk/tools/bin:$PATH"
export REACT_EDITOR="vim"
