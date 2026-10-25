/*! http://www.zkea.net/
 * Copyright (c) ZKEASOFT. All rights reserved.
 * http://www.zkea.net/licenses */

$(function () {
    var toolBar = window.ShadowDom.get("shadow-dom-design-toolbar");
    var templates = $(window.ShadowDom.get("shadow-dom-design-templates")).find(".templates");
    $(".zone").sortable({
        items: ">div:not(.zoneName)",
        placeholder: "sorting",
        handle: ".sort-handle",
        tolerance: "pointer",
        connectWith: ".zone",
        stop: function (event, ui) {

            var target = ui.item.parent();
            if (ui.item.data("add")) {
                $.ajax({
                    type: "POST",
                    url: $("#append-widget-url").val(),
                    dataType: 'html',
                    async: false,
                    data: {
                        ID: ui.item.data("id"),
                        ZoneId: $("input.zoneId", this).val(),
                        PageId: $("#pageId").val(),
                        AssemblyName: ui.item.data("assemblyname"),
                        ServiceTypeName: ui.item.data("servicetypename"),
                        Position: 1
                    },
                    success: function (data) {
                        ui.item.replaceWith(data);
                        window.ShadowDom.init();
                        initWidgetToolBars(target);
                    }
                });
            }
            var widgets = [];
            target.find(".widget-design").each(function (i, ui) {
                widgets.push({
                    ID: $(ui).data("widgetid"),
                    ZoneId: $(".zoneId", target).val(),
                    Position: i + 1
                });
            });
            $.ajax({
                type: "POST",
                url: $("#save-widget-zone-url").val(),
                dataType: 'json',
                contentType: "application/json;charset=utf-8",
                async: false,
                data: JSON.stringify(widgets),
                success: function () {
                }
            });
            return true;
        }
    });

    templates.find("ul li").draggable({ helper: "clone", appendTo: templates, connectToSortable: ".zone" });
    templates.find(".tool-open").on("click", function () {
        $(this).parent().toggleClass("active");
    });
    templates.find(".delete-template").on("click", function () {
        var th = $(this);
        Easy.ShowMessageBox("提示", "确定要删除该模板吗？", function () {
            $.post(th.data("url"), { Id: th.data("id") }, function (data) {
                if (data) {
                    templates.find("#template_" + data).remove();
                }
            }, "json");
        }, true, 10);
    });
    function getToolBarRoot(host) {
        if (window.ShadowDom && window.ShadowDom.attach) {
            return window.ShadowDom.attach(host);
        }
        return host.shadowRoot;
    }

    // jQuery UI gets the mousedown retargeted to the host, so the host is the sort handle.
    // Mousedown on other toolbar items has to stay in the shadow root, otherwise it starts a drag.
    function stopNonHandleMouseDown(root) {
        root.addEventListener("mousedown", function (e) {
            if (!e.target.closest || !e.target.closest(".sort-handle")) {
                e.stopPropagation();
            }
        });
    }

    function getWidget(element) {
        var rootNode = element.getRootNode ? element.getRootNode() : null;
        var host = rootNode && rootNode.host;
        return host ? $(host).closest(".widget") : $(element).closest(".widget");
    }

    function initWidgetToolBar(host) {
        if (host.dataset.widgetToolBarReady) {
            return;
        }
        host.dataset.widgetToolBarReady = "true";

        var root = getToolBarRoot(host) || host;
        var $root = $(root);
        stopNonHandleMouseDown(root);

        $root.find(".delete").on("click", function () {
            var th = $(this);
            var id = th.data("id");
            $.post(th.data("url"), { ID: id }, function (data) {
                if (data) {
                    $("#widget_" + id).parent().remove();
                }
            }, "json");
        });

        $root.find(".more").on("click", function () {
            $(this).siblings(".toggle-hidden").toggleClass("hidden");
            $(this).toggleClass("hidden");
        });

        $root.find(".toggle-widget-class").on("click", function () {
            var clas = $(this).data("class");
            getWidget(this).toggleClass(clas);
            $.post($(this).data("action"), { clas: clas }, function () {
            });
        });

        $root.find(".custom-style-editor").on("click", function () {
            $(".custom-style-target").removeClass("custom-style-target");
            var url = $(this).data("action");
            var styleTarget = getWidget(this).parent();
            styleTarget.toggleClass("custom-style-target");
            window.top.Easy.ShowUrlWindow({
                url: '/admin/StyleEditor/Edit',
                width: 1024,
                title: "编辑样式",
                onLoad: function (box) {
                    box.addClass("loaded");
                },
                callBack: function () {
                    $.post(url, { style: styleTarget.attr("style") }, function () {
                    });
                },
                isDialog: false
            });
            $(".WeiWindow.BoxShadow").addClass("StyleEditor");
        });

        $root.find(".copy-widget").on("click", function () {
            $.post($(this).data("action"), function (data) {
                Easy.MessageTip.Show(data.message);
            });
        });
    }

    // jQuery cannot delegate events on a ShadowRoot, so each widget toolbar is bound directly.
    function initWidgetToolBars(context) {
        context.find("shadow-dom-widget-toolbar").each(function () {
            initWidgetToolBar(this);
        });
    }

    initWidgetToolBars($(document));

    $(document).on("change", "#template-file", function () {
        $("#template-form").submit();
    }).on("click", ".paste-widget", function () {
        var zone = $(this).closest(".zone");
        if (!zone.data("pasting")) {
            zone.data("pasting", true);
            $.post($(this).attr("href"), { Position: $(".widget", zone).size() + 1 }, function (html) {
                zone.append(html);
                window.ShadowDom.init();
                initWidgetToolBars(zone);
                zone.data("pasting", false);
            }, "html");
        }
        return false;
    });
    $(toolBar).find(".upload-template").on("click", function () {
        $("#template-file").trigger("click");
    });
    $(toolBar).find(".helper").click(function () {
        $("#containers").toggleClass($(this).data("class"));
    });
    if ($(window).width() > 1600) {
        templates.addClass("active");
    }

    $(document).on("show.bs.modal", "#mobile-frame", function () {
        if (window.innerHeight < 740) {
            $(".mobile", this).addClass("mini");
        } else {
            $(".mobile", this).removeClass("mini");
        }
        $("iframe", this).attr("src", $(this).data("src"));
    });
    $(document).on("hidden.bs.modal", "#mobile-frame", function () {
        $("iframe", this).html("").attr("src", "about:blank");
    });
});