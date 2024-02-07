import App from 'resource:///com/github/Aylur/ags/app.js';
import "./src/windows/bar.js"
import { Bar } from "./src/windows/bar.js"
import { NotificationPopup } from "./src/windows/notification.js"
import Notifications from 'resource:///com/github/Aylur/ags/service/notifications.js'

export default {
    windows: [],
    style: 'style/main.css',
    notificationPopupTimeout: 5000
}

export const AddMonitor = (monitor) => {
    App.addWindow(Bar(monitor))
    App.addWindow(NotificationPopup(monitor))
}

export const RemoveMonitor = (monitor) => {
    App.removeWindow(Bar(monitor))
    App.removeWindow(NotificationPopup(monitor))
}

AddMonitor(0)
