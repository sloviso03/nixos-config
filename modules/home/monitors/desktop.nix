#
#   +----------+  +-----------------------+
#   |   DP-3   |  |       HDMI-A-1        |
#   | 1366x768 |  |    1920x1080@100Hz    |
#   |  @60Hz   |  |                       |
#   +----------+  +-----------------------+
#
# To add monitors for another machine, create
# modules/home/monitors/<hostname>.nix with the same structure.
#
{ ... }:
{
  wayland.windowManager.sway.config = {
    output = {
      "HDMI-A-1" = {
        mode     = "1920x1080@100Hz";
        position = "1366 0";
        bg       = "/home/santiagolovisotto/Pictures/Wallpapers/bg.png fill";
      };
      "DP-3" = {
        mode     = "1366x768@60Hz";
        position = "0 300";
        bg       = "/home/santiagolovisotto/Pictures/Wallpapers/bg.png fill";
      };
    };
    workspaceOutputAssign = [
      { workspace = "1"; output = "HDMI-A-1"; }
      { workspace = "2"; output = "HDMI-A-1"; }
      { workspace = "3"; output = "HDMI-A-1"; }
      { workspace = "4"; output = "DP-3"; }
      { workspace = "5"; output = "DP-3"; }
      { workspace = "6"; output = "DP-3"; }
    ];
  };
}