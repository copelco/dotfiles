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

# brew 
# export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
# Python compile
export LDFLAGS="-L$(brew --prefix openssl@3)/lib -L$(brew --prefix zlib)/lib -L$(brew --prefix unixodbc)/lib -L$(brew --prefix libssh)/lib -L$(brew --prefix gdal)/lib"
export CPPFLAGS="-I$(brew --prefix openssl@3)/include -I$(brew --prefix zlib)/include -L$(brew --prefix libffi)/include -L$(brew --prefix unixodbc)/include -L$(brew --prefix libssh)/include -L$(brew --prefix gdal)/include"
export CFLAGS="-I /opt/homebrew/include -I ext -L /opt/homebrew/lib -lssh"

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

eval "$(direnv hook zsh)"
eval "$(starship init zsh)"

export PATH="/Users/copelco/go/bin:$PATH"

export VIRTUAL_ENV_DISABLE_PROMPT=true

alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

path+=/Applications/Postgres.app/Contents/Versions/16/bin

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.config/op/plugins.sh
