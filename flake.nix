{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ {
    self, nixpkgs, flake-parts, ...
  }: flake-parts.lib.mkFlake {
    inherit inputs;
  } {
    systems = [ "aarch64-darwin" ];

    perSystem = { pkgs, system, ... }: let
      buildPackages = [
        pkgs.nodejs_24
      ];

      toolsPackages = [
        pkgs.tailwindcss_4
        pkgs.vscode-langservers-extracted
      ];
    in {
      devShells.default = pkgs.mkShell {
        packages = buildPackages ++ toolsPackages;
      };
    };
  };
}
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      forAllSystems =
        function:
        nixpkgs.lib.genAttrs [
          "aarch64-darwin"
        ] (system: function nixpkgs.legacyPackages.${system});
    in
    {
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            zola
          ];
        };
      });
    };
}
