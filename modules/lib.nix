{ lib, ... }:
let
  libType = lib.types.oneOf [
    (lib.types.functionTo lib.types.raw)
    (lib.types.lazyAttrsOf libType)
  ];
in
{
  options = {
    lib = lib.options.mkOption {
      type = libType;
      apply = lib': lib.extend (lib.trivial.const (lib: lib.attrsets.recursiveUpdate lib lib'));
      default = { };
    };
  };
}
