{lib
, stdenv
, wrapQtAppsHook
, alsa-lib
, boost
, catch2_3
, cmake
, cpp-jwt
, cubeb
, discord-rpc
, doxygen
, enet
, fetchzip
, ffmpeg
, fmt
, glslang
, httplib
, inih
, libjack2
, libopus
, libpulseaudio
, libusb1
, libva
, libzip
, lz4
, nlohmann_json
, perl
, pkg-config
, python3
, qtbase
, qtmultimedia
, qttools
, qtwayland
, qtwebengine
, rapidjson
, SDL2
, sndio
, speexdsp
, udev
, vulkan-headers
, vulkan-loader
, zlib
, zstd
}: stdenv.mkDerivation {
    pname = "sudachi";
    version = "1.0.9";

    src = fetchzip {
        url = "https://github.com/emuplace/sudachi.emuplace.app/releases/download/v${version}/latest.zip";
        hash = "";
    };

    nativeBuildInputs = [
        cmake
        doxygen
        perl
        pkg-config
        python3
        wrapQtAppsHook
    ];

    buildInputs = [
        alsa-lib
        boost
        catch2_3
        cpp-jwt
        cubeb
        discord-rpc
        enet
        ffmpeg
        fmt
        glslang
        httplib
        inih
        libjack2
        libopus
        libpulseaudio
        libusb1
        libva
        libzip
        lz4
        nlohmann_json
        qtbase
        qtmultimedia
        qttools
        qtwayland
        qtwebengine
        rapidjson
        SDL2
        sndio
        speexdsp
        udev
        vulkan-headers
        zlib
        zstd
    ];

    dontFixCmake = true;

    cmakeFlags = [
        "-DYUZU_ENABLE_LTO=ON"

        "-DENABLE_QT6=ON"
        "-DENABLE_QT_TRANSLATION=ON"

        "-DYUZU_USE_EXTERNAL_SDL2=OFF"
        "-DYUZU_USE_EXTERNAL_VULKAN_HEADERS=OFF"

        "-DYUZU_CHECK_SUBMODULES=OFF"

        "-DYUZU_USE_QT_WEB_ENGINE=ON"
        "-DYUZU_USE_QT_MULTIMEDIA=ON"
        "-DUSE_DISCORD_PRESENCE=ON"

        "-DYUZU_ENABLE_COMPATIBILITY_REPORTING=OFF"
        "-DENABLE_COMPATIBILITY_LIST_DOWNLOAD=OFF" # We provide this deterministically
    ];

    qtWrapperArgs = [
        "--prefix LD_LIBRARY_PATH : ${vulkan-loader}/lib"
    ];

    preConfigure = ''
        cmakeFlagsArray+=(
                "-DTITLE_BAR_FORMAT_IDLE=yuzu | ${branch} ${version} (nixpkgs) {}"
                "-DTITLE_BAR_FORMAT_RUNNING=yuzu | ${branch} ${version} (nixpkgs) | {}"
                )

        mkdir -p build/externals/nx_tzdb
        ln -sf ${tzinfo} build/externals/nx_tzdb/${tzinfoVersion}.zip
    '';

    meta = with lib; {
        description = "The ${branch} branch of an experimental Nintendo Switch emulator written in C++";
        longDescription = ''
            An experimental Nintendo Switch emulator written in C++.
            Using the mainline branch is recommended for general usage.
            Using the early-access branch is recommended if you would like to try out experimental features, with a cost of stability.
        '';
        mainProgram = "sudachi";
        platforms = [ "x86_64-linux" ];
        license = with licenses; [
            gpl3Plus
        ];
    };
}
