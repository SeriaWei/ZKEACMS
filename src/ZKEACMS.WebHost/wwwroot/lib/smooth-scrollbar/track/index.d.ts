import * as I from '../interfaces/';
import { ScrollbarTrack } from './track';
export declare class TrackController implements I.TrackController {
    private _scrollbar;
    readonly xAxis: ScrollbarTrack;
    readonly yAxis: ScrollbarTrack;
    constructor(_scrollbar: I.Scrollbar);
    /**
     * Updates track appearance
     */
    update(): void;
    /**
     * Automatically hide tracks when scrollbar is in idle state
     */
    autoHideOnIdle(): void;
}
