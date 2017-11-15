var ZKEACMS = ZKEACMS || {};
ZKEACMS.Basket = {
    Add: function (productId, quantity) {
        $.post("/Basket/Add", { productId: productId, quantity: quantity }, function (data) {
            if (data.location) {
                window.location = data.location;
            }
        });
    },
    Update: function (basketId, quantity) { },
    Remove: function () { },
    Get: function () { }
};
$(function () {
    $(document).on("click", ".add-to-basket", function () {
        ZKEACMS.Basket.Add($(this).data("productid"), $(this).data("quantity"));
    });
});