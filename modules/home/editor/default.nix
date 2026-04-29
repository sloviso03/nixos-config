{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withRuby = false;
    withPython3 = false;
  };

  # LazyVim - lua files are in modules/home/editor/nvim/
  xdg.configFile."nvim" = {
    source = ./nvim;
    recursive = true;
  };
}
