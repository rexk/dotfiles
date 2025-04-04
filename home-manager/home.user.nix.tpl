{ pkgs, lib, ... }:
let
  provided-pkgs-args = { inherit pkgs; inherit lib; };
  provided-pkgs = import ./provided-pkgs.nix provided-pkgs-args;
in
{
  home.packages = with pkgs;
    provided-pkgs.with-user-pkgs {
      excludes = [ ];
      includes = [
        gh
        lazygit
        bat
      ];
    };

  programs.starship = {
    enable = true;
  };
}
