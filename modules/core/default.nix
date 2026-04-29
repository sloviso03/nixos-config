{ pkgs, ...}:


{
  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 5d";
  };
  
  # Wifi
  networking.networkmanager.enable = true;

  # Keyboard & timezone
  console.keyMap = "la-latin1";
  time.timeZone = "America/Argentina/Buenos_Aires";


  # Enable services
  services.timesyncd.enable = true;

  # User (password generated with mkpasswd -m sha-512)
  users.users.santiagolovisotto = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "input" ];
    initialPassword = "$6$mNK0t39R0nuDsHal$qiTRg1AzmeIeZpezIgauw4bA7/gvZTX7pyXifKkJpWzuUvzbEn8mdgB4VdJeQaj4bYyVpI22oVYUc2jgg.Wb60";
    shell = pkgs.fish;
  };

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  security.sudo.wheelNeedsPassword = false;

  # Nix Config
  programs.fish.enable = true;
  nixpkgs.config.allowUnfree = true;
}

