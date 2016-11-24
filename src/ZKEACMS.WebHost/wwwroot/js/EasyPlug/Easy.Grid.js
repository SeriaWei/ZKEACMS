/// <reference path="Easy.js" />
/*!
 * http://www.zkea.net/
 * Copyright 2016 ZKEASOFT
 * http://www.zkea.net/licenses
 */
var Easy = Easy || {};
Easy.Grid = (function () {
    var gridOptions = {
        text: {
            PageSize: "分页",
            CurrentPage: "当前",
            Refresh: "刷新",
            FirstPage: "首页",
            PrePage: "上一页",
            NextPage: "下一页",
            LastPage: "尾页",
            NoData: "无相关数据...",
            AllRecord: " 共 {0} 条记录",
            DeleteTitle: "提示",
            DeleteConfirm: "确定要删除选中项吗？",
            SelectWorm: "请至少选择一项进行操作！",
            Delete: "删除选中项",
            Yes: "是",
            No: "否"
        },
        dataUrl: "",
        chVale: null,
        templetes: new Array(),
        templeteValues: new Array(),
        model: { Property: { Data: "", DataType: "", DisplayName: "", Format: "", Hidden: 0, Name: "", Width: 150 } },
        canSearch: false,
        rowDataBindEventHandler: null,
        checkBoxEventHandler: null,
        dataSuccessEventHandler: null,
        checkBox: false,
        orderArray: [],
        orderCol: "",
        orderType: 1,
        scrollLeft: 0,
        constHeight: false,
        isLoading: false,
        queryString: "",
        deleteUrl: "",
        heightFix: 10,
        jsonData: null,
        allPage: 0,
        headerWidthDiff: 20,
        dateFormat: "YYYY/MM/DD"
    };


    var grid = { name: "" };
    var openMethod = {};

    grid.body = $(["<div class='EasyGrid panel panel-default'>",
        "<div class='GridContent'><div class='GridToolBar panel-heading'></div><div class='GridHeader'></div><div class='GridBody'></div></div>",
        "<div class='Gridfoot'>",
        "<div class='GridDelete' title='" + gridOptions.text.Delete + "'>&nbsp;</div>",
        "<label>",
        gridOptions.text.PageSize,
        "</label>",
        "<select id='GridPageSize' easy='easy'>",
        "<option value='10'>10</option>",
        "<option value='20' selected='selected'>20</option>",
        "<option value='30'>30</option>",
        "<option value='50'>50</option>",
        "<option value='100'>100</option>",
        "</select>",
        "<label for='GridPageIdex'>",
        gridOptions.text.CurrentPage,
        "</label><input id='GridPageIdex' type='text' value='1' ValueType='Num' />",
        "<label id='PageInfo'></label>",
        "<label id='Count'></label>",
        "<a id='PageGo' class='glyphicon glyphicon-repeat' title='" + gridOptions.text.Refresh + "'>",
        "</a>",
        "<a id='PageFirst' class='glyphicon glyphicon-fast-backward' title='" + gridOptions.text.FirstPage + "'>",
        "</a>",
        "<a id='PagePre' class='glyphicon glyphicon-step-backward' title='" + gridOptions.text.PrePage + "'>",
        "</a>",
        "<a id='PageNext' class='glyphicon glyphicon-step-forward' title='" + gridOptions.text.NextPage + "'>",
        "</a>",
        "<a id='PageLast' class='glyphicon glyphicon-fast-forward' title='" + gridOptions.text.LastPage + "'>",
        "</a>",
        "</div></div>"].join(""));

    var gridHeader = $(".GridHeader", grid.body);
    var gridBody = $(".GridBody", grid.body);
    var gridSearch = $("<tbody class='GridSearch'></tbody>");

    grid.initGrid = function (viewModel) {
        var width = 0;
        var tableHeader = $("<table class='header' cellpadding='0' cellspacing='0'></table>");
        var trH = "<tr class='trTitle'>";
        if (gridOptions.checkBox && gridOptions.chVale) {
            trH += "<th style='width:20px' align='center'><input type='checkbox' class='CheckBoxAll' /></th>";
            width += 20;
        }
        gridOptions.model = viewModel;
        for (var itemProperty in gridOptions.model) {
            if (gridOptions.model.hasOwnProperty(itemProperty)) {
                var m = gridOptions.model[itemProperty];
                if (m.Hidden)
                    continue;
                if (!m.Width)
                    m.Width = 150;
                if (!gridOptions.orderCol)
                    gridOptions.orderCol = m.Name;
                trH += "<th style='width:" + m.Width + "px' col='" + m.Name + "'><div class='coData clearfix' style='" + m.Width + "px'><span class='pull-left'>" + m.DisplayName + "</span><span class='resize-col'></span></div></th>";
                width += m.Width;
            }
        }
        tableHeader.html("<thead>" + trH + "<th style='width:" + gridOptions.headerWidthDiff + "px'></th></thead>");
        tableHeader.width(width + gridOptions.headerWidthDiff);
        gridHeader.html(tableHeader);
        if (gridOptions.orderType === 1) {
            gridHeader.find("th[col='" + gridOptions.orderCol + "']").addClass("OrderUp");
        }
        else {
            gridHeader.find("th[col='" + gridOptions.orderCol + "']").addClass("OrderDown");
        }
        trH = "";
        if (gridOptions.canSearch) {
            trH = "<tr>";
            if (gridOptions.checkBox && gridOptions.chVale) {
                trH += "<th align='center'><input type='button' class='ClearSearch' /></th>";
            }
            for (var itemName in gridOptions.model) {
                if (gridOptions.model.hasOwnProperty(itemName)) {
                    var input = "";
                    var item = gridOptions.model[itemName];
                    if (item.Hidden)
                        continue;
                    switch (item.DataType) {
                        case "String":
                            input = "<input class='condition' type='text' DataType='" + item.DataType + "'  name='" + item.Name + "' OperatorType='7' title='" + item.DisplayName + "'/>";
                            break;
                        case "Boolean":
                            {
                                input = ["<select class='easy condition' DataType='" + item.DataType + "'  name='" + item.Name + "' OperatorType='1' title='" + item.DisplayName + "'>",
                                    "<option></option>",
                                    "<option value='true'>" + gridOptions.text.Yes + "</option>",
                                    "<option value='false'>" + gridOptions.text.No + "</option>",
                                    "</select>"].join("");
                                break;
                            }
                        case "Decimal":
                        case "Single":
                        case "Int16":
                        case "Int64":
                        case "Int32":
                            {
                                input = ["<div class='RangeOption clearfix'>",
                                    "<input class='condition' type='hidden' DataType='" + item.DataType + "'  name='" + item.Name + "' OperatorType='1' title='" + item.DisplayName + "'/>",
                                    "<input class='RangeAdd' type='button'  value='' title='" + item.DisplayName + "'/>",
                                    "<input type='button' class='RangeClear'  value='' title='" + item.DisplayName + "'/></div>"].join("");
                                break;
                            }
                        case "DateTime":
                            {
                                input = ["<div class='RangeOption clearfix'>",
                                    "<input class='condition' type='hidden' DataType='" + item.DataType + "' Format='" + (item.JsDateFormat || gridOptions.dateFormat) + "'  name='" + item.Name + "' OperatorType='1' title='" + item.DisplayName + "'/>",
                                    "<input class='RangeAdd' type='button'  value='' title='" + item.DisplayName + "'/>",
                                    "<input type='button' class='RangeClear'  value='' title='" + item.DisplayName + "'/></div>"].join("");
                                break;
                            }
                        case "Select":
                            {
                                var option = "<option></option>";
                                option += item.Data || "";
                                input = "<select class='easy condition' multiple='multiple' name='" + item.Name + "' DataType='" + item.DataType + "'  name='" + item.Name + "' OperatorType='1' title='" + item.DisplayName + "'>" + option + "</select>";
                                break;
                            }
                        case "None":
                            input = "<span></span>";
                            break;
                        default:
                            input = "<input class='condition' type='text' DataType='" + item.DataType + "'  name='" + item.Name + "' OperatorType='7' title='" + item.DisplayName + "'/>";
                            break;
                    }
                    trH += "<td><div class='searchbox'>" + input + "</div></td>";
                }
            }
            trH += " <td style='width:" + gridOptions.headerWidthDiff + "px'></td></tr>";
            gridSearch.html(trH);
            gridHeader.find("table").append(gridSearch);
            grid.multiSelect();
        } else {
            gridSearch.hide();
        }
        function getHeight() {
            var totalHeight = grid.body.parent().parent().height();
            grid.body.parent().siblings(":not(script)").each(function() {
                totalHeight -= $(this).outerHeight();
                totalHeight -= parseInt($(this).css("margin-top"));
                totalHeight -= parseInt($(this).css("margin-bottom"));
            });
            return totalHeight;
        }
        if (!gridOptions.constHeight) {
            $(window).resize(function () {
                Easy.Processor(function () { grid.setHeight(getHeight()); }, 200);
            });
            $(function () {
                setTimeout(function () { grid.setHeight(getHeight()); }, 50);
            });
        }
       
        
        grid.resizeColumn();
    }
    grid.resizeColumn = function () {
        $(".resize-col", gridHeader).on("mousedown", function (e) {
            var thHead = $(this).parents("th");
            var modelCol = gridOptions.model[thHead.attr("col")];
            var thBody = $("table.body tr:first>td:eq(" + thHead.index() + ")", gridBody);
            var rows = $("table.body tr", gridBody);
            var rowDataSelector = "td:eq(" + thHead.index() + ") .coData";
            var tableHead = $("table.header", gridHeader);
            var tableBody = $("table.body", gridBody);
            var oldWidth = thHead.width();
            var oldTWidth = tableBody.width();
            var startX = e.clientX;
            var moveHelper = $("<div class='move-helper'></div>");
            moveHelper.on("mousemove", function (em) {
                var newWidth = oldWidth + em.clientX - startX;
                var newTWidth = oldTWidth + em.clientX - startX;
                thHead.width(newWidth);
                $(".coData", thHead).width(newWidth);

                thBody.width(newWidth);
                $(".coData", thBody).width(newWidth);
                rows.each(function () {
                    $(rowDataSelector, $(this)).width(newWidth);
                });
                modelCol.Width = newWidth;
                tableHead.width(newTWidth + gridOptions.headerWidthDiff);
                tableBody.width(newTWidth);
            });
            moveHelper.on("mouseup", function () {
                $(this).remove();
                grid.setColumnWidth(modelCol.Name, modelCol.Width);
            });
            grid.body.append(moveHelper);
            return false;
        });
    }
    grid.getColumnWidth = function (column) {
        return Easy.Cookie.GetCookie(location.pathname + "_" + grid.name + "_" + column + "_width");
    }
    grid.setColumnWidth = function (column, width) {
        return Easy.Cookie.SetCookie(location.pathname + "_" + grid.name + "_" + column + "_width", width, 365);
    }
    grid.getPageIndex = function () {
        var pageIndex = parseInt($("#GridPageIdex", grid.body).val());
        if (!(pageIndex >= 0)) {
            pageIndex = 1;
            $("#GridPageIdex", grid.body).val(pageIndex);
        }
        return pageIndex - 1;
    }
    grid.getPageSize = function () {
        return parseInt($("#GridPageSize", grid.body).val());
    }
    grid.setPageIndex = function (index) {
        index = parseInt(index) || 0;
        $("#GridPageIdex", grid.body).val(index + 1);
    }
    grid.loadPage = function (index) {
        grid.setPageIndex(index);
        grid.reload();
    }
    grid.initGridData = function (gdata) {
        gridHeader.find(".CheckBoxAll").prop("checked", false).change();
        gridBody.html("");
        var tableBody = $("<table class='body' cellpadding='0' cellspacing='0'></table>");
        var trBs = "";
        var width = 0;
        if (gdata.Rows.length > 0) {
            for (var j = 0; j < gdata.Rows.length; j++) {
                var cl = "trBe";
                if (j % 2 === 0)
                    cl = "trAf";
                var trB = "<tr class='" + cl + "'>";
                if (gridOptions.checkBox && gridOptions.chVale) {
                    trB += "<td style='width:20px' align='center'><input type='checkbox' class='CheckBoxItem' val='" + gdata.Rows[j][gridOptions.chVale] + "' /></td>";
                    if (j === 0) {
                        width += 20;
                    }
                }
                for (var p in gridOptions.model) {
                    if (gridOptions.model.hasOwnProperty(p)) {
                        var m = gridOptions.model[p];
                        if (m.Hidden) {
                            continue;
                        }
                        trB += "<td " + (j === 0 ? "style='width:" + m.Width + "px'" : "") + "><div class='coData' style='width:" + m.Width + "px'>" + grid.getTempleteValue(p, gdata.Rows[j], m) + "</div></td>";
                        if (j === 0) {
                            width += m.Width;
                        }
                    }
                }
                trB += "</tr>";
                trBs += trB;
                if (gridOptions.rowDataBindEventHandler) {
                    gridOptions.rowDataBindEventHandler.call(this, gdata.Rows[j]);
                }
            }
        }
        else {
            var emptyTr = "<tr>";
            var noData = gridOptions.text.NoData;
            for (var item in gridOptions.model) {
                if (gridOptions.model.hasOwnProperty(item)) {
                    if (gridOptions.model[item].Hidden) {
                        continue;
                    }
                    var colWidth = gridOptions.model[item].Width || 150;
                    width += colWidth;
                    emptyTr += "<td style='width:" + colWidth + "px;border-bottom:none;'>" + noData + "</td>";
                    noData = "";
                }
            }
            emptyTr += "</tr>";
            trBs += emptyTr;
        }
        tableBody.html("<tbody>" + trBs + "</tbody>");
        gridBody.html(tableBody);
        tableBody.width(width);

        grid.setPageIndex(gdata.PageIndex);

        gridOptions.allPage = Math.floor(gdata.RecordCount / gdata.PageSize);
        gridOptions.allPage += gdata.RecordCount % gdata.PageSize === 0 ? 0 : 1;
        grid.body.find("#PageInfo").html("[" + (gdata.PageIndex + 1) + "/" + gridOptions.allPage + "]");
        grid.body.find("#Count").html(gridOptions.text.AllRecord.replace("{0}", gdata.RecordCount));
        gridBody.scrollLeft(gridOptions.scrollLeft);

        if (gridOptions.dataSuccessEventHandler != null) {
            gridOptions.dataSuccessEventHandler.call();
        }
    }
    grid.dataFormater = {
        "Boolean": function (value) {
            if (value === 'True') {
                return gridOptions.text.Yes;
            }
            return gridOptions.text.No;
        },
        "None": function (value) {
            return value;
        },
        Provider: function (m) {
            return this[m.DataType] || this.None;
        }
    };
    grid.reload = function () {
        if (gridOptions.isLoading) {
            return;
        }
        gridOptions.isLoading = true;
        grid.body.find("#PageGo").addClass("InnerLonding");
        gridOptions.scrollLeft = gridBody.scrollLeft();
        var groups = [];
        var conditions = [];
        gridSearch.find(".condition").each(function () {
            if ($(this).val()) {
                switch ($(this).attr("DataType")) {
                    case "Select":
                        {
                            var selectConditions = [];
                            var select = $(this);
                            $("option:selected", this).each(function (i) {
                                selectConditions.push({ Property: select.attr("name"), Value: $(this).val(), DataType: select.attr("DataType"), OperatorType: 1, ConditionType: 2 });
                            });
                            groups.push({ Conditions: selectConditions });
                            break;
                        }
                    case "Decimal":
                    case "Single":
                    case "Int16":
                    case "Int64":
                    case "Int32": {
                        var numConditions = [];
                        var numValues = $(this).val().split('@');
                        if (numValues.length === 3) {
                            if (numValues[0]) {
                                numConditions.push({ Property: $(this).attr("name"), Value: numValues[0], DataType: $(this).attr("DataType"), OperatorType: 3, ConditionType: 1 });

                            }
                            if (numValues[1]) {
                                numConditions.push({ Property: $(this).attr("name"), Value: numValues[1], DataType: $(this).attr("DataType"), OperatorType: 5, ConditionType: 1 });

                            }
                            if (numValues[2]) {
                                numConditions.push({ Property: $(this).attr("name"), Value: numValues[2], DataType: $(this).attr("DataType"), OperatorType: 1, ConditionType: 1 });

                            }
                            groups.push({ Conditions: numConditions });
                        }
                        break;
                    }
                    case "DateTime": {
                        var dateConditions = [];
                        var values = $(this).val().split('@');
                        if (values.length === 3) {
                            if (values[0]) {
                                if (values[0].indexOf(":") < 0) {
                                    values[0] += " 0:0:0";
                                }
                                dateConditions.push({ Property: $(this).attr("name"), Value: values[0], DataType: $(this).attr("DataType"), OperatorType: 3, ConditionType: 1 });

                            }
                            if (values[1]) {
                                if (values[1].indexOf(":") < 0) {
                                    values[1] += " 23:59:59";
                                }
                                dateConditions.push({ Property: $(this).attr("name"), Value: values[1], DataType: $(this).attr("DataType"), OperatorType: 5, ConditionType: 1 });

                            }
                            if (values[2]) {
                                var hasTime = values[2].indexOf(":") >= 0;
                                dateConditions.push({ Property: $(this).attr("name"), Value: values[2] + (hasTime ? "" : " 0:00:00"), DataType: $(this).attr("DataType"), OperatorType: 3, ConditionType: 1 });

                                dateConditions.push({ Property: $(this).attr("name"), Value: values[2] + (hasTime ? "" : " 23:59:59"), DataType: $(this).attr("DataType"), OperatorType: 5, ConditionType: 1 });

                            }
                            groups.push({ Conditions: dateConditions });

                        }
                        break;
                    }
                    default:
                        {
                            conditions.push({ Property: $(this).attr("name"), Value: $(this).val(), DataType: $(this).attr("DataType"), OperatorType: $(this).attr("OperatorType"), ConditionType: 1 });
                            break;
                        }
                }
            }
        });
        $.ajax({
            url: gridOptions.dataUrl + (gridOptions.queryString === "" ? "" : "?" + gridOptions.queryString),
            data: { ConditionGroups: groups, Conditions: conditions, PageIndex: grid.getPageIndex(), PageSize: grid.getPageSize(), OrderBy: gridOptions.orderArray },
            type: "post",
            success: function (data) {
                gridOptions.isLoading = false;
                try {
                    if (typeof data === "string") {
                        gridOptions.jsonData = eval("(" + data + ")");
                    } else {
                        gridOptions.jsonData = data;
                    }
                }
                catch (ex) {
                    alert(ex.message);
                    return false;
                }
                grid.initGridData(gridOptions.jsonData);
                grid.body.find("#PageGo").removeClass("InnerLonding");
                return true;
            },
            error: function (msg) {
                gridOptions.isLoading = false;
                grid.body.find("#PageGo").removeClass("InnerLonding");
                gridBody.html("<h1>Grid.Ajax.Error:" + msg.status + "</h1>");
            }
        }, "json");
    }
    grid.clearCondition = function () {
        gridSearch.find("input.condition").val("");
        gridSearch.find(".bg-info").removeClass("bg-info");
        gridSearch.find("select.condition option").prop("selected", false);
        gridSearch.find("select").change();
        $(".RangeAdd").data("shown", false);
        grid.reload();
        return false;
    }
    grid.deleteData = function () {
        var vals = [];
        gridBody.find(".CheckBoxItem:checked").each(function () {
            vals.push($(this).attr("val"));
        });
        if (vals.length > 0) {
            Easy.ShowMessageBox(gridOptions.text.DeleteTitle, gridOptions.text.DeleteConfirm, function () {
                grid.body.find(".GridDelete").addClass("InnerLonding");
                $.ajax({
                    url: gridOptions.deleteUrl,
                    data: { ids: vals.join(',') },
                    success: function (data) {
                        if (data.Status != 1) {
                            Easy.ShowMessageBox(gridOptions.text.DeleteTitle, data.Message);
                        }
                        if (data.Status != 3) {
                            grid.reload();
                        }
                        grid.body.find(".GridDelete").removeClass("InnerLonding");
                    },
                    error: function (msg) {
                        grid.body.find(".GridDelete").removeClass("InnerLonding");
                        Easy.ShowMessageBox(gridOptions.text.DeleteTitle, msg.status);
                    },
                    type: "post"
                }, "json");
            }, true);
        }
        else {
            Easy.ShowMessageBox(gridOptions.text.DeleteTitle, gridOptions.text.SelectWorm);
        }
    }
    grid.showRangeCondition = function () {
        var th = $(this);
        if (th.data("shown")) {
            return;
        }
        th.data("shown", true);
        var rangeBox = $([
            "<div class='RangeConditionBox form' tabindex='-1'>",
            "<div class='form-group'><div class='input-group'><label for='GreaterThanOrEqualTo' class='input-group-addon'>>=</label><input  class='form-control' type='text' id='GreaterThanOrEqualTo' /></div></div>",
            "<div class='form-group'><div class='input-group'><label for='LessThanOrEqualTo' class='input-group-addon'><=</label><input  class='form-control' type='text' id='LessThanOrEqualTo' /></div></div>",
            "<div class='form-group'><div class='input-group'><label for='EqualTo' class='input-group-addon'>&nbsp;=&nbsp;</label><input type='text'  class='form-control' id='EqualTo' /></div></div>",
            "</div>"
        ].join(""));

        var effect = th.parent().find("input.condition");
        th.parent().append(rangeBox);
        var normalLeft = th.position().left;
        if (normalLeft + rangeBox.outerWidth() > grid.body.outerWidth()) {
            normalLeft = grid.body.outerWidth() - rangeBox.outerWidth();
        }
        rangeBox.css("left", normalLeft);
        rangeBox.css("top", th.position().top + th.outerHeight());
        var valueParse=function(val){
            return val;
        }
        switch (effect.attr("DataType")) {
            case "DateTime": {
                $(".form-control", rangeBox)
                    .attr("ValueType", "Date")
                    .addClass("Date")
                    .datetimepicker({ locale: "zh_cn", format: effect.attr("Format") || gridOptions.dateFormat })
                    .on("keydown", false);
                break;
            }
            case "Decimal":
            case "Single":
            case "Int16":
            case "Int64":
            case "Int32": {
                rangeBox.find("input").attr("ValueType", "Num")
                    .addClass("Number");
                valueParse=function(val){
                        return Number(val)||'';                        
                    }
                break;
            }
        }
        var values = effect.val().split("@");
        if (values.length === 3) {
            rangeBox.find("#GreaterThanOrEqualTo").val(values[0]);
            rangeBox.find("#LessThanOrEqualTo").val(values[1]);
            rangeBox.find("#EqualTo").val(values[2]);
        }
        function setValue() {
            var value1 = $("#GreaterThanOrEqualTo", rangeBox).val();
            var value2 = $("#LessThanOrEqualTo", rangeBox).val();
            var value3 = $("#EqualTo", rangeBox).val();
            effect.val(valueParse(value1) + "@" + valueParse(value2) + "@" + valueParse(value3));
            if (effect.val() !== "@@") {
                effect.parent().addClass("bg-info");
            } else {
                effect.parent().removeClass("bg-info");
            }
            grid.reload();
        }

        var closeThread;
        function removeConditionBox() {
            if (closeThread) return;
            closeThread = setTimeout(function () {
                th.data("shown", false);
                rangeBox.remove();
            }, 100);
        }

        $("input.form-control", rangeBox).on("keyup", function (e) {
            if (e.keyCode === 13) {
                removeConditionBox();
                return;
            }
            setValue();
        }).on("dp.change", setValue).on("focus", function () {
            clearTimeout(closeThread);
            closeThread = null;
        }).on("blur", removeConditionBox);

        rangeBox.on("focus", function () {
            clearTimeout(closeThread);
            closeThread = null;
        }).on("blur", removeConditionBox).focus();
    }
    grid.getTempleteValue = function (columnName, data, m) {
        var ind = gridOptions.templetes.ValueIndex(columnName);
        if (ind !== -1) {
            var reStr = gridOptions.templeteValues[ind];
            for (var item in data) {
                if (data.hasOwnProperty(item)) {
                    while (reStr.indexOf("{" + item + "}") >= 0) {
                        reStr = reStr.replace("{" + item + "}", grid.dataFormater.Provider(m)(data[item]));
                    }
                }
            }
            return reStr;
        }
        else {
            return grid.dataFormater.Provider(m)(data[columnName]);
        }
    }
    grid.multiSelect = function () {
        $("select.easy[multiple]", gridHeader).each(function () {
            if ($(this).attr("easy")) {
                return;
            }
            $(this).attr("easy", "easy");
            var oldSelect = $(this);
            var selectList = $(["<div class='DropDownList'>",
                "<div class='TextPlace' title=" + oldSelect.attr("title") + "><span></span></div><div class='DropIcon'>&nbsp;</div>",
                "<div style='clear:both'></div>",
                "</div>"].join(""));
            selectList.insertAfter(oldSelect);
            var options = $("<ul class='DropDownList_Options dropdown-menu' tabindex='-1'></ul>");
            selectList.on("click", ".Clear", function () {
                $("option", oldSelect).prop("selected", false);
                oldSelect.change();
                selectList.removeClass("Open");
                options.hide();
                return false;
            });
            oldSelect.change(function () {
                var text = "";
                $("option:checked", oldSelect).each(function () {
                    if (!text)
                        text += $(this).text();
                    else text += "," + $(this).text();
                });
                if (text) {
                    var textplace = selectList.find(".TextPlace");
                    textplace.attr("title", text);
                    textplace.html("<span>" + text + "</span><div class='Clear'></div>");
                }
                else selectList.find(".TextPlace").html("<span>&nbsp;</span>");
                selectList.find(".TextPlace").css("position", "relative");
            });
            var clickIn;
            options.on("blur", function () {
                if (!clickIn) {
                    selectList.removeClass("Open");
                    options.hide();
                }
                clickIn = false;
            });
            options.on("mousedown", function () {
                clickIn = true;
            });
            options.on("click", ".checkbox input[type=checkbox]", function () {
                var val = $(this).val();
                var checked = $(this).prop("checked");
                $("option", oldSelect).each(function () {
                    if ($(this).val() === val) {
                        $(this).prop("selected", checked);
                    }
                });
                oldSelect.trigger("change");
                options.focus();
            });
            oldSelect.hide();
            options.insertAfter(selectList);
            selectList.click(function () {
                if (selectList.hasClass("Open")) {
                    selectList.removeClass("Open");
                    options.hide();
                    return true;
                }
                selectList.addClass("Open");
                var lists = [];
                $("option", oldSelect).each(function () {
                    var val = $(this).attr("value");
                    if (val) {
                        var txt = $(this).text();
                        var selected = $(this).prop("selected");
                        if (selected) {
                            lists.push("<li val='" + val + "'><a><label class='checkbox'><input type='checkbox' checked='checked' value='" + val + "' />" + txt + "</label></a></li>");
                        } else {
                            lists.push("<li val='" + val + "'><a><label class='checkbox'><input type='checkbox' value='" + val + "' />" + txt + "</label></a></li>");
                        }
                    }
                });
                options.empty();
                options.append(lists.join(""));
                options.show();
                options.css("left", $(this).position().left);
                options.css("top", $(this).position().top + $(this).outerHeight());
                options.focus();
                return true;
            });
        });
    }
    grid.checkBoxClick = function (e) {
        if (e) {
            if ($(this).prop("checked")) {
                $(this).parents("tr").addClass("selected");
            } else {
                $(this).parents("tr").removeClass("selected");
            }
        } else {
            if ($(".CheckBoxAll", gridHeader).prop("checked")) {
                $("tr.trAf,tr.trBe", gridBody).addClass("selected");
            } else {
                $("tr.trAf,tr.trBe", gridBody).removeClass("selected");
            }
        }
        if (gridOptions.checkBoxEventHandler) {
            gridOptions.checkBoxEventHandler.call(this, grid.getSelectedRows());
        }
    }
    grid.getSelectedRows = function () {
        var select = [];
        grid.body.find(".CheckBoxItem:input:checked").each(function (i) {
            if ($(this).prop("checked") && gridOptions.jsonData && gridOptions.jsonData.Rows) {
                select.push(gridOptions.jsonData.Rows[i]);
            }
        });
        return select;
    }


    grid.setUrl = function (value) {
        gridOptions.dataUrl = value;
        return openMethod;
    }
    grid.setGridArea = function (eleId) {
        var pl = $("#" + eleId);
        if (pl.length > 0) {
            var size = $(".easy-grid").size();
            pl.addClass("easy-grid grid-" + size);
            pl.append(grid.body);
            pl.data("easy-grid", openMethod);
            grid.name = "grid_" + size;
        } else $("body").append(grid.body);
        return openMethod;
    }
    grid.showCheckBox = function (valueColumn) {
        gridOptions.chVale = valueColumn;
        gridOptions.checkBox = true;
        return openMethod;
    }
    grid.setHeight = function (value) {
        $(".GridBody", grid.body).height(value -
            $(".GridHeader", grid.body).outerHeight() -
            $(".Gridfoot", grid.body).outerHeight() -
            $(".GridToolBar", grid.body).outerHeight() -
            gridOptions.heightFix);
        gridOptions.constHeight = true;
        return openMethod;
    }
    grid.setModel = function (viewModel) {
        for (var p in viewModel) {
            if (viewModel.hasOwnProperty(p)) {
                var width = parseInt(grid.getColumnWidth(p));
                if (width) {
                    viewModel[p].Width = width;
                }
            }
        }
        grid.initGrid(viewModel);
        return openMethod;
    }
    grid.searchAble = function () {
        gridOptions.canSearch = true;
        return openMethod;
    }
    grid.orderBy = function (property, sortType) {
        if (!gridOptions.orderCol) {
            gridOptions.orderCol = property;
            gridOptions.orderType = sortType;
        }
        gridOptions.orderArray.push({ OrderCol: property, OrderType: sortType });
        return openMethod;
    }
    grid.setToolbar = function (selector) {
        var toolBar = $(".GridToolBar", grid.body);
        $(selector).appendTo(toolBar);
        toolBar.show();
        return openMethod;
    }
    grid.setDeleteUrl = function (url) {
        gridOptions.deleteUrl = url;
        $(".GridDelete", grid.body).show();
        return openMethod;
    }

    grid.onRowDataBind = function (fun) {
        gridOptions.rowDataBindEventHandler = fun;
        return openMethod;
    }
    grid.onCheckBoxChange = function (fun) {
        gridOptions.checkBoxEventHandler = fun;
        return openMethod;
    }
    grid.onSuccess = function (fun) {
        gridOptions.dataSuccessEventHandler = fun;
        return openMethod;
    }
    grid.setColumnTemplete = function (columnName, strFormate) {
        if (!gridOptions.templetes.ContainsValue(columnName)) {
            gridOptions.templetes.push(columnName);
            gridOptions.templeteValues.push(strFormate);
        }
        return openMethod;
    }

    gridBody.on("scroll", function () {
        gridHeader.scrollLeft($(this).scrollLeft());
    });
    gridBody.on("click", ".CheckBoxItem", grid.checkBoxClick);

    gridSearch.on("keydown", function (e) {
        if (e.keyCode === 13) {
            grid.reload();
        }
    });
    gridSearch.on("click", ".RangeAdd", grid.showRangeCondition);
    gridSearch.on("click", ".RangeClear", function () {
        $("input.condition", $(this).parent()).val("");
        $(this).parent().removeClass("bg-info");
        grid.reload();
    });
    gridSearch.on("click", ".ClearSearch", grid.clearCondition);
    gridSearch.on("change", "select", grid.reload);

    grid.body.on("keyup", "#GridPageIdex", function (e) {
        if (e.keyCode === 13) {
            $("#PageGo", grid.body).click();
        }
    });
    grid.body.on("change", "#GridPageSize", function () {
        grid.loadPage(0);
    });
    grid.body.on("click", "#PageGo", grid.reload);
    grid.body.on("click", "#PageFirst", function () {
        grid.loadPage(0);
    });
    grid.body.on("click", "#PagePre", function () {
        var pageIndex = grid.getPageIndex();
        if (pageIndex > 0) {
            grid.loadPage(pageIndex - 1);
        }
    });
    grid.body.on("click", "#PageNext", function () {
        var pageIndex = grid.getPageIndex();
        if (pageIndex < gridOptions.allPage - 1) {
            grid.loadPage(pageIndex + 1);
        }
    });
    grid.body.on("click", "#PageLast", function () {
        grid.loadPage(gridOptions.allPage - 1);
    });
    grid.body.on("click", ".GridDelete", grid.deleteData);
    gridHeader.on("click", ".CheckBoxAll", function () {
        gridBody.find("tr").find(".CheckBoxItem").prop("checked", $(this).prop("checked"));
        grid.checkBoxClick();
    });
    gridHeader.on("click", "th[col]", function () {
        var deCol = $(this).attr("col");
        if (deCol === gridOptions.orderCol) {
            gridOptions.orderType = gridOptions.orderType === 1 ? 2 : 1;
        }
        else {
            gridOptions.orderCol = deCol;
            gridOptions.orderType = 1;
        }
        gridOptions.orderArray = [];
        gridOptions.orderArray.push({ OrderCol: gridOptions.orderCol, OrderType: gridOptions.orderType });
        gridHeader.find("th[col]").removeAttr("class");
        if (gridOptions.orderType === 1)
            $(this).addClass("OrderUp");
        else $(this).addClass("OrderDown");
        grid.reload();
        return false;
    });

    /*public function*/
    openMethod.Show = grid.reload;
    openMethod.Reload = grid.reload;
    openMethod.OnRowDataBind = grid.onRowDataBind;
    openMethod.SetColumnTemplete = grid.setColumnTemplete;
    openMethod.SetUrl = grid.setUrl;
    openMethod.SetGridArea = grid.setGridArea;
    openMethod.ShowCheckBox = grid.showCheckBox;
    openMethod.OnCheckBoxChange = grid.onCheckBoxChange;
    openMethod.Height = grid.setHeight;
    openMethod.SetModel = grid.setModel;
    openMethod.SearchAble = grid.searchAble;
    openMethod.OnSuccess = grid.onSuccess;
    openMethod.OrderBy = grid.orderBy;
    openMethod.SetBoolBar = grid.setToolbar;
    openMethod.SetDeleteUrl = grid.setDeleteUrl;
    openMethod.Delete = grid.deleteData;
    openMethod.getSelectedRows = grid.getSelectedRows;
    return openMethod;
});

$.fn.grid = function () {
    return $(this).data("easy-grid");
};