{ pkgs, ...}:


{
  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # Wifi
  networking.networkmanager.enable = true;

  # Keyboard
  console.keyMap = "la-latin1";

  # User (password generated with mkpasswd -m sha-512)
  users.users.santiagolovisotto = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "input" ];
    initialPassword = "$6$mNK0t39R0nuDsHal$qiTRg1AzmeIeZpezIgauw4bA7/gvZTX7pyXifKkJpWzuUvzbEn8mdgB4VdJeQaj4bYyVpI22oVYUc2jgg.Wb60";
  };

  # Base packages
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    curl
    htop
  ];

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  security.sudo.wheelNeedsPassword = false;
}

