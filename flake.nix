{
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs =
    { self
    , flake-parts
    , nixvim
    , ...
    } @ inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem =
        { system, pkgs, ... }:
        {
          packages."default" = nixvim.legacyPackages.${system}.makeNixvimWithModule {
            inherit pkgs;
            module = self.nixvimModules.default;
          };

          # Dev shell with formatters
          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              nixfmt
            ];
          };
        };

      flake = {
        nixvimModules.default = ./modules;

        # Home Manager module that can be imported
        homeManagerModules.default = { pkgs, lib, ... }: {
          programs.nixvim = {
            enable = true;
            imports = [ ./modules ];
          };
        };
      };
    };
}
