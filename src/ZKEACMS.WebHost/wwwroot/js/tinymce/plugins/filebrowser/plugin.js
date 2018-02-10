/*!
 * http://www.zkea.net/
 * Copyright 2016 ZKEASOFT
 * http://www.zkea.net/licenses
 */
tinymce.PluginManager.add('filebrowser', function (editor) {
    function showDialog() {
        tinymce.activeEditor.windowManager.open({
            url: "/admin/Media/MultiSelect",
            width: 1024,
            height: 600,
            title: "媒体库",
            resizable: true,
            buttons: [
                {
                    text: "确定",
                    onclick: function (e) {
                        var frame = $(e.currentTarget).find("iframe")[0];
                        var doc = frame.contentDocument || frame.contentWindow.document;
                        var selected = $(doc).find(".multi-select:not(.unchecked)");
                        if (selected.length == 0) {
                            tinymce.activeEditor.windowManager.alert("请先选择要使用的媒体资源！");
                            return;
                        }
                        selected.each(function () {
                            var result = initResult({ src: $(this).data("result"), name: $(this).data("name") });
                            if (result.ele) {
                                editor.undoManager.transact(function () {
                                    editor.selection.setContent(editor.dom.createHTML(result.ele, result.attr, result.innerText));
                                });
                            }
                        });
                        editor.focus();
                        editor.nodeChanged();
                        tinymce.activeEditor.windowManager.close();
                    },
                    classes: "primary"
                },
                { text: "取消", onclick: "close" }
            ]
        }).$el.find("iframe").on("load", function () {
            var doc = this.contentDocument || this.contentWindow.document;
            $(doc).on("click", ".confirm", function () {
                var result = initResult({ src: $(this).data("result"), name: $(this).data("name") });
                if (result.ele) {
                    editor.undoManager.transact(function () {
                        editor.selection.setContent(editor.dom.createHTML(result.ele, result.attr, result.innerText));
                    });
                    editor.focus();
                    editor.nodeChanged();

                }
                tinymce.activeEditor.windowManager.close();
            });
        });
    }
    function initResult(obj) {
        var path = obj.src;
        var name = obj.name;
        var result = { ele: "", attr: {}, innerText: "" }
        var lowerPath = path.toLowerCase();
        if (/.*(\.jpg|\.gif|\.png|\.jpeg|\.bmp|\.jpe)$/.test(lowerPath)) {
            result.ele = "img";
            result.attr = { "src": path, "title": name, "alt": name };
        } else if (/.*(\.mp4)$/.test(lowerPath)) {
            result.ele = "video";
            result.attr = { "controls": "controls", "src": path, "title": name };
        } else {
            result.ele = "a";
            result.attr = { "href": path, "class": "btn btn-default", "download": name, title: name };
            result.innerText = "下载";
        }
        return result;
    }


    editor.addCommand("filebrowser", showDialog);


    editor.addButton('filebrowser', {
        icon: 'browse',
        tooltip: '媒体库',
        onclick: showDialog
    });

    editor.addMenuItem('filebrowser', {
        icon: 'browse',
        text: '媒体库',
        onclick: showDialog,
        context: 'insert',
        prependToContext: true
    });
});