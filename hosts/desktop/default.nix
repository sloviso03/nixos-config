{ pkgs, ... }:
{
  imports = [
    ./hardware.nix
    ../../modules/system/sway
    ../../modules/system/pipewire
  ];

  # bootloader 
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # network
  networking = {
    hostName = "desktop";
    networkmanager.enable = true;
  };

  # locale / timezone
  time.timeZone = "America/Argentina/Buenos_Aires";
  i18n.defaultLocale = "en_US.UTF-8";

  # fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  # user 
  users.users.santiagolovisotto = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "wheel" "networkmanager" "audio" "video" "adbusers" "docker" ];
  };

  # Basic system packages
  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    unzip
    ripgrep
    fd
    nano
    fastfetch
  ];

  # shell 
  programs.fish.enable = true;

  # nix settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  virtualisation.libvirtd.enable = true;
  system.stateVersion = "24.11";
}
