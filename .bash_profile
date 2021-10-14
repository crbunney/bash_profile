# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

. /usr/share/git-core/contrib/completion/git-prompt.sh
force_color_prompt=yes
GIT_PS1_SHOWDIRTYSTATE=true
PS1='\[\033[33m\][\D{%H:%M:%S}] \[\033[0;36m\]\w\[\033[0;31m\] $(__git_ps1)\[\033[00m\]\$ '

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
