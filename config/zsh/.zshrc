ZSH=/usr/share/oh-my-zsh
PLUGINS=/usr/share/zsh/plugins

ZSH_THEME="agnoster"

plugins=(  
  autojump
  archlinux 
  git    
  git-auto-fetch
  gitignore
  web-search
  frontend-search
  spring
  dotenv 
  npm
  nvm 
  node  
  yarn
  themes
  python
  pip
  docker
  docker-compose
  safe-paste
  mvn   
  gradle 
  history
  thefuck
)

source $ZSH/oh-my-zsh.sh

source $PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}
