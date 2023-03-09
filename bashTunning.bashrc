# Tunning section

### Git ###
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

### add Color ANSI code ###
lightPurple='\e[0;35m'
green='\e[1;32m'
blue='\e[1;34m'
reset=$(tput sgr0)   # use color setting in terminal Preference
# get more color on this site: 
# http://misc.flogisoft.com/bash/tip_colors_and_formatting
# https://www.shellhacks.com/bash-colors/

export PS1="\[$green\]\u@\h\[$reset\]:\[$blue\]\w\[$lightPurple\]\$(git_branch)\[$reset\]\$ "