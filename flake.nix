{
  description = "Boilerplate to load a deeply nested flake from GitHub";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Target your specific nested sub-subfolder here
    subfolder-flake.url = "github:the-nix-way/dev-templates?dir=platformio";
    subfolder-flake.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, subfolder-flake, ... }:
    let
      system = "x86_64-linux";
    in
    {
      # Directly mirror the default devShell out of the subfolder project
      devShells.${system}.default = subfolder-flake.devShells.${system}.default;
    };
}
