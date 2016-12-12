$(document).ready(function () {
    $('.dataTable').each(function () {
        var columns = [];
        var order = [];
        $("thead th", this).each(function (i) {
            var template = $(this).data("template");
            var sort = $(this).data("order");
            var option = $(this).data("option");
            var key = $(this).data("key");
            if (sort) {
                order.push([i, sort]);
            }
            var orderAble = true;
            if (!key) {
                orderAble = false;
            }
            columns.push({
                "data": key,
                "render": function (data, type, full, meta) {
                    var dataIn = data;
                    meta.settings.columnSettings = meta.settings.columnSettings || {};
                    meta.settings.columnSettings[meta.col] = meta.settings.columnSettings[meta.col] || {};
                    var columnSetting = meta.settings.columnSettings[meta.col];
                    columnSetting.searchAble = true;
                    if (!key) {
                        columnSetting.searchAble = false;
                    }
                    if (option) {
                        columnSetting.option = option;
                        for (var i = 0; i < option.length; i++) {
                            if (option[i].value == data) {
                                dataIn = option[i].name;
                                break;
                            }
                        }
                    }
                    if (!template) {
                        return dataIn;
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
                    "next": "下一页"
                },
                "search": "关键字:"
            },
            initComplete: function () {
                this.api().columns().every(function () {
                    var column = this;
                    var columnSetting = column.settings()[0].columnSettings[column[0][0]];
                    if (columnSetting.searchAble) {
                        var option = columnSetting.option;
                        if (option) {
                            var select = $('<select></select>');
                            select.append("<option>-- 请选择 --</option>")
                            for (var i = 0; i < option.length; i++) {
                                select.append("<option value=\"" + option[i].value + "\">" + option[i].name + "</option>")
                            }

                            select.appendTo($(column.header()))
                            .on('change', function () {
                                column
                                    .search($(this).val(), false, false)
                                    .draw();
                            });
                        } else {
                            $('<input type="text">')
                            .appendTo($(column.header()))
                            .on('keyup', function () {
                                column
                                    .search($(this).val(), false, false)
                                    .draw();
                            });
                        }
                    }
                });
            }
        });
    });
});