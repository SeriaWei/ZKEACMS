/*! http://www.zkea.net/
 * Copyright (c) ZKEASOFT. All rights reserved.
 * http://www.zkea.net/licenses */

$(".product-ecommerce").each(function () {
    var ecommerce = $(this);
    var stage = $(".stage", ecommerce);
    var zoomPanel = $(".zoom-panel", ecommerce);
    // must match the background-size of .zoom-panel in product-ecommerce.less
    var zoomScale = 2.5;
    var zooming = false;

    function updateZoomImage() {
        var src = stage.attr("src");
        if (src) {
            zoomPanel.css("background-image", "url(\"" + src + "\")");
        }
    }

    function positionZoomPanel() {
        var rect = stage[0].getBoundingClientRect();
        var width = Math.round(Math.min(rect.width * 1.2, 560));
        var height = Math.round(width * rect.height / rect.width);
        var left = rect.right + 20;
        if (left + width > window.innerWidth) {
            left = Math.max(10, rect.left - width - 20);
        }
        var top = Math.round(Math.max(10, Math.min(rect.top + (rect.height - height) / 2, window.innerHeight - height - 10)));
        zoomPanel.css({ width: width, height: height, left: left, top: top });
    }

    function moveZoom(event) {
        var rect = stage[0].getBoundingClientRect();
        var fx = Math.min(Math.max((event.clientX - rect.left) / rect.width, 0), 1);
        var fy = Math.min(Math.max((event.clientY - rect.top) / rect.height, 0), 1);
        // keep the point under the cursor centered in the zoom panel
        var px = (fx * zoomScale - 0.5) * 100 / (zoomScale - 1);
        var py = (fy * zoomScale - 0.5) * 100 / (zoomScale - 1);
        zoomPanel.css("background-position", px + "% " + py + "%");
    }

    function showZoom(event) {
        zooming = true;
        updateZoomImage();
        positionZoomPanel();
        moveZoom(event);
        ecommerce.addClass("zooming");
        zoomPanel.addClass("active");
    }

    function hideZoom() {
        zooming = false;
        ecommerce.removeClass("zooming");
        zoomPanel.removeClass("active");
    }

    $(".tag-grop", ecommerce).each(function () {
        $("input[type=radio]:first", this).prop("checked", true);
    });
    $(".thumbnails a", ecommerce).on("click", function () {
        $(".stage", ecommerce).attr("src", $(this).data("src"));
        $(this).parent().addClass("active").siblings().removeClass("active");
        updateZoomImage();
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
    stage.on("click", function (event) {
        if (zooming) {
            hideZoom();
        } else {
            showZoom(event);
        }
    });
    stage.on("mousemove", function (event) {
        if (zooming) {
            moveZoom(event);
        }
    });
    zoomPanel.on("click", function () {
        hideZoom();
    });
    $(window).on("keydown.zoom", function (event) {
        if (zooming && event.key === "Escape") {
            hideZoom();
        }
    });
    $(window).on("resize.zoom scroll.zoom", function () {
        if (zooming) {
            positionZoomPanel();
        }
    });
});