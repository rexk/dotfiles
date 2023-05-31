# DO NOT MODIFY this file unless, the change is required
# for all memebers.
#
# This file provide set of common bash configurations
# that are useful for all of us.

# set up PATH
export PATH=$PATH:$HOME/.config/bin

if [ -f $HOME/.config/bash/user.bash ]; then
	source $HOME/.config/bash/user.bash
fi

if [ -f $HOME/.config/bash/secret.bash ]; then
	source $HOME/.config/bash/secret.bash
fi
