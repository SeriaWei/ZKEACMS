/*!
 * http://www.zkea.net/
 * Copyright 2019 ZKEASOFT
 * http://www.zkea.net/licenses
 */
tinymce.PluginManager.add('filebrowser', function (editor) {
    function showDialog() {
        window.top.Easy.ShowUrlWindow({
            url: '/admin/Media/MultiSelect',
            title: "媒体库",
            zindex:10000,
            onLoad: function (box) {
                window.top.$(this.document).find("#confirm").click(function () {
                    $(".multi-select:not(.unchecked)", $(this).closest("body")).each(function () {
                        var result = initResult({ src: $(this).data("result"), name: $(this).data("name") });
                        if (result.ele) {
                            editor.undoManager.transact(function () {
                                editor.selection.setContent(editor.dom.createHTML(result.ele, result.attr, result.innerText));
                            });
                        }
                    });
                    editor.focus();
                    editor.nodeChanged();
                    box.close();
                });
                window.top.$(this.document).on("click", ".confirm", function () {
                    var result = initResult({ src: $(this).data("result"), name: $(this).data("name") });
                    if (result.ele) {
                        editor.undoManager.transact(function () {
                            editor.selection.setContent(editor.dom.createHTML(result.ele, result.attr, result.innerText));
                        });
                        editor.focus();
                        editor.nodeChanged();
                    }
                    box.close();
                });
            }
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


    //editor.addCommand("filebrowser", showDialog);


    editor.ui.registry.addButton('filebrowser', {
        icon: 'browse',
        tooltip: '媒体库',
        onAction: showDialog
    });

    //editor.ui.registry.addMenuItem('filebrowser', {
    //    icon: 'browse',
    //    text: '媒体库',
    //    onAction: showDialog,
    //    contextMenu: 'insert'
    //});

});