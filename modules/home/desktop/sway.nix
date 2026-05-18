{ ... }:
{
  wayland.windowManager.sway = {
    enable = true;
    checkConfig = false;
    
    extraConfig = ''
      smart_gaps off
      smart_borders off
      hide_edge_borders both
      bindsym --whole-window Mod4+button5 workspace next_on_output
      bindsym --whole-window Mod4+button4 workspace prev_on_output
      bindsym Mod4+Tab focus next sibling
      bindsym Mod4+Shift+Tab focus prev sibling
    '';

    config = {
      modifier = "Mod4";
      terminal = "alacritty";
      menu = "wofi --show drun";
      assigns = {};
    
      fonts = {
        names = [ "JetBrainsMono Nerd Font" ];
        size = 11.0;
      };

      input = {
        "*" = {
          xkb_layout = "latam";
        };
      };

      output = {};

      gaps = {
        inner = 0;
        outer = 0;
      };

      window = {
        border = 0;
        titlebar = false;
        hideEdgeBorders = "both";
      };

      floating = {
        border = 0;
        titlebar = false;
      };

      colors = {
        focused = {
          background = "#000000"; border = "#000000";
          childBorder = "#000000"; indicator = "#000000";
          text = "#ffffff";
        };
      
        unfocused = {
          background = "#000000"; border = "#000000";
          childBorder = "#000000"; indicator = "#000000";
          text = "#888888";
        };
        
      };

      keybindings = let mod = "Mod4"; in {
        "${mod}+t" = "exec alacritty";
        "${mod}+d" = "exec wofi --show drun";
        "${mod}+w" = "exec firefox";
        "${mod}+e" = "exec thunar";
        "${mod}+q" = "kill";
        "${mod}+f" = "fullscreen toggle";
        "${mod}+v" = "exec cliphist list | wofi --dmenu | cliphist decode | wl-copy";
        "${mod}+o" = "exec okular";
        "${mod}+Shift+r" = "reload";
        "${mod}+Shift+e" = "exec swaynag -t warning -m 'Salir?' -B 'Sí' 'swaymsg exit'";
        "${mod}+Shift+s" = ''exec grim -g "$(slurp)" - | tee ~/Pictures/$(date +%Y%m%d_%H%M%S).png | wl-copy'';
        "${mod}+Shift+a" = "exec grim - | wl-copy && grim ~/Pictures/$(date +%Y%m%d_%H%M%S).png";
      
        "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
        "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
      
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
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        
        "${mod}+Ctrl+Left" = "resize shrink width 50px"; 
        "${mod}+Ctrl+Right" = "resize grow width 50px";  
        "${mod}+Ctrl+Up" = "resize shrink height 50px";  
        "${mod}+Ctrl+Down" = "resize grow height 50px";   
      };

      startup = [
        { command = "nm-applet --indicator"; }
        { command = "blueman-applet"; }
      ];
      
      bars = [{
        command = "waybar";
        position = "bottom";
      }];

    };
  };
}
