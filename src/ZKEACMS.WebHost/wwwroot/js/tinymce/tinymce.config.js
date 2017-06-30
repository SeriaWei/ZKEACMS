
$.post("/admin/Theme/GetCurrentTheme", function (theme) {
    tinymce.init({
        content_css: [theme],
        selector: "textarea.html",
        verify_html: false,
        plugins: [
            "advlist autolink lists link image charmap print preview anchor",
            "searchreplace visualblocks code fullscreen",
            "insertdatetime media table contextmenu paste",
            "filebrowser textcolor hr",
            "bootstrap"
        ],
        toolbar: "insertfile undo redo | styleselect | bold italic forecolor backcolor | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | filebrowser",
        height: 300,
        relative_urls: false,
        language: "zh_CN",
        setup: function (editor) {
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
                    Easy.Block();
                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "/admin/media/Upload");
                    xhr.onload = function (data) {
                        Easy.UnBlock();
                        var result = JSON.parse(data.target.response);
                        if (result.id) {
                            pasteImage(result.url);
                        }
                    }
                    var formData = new FormData();
                    formData.append('file', file);
                    formData.append("folder", "图片");
                    xhr.send(formData)
                }
                function pasteImage(source) {
                    currentEditor.undoManager.transact(function () {
                        currentEditor.selection.setContent(currentEditor.dom.createHTML("img", { "src": source }));
                    });
                    currentEditor.focus();
                    currentEditor.nodeChanged();

                }
            })
        }
    });
});
