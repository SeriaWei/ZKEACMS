$(document).ready(function () {
    function htmlEncode(val) {
        if (typeof val == "string") {
            return (val || "").replace(/</g, "&lt;").replace(/>/g, "&gt;");
        }
        return val;
    }

    $(".seach-terms .form-control").each(function () {
        $(this).removeAttr("readonly").removeAttr("disabled");
        if ($(this).is("select")) {
            if ($("option:first", this).val()) {
                $(this).prepend("<option selected></option>");
            }
        }
    });
    $('.dataTable').each(function () {
        var columns = [];
        var order = [];
        $("thead th", this).each(function (i) {
            var template = $(this).data("template");
            var sort = $(this).data("order");
            var option = $(this).data("option");
            var key = $(this).data("key");
            var searchOpeartor = $(this).data("search-operator");
            var dataType = $(this).data("data-type");
            var format = $(this).data("format");
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
                    meta.settings.columnSettings = meta.settings.columnSettings || {};
                    meta.settings.columnSettings[meta.col] = meta.settings.columnSettings[meta.col] || {};
                    var columnSetting = meta.settings.columnSettings[meta.col];
                    columnSetting.searchOpeartor = searchOpeartor;
                    columnSetting.dataType = dataType;
                    columnSetting.format = format;

                    if (option && data != null) {
                        var dataIn = data.toString();
                        columnSetting.option = option;
                        for (var i = 0; i < option.length; i++) {
                            if (option[i].value == dataIn) {
                                data = option[i].name;
                                break;
                            }
                        }
                    }
                    if (!template) {
                        return htmlEncode(data);
                    }
                    var result;
                    for (var p in full) {
                        result = (result || template).replaceAll("{" + p + "}", htmlEncode(full[p] || ""));
                    }
                    return result;
                },
                "orderable": orderAble
            });
        });
        var dataTable = $(this);
        dataTable.DataTable({
            "autoWidth": false,
            "processing": true,
            "serverSide": true,
            "filter": false,
            "ajax": {
                "url": $(this).data("source"),
                "data": function (data, setting) {
                    var inputs = dataTable.closest(".grid-component").find(".seach-terms").find(".form-control");
                    for (var i = 0; i < inputs.length; i++) {
                        var input = $(inputs[i]);
                        var name = input.attr("name").toLowerCase();
                        var exist = false;
                        for (var j = 0; j < data.columns.length; j++) {
                            if (data.columns[j].data.toLowerCase() == name) {
                                data.columns[j].search['value'] = input.val();
                                data.columns[j].search["opeartor"] = input.data("opeartor");
                                if (input.data("opeartor") == 9) {
                                    if (!data.columns[j].search['index']) {
                                        data.columns[j].search['valueMin'] = input.val();
                                    } else {
                                        data.columns[j].search['valueMax'] = input.val();
                                    }
                                    data.columns[j].search['index'] = 1;
                                }
                                exist = true;
                                break;
                            }
                        }
                        if (!exist) {
                            var item = {
                                data: name,
                                name: name,
                                orderable: false,
                                search: { value: input.val(), regex: false, opeartor: input.data("opeartor") },
                                searchable: true
                            }
                            if (item.search.opeartor == 9) {
                                item.search['valueMin'] = input.val();
                                item.search['index'] = 1;
                            }
                            data.columns.push(item);
                        }
                    }
                    return data;
                },
                "type": "POST"
            },
            "columns": columns,
            "order": order,
            "language": {
                "lengthMenu": "每页 _MENU_ 条记录",
                "zeroRecords": "没有找到记录",
                "info": "第 _PAGE_ 页 ( 总共 _PAGES_ 页 , 总共 _TOTAL_ 条记录 )",
                "infoEmpty": "无记录",
                "infoFiltered": "(从 _MAX_ 条记录过滤)",
                "paginate": {
                    "previous": "上一页",
                    "next": "下一页"
                },
                "search": "关键字:"
            }
        }).on("keyup change", function (e) {
            if ($(e.target).closest("tr.search").length > 0) {
                if (e.type == "change" || (e.type == "keyup" && e.keyCode == 13)) {
                    var valid = true;
                    $("tr.search>th .form-control", this).each(function () {
                        if (valid) {
                            var dataType = $(this).data("data-type");
                            if (dataType == "DateTime" && $(this).val()) {
                                if (!Date.parse($(this).val())) {
                                    valid = false;
                                }
                            }
                        }
                    });
                    if (valid) {
                        $(this).DataTable().draw();
                    }

                }
            }
        }).on("click", ".range-search .input-group-addon", function () {
            $(this).closest(".range-search").find("input.max").toggleClass("show");
        }).on("click", ".reset-search", function () {
            $(".form-control", $(this).closest(".search")).each(function () {
                $(this).val("");
            }).first().trigger("change");
        }).on("click", ".glyphicon.glyphicon-remove", function () {
            var link = $(this);
            Easy.ShowMessageBox("提示", "确认删除该数据吗？", function () {
                $.post(link.attr("href"), function (data) {
                    if (data.message) {
                        Easy.ShowMessageBox("提示", data.message);
                    } else {
                        link.closest("table.dataTable").DataTable().draw();
                    }
                });
            }, true);
            return false;
        });
    });
    $(document).on("click", ".seach-terms .btn.search", function () {
        $(this).closest(".grid-component").find(".dataTable").DataTable().draw();
    });
});