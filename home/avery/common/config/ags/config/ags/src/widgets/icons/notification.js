import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import Notifications from 'resource:///com/github/Aylur/ags/service/notifications.js'

const generateLabelText = (notifications) => {
    let icon = "󰂚";

    if(notifications.length > 0) {
        icon = "󱅫";
        for(let notification of notifications) {
            if(notification.urgency == "critical") {
                icon = "󰵙";
            }
        }
    }

    return icon;
}

export const NotificationIcon = () => Widget.Button({
    label: "󰂚",
    className: "notification-icon",
    binds: [
        ["label", Notifications, "notifications", generateLabelText]
    ]
})
