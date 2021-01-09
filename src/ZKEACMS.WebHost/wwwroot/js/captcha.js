$(function () {
    $(document).on("click", ".image-captcha", function () {
        var url = $(this).data("captcha") + "?v=" + new Date().getTime();
        $("img", this).attr("src", url);
    });
});