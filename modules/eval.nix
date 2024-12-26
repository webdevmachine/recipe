{ lib, ... }:
{
  options = {
    target = lib.options.mkOption {
      type = lib.types.lazyAttrsOf lib.types.deferredModule;
      default = { };
    };
  };
}
