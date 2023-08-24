{ lib, python3Packages, python310Packages, fetchFromGitHub}: 
python3Packages.buildPythonApplication rec {
    pname = "khinsider";
    version = "b1683fb";
    
    src = fetchFromGitHub {
        owner = "obskyr";
        repo = "khinsider";
        rev = "b1683fb";
        sha256 = "sha256-sSxLicoqS41Ofw5M0K3ERbYZAYe4lgQPKpzWdHNl0vA=";
    };

    propagatedBuildInputs = [
        python310Packages.requests
        python310Packages.beautifulsoup4
    ];

    format = "other";

    dontBuild = true;
    
    installPhase = ''
        mkdir -p $out/bin
        cp -r $src/khinsider.py $out/bin/khinsider
        chmod +x $out/bin/khinsider
    '';
}
