/*!
 * http://www.zkea.net/
 * Copyright 2019 ZKEASOFT
 * http://www.zkea.net/licenses
 */
tinymce.PluginManager.add('filebrowser', function (editor) {
    var icon = '<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"\
	 viewBox="0 0 512.001 512.001" style="enable-background:new 0 0 512.001 512.001;" xml:space="preserve" width="24" height="24">\
<g><g><g><path d="M492.971,211.64h-50.443v-63.41c0-10.502-8.514-19.016-19.016-19.016H189.695V63.91c0-10.502-8.514-19.016-19.016-19.016\
				H19.016C8.514,44.894,0,53.408,0,63.91c0,13.692,0.001,370.375,0.001,384.179c0,10.432,8.48,19.017,19.029,19.017\
				c0.01,0,0.02-0.001,0.03-0.001h404.453c8.273,0,15.597-5.349,18.115-13.23l69.459-217.435\
				C515.005,224.175,505.831,211.64,492.971,211.64z M38.032,82.926h113.631v46.288H38.032V82.926z M38.032,167.247\
				c8.343,0,359.629-0.001,366.464-0.001v44.394H88.489c-8.272,0-15.596,5.349-18.115,13.229L38.032,326.092V167.247z\
				 M409.625,429.073H45.057l57.321-179.403c11.05,0,346.991,0,364.557,0L409.625,429.073z"/>\
			<path d="M206.005,358.389h30.973v30.973c0,10.502,8.514,19.016,19.016,19.016c10.502,0,19.016-8.514,19.016-19.016v-30.973\
				h30.973c10.502,0,19.016-8.514,19.016-19.016c0-10.503-8.514-19.016-19.016-19.016H275.01v-30.973\
				c0-10.502-8.514-19.016-19.016-19.016c-10.502,0-19.016,8.514-19.016,19.016v30.973h-30.973\
				c-10.502,0-19.016,8.514-19.016,19.016C186.989,349.875,195.503,358.389,206.005,358.389z"/></g></g></svg>';
    editor.ui.registry.addIcon('folder', icon);
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