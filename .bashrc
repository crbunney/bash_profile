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
PATH=$PATH:"~/Library/Application Support/JetBrains/Toolbox/scripts" # for Jetbrains command line tools/commands
export PATH

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# enable pyenv-virtualenv
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

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

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# for conveniently interacting with localstack resources
alias awslocal="AWS_ACCESS_KEY_ID=test AWS_SECRET_ACCESS_KEY=test AWS_DEFAULT_REGION=${DEFAULT_REGION:-$AWS_DEFAULT_REGION} aws --endpoint-url=http://${LOCALSTACK_HOST:-localhost}:4566"
complete -C '/opt/homebrew/bin/aws_completer' aws
complete -C '/opt/homebrew/bin/aws_completer' awslocal

# GCP CLI setup (via brew: brew install --cask google-cloud-sdk)
[[ -r $(brew --prefix)"/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/share/google-cloud-sdk/path.bash.inc"

# Login to GHCR
cat ~/.github_pat | docker login ghcr.io -u crbunney --password-stdin
