{ config, ... }:
let
  inherit (config) lib;
in
{
  lib.recipe.target.lib =
    {
      inputs,
      extraSpecialArgs ? { },
    }:
    { config }:
    let
      specialArgs = lib.recipe.args { inherit inputs extraSpecialArgs; };
      eval = lib.recipe.eval { inherit specialArgs; } { inherit config; };

      result = lib.modules.evalModules {
        inherit specialArgs;
        class = "lib";
        modules = [
          eval.config.target.lib
          ../../../modules/lib.nix
        ];
      };
    in
    result.config.lib;
}
