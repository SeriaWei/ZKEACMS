/*!
 * http://www.zkea.net/
 * Copyright 2016 ZKEASOFT
 * http://www.zkea.net/licenses
 */
tinymce.PluginManager.add('pasteImage', function (editor) {
    editor.on('paste', function (e) {
        setTimeout(function () { editor.uploadImages(); });
    })
});