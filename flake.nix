{
  description = "A (human) langage that is data-driven and logical, and with four sylables, a, ya, ay, and y ";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    flake-utils,
    nixpkgs,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = (import nixpkgs) {
          inherit system;
        };

	haskellPackages = with pkgs; [
	  stack
	  ghc
	];
      in {
        devShell = pkgs.mkShell {
          nativeBuildInputs = [] ++ haskellPackages;
        };
      }
    );
}
