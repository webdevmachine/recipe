inputs:
let
  lib' = inputs.lib.lib;

  args = import ./libraries/recipe/args.nix {
    config.lib = lib';
  };

  eval = import ./libraries/recipe/eval.nix {
    config.lib = lib' // args.lib;
  };

  self = import ./libraries/recipe/target/lib.nix {
    config.lib = lib' // (lib'.attrsets.recursiveUpdate args.lib eval.lib);
  };

  lib = self.lib.recipe.target.lib { inherit inputs; } { config = ./configs; };
in
lib.recipe.target.recipe { inherit inputs; } { config = ./configs; }
