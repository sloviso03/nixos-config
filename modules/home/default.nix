{ host ? "desktop", ... }:
{
  imports = [
    ./shell       # fish + starship
    ./editor      # neovim + lazyvim
    ./terminal    # alacritty
    ./desktop     # sway + waybar + gtk
    ./dev
    ./apps
    (./monitors + "/${host}.nix")  # per-machine monitor outputs
  ];

  home = {
    username    = "santiagolovisotto";
    homeDirectory = "/home/santiagolovisotto";
    stateVersion  = "24.11";
  };
}
