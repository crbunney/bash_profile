# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific environment and startup programs
PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH

EDITOR=nano
export EDITOR

# User specific aliases and functions
. /project/avd/sss/miniconda/etc/profile.d/conda.sh

. /usr/share/git-core/contrib/completion/git-prompt.sh
force_color_prompt=yes
GIT_PS1_SHOWDIRTYSTATE=true
PS1='\[\033[33m\][\D{%H:%M:%S}] \[\033[0;36m\]\w\[\033[0;31m\] $(__git_ps1)\[\033[00m\]\$ '

