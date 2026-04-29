{ pkgs, ... }:
{
  home.username = "santiagolovisotto";
  home.homeDirectory = "/home/santiagolovisotto";
  home.stateVersion = "25.11";

  imports = [
    ./sway.nix
  ];

  programs.home-manager.enable = true;
}
