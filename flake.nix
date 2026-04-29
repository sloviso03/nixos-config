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
    mkHost = hostname: nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit self; };
      modules = [
        ./hosts/${hostname}
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs    = true;
          home-manager.useUserPackages  = true;
          home-manager.users.santiagolovisotto =
            import ./modules/home { host = hostname; };
        }
      ];
    };
  in
  {
    # hosts
    # Agregar una máquina nueva es tan simple como:
    #   1. mkdir hosts/<nombre>
    #   2. copiar default.nix + hardware.nix
    #   3. agregar la línea acá abajo
    nixosConfigurations = {
      desktop = mkHost "desktop";
      # thinkpad = mkHost "thinkpad";
    };
  };
}
