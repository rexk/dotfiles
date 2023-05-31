# This file should be maintained by a team X
# DO NOT MODIFY directly
# for local configurations use home.user.nix
{ pkgs, lib, ... }:
let
  removeAll = excludes: all: lib.lists.fold (acc: item: lib.lists.remove item acc) all excludes;
  provided-pkgs = with pkgs; [
    # Provide org-wide packages here
    bashInteractive
    jq
    curl
    git
    nodejs-18_x
  ];
  with-user-pkgs = inst:
    let
      excludes = inst.excludes;
      includes = inst.includes;
      without-excludes = removeAll excludes provided-pkgs;
    in
    lib.lists.unique (provided-pkgs ++ includes);
in
{
  inherit provided-pkgs;
  inherit with-user-pkgs;
}
