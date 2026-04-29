{ pkgs, ... }:
{
  programs.neovim = {
    enable        = true;
    defaultEditor = true;
    viAlias       = true;
    vimAlias      = true;
  };

  # LazyVim - lua files are in modules/home/editor/nvim/
  xdg.configFile."nvim" = {
    source = ./nvim;
    recursive = true;
  };
}
