{ pkgs, ... }:
{
  imports = [
    ./sway.nix
    ./waybar.nix
    ./gtk.nix
    ./fastfetch.nix
  ];

  services.cliphist.enable = true;

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/terminal" = "alacritty.desktop";
    };
  };
}