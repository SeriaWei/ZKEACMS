/*!
 * http://www.zkea.net/
 * Copyright 2017 ZKEASOFT
 * http://www.zkea.net/licenses
 */

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
                    target.val(win.GetSelected());
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



    if ($.fn.datetimepicker) {
        $(".Date").each(function () {
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



    $("input.select-image").popover({
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
    }).on("change", function () {
        var url = $(this).val();
        if (url && url.indexOf("~/") != 0 && url.indexOf("/") != 0 && url.replace("http://", "").replace("https://", "").indexOf(window.location.hostname) != 0) {
            if ($(this).siblings(".image-local").length == 0) {
                $('<div class="input-group-addon image-local"><span class="glyphicon glyphicon-floppy-open upload-external"></span></div>').insertAfter($(this));
            }
        } else {
            $(this).siblings(".image-local").remove();
        }
    }).trigger("change").parent().addClass("loading");

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
                            if (file.size > 1048000) {
                                continue;
                            }
                            target.parentNode.className = target.parentNode.className + " processing";
                            target.value = "图片上传中...";
                            var xhr = new XMLHttpRequest();
                            xhr.open("POST", "/admin/media/Upload");
                            xhr.onload = function (data) {
                                target.parentNode.className = target.parentNode.className.replace(" processing", "");
                                var result = JSON.parse(data.target.response);
                                if (result.id) {
                                    target.value = "~" + result.url;
                                    $(target).blur().focus();
                                }
                            }
                            xhr.onerror = function () {
                                target.parentNode.className = target.parentNode.className.replace(" processing", "");
                                target.value = "图片上传失败";
                            }
                            var formData = new FormData();
                            formData.append('file', file);
                            formData.append("folder", "图片");
                            formData.append("size", file.size);
                            xhr.send(formData);
                            break;
                        }
                    }
                }
            }
        });
    }

    $(".input-group .glyphicon.glyphicon-play").popover({
        trigger: "click",
        html: true,
        title: "视频预览",
        content: function () {
            var url = $(this).parent().siblings("input").val();
            if (url) {
                if (url.indexOf("~") === 0) {
                    url = url.replace("~", location.origin);
                }
                return "<div><video style='width:244px;height:183px' controls='controls' src='" + url + "'>您的浏览器不支持播放该视频</video></div>";
            }
            return null;
        },
        placement: "left"
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
            scrollBar.scrollTop = scroll/2;
        }
    }

    //list editor

    $("input,select,textarea", ".input-group-collection .Template").each(function () {
        if (!$(this).prop("disabled")) {
            $(this).prop("disabled", true);
            $(this).attr("editable", true);
        }
    });

    $(document).on("click", ".input-group-collection .add", function () {
        var index = $(this).siblings(".items").children(".item").size();
        var template = $($(this).siblings(".Template").html());
        $("input,select,textarea", template).attr("data-val", true).each(function () {
            if ($(this).attr("editable")) {
                $(this).prop("disabled", false);
                $(this).removeAttr("editable");
            }
            var name = $(this).attr("name");
            if (name) {
                $(this).attr("name", name.replace(/\[(\d+)\]/, "[" + index + "]"));
            }
            var id = $(this).attr("id");
            if (id) {
                $(this).attr("id", id.replace(/\_(\d+)\_/, "_" + index + "_"));
            }

            if ($(this).hasClass("Date") && !$(this).prop("readonly") && !$(this).prop("disabled") && $.fn.datetimepicker) {
                $(this).datetimepicker({ locale: "zh-CN", format: $(this).attr("JsDateFormat") });
            }
        });

        $(".field-validation-error,.field-validation-valid", template).each(function () {
            var msgFor = $(this).attr("data-valmsg-for");
            $(this).attr("data-valmsg-for", msgFor.replace(/\[(\d+)\]/, "[" + index + "]"))
        });
        template.find(".ActionType").val($(this).data("value"));
        $(this).siblings(".items").append(template);

        var form = $(this).closest("form");
        form.removeData("validator").removeData("unobtrusiveValidation");
        $.validator.unobtrusive.parse(form[0]);

    }).on("click", ".input-group-collection .delete", function () {
        var form = $(this).closest("form");
        var allValid = true;
        $("input,select,textarea", $(this).parent()).each(function () {
            if ($(this).hasClass("required") && !$(this).val()) {
                if ($(this).is("select")) {
                    $(this).val($("option:last", this).val());
                } else {
                    $(this).val("None");
                }
            }
            if (allValid) {
                allValid = form.validate().element("#" + $(this).attr("id"));
            }
        });
        if (allValid) {
            $(this).parent().hide();
            $(this).siblings(".hide").find(".ActionType").val($(this).data("value"));
        }
    }).on("change", ".input-group-collection .form-control", function () {
        var actionType = $(".ActionType", $(this).closest(".item"));
        if (actionType.val() !== "Create") {
            actionType.val("Update");
        }
    });

    if ($.fn.select2) {
        $("select[multiple='multiple']").select2();
    }
});