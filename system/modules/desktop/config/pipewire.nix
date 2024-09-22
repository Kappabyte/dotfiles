{...}: {
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        pulse.enable = true;
        jack.enable = true;
    };
    
    # Enables the realtimekit system service used by pulseaudio
    security.rtkit.enable = true;
}
