
{ ... }: {
    xdg.configFile."hypr/hyprlock.conf".text = ''
    general {
        no_fade_in=true
        no_fade_out=true
    }

    background {
        monitor=
        path=screenshot

        blur_passes=3
        blur_size=7
    }

    input-field {
        monitor =
        size = 500, 50
        outline_thickness = 3
        dots_size = 0.1 # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.5 # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = false
        dots_rounding = -1 # -1 default circle, -2 follow input-field rounding
        outer_color = rgb(282C34)
        inner_color = rgb(282C34)
        font_color = rgb(ABB2BF)
        fade_on_empty = false
        fade_timeout = 1000 # Milliseconds before fade_on_empty is triggered.
        placeholder_text = <i>Input Password...</i> # Text rendered in the input box when it's empty.
        hide_input = false
        rounding = 10 # -1 means complete rounding (circle/oval)
        check_color = rgb(204, 136, 34)
        fail_color = rgb(E5C07B) # if authentication failed, changes outer_color and fail message color
        fail_text = <i>$FAIL <b>($ATTEMPTS)</b></i> # can be set to empty
        fail_transition = 0 # transition time in ms between normal outer_color and fail_color
        capslock_color = rgb(E5C07B)
        numlock_color = rgb(E5C07B)
        bothlock_color = rgb(E5C07B) # when both locks are active. -1 means don't change outer color (same for above)
        invert_numlock = false # change color if numlock is off
        swap_font_color = false # see below

        position = 0, -20
        halign = center
        valign = center
    }

    label {
        monitor =
        text = cmd[update:-1] cat /etc/issue
        text_align = center # center/right or any value for default left. multi-line text alignment inside label container
        color = rgba(200, 200, 200, 1.0)
        font_size = 14
        font_family = Noto Sans
        rotate = 0 # degrees, counter-clockwise

        position = 0, -50
        halign = center
        valign = bottom
    }
    '';
}
