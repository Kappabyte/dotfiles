{stdenv, fetchFromGitLab}: stdenv.mkDerivation {
    pname = "adwaita-one-dark";
    version = "v0.44.1";
    
    src = fetchFromGitLab {
        owner = "roidm";
        repo = "one-dark";
        rev = "369ecce5";
        sha256 = "sha256-FkmpCqtxvgLoUQn1rk9YIIFGoN1E53E3XYGNHmi1/JQ=";
    };

    dontBuild = true;
    
    installPhase = ''
        mkdir -p $out/share/themes
        cp -r $src/One-Dark $out/share/themes/
    '';

    meta = {
        description = "One Dark Theme for GTK";
        homepage = "https://gitlab.com/roidm/one-dark";
    };
}
