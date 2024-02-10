import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import { Space } from "./spacers.js"
import {BatteryIcon} from "./icons/battery.js"
import {VolumeIcon} from "./icons/volume.js"

export const Indicators = () => Widget.Box({
    children: [BatteryIcon(), Space(), VolumeIcon()]
})
