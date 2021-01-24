$(function () {
    $("input,select,textarea", ".input-group-collection .Template").each(function () {
        if (!$(this).prop("disabled")) {
            $(this).prop("disabled", true);
            $(this).attr("editable", true);
        }
    });

    $(document).on("click", ".input-group-collection .add", function () {
        var index = $(this).siblings(".items").children(".item").size();
        var tpl = $(this).siblings(".Template");
        var template = $(tpl.html());
        var namePrefix = tpl.children().data("name");
        var deep = 0;
        namePrefix.replace(/\[(\d+)\]/g, function (a) {
            deep++;
            return a;
        });
        $("input,select,textarea", template).attr("data-val", true).each(function () {
            if ($(this).attr("editable")) {
                $(this).prop("disabled", false);
                $(this).removeAttr("editable");
            }
            var name = $(this).attr("name");
            if (name) {
                var cuDeep = 0;
                $(this).attr("name", name.replace(/\[(\d+)\]/g, function (a) {
                    cuDeep++;
                    var idx = cuDeep == deep ? "[" + index + "]" : a;
                    return idx;
                }));
            }
            var id = $(this).attr("id");
            if (id) {
                var cuDeep = 0;
                $(this).attr("id", id.replace(/\_(\d+)\_/g, function (a) {
                    cuDeep++;
                    var idx = cuDeep == deep ? "_" + index + "_" : a;
                    return idx;
                }));
            }

            if ($(this).hasClass("Date") && !$(this).prop("readonly") && !$(this).prop("disabled") && $.fn.datetimepicker) {
                $(this).datetimepicker({ locale: "zh-CN", format: $(this).attr("JsDateFormat") });
            }
        });

        $("label", template).each(function () {
            var id = $(this).attr("for");
            if (id) {
                var cuDeep = 0;
                $(this).attr("for", id.replace(/\_(\d+)\_/g, function (a) {
                    cuDeep++;
                    var idx = cuDeep == deep ? "_" + index + "_" : a;
                    return idx;
                }));
            }
        });
        $(".field-validation-error,.field-validation-valid", template).each(function () {
            var msgFor = $(this).attr("data-valmsg-for");
            var cuDeep = 0;
            $(this).attr("data-valmsg-for", msgFor.replace(/\[(\d+)\]/g, function (a) {
                cuDeep++;
                var idx = cuDeep == deep ? "[" + index + "]" : a;
                return idx;
            }))
        });
        template.find(".ActionType").val($(this).data("value"));
        $(this).siblings(".items").append(template);
        $(".dy-editor:visible", template).trigger("init-editor");
        var form = $(this).closest("form");
        form.removeData("validator").removeData("unobtrusiveValidation");
        $.validator.unobtrusive.parse(form[0]);
        template.trigger("list.added");
    });
    $(document).on("click", ".input-group-collection .delete", function () {
        var form = $(this).closest("form");
        var allValid = true;
        $("input,select,textarea", $(this).parent()).each(function () {
            if ($(this).hasClass("required") && !$(this).val()) {
                if ($(this).is("select")) {
                    $(this).val($("option:last", this).val());
                } else {
                    $(this).val("None");
                }
            }
            if (allValid) {
                allValid = form.validate().element("#" + $(this).attr("id"));
            }
        });
        if (allValid) {
            $(this).parent().hide();
            $(this).siblings(".hide").find(".ActionType").val($(this).data("value"));
        }
        $(this).parent().trigger("list.remove");
    });
    $(document).on("change", ".input-group-collection .form-control", function () {
        var actionType = $(".ActionType", $(this).closest(".item"));
        if (actionType.val() !== "Create") {
            actionType.val("Update");
        }
    });
    if ($.fn.sortable) {
        $(".input-group-collection .items.sortable").sortable({
            tolerance: "pointer",
            stop: function (event, ui) {
                var itemContainer = ui.item.closest(".items");
                var items = itemContainer.find(".item");
                items.each(function (index) {
                    var namePrefix = $(this).data("name");
                    var deep = 0;
                    namePrefix.replace(/\[(\d+)\]/g, function (a) {
                        deep++;
                        return a;
                    });

                    $("input,select,textarea", this).each(function () {
                        var name = $(this).attr("name");
                        if (name) {
                            var cuDeep = 0;
                            $(this).attr("name", name.replace(/\[(\d+)\]/g, function (a) {
                                cuDeep++;
                                var idx = cuDeep == deep ? "[" + index + "]" : a;
                                return idx;
                            }));
                        }
                        var id = $(this).attr("id");
                        if (id) {
                            var cuDeep = 0;
                            $(this).attr("id", id.replace(/\_(\d+)\_/g, function (a) {
                                cuDeep++;
                                var idx = cuDeep == deep ? "_" + index + "_" : a;
                                return idx;
                            }));
                        }
                    });
                    $("label", this).each(function () {
                        var id = $(this).attr("for");
                        if (id) {
                            var cuDeep = 0;
                            $(this).attr("for", id.replace(/\_(\d+)\_/g, function (a) {
                                cuDeep++;
                                var idx = cuDeep == deep ? "_" + index + "_" : a;
                                return idx;
                            }));
                        }
                    });
                });
                itemContainer.trigger("list.sorted");
            }
        });
    }
});