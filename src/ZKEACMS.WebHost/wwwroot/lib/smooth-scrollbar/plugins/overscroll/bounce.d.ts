import Scrollbar from 'smooth-scrollbar';
export declare class Bounce {
    private _scrollbar;
    constructor(_scrollbar: Scrollbar);
    render({ x, y }: {
        x?: number | undefined;
        y?: number | undefined;
    }): void;
}
