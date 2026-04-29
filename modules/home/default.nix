{ pkgs, ... }:
{
  home.username = "santiagolovisotto";
  home.homeDirectory = "/home/santiagolovisotto";
  home.stateVersion = "25.11";

  imports = [
    ./sway.nix
    ./waybar.nix
    ./alacritty.nix
    ./fish.nix
    ./nvim.nix
    ./gtk.nix
  ];

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    thunar
    yazi
    fastfetch
  ];

  programs.home-manager.enable = true;
}
