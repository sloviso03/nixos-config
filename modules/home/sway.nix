{ ... }:
{
  wayland.windowManager.sway = {
    enable = true;
    checkConfig = false;
    config = {
      modifier = "Mod4";
      terminal = "alacritty";
      menu = "wofi --show drun";

      fonts = {
        names = [ "JetBrainsMono Nerd Font" ];
        size = 11.0;
      };

      input = {
        "*" = {
          xkb_layout = "latam";
        };
      };

      output = {
        "HDMI-A-1" = {
          mode = "1920x1080@100Hz";
          position = "1366 0";
          bg = "/home/santiagolovisotto/Pictures/Wallpapers/bg.png fill";
        };
        "DP-3" = {
          mode = "1366x768@60Hz";
          position = "0 300";
          bg = "/home/santiagolovisotto/Pictures/Wallpapers/bg.png fill";
        };
        "*" = {
          #bg = "#000000 solid_color";
          bg = "/home/santiagolovisotto/Pictures/Wallpapers/bg.png fill";
        };
      };

      gaps = {
        inner = 6;
        outer = 4;
      };

      window = {
        border = 0;
        titlebar = false;
      };

      floating = {
        border = 0;
        titlebar = false;
      };

      colors = {
        focused = {
          background = "#000000";
          border = "#000000";
          childBorder = "#000000";
          indicator = "#000000";
          text = "#ffffff";
        };

        unfocused = {
          background = "#000000";
          border = "#000000";
          childBorder = "#000000";
          indicator = "#000000";
          text = "#888888";
        };
      };


      keybindings = let
        mod = "Mod4";
      in {
        "${mod}+t" = "exec alacritty";
        "${mod}+d" = "exec wofi --show drun";
        "${mod}+w" = "exec firefox";
	"${mod}+e" = "exec thunar";
        "${mod}+q" = "kill";
        "${mod}+Shift+r" = "reload";
        "${mod}+Shift+e" = "exec swaynag -t warning -m 'Salir?' -B 'Sí' 'swaymsg exit'";

        "${mod}+Left" = "focus left";
        "${mod}+Down" = "focus down";
        "${mod}+Up" = "focus up";
        "${mod}+Right" = "focus right";

        "${mod}+Shift+Left" = "move left";
        "${mod}+Shift+Down" = "move down";
        "${mod}+Shift+Up" = "move up";
        "${mod}+Shift+Right" = "move right";

        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";

        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
      };

      bars = [{
        command = "waybar";
        position = "bottom";
      }];
    };
  };
}
