import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import Notifications from 'resource:///com/github/Aylur/ags/service/notifications.js'

const NotificationElement = (notification) => {
console.log(notification)
return Widget.Box({
    classNames: ["notification", notification.urgency],
    children: [
        Widget.Icon({
            icon: notification.image || notification.appIcon,
            size: 15,
            margin: [10]
        }),
        Widget.Box({
            orientation: 1,
            margin: [5],
            children: [
                Widget.Label({
                    css: "font-weight: 700",
                    justification: "left",
                    xalign: 0,
                    label: notification.summary,
                }),
                Widget.Label({
                    widthChars: 50,
                    xalign: 0,
                    wrap: true,
                    justification: "left",
                    label: notification.body
                })
            ]
        })
    ]
})
}

export const NotificationPopupList = () => Widget.Box({
    orientation: 1,
    css: "min-height: 500px;",
    margin: [20],
    vertical: true,
    connections: [[Notifications, self => {
        self.children = Notifications.popups.map(NotificationElement);
    }]]
})
