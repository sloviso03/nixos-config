{ pkgs, ... }:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "nixos";
        type = "builtin";
        padding = {
          left = 2;
          right = 6;
        };
        color = {
          "1" = "blue";
          "2" = "cyan";
        };
      };
      display = {
        separator = " → ";
      };
      modules = [
        "title"
        "separator"
        "os"
        "kernel"
        "uptime"
        "packages"
        "shell"
        "terminal"
        "cpu"
        "gpu"
        "memory"
        "separator"
        "colors"
      ];
    };
  };
}