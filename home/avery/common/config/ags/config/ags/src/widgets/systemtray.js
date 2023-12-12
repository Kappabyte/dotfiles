import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import SystemTray from 'resource:///com/github/Aylur/ags/service/systemtray.js';

const SysTrayItem = item => Widget.Button({
    child: Widget.Icon({ size: 14, binds: [['icon', item, 'icon']] }),
    binds: [['tooltip-markup', item, 'tooltip-markup']],
    onPrimaryClick: (_, event) => item.activate(event),
    onSecondaryClick: (_, event) => item.openMenu(event),
});

export const sysTray = Widget.Box({
    binds: [['children', SystemTray, 'items', i => i.map(SysTrayItem)]],
});
