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

  hardware.graphics = {      
      enable = true;
      enable32Bit = true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
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
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCUSeBw="
    ];
  };
  nixpkgs.config.allowUnfree = true;
  virtualisation.libvirtd.enable = true;
  system.stateVersion = "24.11";
}
