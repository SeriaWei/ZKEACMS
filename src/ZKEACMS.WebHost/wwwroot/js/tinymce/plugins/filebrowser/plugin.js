/*!
 * http://www.zkea.net/
 * Copyright 2016 ZKEASOFT
 * http://www.zkea.net/licenses
 */
tinymce.PluginManager.add('filebrowser', function (editor) {
    function showDialog() {
        tinymce.activeEditor.windowManager.open({
            title: "媒体库",
            body: {
                type: "panel",
                items: [
                    {
                        type: 'htmlpanel',
                        html: '<iframe src="/admin/Media/MultiSelect" style="width: 1024px;height: 600px"></iframe>'
                    }
                ]
            },
            resizable: true,
            buttons: [
                {
                    type:"custom",
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
                {
                    type: "cancel",text: "取消", onclick: "close" }
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
        } else if (/.*(\.mp3|\.ogg|\.wav)$/.test(lowerPath)) {
            result.ele = "audio";
            result.attr = { "controls": "controls", "src": path, "title": name };
        } else {
            result.ele = "a";
            result.attr = { "href": path, "class": "btn btn-default", "download": name, title: name };
            result.innerText = "下载";
        }
        return result;
    }


    editor.addCommand("filebrowser", showDialog);


    editor.ui.registry.addButton('filebrowser', {
        icon: 'browse',
        tooltip: '媒体库',
        onAction: showDialog
    });

    editor.ui.registry.addMenuItem('filebrowser', {
        icon: 'browse',
        text: '媒体库',
        onAction: showDialog,
        context: 'insert',
        prependToContext: true
    });
});