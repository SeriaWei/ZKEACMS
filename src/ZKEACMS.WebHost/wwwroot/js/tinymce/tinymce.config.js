
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
                            console.log("Image blob: " + blob);
                            readPastedBlob(blob);
                        }
                    }
                }
                if (cbData && cbData.items) {
                    if ((text = cbData.getData("text/plain"))) {
                        // Text pasting is already handled
                        return;
                    }
                    for (var i = 0; i < cbData.items.length; i++) {
                        if (cbData.items[i].type.indexOf('image') !== -1) {
                            var blob = cbData.items[i].getAsFile();
                            readPastedBlob(blob);
                        }
                    }
                }

                function readPastedBlob(blob) {
                    if (blob) {
                        reader = new FileReader();
                        reader.onload = function (evt) {
                            pasteImage(evt.target.result);
                        };
                        reader.readAsDataURL(blob);
                    }
                }

                function pasteImage(source) {
                    var image = "<img src='" + source + "' data-mce-selected='1'></img>";
                    window.tinyMCE.execCommand('mceInsertContent', false, image);
                }
            
            })
        }
    });
});
