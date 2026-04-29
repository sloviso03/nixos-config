{ ... }:
{
  programs.waybar = {
    enable   = true;
    settings = {
      mainBar = {
        position = "bottom";
        height = 30;
        modules-left = [ "sway/workspaces" ];
        modules-right = [ "network" "pulseaudio" "clock" ];

        "sway/workspaces" = {
          disable-scroll = false;
          all-outputs = true;
        };

        "network" = {
          format-wifi = "  {essid}";
          format-disconnected = "  disconnected";
          tooltip = false;
        };

        "pulseaudio" = {
          format = "  vol: {volume}%";
          format-muted = "  mute";
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
        border-radius: 0;
      }

      window#waybar {
        background-color: #000000;
        color: #ffffff;
      }

      #workspaces button {
        color: #555555;
        background: transparent;
        padding: 0 8px;
      }

      #workspaces button.focused {
        color: #ffffff;
      }

      #workspaces button:hover {
        background: #111111;
        color: #ffffff;
      }

      #network, #pulseaudio, #clock {
        color: #aaaaaa;
        padding: 0 12px;
      }
    '';
  };
}
