(function ($) {
    $(document).on("click", ".comments-box .reply", function () {
        var content = $(this).closest(".comments-box").find("#CommentContent");
        content.val(content.val() + "@" + $(this).data("reply-to") + " ").focus();
        $(this).closest(".comments-box").find("#ReplyTo").val($(this).data("reply-user"));
    });
    $(".comments-box #Title").val(document.title);
})(jQuery);