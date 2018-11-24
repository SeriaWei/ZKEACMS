import * as tslib_1 from "tslib";
import { range, boolean, } from './decorators/';
var Options = /** @class */ (function () {
    function Options(config) {
        if (config === void 0) { config = {}; }
        var _this = this;
        /**
         * Momentum reduction damping factor, a float value between `(0, 1)`.
         * The lower the value is, the more smooth the scrolling will be
         * (also the more paint frames).
         */
        this.damping = 0.1;
        /**
         * Minimal size for scrollbar thumbs.
         */
        this.thumbMinSize = 20;
        /**
         * Render every frame in integer pixel values
         * set to `true` to improve scrolling performance.
         */
        this.renderByPixels = true;
        /**
         * Keep scrollbar tracks visible
         */
        this.alwaysShowTracks = false;
        /**
         * Set to `true` to allow outer scrollbars continue scrolling
         * when current scrollbar reaches edge.
         */
        this.continuousScrolling = true;
        /**
         * Delegate wheel events and touch events to the given element.
         * By default, the container element is used.
         * This option will be useful for dealing with fixed elements.
         */
        this.delegateTo = null;
        /**
         * Options for plugins. Syntax:
         *   plugins[pluginName] = pluginOptions: any
         */
        this.plugins = {};
        Object.keys(config).forEach(function (prop) {
            _this[prop] = config[prop];
        });
    }
    Object.defineProperty(Options.prototype, "wheelEventTarget", {
        get: function () {
            return this.delegateTo;
        },
        set: function (el) {
            console.warn('[smooth-scrollbar]: `options.wheelEventTarget` is deprecated and will be removed in the future, use `options.delegateTo` instead.');
            this.delegateTo = el;
        },
        enumerable: true,
        configurable: true
    });
    tslib_1.__decorate([
        range(0, 1)
    ], Options.prototype, "damping", void 0);
    tslib_1.__decorate([
        range(0, Infinity)
    ], Options.prototype, "thumbMinSize", void 0);
    tslib_1.__decorate([
        boolean
    ], Options.prototype, "renderByPixels", void 0);
    tslib_1.__decorate([
        boolean
    ], Options.prototype, "alwaysShowTracks", void 0);
    tslib_1.__decorate([
        boolean
    ], Options.prototype, "continuousScrolling", void 0);
    return Options;
}());
export { Options };
//# sourceMappingURL=options.js.map