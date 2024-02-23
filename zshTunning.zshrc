# Tunning section

setopt PROMPT_SUBST

# Función para obtener el nombre de la rama actual
git_branch() {
  local red='\e[0;31m'
  local lPurple='\e[0;35m'
  local color_branch="$lPurple"
  local branch_name=$(git symbolic-ref --short HEAD 2>/dev/null)
  if [ $? -eq 0 ] && [ -n "$branch_name" ]; then
    local status_output=$(git status --porcelain)
    local log_output=$(git log --branches --not --remotes --quiet)
    if [ -n "$status_output" ]; then
      prefix_status="+"
    fi
    if [ -n "$log_output" ]; then
      prefix_log="?"
    fi
    local branch_name_lower=$(echo "$branch_name" | tr '[:upper:]' '[:lower:]')
    case "$branch_name_lower" in
      "dev" | "develop" )
        color_branch='\e[0;33m'
        ;;
    esac
    case "$branch_name_lower" in
      "main" | "master" )
        color_branch="$red"
        ;;
    esac
    echo -e "⎇ $red$prefix_status$prefix_log$color_branch($branch_name)"
  fi
}

# Definiición del prompt con colores
autoload -Uz colors
colors

# Personalización del prompt
PROMPT='%F{green}%n@%m%f:%F{blue}%~%f$(git_branch)%f$ '

#zstyle :compinstall filename '/home/%n/.zshrc'
#autoload -Uz compinit
#zstyle ':completion:*' menu select
#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*' rehash true
#zmodload zsh/complist
#compinit

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#404040'
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

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
