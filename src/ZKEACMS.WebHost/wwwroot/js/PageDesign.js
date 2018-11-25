$(function () {
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
                        ZoneID: $("input.zoneId", this).val(),
                        PageID: $("#pageId").val(),
                        AssemblyName: ui.item.data("assemblyname"),
                        ServiceTypeName: ui.item.data("servicetypename"),
                        Position: 1
                    },
                    success: function (data) {
                        ui.item.replaceWith(data);
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

    $(".templates ul li").draggable({ helper: "clone", connectToSortable: ".zone" });
    $(document).on("click", ".zoneToolbar .delete", function () {
        var th = $(this);        
        $.post(th.data("url"), { ID: th.data("id") }, function (data) {
            if (data) {
                $("#widget_" + data).parent().remove();
            }
        }, "json");
    });
    $(document).on("click", ".templates .tool-open", function () {
        $(this).parent().toggleClass("active");
    }).on("click", ".templates .delete-template", function () {
        var th = $(this);
        Easy.ShowMessageBox("提示", "确定要删除该模板吗？", function () {
            $.post(th.data("url"), { Id: th.data("id") }, function (data) {
                if (data) {
                    $("#template_" + data).remove();
                }
            }, "json");
        }, true, 10);
    }).on("click", ".upload-template", function () {
        $("#template-file").trigger("click");
    }).on("change", "#template-file", function () {
        $("#template-form").submit();
    }).on("click", ".zoneToolbar .toggle-widget-class", function () {
        var clas = $(this).data("class");
        $(this).closest(".widget").toggleClass(clas);
        $.post($(this).data("action"), { clas: clas }, function () {
        });
    }).on("click", ".zoneToolbar .custom-style-editor", function () {
        $(".custom-style-target").removeClass("custom-style-target");
        var url = $(this).data("action");
        var styleTarget = $(this).closest(".widget").parent();
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
    }).on("click", ".copy-widget", function() {
        $.post($(this).data("action"), function (data) {
            Easy.MessageTip.Show(data.message);
        });
    }).on("click", ".paste-widget", function () {
        var zone = $(this).closest(".zone");
        if (!zone.data("pasting")) {
            zone.data("pasting", true);
            $.post($(this).attr("href"), { Position: $(".widget", zone).size() + 1 }, function (html) {
                zone.append(html);
                zone.data("pasting", false);
            }, "html");
        }
        return false;
    });
    $(".helper").click(function () {
        $("#containers").toggleClass($(this).data("class"));
    });
    if ($(window).width() > 1600) {
        $(".templates").addClass("active");
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