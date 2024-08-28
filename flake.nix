{
  description = "Flo project";

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "aarch64-darwin"
        "x86_64-darwin"
      ];

      imports = [ ];

      perSystem =
        { pkgs, ... }:
        {
          # development / nix-shell / nix develop 
          devShells.default = pkgs.mkShell {
            nativeBuildInputs = with pkgs; [
              swift
              swiftpm
              swiftpm2nix
            ];
          };
        };

    };

  inputs = {
    # utilities for Flake
    flake-parts.url = "github:hercules-ci/flake-parts";

    ## -- nixpkgs 
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs.follows = "nixpkgs-unstable";
  };
}
