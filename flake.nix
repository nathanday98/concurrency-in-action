{
  description = "concurrency-in-action";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    fastbuild-bin-overlay.url = "github:nathanday98/fastbuild-bin-overlay";
  };

  outputs =
    { nixpkgs, fastbuild-bin-overlay, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          fastbuild-bin-overlay.overlays.default
        ];
      };
    in
    {
      devShells.${system}.default = pkgs.mkShell.override { stdenv = pkgs.clangStdenv; } {

        # COMPILER = llvmPkgs.clang;
        # LIBCXX = llvmPkgs.libcxx;
        #

        packages = with pkgs; [
          clang-tools
          # llvmPkgs.libstdcxxClang
          # mold
          # llvmPkgs.libcxx
          fastbuild-bin
        ];
      };
    };
}
