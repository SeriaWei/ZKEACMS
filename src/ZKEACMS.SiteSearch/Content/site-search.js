$(function () {
    function search(input) {
        var value = $.trim(input.val());
        if (value) {
            var keywords = "site:" + window.location.host + " " + value;
            window.open(input.data("search").replace("{0}", keywords), "_blank");
        }        
    }
    $(document).on("click", ".site-search .btn-submit", function () {
        search($(this).closest(".site-search").find(".site-search-query"));
    }).on("keyup", ".site-search .site-search-query", function (e) {
        if (e.keyCode == 13) {
            search($(this));
        }
    });
});
