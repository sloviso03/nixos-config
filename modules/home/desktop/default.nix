{ pkgs, ... }:
{
  imports = [
    ./sway.nix
    ./waybar.nix
    ./gtk.nix
  ];

  services.cliphist.enable = true;
}