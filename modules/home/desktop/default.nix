{ pkgs, ... }:
{
  imports = [
    ./sway.nix
    ./waybar.nix
    ./gtk.nix
  ];

  services.cliphist.enable = true;

  home.file.".config/sway/cycle-hdmi.sh" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash
      WORKSPACES=(1 3 4)
      OUTPUT="HDMI-A-1"
      DIRECTION=$1

      CURRENT=$(swaymsg -t get_workspaces | python3 -c "
      import json,sys
      ws = json.load(sys.stdin)
      for w in ws:
          if w['output'] == '$OUTPUT' and w['visible']:
              print(w['name'])
              break
      ")

      LEN=${#WORKSPACES[@]}
      IDX=0
      for i in "${!WORKSPACES[@]}"; do
        if [ "${WORKSPACES[$i]}" = "$CURRENT" ]; then
          IDX=$i
          break
        fi
      done

      if [ "$DIRECTION" = "next" ]; then
        NEXT=${WORKSPACES[$(( (IDX + 1) % LEN ))]}
      else
        NEXT=${WORKSPACES[$(( (IDX - 1 + LEN) % LEN ))]}
      fi

      swaymsg "workspace number $NEXT"
    '';
  };
}