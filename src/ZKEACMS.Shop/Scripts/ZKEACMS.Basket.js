var ZKEACMS = ZKEACMS || {};
ZKEACMS.Basket = {
    Add: function (product, callBack) {
        $.post("/Basket/Add", product, function (data) {
            if (data.location) {
                window.location = data.location;
            } else {
                if (callBack) {
                    callBack.call(data);
                }
            }
        });
    },
    Update: function (basket, callBack) {
        $.post("/Basket/Update", basket, function (data) {
            if (data.location) {
                window.location = data.location;
            } else {
                if (callBack) {
                    callBack.call(data);
                }
            }
        });
    },
    Remove: function (basketId, callBack) {
        $.post("/Basket/Remove", { basketId: basketId }, function (data) {
            if (data.location) {
                window.location = data.location;
            } else {
                if (callBack) {
                    callBack.call(data);
                }
            }
        });
    },
    Get: function (callBack) {
        $.post("/Basket/GetBaskets", function (data) {
            if (callBack) {
                callBack.call(data);
            }
        });
    },
    ShowBasket: function () {
        $.post("/Basket/Index", function (data) {
            if (data.location) {
                window.location = data.location;
            } else {
                var basket = $("body>.basket");
                var newBasket = $(data);
                if (basket.length > 0) {
                    newBasket.addClass("active")
                    basket.replaceWith(newBasket);
                } else {
                    $("body").append(newBasket);
                    setTimeout(function () { newBasket.addClass("active") }, 10);
                }
            }
        });
    }
};
$(function () {
    $(document).on("click", ".basket .close", function () {
        $("body>.basket").removeClass("active");
        setTimeout(function () { $("body>.basket").remove(); }, 300);
    });
    $(document).on("click", ".add-to-basket", function () {
        var tags = $(this).data("tags");
        if (!tags) {
            var tagArray = [];
            $(this).closest(".product-ecommerce").find("input[type=radio]:checked").each(function () { tagArray.push($(this).val()) });
            if (tagArray.length > 0) {
                tags = tagArray.join(";");
            }
        }
        ZKEACMS.Basket.Add({ productId: $(this).data("productid"), quantity: $(this).data("quantity"), tags: tags }, function () {
            ZKEACMS.Basket.ShowBasket();
            updateBasketIcon(this);
        });
    });
    $(document).on("click", ".basket .quantity-minus", function () {
        var quantity = Number($.trim($(this).closest(".quantity-set").find(".quantity").text()));
        if (quantity > 1) {
            quantity -= 1;
            var row = $(this).closest(".basket-item")
            row.find(".quantity").text(quantity);
            var id = row.data("id");
            Easy.Processor(function () {
                ZKEACMS.Basket.Update({ basketId: id, quantity: quantity }, function () {
                    $(".basket .total-items").text(this.data.quantity);
                    $(".basket .total-price").text(this.data.total.toFixed(2));
                    updateBasketIcon(this);
                });
            }, 300);
        }
    });
    $(document).on("click", ".basket .quantity-plus", function () {
        var quantity = Number($.trim($(this).closest(".quantity-set").find(".quantity").text()));
        quantity += 1;
        var row = $(this).closest(".basket-item")
        row.find(".quantity").text(quantity);
        var id = row.data("id");
        Easy.Processor(function () {
            ZKEACMS.Basket.Update({ basketId: id, quantity: quantity }, function () {
                $(".basket .total-items").text(this.data.quantity);
                $(".basket .total-price").text(this.data.total.toFixed(2));
                updateBasketIcon(this);
            });
        }, 300);
    });
    $(document).on("click", ".basket .remove", function () {
        var id = $(this).closest(".basket-item").data("id");
        ZKEACMS.Basket.Remove(id, function () {
            $(".basket " + "#basket-" + id).remove();
            if ($(".basket .basket-body>ul>li").length == 0) {
                $(".basket .basket-body>ul").append('<li class="row empty text-center">您的购物车是空的</li >');
                $(".basket .basket-footer").remove();
            }
            updateBasketIcon(this);
        });
    });
    $(document).on("click", ".basket .ckeck-out", function () {
        $.post("/Basket/CheckOut", function (data) {
            if (data.location) {
                window.location = data.location;
            } else {
                var basket = $("body>.basket");
                var newBasket = $(data);
                if (basket.length > 0) {
                    newBasket.addClass("active")
                    basket.replaceWith(newBasket);
                } else {
                    $("body").append(newBasket);
                    setTimeout(function () { newBasket.addClass("active") }, 10);
                }
            }
        }, "html");
    });
    $(document).on("click", ".basket .confirm-order", function () {
        $("#PaymentGateway").val($(this).data("payment"));
        $(this).closest("form").submit();
    });
    var basketIcon = $(".navigation .show-basket");
    if (basketIcon.length > 0) {
        ZKEACMS.Basket.Get(function () {
            updateBasketIcon(this);
        });
        basketIcon.click(ZKEACMS.Basket.ShowBasket)
    }
    function updateBasketIcon(data) {
        if (basketIcon.length > 0) {
            if (data.data && data.data.quantity > 0) {
                basketIcon.children().addClass("active");
                basketIcon.children(".quantity").text(data.data.quantity);
            } else {
                basketIcon.children().removeClass("active");
                basketIcon.children(".quantity").text('');
            }
        }
    }
});