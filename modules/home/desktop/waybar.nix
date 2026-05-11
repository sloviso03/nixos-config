{ ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        position = "bottom";
        height = 32;
        
        margin-top = 5;
        margin-bottom = 5;
        margin-left = 5;
        margin-right = 5;

        spacing = 0;
        modules-left = [ "sway/workspaces" ];
        modules-right = [ "network" "pulseaudio" "clock" ];

        "sway/workspaces" = {
          disable-scroll = false;
          all-outputs = false;
          format = "{icon}";
          format-icons = {
            focused = "●";
            default = "○";
            urgent  = "◆";
          };
        };

        "network" = {
          format-wifi = "󰖩  {essid}";
          format-disconnected = "󰖪  offline";
          tooltip = false;
        };

        "pulseaudio" = {
          format = "󰕾  {volume}%";
          format-muted = "󰝟  mute";
          tooltip = false;
        };

        "clock" = {
          format = "{:%H:%M    %d/%m/%Y}";
          timezone = "America/Argentina/Buenos_Aires";
          tooltip = false;
        };
      };
    };

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font Mono";
        font-size: 14px;
        border: none;
        min-height: 0;
      }

      window#waybar {
        background-color: transparent;
      }

      window#waybar > box {
        background-color: #0a0a0a;
        border: 1px solid #cccccc;
        border-radius: 16px;
        margin: 0;
        padding: 0 4px;
      }

      #workspaces {
        padding: 0 8px;
      }

      #workspaces button {
        color: #cccccc;
        background: transparent;
        padding: 0 6px;
        font-size: 16px;
      }

      #workspaces button.focused {
        color: #ffffff;
      }

      #workspaces button.urgent {
        color: #ff5555;
      }

      #workspaces button:hover {
        color: #888888;
        background: transparent;
        box-shadow: none;
      }

      #network, #pulseaudio, #clock {
        color: #666666;
        padding: 0 14px;
      }

      #clock {
        color: #aaaaaa;
      }

      #network:hover, #pulseaudio:hover {
        color: #ffffff;
      }
    '';
  };
}