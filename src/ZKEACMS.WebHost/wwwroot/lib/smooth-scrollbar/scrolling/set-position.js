import * as tslib_1 from "tslib";
import clamp from 'lodash-es/clamp';
import { setStyle, } from '../utils/';
export function setPosition(scrollbar, x, y) {
    var options = scrollbar.options, offset = scrollbar.offset, limit = scrollbar.limit, track = scrollbar.track, contentEl = scrollbar.contentEl;
    if (options.renderByPixels) {
        x = Math.round(x);
        y = Math.round(y);
    }
    x = clamp(x, 0, limit.x);
    y = clamp(y, 0, limit.y);
    // position changed -> show track for 300ms
    if (x !== offset.x)
        track.xAxis.show();
    if (y !== offset.y)
        track.yAxis.show();
    if (!options.alwaysShowTracks) {
        track.autoHideOnIdle();
    }
    if (x === offset.x && y === offset.y) {
        return null;
    }
    offset.x = x;
    offset.y = y;
    setStyle(contentEl, {
        '-transform': "translate3d(" + -x + "px, " + -y + "px, 0)",
    });
    track.update();
    return {
        offset: tslib_1.__assign({}, offset),
        limit: tslib_1.__assign({}, limit),
    };
}
//# sourceMappingURL=set-position.js.map