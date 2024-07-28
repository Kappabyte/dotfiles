{lib, pkgs, config, enabled, inputs, ...}: 
let
    getDir = dir: lib.mapAttrs(file: type: if type == "directory" then getDir "${dir}/${file}" else type)(builtins.readDir dir);
    files = dir: lib.collect lib.isString (lib.mapAttrsRecursive (path: type: lib.concatStringsSep "/" path) (getDir dir));
    genConfig = dir: recursiveMerge(map (file: import (dir + "/${file}") {pkgs = pkgs; lib = lib; config = config; inputs = inputs;}) (lib.filter(file: lib.hasSuffix ".nix" file && file != "default.nix")(files dir)));
    
    recursiveMerge = attrList: let f = attrPath: lib.zipAttrsWith (n: values:
        if lib.tail values == []
            then lib.head values
        else if lib.all lib.isList values
            then lib.unique (lib.concatLists values)
        else if lib.all lib.isAttrs values
            then f (attrPath ++ [n]) values
        else lib.last values
    );
    in f [] attrList;
in {
    imports = lib.optional (builtins.pathExists ./services) ./services;

    config = (lib.mkIf enabled (recursiveMerge [
        (if (builtins.pathExists ./config) then (genConfig ./config) else {})
        (if (builtins.pathExists ./users) then (genConfig ./users) else {})
        (if (builtins.pathExists ./overlays) then (genConfig ./overlays) else {})
        (if (builtins.pathExists ./packages.nix) then (import ./packages.nix {pkgs = pkgs; lib = lib; inputs = inputs;}) else {})
    ]));
}

