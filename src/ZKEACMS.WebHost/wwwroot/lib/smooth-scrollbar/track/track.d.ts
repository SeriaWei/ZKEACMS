import * as I from '../interfaces/';
import { TrackDirection } from './direction';
import { ScrollbarThumb } from './thumb';
export declare class ScrollbarTrack implements I.ScrollbarTrack {
    readonly thumb: ScrollbarThumb;
    /**
     * Track element
     */
    readonly element: HTMLDivElement;
    private _isShown;
    constructor(direction: TrackDirection, thumbMinSize?: number);
    /**
     * Attach to scrollbar container element
     *
     * @param scrollbarContainer Scrollbar container element
     */
    attachTo(scrollbarContainer: HTMLElement): void;
    /**
     * Show track immediately
     */
    show(): void;
    /**
     * Hide track immediately
     */
    hide(): void;
    update(scrollOffset: number, containerSize: number, pageSize: number): void;
}
