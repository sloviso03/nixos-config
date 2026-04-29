{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    firefox
    kdePackages.okular
    spotify
    jetbrains-toolbox
    vscode
    discord
  ];
}
