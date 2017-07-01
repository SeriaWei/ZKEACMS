/*!
 * http://www.zkea.net/
 * Copyright 2016 ZKEASOFT
 * http://www.zkea.net/licenses
 */
tinymce.PluginManager.add('pasteImage', function (editor) {
    editor.on('paste', function (e) {
        var currentEditor = this;
        var cbData;
        if (e.clipboardData) {
            cbData = e.clipboardData;
        } else if (window.clipboardData) {
            cbData = window.clipboardData;
        }
        if (e.msConvertURL) {
            var fileList = cbData.files;
            if (fileList.length > 0) {
                for (var i = 0; i < fileList.length; i++) {
                    var blob = fileList[i];
                    uploadFile(blob);
                }
            }
        }
        if (cbData && cbData.items) {
            if (cbData.getData("text/plain") ||
                (cbData.items.length === 2 && cbData.items[0].type === "text/html") && cbData.items[1].type.indexOf('image') !== -1) {
                return;
            }
            for (var i = 0; i < cbData.items.length; i++) {
                var reader = new FileReader();
                if (cbData.items[i].type.indexOf('image') !== -1) {
                    var blob = cbData.items[i].getAsFile();
                    uploadFile(blob);
                }
            }
        }

        function uploadFile(file) {
            var loading = currentEditor.dom.createHTML("img", { "src": "/images/loader.gif", "id": (new Date()).valueOf() })
            currentEditor.selection.setContent(loading);
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "/admin/media/Upload");
            xhr.onload = function (data) {
                var result = JSON.parse(data.target.response);
                if (result.id) {
                    var r = currentEditor.getContent();
                    r = r.replace(loading, currentEditor.dom.createHTML("img", { "src": result.url }));
                    currentEditor.setContent(r);
                    currentEditor.focus()
                }
            }
            var formData = new FormData();
            formData.append('file', file);
            formData.append("folder", "图片");
            xhr.send(formData)
        }

    })
});