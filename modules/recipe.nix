{ lib, ... }:
{
  options = {
    recipe = lib.options.mkOption {
      type = lib.types.raw;
    };
  };
}
