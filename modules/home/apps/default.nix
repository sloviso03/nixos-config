{ pkgs, ... }:
{
  home.packages = with pkgs; [
    firefox
    zip
    spotify
    discord
    kdePackages.okular  
    anki       
    vlc       
    chromium
    zoom-us
    obsidian
  ];

  
}
