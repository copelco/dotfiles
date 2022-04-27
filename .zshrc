export PATH="/opt/homebrew/bin:$PATH"

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
autoload -U bashcompinit
    bashcompinit

# Load zsh plugins
# antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
source ~/.zsh_plugins.sh

# xcode python3
# export PATH=${PATH}:~/Library/Python/3.8/bin
# brew 
# export PATH="/opt/homebrew/bin:$PATH"
alias brewx86='arch --x86_64 /usr/local/Homebrew/bin/brew'
# pyenv git checkout
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
# Python compile
export LDFLAGS="-L$(brew --prefix openssl@1.1)/lib -L$(brew --prefix zlib)/lib -L$(brew --prefix unixodbc)/lib"
export CPPFLAGS="-I$(brew --prefix openssl@1.1)/include -I$(brew --prefix zlib)/include -L$(brew --prefix libffi)/include -L$(brew --prefix unixodbc)/include"

# psql - default to docker PostgreSQL
export PGHOST=localhost

export EDITOR='code --wait'

# fix Ansible issue
# https://github.com/ansible/ansible/issues/32499
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Created by `pipx` on 2021-06-11 01:26:20
export PATH="$PATH:/Users/copelco/.local/bin"

# https://github.com/direnv/direnv/issues/335#issuecomment-937051564
export NODE_VERSION_PREFIX=v
export NODE_VERSIONS=~/.nvm/versions/node
# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# eval "$(register-python-argcomplete pipx)"
eval "$(pyenv init -)"
eval "$(pyenv init --path)"
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
