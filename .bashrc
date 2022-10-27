# .bashrc
# Executed for non-login shells
# You can read about the difference between login and non-login shells, and how it affects bash startup, here:
# * https://tecadmin.net/difference-between-login-and-non-login-shell/
# * https://relentlesscoding.com/posts/whats-the-difference-between-a-login-and-a-nonlogin-shell/

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific environment and startup programs
PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

EDITOR=nano
export EDITOR

### USER SPECIFIC ALIASES AND FUNCTIONS ###

# Install git auto-completion and prompt
[[ -r $(brew --prefix)"/etc/profile.d/bash_completion.sh" ]] && . $(brew --prefix)"/etc/profile.d/bash_completion.sh" # Git completion for macOS. Used by `brew install bash-completion` and `brew install bash-completion@2`
[ -f /usr/share/git-core/contrib/completion/git-prompt.sh ] && . /usr/share/git-core/contrib/completion/git-prompt.sh  # Git completion for linux

force_color_prompt=yes
GIT_PS1_SHOWDIRTYSTATE=true
PS1='\[\033[33m\][\D{%H:%M:%S}] \[\033[0;36m\]\w\[\033[0;31m\] $(__git_ps1)\[\033[00m\]\$ '

# END: Install git auto-completion and prompt

