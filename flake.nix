{
  description = "concurrency-in-action";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    fastbuild = {
      url = "https://fastbuild.org/downloads/v1.18/FASTBuild-Linux-x64-v1.18.zip";
      # sha256 = "144d968vjhrjgjqnqqi288hw39x6qc28mmmizin84n8xijg5rirz";
      flake = false;
    };
  };

  outputs =
    { nixpkgs, fastbuild, ... }:
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
          "{fastbuild}/fbuild"
        ];
      };
    };
}
