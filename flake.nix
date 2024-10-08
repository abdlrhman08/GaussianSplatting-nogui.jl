{
  description = "CUDA development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          julia-bin
        ];
        #CUDA_PATH="${pkgs.cudaPackages.cudatoolkit}";
        LD_LIBRARY_PATH="/run/opengl-driver/lib";
      };
    };
}
