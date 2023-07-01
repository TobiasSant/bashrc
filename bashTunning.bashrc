# Tunning section

alias cd..='cd ..'

git_branch() {
  local red='\e[0;31m'
  local lPurple='\e[0;35m'
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
    echo -e "⎇ $red$prefix_status$prefix_log$lPurple($branch_name)"
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

export PS1="\[$green\]\u@\h\[$reset\]:\[$blue\]\w\[$lGrey\]\$(git_branch)\[$reset\]\$ "
