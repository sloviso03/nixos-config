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
    zoom-us
    p7zip
    obsidian
    pavucontrol
    gpu-screen-recorder-gtk
  ];

  
}
