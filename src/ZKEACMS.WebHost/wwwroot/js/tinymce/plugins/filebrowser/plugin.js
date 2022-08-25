/*!
 * http://www.zkea.net/
 * Copyright 2019 ZKEASOFT
 * http://www.zkea.net/licenses
 */
tinymce.PluginManager.add('filebrowser', function (editor) {
    editor.ui.registry.addIcon('folder', '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="24" height="24" viewBox="0 0 256 256" xml:space="preserve"><g style="stroke: none; stroke-width: 0; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: none; fill-rule: nonzero; opacity: 1;" transform="translate(1.4065934065934016 1.4065934065934016) scale(2.81 2.81)" ><path d="M 84.312 22.694 h -0.335 c -0.037 -3.108 -2.573 -5.625 -5.689 -5.625 H 50.062 c -0.709 0 -1.403 -0.288 -1.904 -0.789 l -8.645 -8.645 c -1.075 -1.075 -2.505 -1.667 -4.025 -1.667 H 5.693 C 2.554 5.968 0 8.522 0 11.661 v 56.344 v 8.649 v 2.867 c 0 2.486 2.023 4.51 4.51 4.51 h 79.801 c 3.137 0 5.688 -2.552 5.688 -5.688 V 28.383 C 90 25.246 87.448 22.694 84.312 22.694 z M 6.02 28.383 v 51.139 c 0 0.832 -0.677 1.51 -1.51 1.51 S 3 80.354 3 79.521 v -2.867 v -8.649 V 11.661 c 0 -1.485 1.208 -2.693 2.693 -2.693 h 29.794 c 0.719 0 1.396 0.28 1.904 0.789 l 8.645 8.645 c 1.06 1.06 2.526 1.667 4.025 1.667 h 28.226 c 1.461 0 2.649 1.172 2.686 2.625 H 11.708 C 8.572 22.694 6.02 25.246 6.02 28.383 z M 87 78.344 c 0 1.481 -1.206 2.688 -2.688 2.688 H 8.76 c 0.168 -0.473 0.26 -0.98 0.26 -1.51 V 28.383 c 0 -1.482 1.206 -2.688 2.688 -2.688 h 72.603 c 1.482 0 2.688 1.206 2.688 2.688 V 78.344 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" /><path d="M 76.295 60.675 H 57.08 c -0.828 0 -1.5 -0.672 -1.5 -1.5 s 0.672 -1.5 1.5 -1.5 h 19.215 c 0.828 0 1.5 0.672 1.5 1.5 S 77.123 60.675 76.295 60.675 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" /><path d="M 76.295 66.675 H 57.08 c -0.828 0 -1.5 -0.672 -1.5 -1.5 s 0.672 -1.5 1.5 -1.5 h 19.215 c 0.828 0 1.5 0.672 1.5 1.5 S 77.123 66.675 76.295 66.675 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" /><path d="M 76.295 72.675 H 57.08 c -0.828 0 -1.5 -0.672 -1.5 -1.5 s 0.672 -1.5 1.5 -1.5 h 19.215 c 0.828 0 1.5 0.672 1.5 1.5 S 77.123 72.675 76.295 72.675 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" /></g></svg>');
    function showDialog() {
        window.top.Easy.ShowUrlWindow({
            url: '/admin/Media/MultiSelect',
            title: "Media",
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
        icon: 'folder',
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