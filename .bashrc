alias ls='ls -FG'
alias ll='ls -alFG'

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

if [ -f ~/sources/git-completion.bash ]; then
    source ~/sources/git-completion.bash
fi
if [ -f ~/sources/git-prompt.sh ]; then
    source ~/sources/git-prompt.sh
fi
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=
GIT_PS1_SHOWSTASHSTATE=
GIT_PS1_SHOWUPSTREAM=

PS1='\[\033[37m\][\[\033[36m\]\u\[\033[37m\]@\h \[\033[32m\]\W\[\033[37m\]]\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

SESSION_NAME=ope
if [[ -z "$TMUX" && -z "$STY" ]] && type tmux >/dev/null 2>&1; then
  option=""
  if tmux has-session -t ${SESSION_NAME}; then
    option="attach -t ${SESSION_NAME}"
  else
    option="new -s ${SESSION_NAME}"
  fi
  tmux $option && exit
fi
