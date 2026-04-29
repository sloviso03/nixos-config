{ pkgs, ... }:
{
  gtk = {
    enable = true;

    theme = {
      name    = "Dracula";
      package = pkgs.dracula-theme;
    };

    iconTheme = {
      name    = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };

    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = true;
    gtk4.theme = null;
  };

  home.sessionVariables = {
    GTK_THEME = "Dracula";
  };
}
