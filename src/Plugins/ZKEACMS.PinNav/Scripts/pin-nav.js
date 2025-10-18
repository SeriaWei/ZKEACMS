/*! http://www.zkea.net/
 * Copyright (c) ZKEASOFT. All rights reserved.
 * http://www.zkea.net/licenses */

$(function () {
    var nav = $(".navigation");
    nav.parent().height(nav.height());
    nav.affix({ offset: { top: nav.offset().top, bottom: 0 } });
});