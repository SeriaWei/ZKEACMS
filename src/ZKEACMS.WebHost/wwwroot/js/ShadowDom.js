/*! http://www.zkea.net/
 * Copyright (c) ZKEASOFT. All rights reserved.
 * http://www.zkea.net/licenses */

(function (window, document) {
    "use strict";

    function attach(host) {
        if (!host) {
            return null;
        }
        if (host.shadowRoot) {
            return host.shadowRoot;
        }

        var template = host.querySelector("template[shadowrootmode]");
        if (!template) {
            return null;
        }

        // Browsers without declarative shadow DOM keep the template in the document.
        if (!template.content) {
            host.innerHTML = template.innerHTML;
            return null;
        }

        var content = template.content.cloneNode(true);
        template.parentNode.removeChild(template);

        if (!host.attachShadow) {
            host.appendChild(content);
            return null;
        }

        var shadowRoot = host.attachShadow({ mode: "open" });
        shadowRoot.appendChild(content);
        return shadowRoot;
    }

    function get(selector) {
        var host = document.querySelector(selector);
        if (!host) {
            return null;
        }
        // Attach on demand so callers never observe an uninitialized host.
        return attach(host) || host;
    }

    function init(selector) {
        if (selector) {
            var hosts = document.querySelectorAll(selector);
            for (var i = 0; i < hosts.length; i++) {
                attach(hosts[i]);
            }
            return;
        }

        var templates = document.querySelectorAll("template[shadowrootmode]");
        for (var j = 0; j < templates.length; j++) {
            attach(templates[j].parentNode);
        }
    }

    window.ShadowDom = {
        attach: attach,
        init: init,
        get: get
    };

    init();
    if (document.readyState === "loading") {
        document.addEventListener("DOMContentLoaded", function () {
            init();
        });
    }
})(window, document);
