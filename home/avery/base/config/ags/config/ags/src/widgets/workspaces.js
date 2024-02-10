import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import Hyprland from 'resource:///com/github/Aylur/ags/service/hyprland.js';
import * as Utils from 'resource:///com/github/Aylur/ags/utils.js';
import Variable from 'resource:///com/github/Aylur/ags/variable.js';

const urgentWindows = Variable([])

export const focusedTitle = Widget.Label({
    binds: [
        ['label', Hyprland.active.client, 'title'],
        ['visible', Hyprland.active.client, 'address', addr => !!addr],
    ],
});

const genLabel = (windowCount, workspace) => {
    if(windowCount > 0) {
        return urgentWindows.getValue().filter(win => win.workspace.id == workspace).length > 0 ? "" : "" 
    } else {
        return "󰝦"
    }
}

const dispatch = ws => Utils.execAsync(`hyprctl dispatch workspace ${ws}`);

export const Workspaces = () => Widget.EventBox({
    onScrollUp: () => dispatch('+1'),
    onScrollDown: () => dispatch('-1'),
    child: Widget.Box({
        children: Array.from({ length: 10 }, (_, i) => i + 1).map(i => Widget.Button({
            setup: btn => btn.id = i,
            classNames: ["workspace"],
            label: ``,
            cursor: "pointer",
            onClicked: () => dispatch(i),
        })),

        // remove this connection if you want fixed number of buttons
        connections: [
            [Hyprland, box => box.children.forEach(btn => {
                btn.visible = Hyprland.workspaces.some(ws => ws.id === btn.id);
                if(btn.visible) {
                    btn.label = genLabel(Hyprland.getWorkspace(btn.id).windows, btn.id)
                    if(urgentWindows.getValue().filter(win => win.workspace.id == btn.id).length > 0) {
                        if(!btn.classNames.includes("urgent")) btn.classNames = [...btn.classNames, "urgent"]
                    } else {
                        if(btn.classNames.includes("urgent")) btn.classNames = btn.classNames.filter(i => i != "urgent")
                    }
                    if(Hyprland.active.workspace.id == btn.id) {
                        if(!btn.classNames.includes("current")) btn.classNames = [...btn.classNames, "current"]
                    } else {
                        if(btn.classNames.includes("current")) btn.classNames = btn.classNames.filter(i => i != "current")
                    }
                }
            })],
            [Hyprland, (self, windowAddress) => {
                if(!windowAddress) return;
                const window = Hyprland.getClient(windowAddress);
                if(!window) return;
                const workspace = Hyprland.getWorkspace(window.workspace.id);

                if(!urgentWindows.getValue().includes(window)) urgentWindows.setValue([...urgentWindows.getValue(), window])
                const target = self.children.filter(btn => btn.id == workspace.id)[0];
                target.label = genLabel(workspace.windows, workspace.id)
            }, 'urgent-window'],
            [Hyprland, self => {
                urgentWindows.setValue(urgentWindows.getValue().filter(win => win.address != Hyprland.active.client.address))
            }, 'notify::active']
        ],
    }),
});
