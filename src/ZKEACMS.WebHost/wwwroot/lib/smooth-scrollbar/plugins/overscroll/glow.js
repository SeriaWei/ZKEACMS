import clamp from 'lodash-es/clamp';
import { setStyle } from '../../utils/set-style';
var GLOW_MAX_OPACITY = 0.75;
var GLOW_MAX_OFFSET = 0.25;
var Glow = /** @class */ (function () {
    function Glow(_scrollbar) {
        this._scrollbar = _scrollbar;
        this._canvas = document.createElement('canvas');
        this._ctx = this._canvas.getContext('2d');
        setStyle(this._canvas, {
            position: 'absolute',
            top: 0,
            left: 0,
            width: '100%',
            height: '100%',
            display: 'none',
        });
    }
    Glow.prototype.mount = function () {
        this._scrollbar.containerEl.appendChild(this._canvas);
    };
    Glow.prototype.unmount = function () {
        if (this._canvas.parentNode) {
            this._canvas.parentNode.removeChild(this._canvas);
        }
    };
    Glow.prototype.adjust = function () {
        var size = this._scrollbar.size;
        var DPR = window.devicePixelRatio || 1;
        var nextWidth = size.container.width * DPR;
        var nextHeight = size.container.height * DPR;
        if (nextWidth === this._canvas.width && nextHeight === this._canvas.height) {
            return;
        }
        this._canvas.width = nextWidth;
        this._canvas.height = nextHeight;
        this._ctx.scale(DPR, DPR);
    };
    Glow.prototype.recordTouch = function (event) {
        var touch = event.touches[event.touches.length - 1];
        this._touchX = touch.clientX;
        this._touchY = touch.clientY;
    };
    Glow.prototype.render = function (_a, color) {
        var _b = _a.x, x = _b === void 0 ? 0 : _b, _c = _a.y, y = _c === void 0 ? 0 : _c;
        if (!x && !y) {
            setStyle(this._canvas, {
                display: 'none',
            });
            return;
        }
        setStyle(this._canvas, {
            display: 'block',
        });
        var size = this._scrollbar.size;
        this._ctx.clearRect(0, 0, size.container.width, size.container.height);
        this._ctx.fillStyle = color;
        this._renderX(x);
        this._renderY(y);
    };
    Glow.prototype._getMaxOverscroll = function () {
        var options = this._scrollbar.options.plugins.overscroll;
        return options && options.maxOverscroll ? options.maxOverscroll : 150;
    };
    Glow.prototype._renderX = function (strength) {
        var size = this._scrollbar.size;
        var maxOverscroll = this._getMaxOverscroll();
        var _a = size.container, width = _a.width, height = _a.height;
        var ctx = this._ctx;
        ctx.save();
        if (strength > 0) {
            // glow on right side
            // horizontally flip
            ctx.transform(-1, 0, 0, 1, width, 0);
        }
        var opacity = clamp(Math.abs(strength) / maxOverscroll, 0, GLOW_MAX_OPACITY);
        var startOffset = clamp(opacity, 0, GLOW_MAX_OFFSET) * width;
        // controll point
        var x = Math.abs(strength);
        var y = this._touchY || (height / 2);
        ctx.globalAlpha = opacity;
        ctx.beginPath();
        ctx.moveTo(0, -startOffset);
        ctx.quadraticCurveTo(x, y, 0, height + startOffset);
        ctx.fill();
        ctx.closePath();
        ctx.restore();
    };
    Glow.prototype._renderY = function (strength) {
        var size = this._scrollbar.size;
        var maxOverscroll = this._getMaxOverscroll();
        var _a = size.container, width = _a.width, height = _a.height;
        var ctx = this._ctx;
        ctx.save();
        if (strength > 0) {
            // glow on bottom side
            // vertically flip
            ctx.transform(1, 0, 0, -1, 0, height);
        }
        var opacity = clamp(Math.abs(strength) / maxOverscroll, 0, GLOW_MAX_OPACITY);
        var startOffset = clamp(opacity, 0, GLOW_MAX_OFFSET) * width;
        // controll point
        var x = this._touchX || (width / 2);
        var y = Math.abs(strength);
        ctx.globalAlpha = opacity;
        ctx.beginPath();
        ctx.moveTo(-startOffset, 0);
        ctx.quadraticCurveTo(x, y, width + startOffset, 0);
        ctx.fill();
        ctx.closePath();
        ctx.restore();
    };
    return Glow;
}());
export { Glow };
//# sourceMappingURL=glow.js.map