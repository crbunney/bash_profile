# .bash_profile
# Run for login shells, e.g. when logging in via the console for the first time, but not necessarily all shells
# On OS X, Terminal runs a login shell every time, which differs from other systems
#
# You can read about the difference between login and non-login shells, and how it affects bash startup, here:
# * https://tecadmin.net/difference-between-login-and-non-login-shell/
# * https://relentlesscoding.com/posts/whats-the-difference-between-a-login-and-a-nonlogin-shell/
#
# So basically, use .bash_profile for things that should happen on login, and .bashrc for things that should happen for every shell that's launched
echo "Running bash profile"

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
