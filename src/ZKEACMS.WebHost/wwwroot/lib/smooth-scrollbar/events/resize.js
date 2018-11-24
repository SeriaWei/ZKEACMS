import debounce from 'lodash-es/debounce';
import { eventScope, } from '../utils/';
export function resizeHandler(scrollbar) {
    var addEvent = eventScope(scrollbar);
    addEvent(window, 'resize', debounce(scrollbar.update.bind(scrollbar), 300));
}
//# sourceMappingURL=resize.js.map