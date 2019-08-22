$(function () {
    $(document).on("submit", ".form-widget form", function () {
        if ($("input[type=checkbox].required-one", this).length > 0) {
            if ($("input[type=checkbox].required-one:checked", this).length == 0) {
                var group = $("input[type=checkbox].required-one:first", this).closest(".form-group");
                var id = group.find("label.control-label").attr("for");
                $("[data-valmsg-for='" + id + "']", group).addClass("field-validation-error").removeClass("field-validation-valid");
                return false;
            }
        }
    });
    $(document).on("click", ".form-widget form input[type=checkbox].required-one", function () {        
        var group = $(this).closest(".form-group");
        var id = group.find("label.control-label").attr("for");
        if ($("input[type=checkbox].required-one:checked", group).length == 0) {
            $("[data-valmsg-for='" + id + "']", group).addClass("field-validation-error").removeClass("field-validation-valid");           
        } else {
            $("[data-valmsg-for='" + id + "']", group).addClass("field-validation-valid").removeClass("field-validation-error");
        }

    });
    if ($.fn.datetimepicker) {
        $(".Date").each(function () {
            if (!$(this).prop("readonly") && !$(this).prop("disabled")) {
                $(this).datetimepicker({ locale: "zh-CN", format: $(this).attr("JsDateFormat") });
                $(this).closest(".input-group").find(".glyphicon-calendar").click(function () {
                    $(this).closest(".input-group").find("input").focus();
                });
            }
        });
    }
});