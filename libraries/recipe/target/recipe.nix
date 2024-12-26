{ config, ... }:
let
  inherit (config) lib;
in
{
  lib.recipe.target.recipe =
    {
      inputs,
      extraSpecialArgs ? { },
    }:
    { config }:
    let
      defaultSpecialArgs = {
        lib = lib.recipe.target.lib { inherit inputs extraSpecialArgs; } { inherit config; };
      };

      specialArgs = lib.recipe.args {
        inherit inputs;
        extraSpecialArgs = defaultSpecialArgs // extraSpecialArgs;
      };

      eval = lib.recipe.eval { inherit specialArgs; } { inherit config; };

      result = lib.modules.evalModules {
        inherit specialArgs;
        class = "recipe";
        modules = [
          eval.config.target.recipe
          ../../../modules/recipe.nix
        ];
      };
    in
    result.config.recipe;
}
