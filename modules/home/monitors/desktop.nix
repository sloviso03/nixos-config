# Para agregar/cambiar monitores en otra máquina, crear
# modules/home/monitors/<hostname>.nix con la misma estructura.
{ ... }:
{
  wayland.windowManager.sway.config.output = {
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
}
