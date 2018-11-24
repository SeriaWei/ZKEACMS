import * as I from '../interfaces/';
import { TrackDirection } from './direction';
export declare class ScrollbarThumb implements I.ScrollbarThumb {
    private _direction;
    private _minSize;
    /**
     * Thumb element
     */
    readonly element: HTMLDivElement;
    /**
     * Display size of the thumb
     * will always be greater than `scrollbar.options.thumbMinSize`
     */
    displaySize: number;
    /**
     * Actual size of the thumb
     */
    realSize: number;
    /**
     * Thumb offset to the top
     */
    offset: number;
    constructor(_direction: TrackDirection, _minSize?: number);
    /**
     * Attach to track element
     *
     * @param trackEl Track element
     */
    attachTo(trackEl: HTMLElement): void;
    update(scrollOffset: number, containerSize: number, pageSize: number): void;
    private _getStyle;
}
