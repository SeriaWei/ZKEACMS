import * as tslib_1 from "tslib";
import clamp from 'lodash-es/clamp';
import debounce from 'lodash-es/debounce';
import { ScrollbarPlugin } from 'smooth-scrollbar';
import { Bounce } from './bounce';
import { Glow } from './glow';
export var OverscrollEffect;
(function (OverscrollEffect) {
    OverscrollEffect["BOUNCE"] = "bounce";
    OverscrollEffect["GLOW"] = "glow";
})(OverscrollEffect || (OverscrollEffect = {}));
var ALLOWED_EVENTS = /wheel|touch/;
var OverscrollPlugin = /** @class */ (function (_super) {
    tslib_1.__extends(OverscrollPlugin, _super);
    function OverscrollPlugin() {
        var _this = _super !== null && _super.apply(this, arguments) || this;
        _this._glow = new Glow(_this.scrollbar);
        _this._bounce = new Bounce(_this.scrollbar);
        _this._wheelScrollBack = {
            x: false,
            y: false,
        };
        _this._lockWheel = {
            x: false,
            y: false,
        };
        _this._touching = false;
        _this._amplitude = {
            x: 0,
            y: 0,
        };
        _this._position = {
            x: 0,
            y: 0,
        };
        // since we can't detect whether user release touchpad
        // handle it with debounce is the best solution now, as a trade-off
        _this._releaseWheel = debounce(function () {
            _this._lockWheel.x = false;
            _this._lockWheel.y = false;
        }, 30);
        return _this;
    }
    Object.defineProperty(OverscrollPlugin.prototype, "_isWheelLocked", {
        get: function () {
            return this._lockWheel.x || this._lockWheel.y;
        },
        enumerable: true,
        configurable: true
    });
    Object.defineProperty(OverscrollPlugin.prototype, "_enabled", {
        get: function () {
            return !!this.options.effect;
        },
        enumerable: true,
        configurable: true
    });
    OverscrollPlugin.prototype.onInit = function () {
        var _a = this, _glow = _a._glow, options = _a.options, scrollbar = _a.scrollbar;
        // observe
        var effect = options.effect;
        Object.defineProperty(options, 'effect', {
            get: function () {
                return effect;
            },
            set: function (val) {
                if (!val) {
                    effect = undefined;
                    return;
                }
                if (val !== OverscrollEffect.BOUNCE && val !== OverscrollEffect.GLOW) {
                    throw new TypeError("unknow overscroll effect: " + val);
                }
                effect = val;
                scrollbar.options.continuousScrolling = false;
                if (val === OverscrollEffect.GLOW) {
                    _glow.mount();
                    _glow.adjust();
                }
                else {
                    _glow.unmount();
                }
            },
        });
        options.effect = effect; // init
    };
    OverscrollPlugin.prototype.onUpdate = function () {
        if (this.options.effect === OverscrollEffect.GLOW) {
            this._glow.adjust();
        }
    };
    OverscrollPlugin.prototype.onRender = function (remainMomentum) {
        if (!this._enabled) {
            return;
        }
        if (this.scrollbar.options.continuousScrolling) {
            // turn off continuous scrolling
            this.scrollbar.options.continuousScrolling = false;
        }
        var nextX = remainMomentum.x, nextY = remainMomentum.y;
        // transfer remain momentum to overscroll
        if (!this._amplitude.x &&
            this._willOverscroll('x', remainMomentum.x)) {
            nextX = 0;
            this._absorbMomentum('x', remainMomentum.x);
        }
        if (!this._amplitude.y &&
            this._willOverscroll('y', remainMomentum.y)) {
            nextY = 0;
            this._absorbMomentum('y', remainMomentum.y);
        }
        this.scrollbar.setMomentum(nextX, nextY);
        this._render();
    };
    OverscrollPlugin.prototype.transformDelta = function (delta, fromEvent) {
        this._lastEventType = fromEvent.type;
        if (!this._enabled || !ALLOWED_EVENTS.test(fromEvent.type)) {
            return delta;
        }
        if (this._isWheelLocked && /wheel/.test(fromEvent.type)) {
            this._releaseWheel();
            if (this._willOverscroll('x', delta.x)) {
                delta.x = 0;
            }
            if (this._willOverscroll('y', delta.y)) {
                delta.y = 0;
            }
        }
        var nextX = delta.x, nextY = delta.y;
        if (this._willOverscroll('x', delta.x)) {
            nextX = 0;
            this._addAmplitude('x', delta.x);
        }
        if (this._willOverscroll('y', delta.y)) {
            nextY = 0;
            this._addAmplitude('y', delta.y);
        }
        switch (fromEvent.type) {
            case 'touchstart':
            case 'touchmove':
                this._touching = true;
                this._glow.recordTouch(fromEvent);
                break;
            case 'touchcancel':
            case 'touchend':
                this._touching = false;
                break;
        }
        return {
            x: nextX,
            y: nextY,
        };
    };
    OverscrollPlugin.prototype._willOverscroll = function (direction, delta) {
        if (!delta) {
            return false;
        }
        // away from origin
        if (this._position[direction]) {
            return true;
        }
        var offset = this.scrollbar.offset[direction];
        var limit = this.scrollbar.limit[direction];
        if (limit === 0) {
            return false;
        }
        // cond:
        //  1. next scrolling position is supposed to stay unchange
        //  2. current position is on the edge
        return clamp(offset + delta, 0, limit) === offset &&
            (offset === 0 || offset === limit);
    };
    OverscrollPlugin.prototype._absorbMomentum = function (direction, remainMomentum) {
        var _a = this, options = _a.options, _lastEventType = _a._lastEventType, _amplitude = _a._amplitude;
        if (!ALLOWED_EVENTS.test(_lastEventType)) {
            return;
        }
        _amplitude[direction] = clamp(remainMomentum, -options.maxOverscroll, options.maxOverscroll);
    };
    OverscrollPlugin.prototype._addAmplitude = function (direction, delta) {
        var _a = this, options = _a.options, scrollbar = _a.scrollbar, _amplitude = _a._amplitude, _position = _a._position;
        var currentAmp = _amplitude[direction];
        var isOpposite = delta * currentAmp < 0;
        var friction;
        if (isOpposite) {
            // opposite direction
            friction = 0;
        }
        else {
            friction = this._wheelScrollBack[direction] ?
                1 : Math.abs(currentAmp / options.maxOverscroll);
        }
        var amp = currentAmp + delta * (1 - friction);
        _amplitude[direction] = scrollbar.offset[direction] === 0 ?
            /*    top | left  */ clamp(amp, -options.maxOverscroll, 0) :
            /* bottom | right */ clamp(amp, 0, options.maxOverscroll);
        if (isOpposite) {
            // scroll back
            _position[direction] = _amplitude[direction];
        }
    };
    OverscrollPlugin.prototype._render = function () {
        var _a = this, options = _a.options, _amplitude = _a._amplitude, _position = _a._position;
        if (this._enabled &&
            (_amplitude.x || _amplitude.y || _position.x || _position.y)) {
            var nextX = this._nextAmp('x');
            var nextY = this._nextAmp('y');
            _amplitude.x = nextX.amplitude;
            _position.x = nextX.position;
            _amplitude.y = nextY.amplitude;
            _position.y = nextY.position;
            switch (options.effect) {
                case OverscrollEffect.BOUNCE:
                    this._bounce.render(_position);
                    break;
                case OverscrollEffect.GLOW:
                    this._glow.render(_position, this.options.glowColor);
                    break;
            }
            if (typeof options.onScroll === 'function') {
                options.onScroll.call(this, tslib_1.__assign({}, _position));
            }
        }
    };
    OverscrollPlugin.prototype._nextAmp = function (direction) {
        var _a = this, options = _a.options, _amplitude = _a._amplitude, _position = _a._position;
        var t = 1 - options.damping;
        var amp = _amplitude[direction];
        var pos = _position[direction];
        var nextAmp = this._touching ? amp : (amp * t | 0);
        var distance = nextAmp - pos;
        var nextPos = pos + distance - (distance * t | 0);
        if (!this._touching && Math.abs(nextPos) < Math.abs(pos)) {
            this._wheelScrollBack[direction] = true;
        }
        if (this._wheelScrollBack[direction] && Math.abs(nextPos) <= 1) {
            this._wheelScrollBack[direction] = false;
            this._lockWheel[direction] = true;
        }
        return {
            amplitude: nextAmp,
            position: nextPos,
        };
    };
    OverscrollPlugin.pluginName = 'overscroll';
    OverscrollPlugin.defaultOptions = {
        effect: OverscrollEffect.BOUNCE,
        onScroll: undefined,
        damping: 0.2,
        maxOverscroll: 150,
        glowColor: '#87ceeb',
    };
    return OverscrollPlugin;
}(ScrollbarPlugin));
export default OverscrollPlugin;
//# sourceMappingURL=index.js.map