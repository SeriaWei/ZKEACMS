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
            "order": order,
            "language": {
                "lengthMenu": "每页 _MENU_ 条记录",
                "zeroRecords": "没有找到记录",
                "info": "第 _PAGE_ 页 ( 总共 _PAGES_ 页 )",
                "infoEmpty": "无记录",
                "infoFiltered": "(从 _MAX_ 条记录过滤)",
                "paginate": {
                    "previous": "上一页",
                    "next":"下一页"
                },
                "search": "关键字:"
            }
        });
    });
});