{ ... }: let
    configs = dir: map (n: "${dir}/${n}") (builtins.attrNames (builtins.readDir dir));
in {
    imports = (configs ./config);
}
