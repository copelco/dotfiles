emulate zsh -c "$(direnv export zsh)"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTSIZE=50000
SAVEHIST=10000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

# Changing directories
setopt auto_cd
setopt auto_pushd
unsetopt pushd_ignore_dups
setopt pushdminus

# Completion
setopt auto_menu
setopt always_to_end
setopt complete_in_word
unsetopt flow_control
unsetopt menu_complete
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# Other
setopt prompt_subst

autoload -Uz compinit && compinit

# Load zsh plugins
# antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
source ~/.zsh_plugins.sh

# determine system architecture
arch_name="$(uname -m)"

if [ "${arch_name}" = "arm64" ]; then
  # xcode python3
  export PATH=${PATH}:~/Library/Python/3.8/bin
  # brew 
  export PATH="/opt/homebrew/bin:$PATH"
  # pyenv git checkout
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  # Python compile
  export LDFLAGS="-L$(brew --prefix openssl)/lib -L$(brew --prefix zlib)/lib -L/opt/homebrew/Cellar/libffi/3.3/lib"
  export CPPFLAGS="-I$(brew --prefix openssl)/include -I$(brew --prefix zlib)/include -L$(brew --prefix libffi)/include"
  alias brewx86='arch --x86_64 /usr/local/Homebrew/bin/brew'
else
  # libpq
  export PATH="/usr/local/opt/libpq/bin:$PATH"
  # gnu-sed
  export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
  # pyenv plugin (deprecated)
  ZSH_PYENV_LAZY_VIRTUALENV=true
fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s $(brew --prefix nvm)/nvm.sh ] && . $(brew --prefix nvm)/nvm.sh  # This loads nvm
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
      nvm use >/dev/null 2>&1
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

emulate zsh -c "$(direnv hook zsh)"

# psql - default to docker PostgreSQL
export PGHOST=localhost

export EDITOR='code-insiders --wait'

# fix Ansible issue
# https://github.com/ansible/ansible/issues/32499
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
