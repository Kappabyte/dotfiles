import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import Audio from 'resource:///com/github/Aylur/ags/service/audio.js';

const icons = {
    0: "󰝟",
    1: "󰕿",
    2: "󰖀",
    3: "󰕾",
    4: "󰕾"
}

const generateLabelText = (percent) => {
    return `${icons[Math.ceil(percent / 25)]} ${percent}%`
}

export const VolumeIcon = () => Widget.Label({
    connections: [
        [Audio, self => {
            if(!Audio.speaker) return;
            self.label = generateLabelText(Audio.speaker.volume * 100)
        }]
    ]
})
