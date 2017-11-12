$(".product-ecommerce").each(function () {
    var ecommerce = $(this);
    $(".tag-grop", ecommerce).each(function () {
        $("input[type=radio]:first", this).prop("checked", true);
    });
    $(".thumbnails a", ecommerce).on("click", function () {
        $(".stage", ecommerce).attr("src", $(this).data("src"));
        $(this).parent().addClass("active").siblings().removeClass("active");
    });
});