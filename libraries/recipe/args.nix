{ config, ... }:
let
  inherit (config) lib;
in
{
  lib.recipe.args =
    {
      inputs,
      extraSpecialArgs ? { },
    }:
    { inherit inputs lib; } // extraSpecialArgs;
}
