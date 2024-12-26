{
  target.recipe =
    { lib, ... }:
    {
      recipe = {
        inherit lib;
      };
    };

  target.lib = {
    imports = [ ../libraries ];
  };
}
