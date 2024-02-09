{ lib, ... }:

with lib; let
configs = dir: map (n: "${dir}/${n}") (builtins.attrNames (builtins.readDir dir));
in {
  imports = (trace (configs ./config) (configs ./config));
}
