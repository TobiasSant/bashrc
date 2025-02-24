# Alias section

alias cd..='cd ..'
alias claer='clear'
alias celar='clear'
alias pyenv-i='pyenv install $(cat .python-version)'
alias run-warp='WARP_ENABLE_WAYLAND=0 warp-terminal'
alias gitcd='git checkout develop'
alias gitch='git checkout'

docker-clear() {
    find ~ -name "docker-compose.yml" -execdir docker-compose down --volumes --remove-orphans \;
    docker system prune -a --volumes -f
    docker volume prune -f
}

# Install tools
alias myfont-i='echo "-> Agregando repositorio universe..." && sudo add-apt-repository universe -y && \
echo "-> Actualizando lista de paquetes..." && sudo apt update -y && \
echo "-> Instalando fuentes Fira Code..." && sudo apt install fonts-firacode -y'
alias fzf-i='git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install && echo "-> source ~/.bashrc"'
alias tldr-i='sudo apt -y isntall tldr && tldr --update'

# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm






# FIN_COCO_LOCO