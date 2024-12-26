{ config, ... }:
let
  inherit (config) lib;
in
{
  lib.recipe.eval =
    { specialArgs }:
    { config }:
    lib.modules.evalModules {
      inherit specialArgs;
      class = "recipe";
      modules = [
        config
        ../../modules/eval.nix
      ];
    };
}
