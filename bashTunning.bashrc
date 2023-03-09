# Tunning section

### Git ###
git_ico() {
  if [ $(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' | wc -l) -ge 1 ]; then
    echo '⎇ '
  fi
}
git_branch() {
  if [ $(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' | wc -l) -ge 1 ]; then
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
  fi
}
git_status() {
  if [ $(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' | wc -l) -ge 1 ]; then
    if [ $(git status | wc -l) -gt 4 ]; then
      echo "+"
    fi
  fi
}
git_log() {
  if [ $(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' | wc -l) -ge 1 ]; then
    if [ $(git status | wc -l) -gt 4 ]; then
      if [ $(git log --branches --not --remotes | wc -l) -ge 1 ]; then
      echo "?"
      fi
    fi
  fi
}

git_fetch() {
  if [ $(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' | wc -l) -ge 1 ]; then
    if [ $(git fetch && git status -uno | grep "pull" | wc -l) -ge 1 ]; then
      echo "cagada"
    fi
  fi
}

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

export PS1="\[$green\]\u@\h\[$reset\]:\[$blue\]\w\[$lGrey\]\$(git_ico)\[$red\]\$(git_status)\$(git_log)\$(git_fetch)\[$lPurple\]\$(git_branch)\[$reset\]\$ "