{ ... }:
{
  imports = [
    ./hardware.nix
    ../../modules/core
    ../../modules/sway
    ../../modules/apps
    ../../modules/dev
  ];

  networking.hostName = "nixos";
  time.timeZone = "America/Argentina/Buenos_Aires";
  i18n.defaultLocale = "en_US.UTF-8";

  system.stateVersion = "25.11";

}
