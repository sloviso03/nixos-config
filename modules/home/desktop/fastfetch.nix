{ pkgs, ... }:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "nixos_small";
        type = "builtin";
        padding = {
          left = 1;
          right = 4;
        };
        color = {
          "1" = "white";
          "2" = "bright_black";
        };
      };
      display = {
        separator = " → ";
        color = {
          keys = "bright_black";
          title = "white";
          separator = "bright_black";
        };
      };
      modules = [
        "title"
        "separator"
        "os"
        "kernel"
        "uptime"
        "shell"
        "terminal"
        "cpu"
        "gpu"
        "memory"
      ];
    };
  };
}
