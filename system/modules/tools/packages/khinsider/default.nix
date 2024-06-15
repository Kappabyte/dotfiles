{ python311Packages, fetchFromGitHub}: let 
    python = python311Packages;
in python.buildPythonApplication rec {
    pname = "khinsider";
    version = "b1683fb";
    
    src = fetchFromGitHub {
        owner = "obskyr";
        repo = "khinsider";
        rev = "b1683fb";
        sha256 = "sha256-sSxLicoqS41Ofw5M0K3ERbYZAYe4lgQPKpzWdHNl0vA=";
    };

    propagatedBuildInputs = with python; [
        requests
        beautifulsoup4
    ];

    format = "other";

    dontBuild = true;
    
    installPhase = ''
        mkdir -p $out/bin
        cp -r $src/khinsider.py $out/bin/khinsider
        chmod +x $out/bin/khinsider
    '';
}
