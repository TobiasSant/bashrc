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
