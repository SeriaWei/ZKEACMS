export declare class Tracker {
    updateTime: number;
    delta: {
        x: number;
        y: number;
    };
    velocity: {
        x: number;
        y: number;
    };
    lastPosition: {
        x: number;
        y: number;
    };
    constructor(touch: Touch);
    update(touch: Touch): void;
}
export declare class TouchRecord {
    private _lastTouch;
    private _activeTouchID;
    private _touchList;
    private readonly _primitiveValue;
    isActive(): boolean;
    getDelta(): {
        x: number;
        y: number;
    };
    getVelocity(): {
        x: number;
        y: number;
    };
    track(evt: TouchEvent): {
        [id: number]: Tracker;
    };
    update(evt: TouchEvent): {
        [id: number]: Tracker;
    };
    release(evt: TouchEvent): void;
    private _add;
    private _renew;
    private _delete;
    private _has;
    private _setActiveID;
    private _getActiveTracker;
}
