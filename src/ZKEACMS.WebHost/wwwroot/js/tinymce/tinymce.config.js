
$.post("/admin/Theme/GetCurrentTheme", function (theme) {
    tinymce.init({
        content_css: [theme],
        selector: "textarea.html",
        verify_html: false,
        plugins: [
            'advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker',
            'searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking',
            'save table contextmenu directionality emoticons template paste textcolor',
            "filebrowser bootstrap pasteImage imagelocal"
        ],
        toolbar: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image media fullpage | forecolor backcolor emoticons | bootstrap imagelocal filebrowser preview code',
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
