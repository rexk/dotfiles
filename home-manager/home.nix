let
  user = import ./user.nix;
in
{
  home.username = user.name;
  home.homeDirectory = user.homeDir;
  home.stateVersion = "22.11";

  programs.direnv.enable = true;
}

