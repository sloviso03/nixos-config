{ pkgs, ... }:
{
  # Enables sway at the system level + Wayland dependencies
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      swaylock
      swayidle
      waybar
      wofi
      mako
      alacritty
      brightnessctl
      grim
      slurp
      wl-clipboard
      xdg-utils
      thunar
      cliphist
    ];
  };

  hardware.graphics.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
  };
}
