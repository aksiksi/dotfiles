export SHELL="/bin/zsh"

# Override default zsh behavior
# If $EDITOR == vi, zsh sets editing mode to vi
set -o emacs

# Configure zsh history file
export HISTSIZE=2000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
export hist_ignore_all_dups

# Appends every command to the history file once it is executed
setopt inc_append_history

# Disable shared history
setopt no_share_history
unsetopt share_history

#export PS1="[%n@%M]:%2d $ "
export PS1="[%2d]$ "

