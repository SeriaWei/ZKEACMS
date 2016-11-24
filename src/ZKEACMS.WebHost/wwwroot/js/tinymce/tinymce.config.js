tinymce.init({
    content_css: ["//cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css", "//cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"],
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
    language_url: "http://cdn.zkeasoft.com/Scripts/tinymce/langs/zh_CN.js"
});