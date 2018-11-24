import Scrollbar from 'smooth-scrollbar';
export declare class Glow {
    private _scrollbar;
    private _canvas;
    private _ctx;
    private _touchX;
    private _touchY;
    constructor(_scrollbar: Scrollbar);
    mount(): void;
    unmount(): void;
    adjust(): void;
    recordTouch(event: TouchEvent): void;
    render({ x, y }: {
        x?: number | undefined;
        y?: number | undefined;
    }, color: string): void;
    private _getMaxOverscroll;
    private _renderX;
    private _renderY;
}
