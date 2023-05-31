# DO NOT MODIFY this file unless, the change is required
# for all memebers.
#
# This file provide set of common zsh configurations
# that are useful for all of us.

# region: setup
# TODO:: add more configs
# endregion 

if [ -f $HOME/.config/zsh/user.zsh ]; then
  source $HOME/.config/zsh/user.zsh
fi

if [ -f $HOME/.config/zsh/secret.zsh ]; then
  source $HOME/.config/zsh/secret.zsh
fi
