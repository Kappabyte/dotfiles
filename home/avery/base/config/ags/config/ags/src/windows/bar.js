import { Variable } from 'resource:///com/github/Aylur/ags/variable.js';
import { Widget } from 'resource:///com/github/Aylur/ags/widget.js';
import { Workspaces, focusedTitle } from '../widgets/workspaces.js';
import { BarSection } from "../widgets/barsection.js"
import { sysTray } from "../widgets/systemtray.js"
import { NotificationIcon } from "../widgets/icons/notification.js"
import { Indicators } from "../widgets/indicators.js"

const time = new Variable('', {
    poll: [1000, ['date', '+%l:%M %p']],
});

export const Bar = (monitor) => Widget.Window({
    monitor,
    name: `bar-${monitor}`,
    classNames: ["bar"],
    anchor: ['top', 'left', 'right'],
    exclusivity: "exclusive",
    margins: [10, 20, 0, 20],
    child: Widget.CenterBox({
        start_widget: BarSection("start", Workspaces()),
        center_widget: BarSection("center", focusedTitle),
        end_widget: BarSection("end", 
            Widget.Label({
                hpack: 'center',
                binds: [['label', time]],
            }), 
            Indicators(), 
            Widget.Box({children: [
                sysTray,
                NotificationIcon()
            ]})
        ),
        spacing: 8
    })
})


