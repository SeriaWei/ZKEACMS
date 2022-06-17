﻿/*! http://www.zkea.net/
 * Copyright (c) ZKEASOFT. All rights reserved.
 * http://www.zkea.net/licenses */

$(function () {
    $(".accordion-group>a").click(function () {
        var className = 'active';
        var a = $(this);
        var div_inner = a.nextAll(".accordion-inner");
        if (a.hasClass(className)) {
            a.removeClass(className);
            div_inner.hide(200);
        }
        else {
            a.addClass(className);
            div_inner.show(200);
        }
        //if ($(this).nextAll(".accordion-inner").hasClass("active")) {
        //    return false;
        //}
        //$(this).parents("ul").find(".accordion-inner.active").removeClass("active").hide(200);
        //$(this).nextAll(".accordion-inner").addClass("active").show(200);
        return false;
    });


    $(document).on("click", ".cancel", function () {
        window.history.back();
    }).on("click", ".publish", function () {
        if (confirm("确认要发布吗？")) {
            return true;
        }
        return false;
    }).on("click", "input[type=submit]", function () {
        $("#ActionType").val($(this).data("value"));
        return true;
    }).on("click", ".input-group .glyphicon.glyphicon-search", function () {
        var obj = $(this);
        window.top.Easy.ShowUrlWindow({
            url: obj.parent().siblings("input.form-control").data("url"),
            width: obj.parent().siblings("input.form-control").data("width") || 800,
            onLoad: function (box) {
                var win = this;
                $(this.document).find("#confirm").click(function () {
                    var target = obj.parent().siblings("input.form-control");
                    var selectValue = win.GetSelected();
                    if (typeof (selectValue) == "object") {
                        target.val(selectValue.value);
                        if (selectValue.additional) {
                            var form = target.closest("form");
                            var nameArray = target.attr("name").split('.');
                            for (var p in selectValue.additional) {
                                if (selectValue.additional.hasOwnProperty(p)) {
                                    nameArray[nameArray.length - 1] = p;
                                    var name = nameArray.join('.');
                                    $('[name="' + name + '"]', form).val(selectValue.additional[p]);
                                }
                            }
                        }
                    } else {
                        target.val(selectValue);
                    }
                    box.close();
                    target.trigger("change");
                });
                $(this.document).on("click", ".confirm", function () {
                    var target = obj.parent().siblings("input.form-control");
                    target.val($(this).data("result"));
                    box.close();
                    target.trigger("change");
                });
            }
        });
    }).on("click", ".form-group select#ZoneID", function () {
        var obj = $(this);
        if (obj.val() == "ZONE-X") {
            return;
        }
        var url = "/admin/Layout/SelectZone?layoutId=" + $(".hide #LayoutID").val() + "&pageId=" + $(".hide #PageID").val() + "&zoneId=" + obj.val();
        window.top.Easy.ShowUrlWindow({
            url: url,
            width: 1000,
            title: "选择区域",
            onLoad: function (box) {
                var win = this;
                $(this.document).find("#confirm").click(function () {
                    obj.val(win.GetSelected());
                    box.close();
                });
            }
        });
    }).on("click", ".custom-style-editor", function () {
        window.top.Easy.ShowUrlWindow({
            url: '/admin/StyleEditor/Edit',
            width: 1024,
            title: "编辑样式",
            onLoad: function (box) {
                box.addClass("loaded");
            },
            isDialog: false
        });
        $(".WeiWindow.BoxShadow").addClass("StyleEditor");
    }).on("click", ".form-group select.select", function () {
        var obj = $(this);
        window.top.Easy.ShowUrlWindow({
            url: obj.data("url") + "?selected=" + obj.val(),
            width: obj.data("width") || 800,
            onLoad: function (box) {
                var win = this;
                $(this.document).find("#confirm").click(function () {
                    obj.val(win.GetSelected());
                    box.close();
                    obj.trigger("change");
                });
                $(this.document).on("click", ".confirm", function () {
                    obj.val($(this).data("result"));
                    box.close();
                    obj.trigger("change");
                });
            }
        });
    }).on("submit", "form", function () {
        Easy.Block();
    });
    $(".form-group select#ZoneID,.form-group select.select").on("mousedown", false);
    $(".form-group select#ZoneID").each(function () {
        if ($(this).val() == "ZONE-X") {
            $(this).closest(".form-group").hide();
        }
    });

    if ($.fn.datetimepicker) {
        $(".Date:not(input[type=hidden])").each(function () {
            if (!$(this).prop("readonly") && !$(this).prop("disabled")) {
                $(this).datetimepicker({ locale: "zh-CN", format: $(this).attr("JsDateFormat") });
                $(this).closest(".input-group").find(".glyphicon-calendar").click(function () {
                    $(this).closest(".input-group").find("input").focus();
                });
            }
        });
    }
    $(document).on("click", ".nav.nav-tabs a", function () {
        $(this).tab('show');
        return false;
    });
    $('.nav.nav-tabs').each(function () {
        var shown = false;
        $("li", this).each(function () {
            if ($(this).hasClass("active")) {
                $(this).removeClass("active");
                $("a", this).tab("show");
                shown = true;
            }
        });
        if (!shown) {
            $("li:first a", this).tab("show");
            if (location.hash) {
                $("li a[href='" + location.hash + "']", this).tab("show");
            }
        }
    });

    $('#StyleClass.form-control').popover({
        trigger: "focus",
        html: true,
        title: "自定义样式用法",
        content: function () {
            var activeClass = [
                { name: "边框", value: "border" },
                { name: "文字居中", value: "align-center" },
                { name: "文字右对齐", value: "align-right" },
                { name: "图片边框", value: "image-border" },
                { name: "阴影", value: "box-shadow" },
                { name: "图片圆形", value: "image-circle" },
                { name: "取消外边距", value: "full" },
                { name: "居中容器", value: "container" }
            ];
            var html = "<p clss='text-nowrap'>直接写样式例：<code>style=\"color:#fff\"</code></p><p>预定义样式：<ol>";
            for (var i = 0; i < activeClass.length; i++) {
                html += "<li>" + activeClass[i].name + ":<code>" + activeClass[i].value + "</code></li>";
            }
            html += "</ol></p>";
            return html;
        },
        placement: "bottom"
    });




    function popoverImage(ele) {
        $("input.select-image", ele).popover({
            trigger: "focus",
            html: true,
            title: "图片预览",
            content: function () {
                var url = $(this).val();
                if (url) {
                    if (url.indexOf("~") === 0) {
                        url = url.replace("~", location.origin);
                    }
                    return "<div style='width:244px;'><img src='" + url + "'/></div>";
                }
                return null;
            },
            placement: "bottom"
        }).trigger("change").parent().addClass("loading");
    }
    $(document).on("change", "input.select-image", function () {
        var url = $(this).val();
        if (url && url.indexOf("~/") != 0 && url.indexOf("/") != 0 && url.replace("http://", "").replace("https://", "").indexOf(window.location.hostname) != 0) {
            if ($(this).siblings(".image-local").length == 0) {
                $('<div class="input-group-addon image-local"><span class="glyphicon glyphicon-floppy-open upload-external"></span></div>').insertAfter($(this));
            }
        } else {
            $(this).siblings(".image-local").remove();
        }
    });
    $(document).on("list.added", function (e) {
        popoverImage(e.target);
    });
    popoverImage(document);

    $(document).on("click", ".image-local .upload-external", function () {
        var group = $(this).closest(".input-group");
        group.addClass("processing");
        $.post("/admin/Media/DownLoadExternalImage", { images: [group.find("input").val()] }, function (data) {
            if (data) {
                for (var i = 0; i < data.length; i++) {
                    group.find("input").val(data[i].value).trigger("change");
                }
            }
            group.removeClass("processing");
        }, "json");
    });

    if (document.addEventListener) {
        function sliceUpload(target, file, start, result) {
            var url = "/admin/media/upload";
            if (start > 0) {
                url = "/admin/media/appendfile";
            }
            var end = start + 1000000;
            if (end > file.size) {
                end = file.size;
            }
            target.parentNode.classList.add("processing");
            target.value = "...";

            var xhr = new XMLHttpRequest();
            xhr.open("POST", url);
            if (end == file.size) {
                xhr.onload = function (data) {
                    target.parentNode.classList.remove("processing");
                    var result = JSON.parse(data.target.response);
                    if (result.id) {
                        target.value = "~" + result.url;
                        $(target).blur().focus();
                    }
                }
            }
            else {
                xhr.onload = function (e) {
                    var result = JSON.parse(e.target.response);
                    if (result) {
                        sliceUpload(target, file, end, result);
                    }
                }
            }
            xhr.onerror = function () {
                target.parentNode.classList.remove("processing");
                target.value = "Error!";
            }
            var formData = new FormData();
            formData.append('file', file.slice(start, end),file.name);
            formData.append("folder", "Images");
            formData.append("size", file.size);
            if (result) {
                formData.append("id", result.id);
                formData.append("position", start);
            }
            xhr.send(formData);
        }
        document.addEventListener("paste", function (e) {
            if (e.target.className && e.target.className.indexOf("select-image") >= 0) {
                var target = e.target;
                var cbData;
                if (e.clipboardData) {
                    cbData = e.clipboardData;
                } else if (window.clipboardData) {
                    cbData = window.clipboardData;
                }
                if (cbData && cbData.items) {
                    for (var i = 0; i < cbData.items.length; i++) {
                        if (cbData.items[i].type.indexOf('image') !== -1) {
                            var file = cbData.items[i].getAsFile();
                            sliceUpload(target, file, 0);
                            break;
                        }
                    }
                }
            }
        });
    }

    $(".input-group .glyphicon.glyphicon-play").click(function () {
        var url = $(this).closest(".input-group").find(".form-control").val();
        if (url) {
            if (url.indexOf("~") === 0) {
                url = url.replace("~", location.origin);
            }
            Easy.ShowUrlWindow({ url: '/admin/widget/playvideo?url=' + encodeURIComponent(url), width: 800, height: 450 });
        }
    });

    //main menu
    var mainMenu = $("#main-menu");
    if (mainMenu.length > 0) {
        var currentSelect;
        var match = 0;
        $("a.menu-item", mainMenu).each(function () {
            var href = $(this).attr("href");
            if (href) {
                if (location.pathname.toLocaleLowerCase().indexOf(href.toLowerCase()) === 0) {
                    if (href.length > match) {
                        currentSelect = $(this);
                        match = href.length;
                    }
                }
            }
        });
        if (currentSelect && currentSelect.size()) {
            currentSelect.addClass("active");
            if (currentSelect.parent().hasClass("accordion-inner")) {
                currentSelect.parent().show();
                currentSelect.parent().prev().addClass("active");
            }
        }

        var scroll = $(".menu-item.active", mainMenu).offset().top - mainMenu.offset().top;
        var leftMenu = document.querySelector('#left-menu');
        function setHeight() {
            leftMenu.style.height = (window.innerHeight - 133) + "px";
        }
        setHeight();
        var scrollBar = window.Scrollbar.init(leftMenu);
        $(window).on("resize", function () {
            Easy.Processor(setHeight, 500);
        });
        if (scroll > 0) {
            scrollBar.scrollTop = scroll / 2;
        }
    }


    if ($.fn.select2) {
        $("select[multiple='multiple']").select2();
    }
    $(".dy-editor:visible").trigger("init-editor");
});