import { setStyle } from '../../utils/set-style';
var Bounce = /** @class */ (function () {
    function Bounce(_scrollbar) {
        this._scrollbar = _scrollbar;
    }
    Bounce.prototype.render = function (_a) {
        var _b = _a.x, x = _b === void 0 ? 0 : _b, _c = _a.y, y = _c === void 0 ? 0 : _c;
        var _d = this._scrollbar, size = _d.size, track = _d.track, offset = _d.offset, contentEl = _d.contentEl;
        setStyle(contentEl, {
            '-transform': "translate3d(" + -(offset.x + x) + "px, " + -(offset.y + y) + "px, 0)",
        });
        if (x) {
            track.xAxis.show();
            var scaleRatio = size.container.width / (size.container.width + Math.abs(x));
            setStyle(track.xAxis.thumb.element, {
                '-transform': "translate3d(" + track.xAxis.thumb.offset + "px, 0, 0) scale3d(" + scaleRatio + ", 1, 1)",
                '-transform-origin': x < 0 ? 'left' : 'right',
            });
        }
        if (y) {
            track.yAxis.show();
            var scaleRatio = size.container.height / (size.container.height + Math.abs(y));
            setStyle(track.yAxis.thumb.element, {
                '-transform': "translate3d(0, " + track.yAxis.thumb.offset + "px, 0) scale3d(1, " + scaleRatio + ", 1)",
                '-transform-origin': y < 0 ? 'top' : 'bottom',
            });
        }
        track.autoHideOnIdle();
    };
    return Bounce;
}());
export { Bounce };
//# sourceMappingURL=bounce.js.map