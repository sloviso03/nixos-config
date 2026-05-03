{ pkgs, ... }:
{
  imports = [
    ./sway.nix
    ./waybar.nix
    ./gtk.nix
    ./fastfetch.nix
  ];

  services.cliphist.enable = true;
}