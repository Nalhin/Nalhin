ZSH=/usr/share/oh-my-zsh
PLUGINS=/usr/share/zsh/plugins
FZF=/usr/share/fzf

ZSH_THEME="agnoster"

plugins=(
  autojump
  safe-paste
  history
  thefuck
  sudo
  dotenv
)

plugins+=(
  web-search
  frontend-search
)

plugins+=(
  docker
  docker-compose
)

plugins+=(
  git
  git-auto-fetch
  gitignore
  gitfast
)

plugins+=(
  npm
  nvm
  node
  yarn
  react-native
)

plugins+=(
  mvn
  gradle
  spring
)

plugins+=(
  python
  pip
)

plugins+=(
  archlinux
)

source $ZSH/oh-my-zsh.sh

source $PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
source $PLUGINS/zsh-z/zsh-z.plugin.zsh
source $FZF/key-bindings.zsh
source $FZF/completion.zsh

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}
