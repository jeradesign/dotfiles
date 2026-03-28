# Runs *every* time zsh is invoked, either interactively or via script
# Set up environment variables here

# Reset paths to work around Apple messing with them in /etc/zprofile
unset PATH
unset MANPATH

# Set up system paths.
# (On a sensible system this may be done for you by /etc/zshenv)
if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi

# Setup Homebrew environment vars
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add emacs and command line tools (Emacs from https://emacsformacosx.com)
export PATH="/Applications/Emacs.app/Contents/MacOS/bin":$PATH

# Add the bin directory in my home directory
export PATH="$HOME/bin:$PATH"

# Set up other environment variables
# TODO: Should environment for interactive commands go in .zshrc?
export VISUAL='emacsclient -c'
export LESS="--no-init --QUIT-AT-EOF --RAW-CONTROL-CHARS"
export GIT_CEILING_DIRECTORIES=`find "$PWD" -maxdepth 1 -type d | paste -sd ":" -`
