import { Widget } from 'resource:///com/github/Aylur/ags/widget.js';
import { NotificationPopupList } from "../widgets/popup/notification.js"

export const NotificationPopup = (monitor) => Widget.Window({
    monitor,
    name: `notification-popup-${monitor}`,
    classNames: ["notification-popup"],
    anchor: ['top', 'right'],
    popup: true,
    child: NotificationPopupList()
}) 
