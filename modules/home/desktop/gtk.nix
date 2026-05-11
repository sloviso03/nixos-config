{ pkgs, config, ... }:
{
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.catppuccin-cursors.mochaDark;
    name = "catppuccin-mocha-dark-cursors";
    size = 24;
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };

    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
    gtk3.extraCss = ''
      @define-color accent_color #cccccc;
      @define-color accent_bg_color #cccccc;
      @define-color accent_fg_color #000000;
      @define-color window_bg_color #000000;
      @define-color window_fg_color #ffffff;
      @define-color view_bg_color #0a0a0a;
      @define-color view_fg_color #ffffff;
      @define-color headerbar_bg_color #000000;
      @define-color headerbar_fg_color #ffffff;

      /* Forzar resaltado gris */
      selection { background-color: #cccccc; color: #000000; }
      *:selected { background-color: #cccccc; color: #000000; }
    '';

    gtk4.extraConfig.gtk-application-prefer-dark-theme = true;
    gtk4.extraCss = ''
      @define-color accent_color #cccccc;
      @define-color accent_bg_color #cccccc;
      @define-color accent_fg_color #000000;
      @define-color window_bg_color #000000;
      @define-color window_fg_color #ffffff;
      
      selection { background-color: #cccccc; color: #000000; }
      *:selected { background-color: #cccccc; color: #000000; }
    '';
  };
  
  home.sessionVariables = {
    GTK_THEME = "Adwaita-dark";
  };
}