{ ... }:
{
  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = "Mod4";
      terminal = "alacritty";
      menu = "wofi --show drun";

      input = {
        "*" = {
          xkb_layout = "latam";
        };
      };

      keybindings = let
        mod = "Mod4";
      in {
        "${mod}+Return" = "exec alacritty";
        "${mod}+d" = "exec wofi --show drun";
        "${mod}+w" = "exec firefox";
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
      }];
    };
  };
}
