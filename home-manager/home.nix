let
  user = import ./user.nix;
in
{
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
  source $HOME/.config/fish/config/base.fish
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


