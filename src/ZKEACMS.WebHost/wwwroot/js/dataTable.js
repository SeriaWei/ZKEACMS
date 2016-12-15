$(document).ready(function () {
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
                                searchInput = $('<div class="input-group"><input name="valueMin" class="form-control min" type="text" placeholder="最小值"><div class="input-group-addon">-</div><input name="valueMax" class="form-control max" type="text" placeholder="最大值"></div>');
                                $(".min", searchInput).data("opeartor", columnSetting.searchOpeartor).data("data-type", columnSetting.dataType);
                                $(".max", searchInput).data("opeartor", columnSetting.searchOpeartor).data("data-type", columnSetting.dataType);

                            } else {
                                searchInput = $('<input class="form-control" type="text" name="value" placeholder="输入搜索..."/>');
                                searchInput.data("opeartor", columnSetting.searchOpeartor)
                                searchInput.data("data-type", columnSetting.dataType);
                            }
                        }
                        if (columnSetting.dataType == "DateTime") {
                            searchInput.find(".form-control").datepicker({
                                language: "zh-CN",
                                format: "yyyy/mm/dd" //columnSetting.format
                            });
                        }
                        searchInput.appendTo($(column.footer()));
                    }
                });
            }
        }).on("keyup change", function (e) {
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
        });
    });
});