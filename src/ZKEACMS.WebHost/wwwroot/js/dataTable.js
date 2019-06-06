$(document).ready(function () {
    function htmlEncode(val) {
        if (typeof val == "string") {
            return (val || "").replace(/</g, "&lt;").replace(/>/g, "&gt;");
        }
        return val;
    }
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
        $(this).DataTable({
            "autoWidth": false,
            "processing": true,
            "serverSide": true,
            "filter": false,
            "ajax": {
                "url": $(this).data("source"),
                "data": function (data, setting) {
                    for (var i = 0; i < data.columns.length; i++) {
                        $("tr.search>th:eq(" + i + ")", $("#" + setting.sTableId)).find(".form-control").each(function () {
                            data.columns[i].search[$(this).attr("name")] = $(this).val();
                            data.columns[i].search["opeartor"] = $(this).data("opeartor");
                        });
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
            },
            initComplete: function () {
                this.api().columns().every(function () {
                    var column = this;
                    if (!column.settings()[0].columnSettings) {
                        return;
                    }
                    var columnSetting = column.settings()[0].columnSettings[column[0][0]];
                    if (columnSetting.searchOpeartor != "None") {
                        var option = columnSetting.option;
                        var searchInput = null;
                        if (option) {
                            searchInput = $('<select class="form-control" name="value"></select>');
                            searchInput.data("opeartor", columnSetting.searchOpeartor).data("data-type", columnSetting.dataType);
                            searchInput.append("<option value=\"\">-- 请选择 --</option>")
                            for (var i = 0; i < option.length; i++) {
                                searchInput.append("<option value=\"" + option[i].value + "\">" + option[i].name + "</option>")
                            }

                        } else {
                            if (columnSetting.searchOpeartor == "Range") {
                                searchInput = $('<div class="range-search"><div class="input-group"><input name="valueMin" class="form-control min" type="text" placeholder="大于"><div class="input-group-addon">-</div></div><input name="valueMax" class="form-control max" type="text" placeholder="小于"></div>');
                                $(".min", searchInput).data("opeartor", columnSetting.searchOpeartor).data("data-type", columnSetting.dataType);
                                $(".max", searchInput).data("opeartor", columnSetting.searchOpeartor).data("data-type", columnSetting.dataType);

                            } else {
                                searchInput = $('<input class="form-control" type="text" name="value" placeholder="输入搜索..."/>');
                                searchInput.data("opeartor", columnSetting.searchOpeartor)
                                searchInput.data("data-type", columnSetting.dataType);
                            }
                        }
                        if (columnSetting.dataType == "DateTime") {
                            debugger
                            searchInput.find(".form-control").datetimepicker({
                                locale: 'zh-cn',
                                format: columnSetting.format //columnSetting.format
                            });
                        }
                        searchInput.appendTo($(column.footer()));
                    } else {
                        $('<a href="javascript:void(0)" class="reset-search glyphicon glyphicon-repeat"></a>').appendTo($(column.footer()));
                    }
                });
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
});