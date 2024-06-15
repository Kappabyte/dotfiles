{lib, pkgs, config, enabled, inputs, ...}: 
with lib; let
    getDir = dir: mapAttrs(file: type: if type == "directory" then getDir "${dir}/${file}" else type)(builtins.readDir dir);
    files = dir: collect isString (mapAttrsRecursive (path: type: concatStringsSep "/" path) (getDir dir));
    genConfig = dir: recursiveMerge(map (file: import (dir + "/${file}") {pkgs = pkgs; lib = lib; config = config; inputs = inputs;}) (filter(file: hasSuffix ".nix" file && file != "default.nix")(files dir)));
    
    recursiveMerge = attrList:
    let f = attrPath:
    zipAttrsWith (n: values:
            if tail values == []
            then head values
            else if all isList values
            then unique (concatLists values)
            else if all isAttrs values
            then f (attrPath ++ [n]) values
            else last values
            );
    in f [] attrList;
in{
    imports = lib.optional (builtins.pathExists ./services) ./services;

    config = (lib.mkIf enabled (recursiveMerge [
                (if (builtins.pathExists ./config) then (genConfig ./config) else {})
                (if (builtins.pathExists ./users) then (genConfig ./users) else {})
                (if (builtins.pathExists ./overlays) then (genConfig ./overlays) else {})
                (if (builtins.pathExists ./packages.nix) then (import ./packages.nix {pkgs = pkgs; lib = lib;}) else {})
                ]));
}
