$(function () {
    var container = $("#containers");
    if (container.children().size() > 0 && container.children(".container").size() === 0 && container.children(".container-fluid").size() === 0) {
        var containerItem = $('<div class="container"></div>');
        container.children().appendTo(containerItem);
        container.append(containerItem);
    }
    var containerTools = [
        '<div class="tools">',
        '<i class="glyphicon glyphicon-resize-horizontal" title="拉伸"></i>',
        '<i class="glyphicon glyphicon-resize-small" title="居中"></i>',
        '<i class="glyphicon glyphicon-sort" title="拖动排序"></i>',
        '<i class="glyphicon glyphicon-erase custom-style-editor" title="编辑样式"></i>',
        '<i class="glyphicon glyphicon-remove-circle" title="删除"></i>',
        '</div>'
    ].join('');
    var rowTools = [
        '<div class="tools">',
        '<i class="glyphicon glyphicon-remove-circle" title="删除"></i>',
        '</div>'].join('');
    var colTools = [
        '<div class="tools">',
        '<i class="glyphicon glyphicon-menu-left" title="宽度 - 1"></i>',
        '<i class="glyphicon glyphicon glyphicon-menu-right" title="宽度 + 1"></i>',
        '<i class="glyphicon glyphicon-remove-circle" title="删除"></i>',
        '</div>'].join('');
    function getNewZone() {
        var zoneParent = $('<div class="additional zone"></div>');
        var zone = $("<zone></zone>");
        zone.append('<input class="form-control" type="text" name="ZoneName" placeholder="输入名称" value="区域 ' + ($("#containers input[type=text]").size() + 1) + '" />');
        zone.append('<input class="form-control" type="hidden" name="LayoutId" value="' + $("#LayoutId").val() + '" />');
        zone.append('<input class="form-control" type="hidden" name="ID" value="" />');
        zone.append('<input class="form-control" type="hidden" name="HeadingCode" value="" />');
        zoneParent.append(zone);
        return zoneParent;
    }
    $(document).on("click", ".dropdown-menu.col-size a", function () {
        $("#add-col-handle").attr("data-val", $(this).data("val")).find(".col-size-info").text($(this).text());
        $(this).parent().parent().find(".active").removeClass("active");
        $(this).parent().addClass("active");
    });
    $(".AddContainer").draggable({ helper: "clone" });
    $(".AddRow").draggable({ helper: "clone", revert: "invalid", connectToSortable: ".container,.container-fluid" });
    $(".AddCol").draggable({ helper: "clone", connectToSortable: ".additional.row" });
    $(".templates ul li").draggable({ helper: "clone", connectToSortable: "#containers>div" });

    var colSortOption = {
        placeholder: "additional",
        tolerance: "pointer",
        connectWith: ".additional.row",
        over: function (event, ui) {
            if (ui.item.hasClass("AddCol")) {
                ui.placeholder.addClass(ui.item.data("col") + ui.item.data("val")).html('<div class="colContent row muted"></div>');
            } else {
                ui.placeholder.addClass(ui.item.attr("class")).html('<div class="colContent row muted"></div>');
            }
        },
        stop: function (event, ui) {
            if (ui.item.hasClass("AddCol")) {
                var col = $('<div class="additional ' + ui.item.data("col") + ui.item.data("val") + ' ui-sortable-handle">' + colTools + '<div class="colContent row"></div></div>');
                col.find(".colContent").append(getNewZone());
                ui.item.replaceWith(col);
            }
        }
    };
    var rowSortOption = {
        placeholder: "additional row muted",
        tolerance: "pointer",
        connectWith: ".container,.container-fluid",
        items: ".additional.row",
        stop: function (event, ui) {
            var row = $('<div class="additional row">' + rowTools + '</div>');
            if (ui.item.hasClass("AddRow")) {
                ui.item.replaceWith(row);
            } else if (ui.item.data("add")) {
                var cols = $(ui.item.find(".row").html());
                cols.find(".border-helper").remove();
                row.append(cols);
                ui.item.replaceWith(row);
                cols.each(function () {
                    $(this).addClass("additional");
                    $(this).append(colTools);
                    $(this).append($('<div class="colContent row"></div>').append(getNewZone()));
                });
            }
            row.sortable(colSortOption);
        }
    };
    function initContainer() {
        $("#containers").sortable({
            placeholder: "design",
            axis: 'y',
            tolerance: "pointer",
            start: function (event, ui) {
                if (ui.helper.hasClass("container")) {
                    ui.placeholder.addClass("container");
                    ui.helper.css("left", ui.placeholder.offset().left);
                }
                else {
                    ui.placeholder.addClass("container-fluid");
                }
            },
            handle: ".glyphicon-sort"
        });

        $("#containers>div").sortable(rowSortOption).append(containerTools).addClass("design main custom-style");
        $(".additional.row").sortable(colSortOption).append(rowTools).children(".additional").append(colTools);
    }
    initContainer();

    $("body").droppable({
        greedy: true,
        accept: ".AddContainer",
        hoverClass: "dropWarning",
        drop: function (event, ui) {
            var newCon = $('<div class="container design main">' + containerTools + '</div>');
            newCon.sortable(rowSortOption);
            $(".additional.row", newCon).sortable(colSortOption);
            $("#containers").append(newCon);
        }
    });
    $(document).on("click", ".container.design .glyphicon-resize-horizontal", function () {
        $(this).closest(".container").removeClass("container").addClass("container-fluid");
    });
    $(document).on("click", ".container-fluid.design .glyphicon-resize-small", function () {
        $(this).closest(".container-fluid").removeClass("container-fluid").addClass("container");
    });
    $(document).on("click", "#containers .glyphicon-remove-circle", function () {
        var target = $(this).parent().parent();
        Easy.ShowMessageBox("提示", "确定要删除吗？", function () {
            target.remove();
        }, true, 10);
    });
    $(document).on("click", "#containers .glyphicon-menu-left", function () {
        var cls = $(this).parent().parent().attr("class");
        cls = cls.replace(/col-md-(\d+)/g, function (a, v) {
            v = parseInt(v);
            if (v > 1) {
                v--;
            }
            return 'col-md-' + v;
        });
        $(this).parent().parent().attr("class", cls);
    });
    $(document).on("click", "#containers .glyphicon-menu-right", function () {
        var cls = $(this).parent().parent().attr("class");
        cls = cls.replace(/col-md-(\d+)/g, function (a, v) {
            v = parseInt(v);
            if (v < 12) {
                v++;
            }
            return 'col-md-' + v;
        });
        $(this).parent().parent().attr("class", cls);
    });
    $(document).on("click", ".custom-style-editor", function () {
        $(".custom-style-target").removeClass("custom-style-target");
        $(this).parents(".main").addClass("custom-style-target");
    });
    if ($(window).width() > 1600) {
        $(".templates").addClass("active");
    }
    $(document).on("click", ".templates .tool-open", function () {
        $(this).parent().toggleClass("active");
    });
    container.removeClass("hide");

    $(document).on("click", "#save", function () {
        $('input[name="ZoneName"]').each(function () {
            if (!$.trim($(this).val())) {
                $(this).val("未命名");
            }
            $(this).attr("value", $(this).val());
        });
        if ($(this).data("done")) {
            return;
        }
        $(this).data("done", true);

        var form = $("#LayoutInfo");

        $("zone").each(function (i) {
            $("input", this).each(function () {
                $(this).attr("name", "zones[" + i + "]." + $(this).attr("name")).addClass("hide");
            }).appendTo(form);
        });

        var copyContainer = $('<div id="containers"/>').append(container.html());

        $("div", copyContainer)
            .removeClass("ui-droppable")
            .removeClass("ui-sortable")
            .removeClass("ui-sortable-handle")
            .removeClass("active")
            .removeClass("design")
            .removeClass("custom-style-target")
            .not(".custom-style").removeAttr("style");

        $(".tools", copyContainer).remove();

        var html = copyContainer.html();
        var htmlArray = html.split("<zone>");
        var zoneArray = [];
        for (var i = 0; i < htmlArray.length; i++) {
            zoneArray.push(htmlArray[i]);
            if (i < htmlArray.length - 1) {
                zoneArray.push("<zone>");
            }
        }
        var allZoneResult = [];
        for (var i = 0; i < zoneArray.length; i++) {
            var zoneEnd = zoneArray[i].split("</zone>");
            for (var j = 0; j < zoneEnd.length; j++) {
                allZoneResult.push(zoneEnd[j]);
                if (j < zoneEnd.length - 1) {
                    allZoneResult.push("</zone>");
                }
            }
        }
        $(".layout-html", form).remove();
        for (var i = 0; i < allZoneResult.length; i++) {
            var part = $.trim(allZoneResult[i]);
            if (!part) {
                continue;
            }
            form.append($('<textarea name="html" class="layout-html hide"></textarea>').val(part));
        }
        form.submit();
        return false;
    });
    $(document).on("click", "#show-source-code", function () {
        $('input[name="ZoneName"]').each(function () {
            if (!$.trim($(this).val())) {
                $(this).val("未命名");
            }
            $(this).attr("value", $(this).val());
        });
        var copyContainer = $('<div id="containers"/>').append(container.html());

        $("div", copyContainer)
            .removeClass("ui-droppable")
            .removeClass("ui-sortable")
            .removeClass("ui-sortable-handle")
            .removeClass("active")
            .removeClass("design")
            .removeClass("custom-style-target")
            .not(".custom-style").removeAttr("style");

        $(".tools", copyContainer).remove();

        var html = copyContainer.html()
            .replace(new RegExp('><div', 'g'), ">\n<div")
            .replace(new RegExp('></div', 'g'), ">\n</div")
            .replace(new RegExp('><zone>', 'g'), ">\n<zone>\n")
            .replace(new RegExp('></zone', 'g'), ">\n</zone")
            .replace(new RegExp('><input', 'g'), ">\n<input");
        editor.setValue(html);
        setTimeout(function () {
            editor.refresh();
            var totalLines = editor.lineCount();
            editor.autoFormatRange({ line: 0, ch: 0 }, { line: totalLines });
        }, 500);
    });
    $(document).on("click", "#save-layout-code", function () {
        var doc = editor.getValue();
        container.html(doc);
        $("input[name=LayoutId]", container).val($("#LayoutId").val());
        initContainer();

    });
    var editor = CodeMirror.fromTextArea(document.getElementById('layout-code'), {
        lineNumbers: true,
        mode: "htmlmixed",
        theme: 'monokai',
        lineWrapping: true,
        autofocus: true,
        tabSize: 2,
        extraKeys: { "Ctrl-J": "autocomplete" },
        autoCloseTags: true
    });
    $(".CodeMirror").height($(window).height() - 220);
    $("#modal-layout-code").css("display", "");
});