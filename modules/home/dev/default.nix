{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vscode
    jetbrains-toolbox
    jdk21
    dotnet-sdk
    gcc
  ];
}
