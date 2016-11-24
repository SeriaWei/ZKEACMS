$(document).ready(function () {
    $('.dataTable').each(function () {
        var columns = [];
        var order = [];
        $("thead th", this).each(function (i) {
            var template = $(this).data("template");
            var sort = $(this).data("order");
            if (sort) {
                order.push([i, sort]);
            }
            var orderAble = true;
            if (!$(this).data("key")) {
                orderAble = false;
            }
            columns.push({
                "data": $(this).data("key"),
                "render": function (data, type, full, meta) {
                    if (!template) {
                        return data;
                    }
                    var result;
                    for (var p in full) {
                        result = (result || template).replaceAll("{" + p + "}", full[p]);
                    }
                    return result;
                },
                "orderable": orderAble
            });
        });
        $(this).DataTable({
            "processing": true,
            "serverSide": true,
            "ajax": {
                "url": $(this).data("source"),
                "type": "POST"
            },
            "columns": columns,
            "order": order
        });
    });
});