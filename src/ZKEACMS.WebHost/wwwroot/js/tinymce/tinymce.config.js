
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
        language: "zh_CN"
    });
});
