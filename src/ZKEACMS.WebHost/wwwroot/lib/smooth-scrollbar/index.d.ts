import './polyfills';
import * as I from './interfaces/';
import { Scrollbar } from './scrollbar';
import { ScrollbarPlugin } from './plugin';
export { ScrollbarPlugin };
/*!
 * cast `I.Scrollbar` to `Scrollbar` to avoid error
 *
 * `I.Scrollbar` is not assignable to `Scrollbar`:
 *     "privateProp" is missing in `I.Scrollbar`
 *
 * @see https://github.com/Microsoft/TypeScript/issues/2672
 */
export default class SmoothScrollbar extends Scrollbar {
    static version: string;
    static ScrollbarPlugin: typeof ScrollbarPlugin;
    /**
     * Initializes a scrollbar on the given element.
     *
     * @param elem The DOM element that you want to initialize scrollbar to
     * @param [options] Initial options
     */
    static init(elem: HTMLElement, options?: Partial<I.ScrollbarOptions>): Scrollbar;
    /**
     * Automatically init scrollbar on all elements base on the selector `[data-scrollbar]`
     *
     * @param options Initial options
     */
    static initAll(options?: Partial<I.ScrollbarOptions>): Scrollbar[];
    /**
     * Check if there is a scrollbar on given element
     *
     * @param elem The DOM element that you want to check
     */
    static has(elem: HTMLElement): boolean;
    /**
     * Gets scrollbar on the given element.
     * If no scrollbar instance exsits, returns `undefined`
     *
     * @param elem The DOM element that you want to check.
     */
    static get(elem: HTMLElement): Scrollbar | undefined;
    /**
     * Returns an array that contains all scrollbar instances
     */
    static getAll(): Scrollbar[];
    /**
     * Removes scrollbar on the given element
     */
    static destroy(elem: HTMLElement): void;
    /**
     * Removes all scrollbar instances from current document
     */
    static destroyAll(): void;
    /**
     * Attaches plugins to scrollbars
     *
     * @param ...Plugins Scrollbar plugin classes
     */
    static use(...Plugins: (typeof ScrollbarPlugin)[]): void;
    /**
     * Attaches default style sheets to current document.
     * You don't need to call this method manually unless
     * you removed the default styles via `Scrollbar.detachStyle()`
     */
    static attachStyle(): void;
    /**
     * Removes default styles from current document.
     * Use this method when you want to use your own css for scrollbars.
     */
    static detachStyle(): void;
}
