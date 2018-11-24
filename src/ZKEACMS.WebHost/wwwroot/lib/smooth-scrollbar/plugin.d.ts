import * as I from './interfaces/';
import { Scrollbar } from './scrollbar';
export declare class ScrollbarPlugin implements I.ScrollbarPlugin {
    static pluginName: string;
    static defaultOptions: any;
    readonly scrollbar: Scrollbar;
    readonly options: any;
    readonly name: string;
    constructor(scrollbar: Scrollbar, options?: any);
    onInit(): void;
    onDestory(): void;
    onUpdate(): void;
    onRender(_remainMomentum: I.Data2d): void;
    transformDelta(delta: I.Data2d, _evt: Event): I.Data2d;
}
export declare type PluginMap = {
    order: Set<string>;
    constructors: {
        [name: string]: typeof ScrollbarPlugin;
    };
};
export declare const globalPlugins: PluginMap;
export declare function addPlugins(...Plugins: (typeof ScrollbarPlugin)[]): void;
export declare function initPlugins(scrollbar: Scrollbar, options: any): ScrollbarPlugin[];
