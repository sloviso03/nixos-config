{ ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        position = "bottom";
        height = 32;
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
          format = "{:%H:%M  %d/%m/%Y}";
          timezone = "America/Argentina/Buenos_Aires";
          tooltip = false;
        };
      };
    };
    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font Mono";
        font-size: 13px;
        border: none;
        min-height: 0;
      }
      window#waybar {
        background-color: transparent;
      }
      window#waybar > box {
        background-color: #000000;
        border: 0.5px solid #000000;
        margin: 0;
        padding: 0 6px;
      }
      #workspaces {
        padding: 0 6px;
      }
      #workspaces button {
        color: rgba(255, 255, 255, 0.25);
        background: transparent;
        padding: 0 7px;
        font-size: 15px;
        transition: color 0.15s ease;
      }
      #workspaces button.focused {
        color: rgba(255, 255, 255, 0.90);
      }
      #workspaces button.urgent {
        color: #ff6e6e;
      }
      #workspaces button:hover {
        color: rgba(255, 255, 255, 0.55);
        background: transparent;
        box-shadow: none;
      }
      #network, #pulseaudio, #clock {
        color: rgba(255, 255, 255, 0.35);
        padding: 0 14px;
        transition: color 0.15s ease;
      }
      #clock {
        color: rgba(255, 255, 255, 0.55);
      }
      #network:hover, #pulseaudio:hover {
        color: rgba(255, 255, 255, 0.85);
      }
    '';
  };
}
