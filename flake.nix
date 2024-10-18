{
  description = "Minimal Template";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils, rust-overlay }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          overlays = [ (import rust-overlay) ];
          pkgs = import nixpkgs {
            inherit system overlays;
          };
          rustToolchain = pkgs.pkgsBuildHost.rust-bin.fromRustupToolchainFile ./rust-toolchain.toml;
        in
        with pkgs;
        {
          devShells.default = mkShell {
            buildInputs = [ rustToolchain ];
            packages = [
              bacon
              # darwin.apple_sdk.frameworks.SystemConfiguration
              rust-analyzer
              flip-link # detect stack overflows
              probe-rs
              elf2uf2-rs
            ];
          };
        }
      );
}
