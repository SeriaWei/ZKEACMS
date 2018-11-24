import { Scrollbar } from '../interfaces/';
export interface EventHandler {
    (event: any): void;
}
export declare function eventScope(scrollbar: Scrollbar): (elem: EventTarget, events: string, fn: EventHandler) => void;
export declare function clearEventsOn(scrollbar: Scrollbar): void;
