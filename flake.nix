{
  description = "concurrency-in-action";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      llvmPkgs = pkgs.llvmPackages_21;
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          llvmPkgs.clang
          mold
          llvmPkgs.libcxx
        ];
      };
    };
}
