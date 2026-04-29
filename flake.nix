{
  description = "sloviso03's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    # Builds a NixOS system for a given hostname.
    # The host folder and its monitors file must exist under the same name.
    mkHost = hostname: nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit self; };
      modules = [
        ./hosts/${hostname}
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs   = true;
          home-manager.useUserPackages = true;
          home-manager.users.santiagolovisotto =
            import ./modules/home { host = hostname; };
        }
      ];
    };
  in
  {
    # To add a new machine:
    #   1. mkdir hosts/<name>  (add default.nix + hardware.nix)
    #   2. add modules/home/monitors/<name>.nix
    #   3. register it below
    nixosConfigurations = {
      desktop  = mkHost "desktop";
      # thinkpad = mkHost "thinkpad";
    };
  };
}