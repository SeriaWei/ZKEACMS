import { Options } from './options';
import { TrackController } from './track/';
import * as I from './interfaces/';
export declare const scrollbarMap: Map<HTMLElement, Scrollbar>;
export declare class Scrollbar implements I.Scrollbar {
    /**
     * Options for current scrollbar instancs
     */
    readonly options: Options;
    readonly track: TrackController;
    /**
     * The element that you initialized scrollbar to
     */
    readonly containerEl: HTMLElement;
    /**
     * The wrapper element that contains your contents
     */
    readonly contentEl: HTMLElement;
    /**
     * Geometry infomation for current scrollbar instance
     */
    size: I.ScrollbarSize;
    /**
     * Current scrolling offsets
     */
    offset: {
        x: number;
        y: number;
    };
    /**
     * Max-allowed scrolling offsets
     */
    limit: {
        x: number;
        y: number;
    };
    /**
     * Container bounding rect
     */
    bounding: {
        top: number;
        right: number;
        bottom: number;
        left: number;
    };
    /**
     * Parent scrollbar
     */
    readonly parent: Scrollbar | null;
    /**
     * Gets or sets `scrollbar.offset.y`
     */
    scrollTop: number;
    /**
     * Gets or sets `scrollbar.offset.x`
     */
    scrollLeft: number;
    private _renderID;
    private _observer;
    private _plugins;
    private _momentum;
    private _listeners;
    constructor(containerEl: HTMLElement, options?: Partial<I.ScrollbarOptions>);
    /**
     * Returns the size of the scrollbar container element
     * and the content wrapper element
     */
    getSize(): I.ScrollbarSize;
    /**
     * Forces scrollbar to update geometry infomation.
     *
     * By default, scrollbars are automatically updated with `100ms` debounce (or `MutationObserver` fires).
     * You can call this method to force an update when you modified contents
     */
    update(): void;
    /**
     * Checks if an element is visible in the current view area
     */
    isVisible(elem: HTMLElement): boolean;
    /**
     * Sets the scrollbar to the given offset without easing
     */
    setPosition(x?: number, y?: number, options?: Partial<I.SetPositionOptions>): void;
    /**
     * Scrolls to given position with easing function
     */
    scrollTo(x?: number, y?: number, duration?: number, options?: Partial<I.ScrollToOptions>): void;
    /**
     * Scrolls the target element into visible area of scrollbar,
     * likes the DOM method `element.scrollIntoView().
     */
    scrollIntoView(elem: HTMLElement, options?: Partial<I.ScrollIntoViewOptions>): void;
    /**
     * Adds scrolling listener
     */
    addListener(fn: I.ScrollListener): void;
    /**
     * Removes listener previously registered with `scrollbar.addListener()`
     */
    removeListener(fn: I.ScrollListener): void;
    /**
     * Adds momentum and applys delta transformers.
     */
    addTransformableMomentum(x: number, y: number, fromEvent: Event, callback?: I.AddTransformableMomentumCallback): void;
    /**
     * Increases scrollbar's momentum
     */
    addMomentum(x: number, y: number): void;
    /**
     * Sets scrollbar's momentum to given value
     */
    setMomentum(x: number, y: number): void;
    /**
     * Update options for specific plugin
     *
     * @param pluginName Name of the plugin
     * @param [options] An object includes the properties that you want to update
     */
    updatePluginOptions(pluginName: string, options?: any): void;
    destroy(): void;
    private _init;
    private _updateDebounced;
    private _shouldPropagateMomentum;
    private _render;
    private _nextTick;
}
