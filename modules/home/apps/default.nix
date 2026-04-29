{ pkgs, ... }:
{
  home.packages = with pkgs; [
    spotify
    discord
    kdePackages.okular
  ];
}
