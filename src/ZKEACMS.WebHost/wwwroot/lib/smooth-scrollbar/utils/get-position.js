import { getPointerData } from './get-pointer-data';
/**
 * Get pointer/finger position
 */
export function getPosition(evt) {
    var data = getPointerData(evt);
    return {
        x: data.clientX,
        y: data.clientY,
    };
}
//# sourceMappingURL=get-position.js.map