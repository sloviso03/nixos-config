{ pkgs, ... }:
{
  imports = [
    ./sway.nix
    ./waybar.nix
    ./gtk.nix
    ./fastfetch.nix
  ];

  services.cliphist.enable = true;

  home.file.".config/xfce4/helpers.rc".text = ''
    TerminalEmulator=alacritty
    TerminalEmulatorDismissed=true
  '';

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/terminal" = "alacritty.desktop";
    };
  };
}