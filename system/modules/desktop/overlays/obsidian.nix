{pkgs, lib}: {
# In overlay
    nixpkgs.overlays = [(final: prev: {
        obsidian = prev.obsidian.override {electron = final.electron_24;};
    })];
    # In config
    nixpkgs.config = {
      permittedInsecurePackages = [
        "electron-24.8.6"
      ];
    };
}
