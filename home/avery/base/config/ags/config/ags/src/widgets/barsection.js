import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import { Space, VerticalSeperator } from "./spacers.js"

export const BarSection = (position, ...children) => {
    const new_children = [Space(), children[0]]
    for(let i = 1; i < children.length; i++) {
        new_children.push(VerticalSeperator())
        new_children.push(children[i])
    }
    new_children.push(Space())
    return Widget.Box({
        classNames: ["barsection"],
        expand: false,
        hpack: position,
        children: new_children
    })
}
