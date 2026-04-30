{ pkgs, ... }:
{
  home.packages = with pkgs; [
    firefox
    spotify
    discord
    kdePackages.okular
    spotify-player
  ];
}
