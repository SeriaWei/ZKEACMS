$(".product-ecommerce").each(function () {
    var ecommerce = $(this);
    $(".tag-grop", ecommerce).each(function () {
        $("input[type=radio]:first", this).prop("checked", true);
    });
    $(".thumbnails a", ecommerce).on("click", function () {
        $(".stage", ecommerce).attr("src", $(this).data("src"));
        $(this).parent().addClass("active").siblings().removeClass("active");
    });
    ecommerce.on("click", ".quantity-minus", function () {
        var quantity = Number($.trim($(this).closest(".quantity-set").find(".quantity").text()));
        if (quantity > 1) {
            quantity -= 1;
            ecommerce.find(".add-to-basket").data("quantity", quantity);
            $(this).closest(".quantity-set").find(".quantity").text(quantity);
        }
    });
    ecommerce.on("click", ".quantity-plus", function () {
        var quantity = Number($.trim($(this).closest(".quantity-set").find(".quantity").text()));
        quantity += 1;
        ecommerce.find(".add-to-basket").data("quantity", quantity);
        $(this).closest(".quantity-set").find(".quantity").text(quantity);
    });
});