/// <reference path="jquery.js" />
/// <reference path="Easy.js" />
/*!
 * http://www.zkea.net/
 * Copyright 2016 ZKEASOFT
 * http://www.zkea.net/licenses
 */
var Easy = Easy || {};
Easy.UI = {
    DropDownList: function (callBack) {
        $("select.easy").not("[multiple]").each(function () {
            if ($(this).attr("easy")) {
                return;
            }
            $(this).attr("easy", "easy");
            var oldSelect = $(this);
            var value = oldSelect.val();
            var canNull = false;
            var text = oldSelect.find("option").first().text();
            if (oldSelect.find("option:selected").length) {
                text = $(this).find("option:selected").text();
            }
            if (text == "") text = "&nbsp;";
            if (value == "")
                canNull = true;
            var ListHtml = [];
            ListHtml.push("<div class='DropDownList'>");
            ListHtml.push("<div class='TextPlace'><span>" + text + "</span></div><div class='DropIcon'>&nbsp;</div>");
            ListHtml.push("<div style='clear:both'></div>");
            ListHtml.push("</div>");
            var selectList = $(ListHtml.join(""));
            selectList.insertAfter(oldSelect);
            selectList.css("width", $(this).outerWidth());
            oldSelect.change(function () {
                text = $(this).find("option:selected").text();
                selectList.removeClass("Open");
                if (canNull) {
                    selectList.find(".TextPlace").html("<span>" + text + "</span><div class='Clear'></div>");
                    selectList.find(".TextPlace").css("position", "relative");
                    if (text == "") {
                        selectList.find(".Clear").remove();
                    } else {
                        selectList.find(".Clear").click(function () {
                            oldSelect.val("");
                            oldSelect.change();
                            selectList.find(".TextPlace").html("<span>&nbsp;</span>");
                            return false;
                        });
                    }
                } else {
                    selectList.find(".TextPlace").html("<span>" + text + "</span>");
                }
            });
            oldSelect.hide();
            if (!oldSelect.attr("readonly") && !oldSelect.attr("disabled"))
                selectList.click(ShowDropDown);
            else selectList.addClass("readonly");
            function ShowDropDown() {
                if (selectList.hasClass("Open")) {
                    $(".DropDownList_Options").remove();
                    selectList.removeClass("Open");
                    $(document).unbind("click", RemoveOptions);
                    return false;
                }
                selectList.addClass("Open");
                var DownList = [];
                DownList.push("<ul class='DropDownList_Options'>");
                var options = oldSelect.find("option");
                options.each(function () {
                    var val = $(this).attr("value");
                    if (val) {
                        var txt = $(this).text();
                        var li = "<li val='" + val + "'>" + txt + "</li>";
                        DownList.push(li);
                    }
                });
                DownList.push("</ul>");
                var $DownList = $(DownList.join(""));
                $DownList.find("li").click(function () {
                    value = $(this).attr("val");
                    text = $(this).text();
                    oldSelect.val($(this).attr("val"));
                    oldSelect.change();
                });
                $DownList.width($(this).width() + 19);
                $DownList.css("left", $(this).offset().left);
                $DownList.css("top", $(this).offset().top + selectList.height());
                if (options.length > 15) {
                    $DownList.height(250);
                }
                setTimeout(function () {
                    $(document).bind("click", RemoveOptions);
                    $("body").append($DownList);
                }, 10);
            }
            function RemoveOptions() {
                $(".DropDownList_Options").remove();
                selectList.removeClass("Open");
                $(document).unbind("click", RemoveOptions);
            }

        });
    },
    MultiSelect: function (callBack) {
        $("select.easy[multiple]").each(function () {
            if ($(this).attr("easy")) {
                return;
            }
            $(this).attr("easy", "easy");
            var oldSelect = $(this);
            var text = "";
            if (oldSelect.find("option:selected").length) {
                $(this).find("option:selected").each(function () {
                    if (text == "")
                        text = $(this).text();
                    else text += "," + $(this).text();
                });
            }
            if (text == "") text = "&nbsp;";
            var ListHtml = [];
            ListHtml.push("<div class='DropDownList'>");
            ListHtml.push("<div class='TextPlace' title=" + text + "><span>" + text + "</span></div><div class='DropIcon'>&nbsp;</div>");
            ListHtml.push("<div style='clear:both'></div>");
            ListHtml.push("</div>");
            var selectList = $(ListHtml.join(""));
            selectList.insertAfter(oldSelect);
            selectList.css("width", $(this).outerWidth());
            oldSelect.change(function () {
                text = "";
                oldSelect.find("option[selected='selected']").each(function () {
                    if (text == "")
                        text += $(this).text();
                    else text += "," + $(this).text();
                });
                if (text != "") {
                    var textplace = selectList.find(".TextPlace");
                    textplace.attr("title", text);
                    textplace.html("<span>" + text + "</span><div class='Clear'></div>");
                }
                else selectList.find(".TextPlace").html("<span>&nbsp;</span>");
                selectList.find(".TextPlace").css("position", "relative");
                selectList.find(".Clear").click(function () {
                    oldSelect.find("option").each(function () { $(this).removeAttr("selected"); });
                    $(".DropDownList_Options").remove();
                    $(document).unbind("click", RemoveOptions);
                    oldSelect.change();
                    selectList.removeClass("Open");
                    return false;
                });
            });
            oldSelect.hide();
            if (!oldSelect.attr("readonly") && !oldSelect.attr("disabled"))
                selectList.click(ShowDropDown);
            function ShowDropDown() {
                if (selectList.hasClass("Open")) {
                    $(document).unbind("click", RemoveOptions);
                    $(".DropDownList_Options").remove();
                    selectList.removeClass("Open");
                    return true;
                }
                selectList.addClass("Open");
                var DownList = [];
                DownList.push("<ul class='DropDownList_Options'>");
                var options = oldSelect.find("option");
                options.each(function () {
                    var val = $(this).attr("value");
                    if (val) {
                        var txt = $(this).text();
                        var selected = $(this).prop("selected");
                        if (selected) {
                            var li = "<li val='" + val + "' id='selectBoxli'><input id='selectBox'  type='checkbox' checked='checked' val='" + val + "' />" + txt + "</li>";
                            DownList.push(li);
                        } else {
                            var li = "<li val='" + val + "' id='selectBoxli'><input id='selectBox' type='checkbox' val='" + val + "' />" + txt + "</li>";
                            DownList.push(li);
                        }
                    }
                });
                DownList.push("</ul>");
                var $DownList = $(DownList.join(""));
                $DownList.find("input[type='checkbox']").click(function () {
                    var op = oldSelect.find("option[value='" + $(this).attr("val") + "']");
                    if (op.attr("selected")) {
                        op.removeAttr("selected");
                    }
                    else {
                        op.attr("selected", "selected")
                    }
                    oldSelect.change();
                });
                $DownList.width($(this).width() + 19);
                $DownList.css("left", $(this).offset().left);
                $DownList.css("top", $(this).offset().top + selectList.height());
                if (options.length > 15) {
                    $DownList.height(250);
                }
                setTimeout(function () {
                    $(document).bind("click", RemoveOptions);
                    $("body").append($DownList);
                    Easy.UI.CheckBox();
                }, 10);
            }
            function RemoveOptions(e) {
                if (e.target.id == 'selectBox' || e.target.id == 'selectBoxli') {
                    if (e.target.id == 'selectBoxli') {
                        $(e.target).find("#selectBox").click();
                        $(e.target).find("#selectBox").change();
                    }
                    return true;
                }
                $(".DropDownList_Options").remove();
                selectList.removeClass("Open");
                $(document).unbind("click", RemoveOptions);
            }
        });
    },
    CheckBox: function (callBack) {
        $("input.easy[type='checkbox']").each(function () {
            if ($(this).attr("easy")) {
                return;
            }
            $(this).attr("easy", "easy");
            var oldCheckBox = $(this);
            var checked = oldCheckBox.prop("checked");
            var checkbox = $("<div class='CheckBox'></div>");
            if (checked)
                checkbox.addClass("CheckBoxOpen");
            checkbox.insertAfter(oldCheckBox);
            oldCheckBox.change(ShowState);
            if (!oldCheckBox.attr("readonly") && !oldCheckBox.attr("disabled")) {
                oldCheckBox.click(ShowState);
                checkbox.click(function () {
                    if ($(this).hasClass("CheckBoxOpen")) {
                        oldCheckBox.removeAttr("checked");
                    }
                    else {
                        oldCheckBox.attr("checked", "checked");
                    }
                    oldCheckBox.change();
                });
            }
            else {
                checkbox.addClass("readonly");
            }
            function ShowState() {
                if (oldCheckBox.prop("checked")) {
                    checkbox.addClass("CheckBoxOpen");
                    oldCheckBox.val("true");
                }
                else {
                    checkbox.removeClass("CheckBoxOpen");
                    oldCheckBox.val("false");
                }
            }
            oldCheckBox.hide();
        });
    },
    DateInput: function (selector) {
        if (!selector) {
            selector = "input.easy[ValueType='Date']";
        }
        $(selector).each(function () {
            var th = $(this);
            if (th.attr("easy")) {
                return;
            }
            var format = th.attr("DateFormat");
            th.parent().css("position", "relative");
            $(this).datetimepicker({ locale: "zh_cn", format: "YYYY/MM/DD H:mm:ss" });
        });
    },
    NumberInput: function () {
        $("input.easy[ValueType='Num']").each(function () {
            if ($(this).attr("easy")) {
                return;
            }
            $(this).attr("easy", "easy");
            $(this).keydown(function (e) {
                var FloatScale = parseInt($(this).attr("FloatScale"));
                if (!FloatScale)
                    FloatScale = 0;
                if ((e.keyCode >= 48 && e.keyCode <= 57) || (e.keyCode >= 8 && e.keyCode <= 9) || e.keyCode == 190 || e.keyCode == 189 || (e.keyCode >= 96 && e.keyCode <= 105)) {
                    if (e.keyCode == 8 || e.keyCode == 9) {
                        return true;
                    }
                    else if (e.keyCode == 189) {
                        var min = parseFloat($(this).attr("Min"));
                        var le = true;
                        if (!isNaN(min) && min > 0) {
                            le = false;
                        }
                        if ($(this).val().indexOf('-') == -1 && le) {
                            $(this).val("-" + $(this).val());
                        }
                        else {
                            $(this).val($(this).val().replace('-', ''));
                        }
                        return false;
                    }
                    else if (e.keyCode == 190) {
                        if ($(this).val().indexOf('.') == -1 && $(this).val().length == 0 && FloatScale != 0) {
                            $(this).val("0.");
                        }
                        if ($(this).val().indexOf('.') >= 0 || FloatScale == 0) {
                            return false;
                        }
                        return true;
                    }
                }
                else {
                    return false;
                }
            });
            $(this).blur(function () {
                if (isNaN(parseFloat($(this).val()))) {
                    $(this).val("");
                    return;
                }
                var FloatScale = parseInt($(this).attr("FloatScale"));
                if ($(this).val().indexOf('.') >= 0) {
                    if ($(this).val().split('.')[1].length >= FloatScale) {
                        $(this).val($(this).val().split('.')[0] + "." + $(this).val().split('.')[1].substring(0, 2))
                    } else {
                        var flo = parseInt($(this).val().split('.')[1]);
                        if (!flo) {
                            flo = "00";
                        }
                        $(this).val($(this).val().split('.')[0] + "." + flo)
                    }
                }
                else if ($(this).val().length > 0) {
                    var min = $(this).attr("Min");
                    if (min || min == 0) {
                        if (parseFloat($(this).val()) < min) {
                            $(this).val(min);
                        }
                    }
                    var max = $(this).attr("Max");
                    if (max || max == 0) {
                        if (parseFloat($(this).val()) > max) {
                            $(this).val(max);
                        }
                    }
                }
            });
        });
    },

    AutoComeleteInput: function () {
        if ($(this).attr("easy")) {
            return;
        }
        $(this).attr("easy", "easy");
        $("input[AutoComplete='true']").each(function () {
            var dataSource = $(this).attr("DataSource");
            var valueField = $(this).attr("ValueField");
            var funAddParameter = $(this).attr("FunAddParameter");
            var addOthPa = false;
            var oldKey = "";
            try {
                funAddParameter = eval(funAddParameter);
            }
            catch (ex) { }
            if (funAddParameter instanceof Function) {
                addOthPa = true;
            }
            if (dataSource) {
                $(this).keydown(function (e) {
                    if (e.keyCode == 38 || e.keyCode == 40) { return false; }
                });
                $(this).keyup(function (e) {
                    if (e.keyCode == 38) {
                        //up
                        var oldActive = $(".autocompleteResult .active");
                        if (oldActive.length == 0 || oldActive.index() == 0) {
                            $(".autocompleteResult>li").last().addClass("active");
                        }
                        else if (oldActive.index() != 0) {
                            oldActive.prev("li").addClass("active");
                        }
                        oldActive.removeClass("active");
                        return false;
                    }
                    else if (e.keyCode == 40) {
                        //down
                        var oldActive = $(".autocompleteResult .active");
                        var allIndex = $(".autocompleteResult>li").length - 1;
                        if (oldActive.length == 0 || oldActive.index() == allIndex) {
                            $(".autocompleteResult>li").first().addClass("active");
                        }
                        else if (oldActive.index() != allIndex) {
                            oldActive.next("li").addClass("active");
                        }
                        oldActive.removeClass("active");
                        return false;
                    }
                    else if (e.keyCode == 13) {
                        var active = $(".autocompleteResult .active");
                        if (active.length == 1) {
                            var val = active.attr("val");
                            var text = active.attr("text");
                            $(this).val(text);
                            $("#" + valueField).val(val);
                            $(".autocompleteResult").remove();
                        }
                        return false;
                    }
                    var theInput = $(this);
                    var inputKey = $(this).val();
                    if (inputKey == oldKey || inputKey == "") {
                        if (inputKey == "") {
                            oldKey = inputKey;
                            $(".autocompleteResult").remove();
                        }
                        return false;
                    }
                    $(".autocompleteResult").remove();
                    oldKey = inputKey;
                    var para = { key: inputKey };
                    if (addOthPa) {
                        $.extend(para, funAddParameter.call());
                    }
                    $.post(dataSource, para, function (data) {
                        var resultHtml = [];
                        resultHtml.push("<ul class='autocompleteResult'>");
                        for (var item in data) {
                            if (!(data[item] instanceof Function)) {
                                var htmlText = data[item].Text.replace(inputKey, "<strong style='color:red'>" + inputKey + "</strong>");
                                resultHtml.push("<li val='" + data[item].Value + "' text='" + data[item].Text + "'>" + htmlText + "</li>");
                            }
                        }
                        resultHtml.push("</ul>");
                        resultHtml = $(resultHtml.join(""));
                        resultHtml.children("li").hover(function () { $(this).addClass("active"); }, function () { $(this).removeClass("active"); });
                        $("body").append(resultHtml);
                        resultHtml.width(theInput.width() + parseInt(theInput.css("padding-left")) + parseInt(theInput.css("padding-right")));
                        resultHtml.css("top", theInput.offset().top + theInput.height() + parseInt(theInput.css("padding-top")) + parseInt(theInput.css("padding-bottom")) + 1);
                        resultHtml.css("left", theInput.offset().left);
                    }, "json");
                });
                $(this).blur(function () {
                    oldKey = "";
                    var active = $(".autocompleteResult .active");
                    if (active.length == 1) {
                        var val = active.attr("val");
                        var text = active.attr("text");
                        $(this).val(text);
                        $("#" + valueField).val(val);
                    }
                    if (valueField) {
                        var $this = $(this);
                        var inputKey = $(this).val();
                        var para = { key: inputKey };
                        if (addOthPa) {
                            $.extend(para, funAddParameter.call());
                        }
                        if (inputKey) {
                            $.post(dataSource, para, function (data) {
                                var clear = true;
                                for (var item in data) {
                                    if (!(data[item] instanceof Function)) {
                                        if (data[item].Text == inputKey) {
                                            clear = false;
                                        }
                                    }
                                }
                                if (clear) {
                                    $this.val("");
                                    $("#" + valueField).val("");
                                }
                            }, "json");
                        }
                    }
                    $(".autocompleteResult").remove();
                });

            }
        });
    },

    Init: function () {
        this.DropDownList();
        this.MultiSelect();
        this.CheckBox();
        this.DateInput();
        this.NumberInput();
        this.AutoComeleteInput();
    }
}
$(function () { Easy.UI.Init(); });
