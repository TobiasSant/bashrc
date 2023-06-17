# Tunning section

# Función de actualización de variable
actualizar_variable() {
  branch_name="$(git symbolic-ref --short HEAD 2>/dev/null)"
}

# Comando de trampa para actualizar la variable después de cada comando
trap 'actualizar_variable' DEBUG

### Git ###
git_ico() {
  trap 'actualizar_variable' DEBUG
  if [ $? -eq 0 ] && [ -n "$branch_name" ]; then
    echo '⎇ '
  fi
}

git_branch() {
  trap 'actualizar_variable' DEBUG
  if [ $? -eq 0 ] && [ -n "$branch_name" ]; then
    local prefix_status=""
    local prefix_log=""
    if [ $(git status --porcelain | wc -l) -gt 0 ]; then
      prefix_status="+"
    fi
    if [ $(git log --branches --not --remotes | wc -l) -ge 1 ]; then
      prefix_log="?"
    fi
    echo "$prefix_status$prefix_log ($branch_name)"
  fi
}
# git_fetch() {
#   if [ $(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' | wc -l) -ge 1 ]; then
#     if [ $(git fetch && git status -uno | grep "pull" | wc -l) -ge 1 ]; then
#       echo "pull"
#     fi
#   fi
# }


### add Color ANSI code ###
lGrey='\e[0;37m'
red='\e[0;31m'
lPurple='\e[0;35m'
green='\e[1;32m'
blue='\e[1;34m'
reset=$(tput sgr0)   # use color setting in terminal Preference
# get more color on this site: 
# http://misc.flogisoft.com/bash/tip_colors_and_formatting
# https://www.shellhacks.com/bash-colors/

### pos ANSI code ###
save='\e[s'
savePoint='\e[u'
nextLine='\e[G\e[1B'
jumpChar='\e[10C'

export PS1="\[$green\]\u@\h\[$reset\]:\[$blue\]\w\[$lGrey\]\$(git_ico)\[$lPurple\]\$(git_branch)\[$reset\]\$ "