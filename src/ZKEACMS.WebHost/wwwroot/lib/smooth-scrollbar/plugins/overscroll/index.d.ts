import { ScrollbarPlugin } from 'smooth-scrollbar';
export declare enum OverscrollEffect {
    BOUNCE = "bounce",
    GLOW = "glow"
}
export declare type Data2d = {
    x: number;
    y: number;
};
export declare type OnScrollCallback = (this: OverscrollPlugin, position: Data2d) => void;
export declare type OverscrollOptions = {
    effect?: OverscrollEffect;
    onScroll?: OnScrollCallback;
    damping: number;
    maxOverscroll: number;
    glowColor: string;
};
export default class OverscrollPlugin extends ScrollbarPlugin {
    static pluginName: string;
    static defaultOptions: OverscrollOptions;
    options: OverscrollOptions;
    private _glow;
    private _bounce;
    private _wheelScrollBack;
    private _lockWheel;
    private readonly _isWheelLocked;
    private _touching;
    private _lastEventType;
    private _amplitude;
    private _position;
    private readonly _enabled;
    private _releaseWheel;
    onInit(): void;
    onUpdate(): void;
    onRender(remainMomentum: Data2d): void;
    transformDelta(delta: Data2d, fromEvent: Event): Data2d;
    private _willOverscroll;
    private _absorbMomentum;
    private _addAmplitude;
    private _render;
    private _nextAmp;
}
