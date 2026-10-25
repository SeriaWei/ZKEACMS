/*! http://www.zkea.net/
 * Copyright (c) ZKEASOFT. All rights reserved.
 * http://www.zkea.net/licenses */

(function (window, document) {
    "use strict";

    var HOST_SELECTOR = "shadow-dom-design-toolbar";
    var initialized = false;

    function getToolBar() {
        if (window.ShadowDom && window.ShadowDom.get) {
            return window.ShadowDom.get(HOST_SELECTOR);
        }
        var host = document.querySelector(HOST_SELECTOR);
        if (!host) {
            return null;
        }
        return host.shadowRoot || host;
    }

    function closeDropdowns() {
        var toolBar = getToolBar();
        if (!toolBar) {
            return;
        }
        $(toolBar).find(".zk-btn-group.open, .dropdown.open").each(function () {
            $(this).removeClass("open");
            $(this).children("[data-toggle='dropdown']").attr("aria-expanded", "false");
        });
    }

    // jQuery refuses to attach events to a ShadowRoot (nodeType 11),
    // so the toolbar elements are bound directly instead of by delegation.
    function bind(toolBar) {
        var $toolBar = $(toolBar);

        $toolBar.find("[data-toggle='dropdown']").on("click", function (e) {
            e.preventDefault();
            e.stopPropagation();
            var toggle = $(this);
            var parent = toggle.closest(".zk-btn-group, .dropdown");
            if (!parent.length) {
                parent = toggle.parent();
            }
            var opened = parent.hasClass("open");
            closeDropdowns();
            if (!opened) {
                parent.addClass("open");
                toggle.attr("aria-expanded", "true");
            }
        });

        $toolBar.find("[data-toggle='modal']").on("click", function (e) {
            e.preventDefault();
            var toggle = $(this);
            var selector = toggle.attr("data-target") || toggle.attr("href");
            if (!selector || selector === "#") {
                return;
            }
            var target = $(document).find(selector);
            if (target.length) {
                target.modal("show");
            }
        });

        $toolBar.find(".cancel").on("click", function () {
            window.history.back();
        });

        $(document).on("click", closeDropdowns);
    }

    function init() {
        if (initialized) {
            return;
        }
        var toolBar = getToolBar();
        if (!toolBar) {
            return;
        }
        bind(toolBar);
        initialized = true;
    }

    $(init);
})(window, document);
