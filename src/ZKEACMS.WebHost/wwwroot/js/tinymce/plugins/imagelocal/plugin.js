/*!
 * http://www.zkea.net/
 * Copyright 2016 ZKEASOFT
 * http://www.zkea.net/licenses
 */

tinymce.PluginManager.add('imagelocal', function (editor) {
    function downloadImage(url) {

    }
    function change() {
        
    }

    editor.addMenuItem('insertimagelocal', {
        icon: '',
        text: '下载外链图',
        context: 'edit',
        onclick: change,
        prependToContext: false
    });
});