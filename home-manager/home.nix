# This is common homemanager configuration file
# with common setup.
#
# DO NOT MODIFY this file unless, unless
# the change can meant to be supplied to
# others.
#
# For user specific customization, use home.user.nix
{ config, pkgs, lib, ... }:
let
  if-exists = f: builtins.pathExists f;
  existing-imports = imports: builtins.filter if-exists imports;
  user = import ./user.nix;
in
{
  imports = existing-imports [
    ./home.user.nix
  ];

  home.username = user.name;
  home.homeDirectory = user.homeDir;
  home.stateVersion = "22.11";

  programs.direnv.enable = true;

  programs.bash = {
    enable = true;
    initExtra = "
if [ -f $HOME/.config/bash/.bashrc ];
then
  source $HOME/.config/bash/.bashrc
fi
";
  };

  programs.fish = {
    enable = true;
    shellInit = "
if test -f $HOME/.config/fish/config.base.fish
  source $HOME/.config/fish/config.base.fish
end
";
  };

  programs.zsh = {
    enable = true;
    initExtra = "
if [ -f $HOME/.config/zsh/.zshrc ];
then
  source $HOME/.config/zsh/.zshrc
fi
";
  };
}


