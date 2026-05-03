{ pkgs, ... }:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "GNU";
        type = "builtin";
        padding = {
          left = 1;
          right = 4;
        };
        color = {
          "1" = "yellow";
          "2" = "white";
        };
      };
      display = {
        separator = " → ";
        color = {
          keys = "yellow";
          title = "white";
          separator = "bright_yellow";
        };
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
        "wm"
        "cpu"
        "gpu"
        "memory"
        "disk"
        "datetime"
        "separator"
        "colors"
      ];
    };
  };
}
