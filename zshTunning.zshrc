# Tunning section

setopt PROMPT_SUBST

autoload -U compinit
compinit
autoload -Uz colors
colors

source ~/.zsh/supercharge/supercharge.plugin.zsh
source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zstyle :compinstall filename '/home/%n/.zshrc'
# autoload -Uz compinit
# zstyle ':completion:*' menu select
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*' rehash true
# zmodload zsh/complist
# compinit

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#404040'
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

git_branch() {
  local red='%F{red}'
  local lPurple='%F{magenta}'
  local color_branch="$lPurple"
  local branch_name

  if branch_name=$(git rev-parse --abbrev-ref HEAD 2>/dev/null); then
    local prefix_status=""
    local prefix_log=""
    
    if [[ -n $(git status --porcelain) ]]; then
      prefix_status="+"
    fi
    
    if [[ -n $(git log --branches --not --remotes --quiet) ]]; then
      prefix_log="?"
    fi
    
    case "$branch_name" in
      "dev" | "develop" )
        color_branch='%F{yellow}'
        ;;
      "main" | "master" )
        color_branch="$red"
        ;;
    esac
    
    echo -e "⎇ $red$prefix_status$prefix_log$color_branch($branch_name)%f"
  fi
}

# git_branch() {
#   local red='%F{red}'
#   local lPurple='%F{magenta}'
#   local color_branch="$lPurple"
#   local branch_name=$(git symbolic-ref --short HEAD 2>/dev/null)
  
#   if [ $? -eq 0 ] && [ -n "$branch_name" ]; then
#     local status_output=$(git status --porcelain)
#     local log_output=$(git log --branches --not --remotes --quiet)
    
#     if [ -n "$status_output" ]; then
#       prefix_status="+"
#     fi
    
#     if [ -n "$log_output" ]; then
#       prefix_log="?"
#     fi
    
#     local branch_name_lower=$(echo "$branch_name" | tr '[:upper:]' '[:lower:]')
    
#     case "$branch_name_lower" in
#       "dev" | "develop" )
#         color_branch='%F{yellow}'
#         ;;
#     esac
    
#     case "$branch_name_lower" in
#       "main" | "master" )
#         color_branch="$red"
#         ;;
#     esac
    
#     echo -e "⎇ $red$prefix_status$prefix_log$color_branch($branch_name)%f"
#   fi
# }

# Prompt configuration
PROMPT='%F{green}%n@%m%f:%F{blue}%~%f$(git_branch)%f$ '

# Alias section

alias cd..='cd ..'
alias claer='clear'
alias celar='clear'
alias pyenv-i='pyenv install $(cat .python-version)'
alias run-warp='WARP_ENABLE_WAYLAND=0 warp-terminal'

# Install tools
alias myfont='echo "-> Agregando repositorio universe..." && sudo add-apt-repository universe -y && \
echo "-> Actualizando lista de paquetes..." && sudo apt update -y && \
echo "-> Instalando fuentes Fira Code..." && sudo apt install fonts-firacode -y'
alias fzf-i='git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install && echo "-> source ~/.bashrc"'

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm






# FIN_COCO_LOCO