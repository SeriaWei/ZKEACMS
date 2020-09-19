function getTinymceConfig() {
    return {
        content_css: ['/themes/Default/css/Theme.min.css'],
        selector: "textarea.html",
        verify_html: false,
        plugins: [
            'print preview searchreplace autolink directionality code visualblocks ',
            'visualchars fullscreen image link media template codesample table charmap hr pagebreak',
            'nonbreaking anchor toc insertdatetime advlist lists wordcount',
            'imagetools textpattern help',
            "filebrowser bootstrap pasteImage imagelocal"
        ],
        toolbar: 'styleselect | bold italic strikethrough forecolor backcolor | link image media | alignleft aligncenter alignright alignjustify | numlist bullist outdent indent removeformat | bootstrap imagelocal filebrowser preview code',
        height: 600,
        relative_urls: false,
        image_advtab: true,
        image_class_list: [
            { title: '无', value: '' },
            { title: '边框', value: 'img-thumbnail' }
        ],
        paste_data_images: true,
        images_upload_url: '/admin/Media/UploadBlob',
        imagetools_proxy: '/admin/Media/Proxy',
        images_reuse_filename: true,
        language: "zh_CN",
        table_default_attributes: {
            class: "table table-hover"
        },
        table_class_list: [
            { title: '无', value: 'table table-hover' },
            { title: '条纹', value: 'table table-hover table-striped' },
            { title: '边框', value: 'table table-hover table-bordered' },
            { title: '边框 + 条纹', value: 'table table-hover table-bordered table-striped' }
        ],
        codesample_languages: [
            { text: 'HTML/XML', value: 'markup' },
            { text: 'JavaScript', value: 'javascript' },
            { text: 'CSS', value: 'css' },
            { text: 'PHP', value: 'php' },
            { text: 'Ruby', value: 'ruby' },
            { text: 'Python', value: 'python' },
            { text: 'Java', value: 'java' },
            { text: 'C', value: 'c' },
            { text: 'C#', value: 'csharp' },
            { text: 'C++', value: 'cpp' }
        ],
        extended_valid_elements: "style,link[href|rel]",
        custom_elements: "style,link,~link"
    };
}
function initEditor(selector) {
    $.post("/admin/Theme/GetCurrentTheme", function (theme) {
        var config = getTinymceConfig();
        config.content_css = [theme];
        config.selector = selector;
        tinymce.init(config);
    });
}
initEditor("textarea.html");
$(document).on("init-editor", function (e) {
    id = "editor-" + new Date().getTime();
    $(e.target).attr("id", id);
    initEditor("#" + id);
});