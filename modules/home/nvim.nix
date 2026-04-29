{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  # LazyVim xdg config
  xdg.configFile."nvim" = {
    source = ./nvim;
    recursive = true;
  };
}
