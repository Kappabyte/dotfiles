import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import Battery from 'resource:///com/github/Aylur/ags/service/battery.js';
import Variable from 'resource:///com/github/Aylur/ags/variable.js';

const percent = Variable(100);
const charging = Variable(false);

const icons = {
    0: "󰂃",
    1: "󰁺",
    2: "󰁻",
    3: "󰁼",
    4: "󰁽",
    5: "󰁾",
    6: "󰁿",
    7: "󰂀",
    8: "󰂁",
    9: "󰂂",
    10: "󱟢"
}

const generateLabelText = () => {
    return `${charging.getValue() ? "󰂄" : icons[Math.floor(percent.getValue() / 10)]} ${percent.getValue()}%`
}

const updatePercent = (new_percent) => {
    percent.setValue(new_percent);
    return generateLabelText()
}

const updateChargingState = (new_charging) => {
    charging.setValue(new_charging);
    return generateLabelText()
}

export const BatteryIcon = () => Widget.Label({
    binds: [
        ['label', Battery, 'percent', updatePercent],
        ['label', Battery, 'charging', updateChargingState]
    ]
})
