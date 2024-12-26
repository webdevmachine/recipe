{
  outputs = inputs: import ./. inputs;

  inputs.lib.url = "github:nix-community/nixpkgs.lib";
}
