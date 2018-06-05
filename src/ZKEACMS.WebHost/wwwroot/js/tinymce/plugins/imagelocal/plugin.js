/*!
 * http://www.zkea.net/
 * Copyright 2018 ZKEASOFT
 * http://www.zkea.net/licenses
 */

tinymce.PluginManager.add('imagelocal', function (editor) {
    function download() {
        tinymce.activeEditor.windowManager.confirm("确定要将外链图片迁移到您的服务器吗？这可能会花一些时间。", function (s) {
            if (s) {
                tinyMCE.activeEditor.setProgressState(true);
                var content = editor.getContent();
                var imageUrls = [];
                var imageIndexed = {};
                var content = $("<div>" + editor.getContent() + "</div>");
                $("img", content).each(function () {
                    var url = $(this).attr("src");
                    if (url) {
                        if (url.indexOf(".qpic.cn/") > 0 && url.indexOf("tp=webp") > 0) {
                            url = url.split("?")[0];
                        }
                        if (url.indexOf("/") != 0 && url.replace("http://", "").replace("https://", "").indexOf(window.location.hostname) != 0) {
                            if (imageUrls.indexOf(url)) {
                                imageUrls.push(url);
                                imageIndexed[url] = [$(this)];
                            }
                            else {
                                imageIndexed[url].push($(this));
                            }
                        }
                    }
                });
                if (imageUrls.length > 0) {
                    $.post("/admin/Media/DownLoadExternalImage", { images: imageUrls }, function (data) {
                        if (data) {
                            for (var i = 0; i < data.length; i++) {
                                if (imageIndexed[data[i].key]) {
                                    for (var j = 0; j < imageIndexed[data[i].key].length; j++) {
                                        imageIndexed[data[i].key][j].attr("src", data[i].value);
                                    }
                                }
                            }
                            editor.setContent(content.html());
                            tinyMCE.activeEditor.setProgressState(false);
                        }
                        if (imageUrls.length != data.length) {
                            tinymce.activeEditor.windowManager.alert("部分图片没有下载成功，可从日志中查看原因或重试。");
                        } else {
                            tinymce.activeEditor.windowManager.alert("图片迁移成功");
                        }
                    }, "json");
                } else {
                    tinyMCE.activeEditor.setProgressState(false);
                    tinymce.activeEditor.windowManager.alert("没有发现外链图片");
                }
            }
        });

    }

    editor.addMenuItem('insertimagelocal', {
        icon: 'upload',
        text: '迁移外链图',
        context: 'edit',
        onclick: download,
        prependToContext: false
    });
});