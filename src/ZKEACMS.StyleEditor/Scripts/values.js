"use strict";

$(function () {
    $(document).on("click", ".input-group .glyphicon.glyphicon-search", function () {
        var obj = $(this);
        window.top.Easy.ShowUrlWindow({
            url: obj.parent().siblings("input.form-control").data("url"),
            width: obj.parent().siblings("input.form-control").data("width") || 800,
            height: obj.parent().siblings("input.form-control").data("height") || 600,
            onLoad: function onLoad(box) {
                var win = this;
                $(this.document).find("#confirm").click(function () {
                    var target = obj.parent().siblings("input.form-control");
                    target.val(win.GetSelected());
                    box.close();
                });
                $(this.document).on("click", ".confirm", function () {
                    var target = obj.parent().siblings("input.form-control");
                    target.val($(this).data("result")).trigger("change");
                    box.close();
                });
            }, zindex: 101
        });
    }).on("click", ".reset", function () {
        $("input.form-control").val("").trigger("focus").trigger("blur");
        $("select.form-control").each(function () {
            $(this).val($("option:first", this).val());
        });
        $(".border,.padding,.fontsize,.position").slider("value", 0).each(function () {
            var $id = $(this).attr('id');
            $id = $id.replace('slider_', '#');
            $($id).text(0);
        });
        updateDisplay();
    });

    if (document.addEventListener) {
        document.querySelector("#background-image").addEventListener("paste", function (e) {
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
                        target.parentNode.className = target.parentNode.className + " processing";
                        target.value = "图片上传中...";
                        var file = cbData.items[i].getAsFile();
                        var xhr = new XMLHttpRequest();
                        xhr.open("POST", "/admin/media/Upload");
                        xhr.onload = function (data) {
                            target.parentNode.className = target.parentNode.className.replace(" processing", "");
                            var result = JSON.parse(data.target.response);
                            if (result.id) {
                                target.value = result.url;
                                updateDisplay();
                            }
                        }
                        xhr.onerror = function () {
                            target.parentNode.className = target.parentNode.className.replace(" processing", "");
                            target.value = "图片上传失败";
                        }
                        var formData = new FormData();
                        formData.append('file', file);
                        formData.append("folder", "图片");
                        xhr.send(formData);
                        break;
                    }
                }
            }

        });
    }

    var target = window.top.$(".custom-style-target");
    var attrs = target.attr("style");
    if (target.hasClass("form-control")) {
        target.val().replace(/style="([^"]*)"/g, function (a, v) {
            attrs = v;
        });
    }
    if (!attrs) {
        attrs = "";
    }
    attrs = attrs.replace(": ", ":");
    var attrRexs = [{
        reg: /^width:(\d+)px/g, setValue: function setValue(v) {
            $("#width").val(v);
        }
    }, {
        reg: /^height:(\d+)px/g, setValue: function setValue(v) {
            $("#height").val(v);
        }
    }, {
        reg: /^background-color:(.+)/g, setValue: function setValue(v) {
            $("#b-color").val(v);
        }
    }, {
        reg: /^color:(.+)/g, setValue: function setValue(v) {
            $("#t-color").val(v);
        }
    }, {
        reg: /^border:(.+)/g, setValue: function setValue(v) {
            v.replace(/(\d+)px ([a-z|A-Z]+) (#[a-z|A-Z|0-9]+)/g, function (a, s1, s2, s3) {
                $("#border-width").html(s1);
                $("#border-style").val(s2);
                $("#bc-color").val(s3);
            });
        }
    }, {
        reg: /^padding:(.+)/g, setValue: function setValue(v) {
            if (v.indexOf(" ") > 0) {
                $("#padding-custom").val(v);
            } else {
                $("#padding").text(parseInt(v));
            }
        }
    }, {
        reg: /^margin:(.+)/g, setValue: function setValue(v) {
            if (v.indexOf(" ") > 0) {
                $("#margin-custom").val(v);
            } else {
                $("#margin").text(parseInt(v));
            }
        }
    }, {
        reg: /^font-family:(.+)/g, setValue: function setValue(v) {
            $("#font-name").val(v);
        }
    }, {
        reg: /^font-style:(.+)/g, setValue: function setValue(v) {
            $("#font-style").val(v);
        }
    }, {
        reg: /^font-weight:(.+)/g, setValue: function setValue(v) {
            $("#font-weight").val(v);
        }
    }, {
        reg: /^font-size:(\d+)px/g, setValue: function setValue(v) {
            $("#font-size").text(v);
        }
    }, {
        reg: /^font-variant:(.+)/g, setValue: function setValue(v) {
            $("#font-variant").val(v);
        }
    }, {
        reg: /^line-height:(\d+)px/g, setValue: function setValue(v) {
            $("#line-height").text(v);
        }
    }, {
        reg: /^text-align:(.+)/g, setValue: function setValue(v) {
            $("#text-align").val(v);
        }
    }, {
        reg: /^text-decoration:(.+)/g, setValue: function setValue(v) {
            $("#text-decoration").val(v);
        }
    }, {
        reg: /^text-indent:(\d+)px/g, setValue: function setValue(v) {
            $("#text-indent").text(v);
        }
    }, {
        reg: /^letter-spacing:(\d+)px/g, setValue: function setValue(v) {
            $("#letter-spacing").text(v);
        }
    }, {
        reg: /^word-spacing:(\d+)px/g, setValue: function setValue(v) {
            $("#word-spacing").text(v);
        }
    }, {
        reg: /^text-transform:(.+)/g, setValue: function setValue(v) {
            $("#text-transform").val(v);
        }
    }, {
        reg: /^background-image:url\((.+)\)/g, setValue: function setValue(v) {
            $("#background-image").val(v);
        }
    }, {
        reg: /^background-repeat:(.+)/g, setValue: function setValue(v) {
            $("#background-repeat").val(v);
        }
    }, {
        reg: /^background-position:(.+)/g, setValue: function setValue(v) {
            $("#background-position").val(v);
        }
    }, {
        reg: /^background-attachment:(.+)/g, setValue: function setValue(v) {
            $("#background-attachment").val(v);
        }
    }, {
        reg: /^background-size:(.+)/g, setValue: function setValue(v) {
            $("#background-size").val(v);
        }
    }, {
        reg: /^background:(.+)/g, setValue: function setValue(v) {
            $("#background").val(v);
        }
    }, {
        reg: /^position:(.+)/g, setValue: function setValue(v) {
            $("#position").val(v);
        }
    }, {
        reg: /^top:(\d+)px/g, setValue: function setValue(v) {
            $("#position-top").val(v);
        }
    }, {
        reg: /^left:(\d+)px/g, setValue: function setValue(v) {
            $("#position-left").val(v);
        }
    }, {
        reg: /^right:(\d+)px/g, setValue: function setValue(v) {
            $("#position-right").val(v);
        }
    }, {
        reg: /^bottom:(\d+)px/g, setValue: function setValue(v) {
            $("#position-bottom").val(v);
        }
    }, {
        reg: /^cursor:(.+)/g, setValue: function setValue(v) {
            $("#cursor").val(v);
        }
    }, {
        reg: /^visibility:(.+)/g, setValue: function setValue(v) {
            $("#visibility").val(v);
        }
    }, {
        reg: /^overflow:(.+)/g, setValue: function setValue(v) {
            $("#overflow").val(v);
        }
    }, {
        reg: /^float:(.+)/g, setValue: function setValue(v) {
            $("#float").val(v);
        }
    }, {
        reg: /^border-radius:(.+)/g, setValue: function setValue(v) {
            if (v.indexOf("%") >= 0 || v.indexOf(" ") >= 0) {
                $("#border-radius-custom").val(v);
            } else {
                $("#border-radius").text(parseInt(v));
            }
        }
    }, {
        reg: /^text-shadow:(.+)/g, setValue: function setValue(v) {
            v.replace(/(\d+)px (\d+)px (\d+)px (#[a-z|A-Z|0-9]+)/g, function (a, s1, s2, s3, s4) {
                $("#text-h-length").html(s1);
                $("#text-v-length").html(s2);
                $("#text-b-length").html(s3);
                $("#text-s-color").val(s4);
            });
        }
    }, {
        reg: /^box-shadow:(.+)/g, setValue: function setValue(v) {
            v.replace(/(\d+)px (\d+)px (\d+)px (#[a-z|A-Z|0-9]+)/g, function (a, s1, s2, s3, s4) {
                $("#box-h-length").html(s1);
                $("#box-v-length").html(s2);
                $("#box-b-length").html(s3);
                $("#box-s-color").val(s4);
            });
        }
    }, {
        reg: /^z-index:(\d+)/g, setValue: function setValue(v) {
            $("#z-index").val(v);
        }
    }];
    var styleArray = attrs.split(';');
    window.unKnownStyle = [];
    for (var i = 0; i < styleArray.length; i++) {
        var styleItem = $.trim(styleArray[i]);
        if (!styleItem) {
            continue;
        }
        var match = false;
        for (var j = 0; j < attrRexs.length; j++) {
            if (attrRexs[j].reg.test(styleItem)) {
                styleItem.replace(attrRexs[j].reg, function (a, v) {
                    attrRexs[j].setValue($.trim(v));
                });
                match = true;
                break;
            }
        }
        if (!match) {
            window.unKnownStyle.push(styleItem);
        }
    }
    function slide(event, ui) {
        var $id = $(this).attr('id');
        $id = $id.replace('slider_', '#');
        $($id).text(ui.value);
        updateDisplay();
    }
    function slideCreate(event, ui) {
        var $id = $(this).attr('id');
        $id = $id.replace('slider_', '#');
        $(this).slider('value', $($id).text());
    }
    $(".border").slider({
        min: 0,
        max: 30,
        slide: slide,
        create: slideCreate
    });
    $(".padding").slider({
        min: 0,
        max: 100,
        slide: slide,
        create: slideCreate
    });
    $(".border-radius").slider({
        min: 0,
        max: 100,
        slide: slide,
        create: slideCreate
    });
    $(".fontsize").slider({
        min: 0,
        max: 60,
        slide: slide,
        create: slideCreate
    });
    $(".color-picker").spectrum({
        preferredFormat: "hex",
        showButtons: false,
        showInput: true,
        showInitial: true,
        showAlpha: true,
        allowEmpty: true
    }).on("dragstop.spectrum", function (e, color) {
        $(this).val(color.toHexString());
        updateDisplay();
    });

    updateDisplay();
});

