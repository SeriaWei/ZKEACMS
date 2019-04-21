
$.post("/admin/Theme/GetCurrentTheme", function (theme) {
    tinymce.init({
        content_css: [theme],
        selector: "textarea.html",
        verify_html: false,
        plugins: [
            'print preview fullpage searchreplace autolink directionality code visualblocks ',
            'visualchars fullscreen image link media template codesample table charmap hr pagebreak',
            'nonbreaking anchor toc insertdatetime advlist lists wordcount',
            'imagetools textpattern help',
            "filebrowser bootstrap pasteImage imagelocal"
        ],
        toolbar: 'styleselect | bold italic strikethrough forecolor backcolor | link image media | alignleft aligncenter alignright alignjustify | numlist bullist outdent indent removeformat | bootstrap imagelocal filebrowser preview code',
        height: 600,
        relative_urls: false,
        language: "zh_CN",
        table_default_attributes: {
            class:"table table-hover"
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
        ]
    });
});
