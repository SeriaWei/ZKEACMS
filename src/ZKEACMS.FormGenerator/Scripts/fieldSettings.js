angular.module("fieldSetting", []).controller("setting", ['$scope', '$filter', function ($scope, $filter) {
    $scope.templates = [
        {
            Name: "SingleLine",
            DisplayName: "单行",
            Description: "",
            Width: 200,
            Required: true,
            displayTemplate: "/Plugins/ZKEACMS.FormGenerator/DisplayTemplate/SingleLine.html",
            editorTemplate: "/Plugins/ZKEACMS.FormGenerator/EditorTemplate/SingleLine.html"
        },
        {
            Name: "Paragraph",
            DisplayName: "多行",
            Description: "",
            Width: 200,
            Required: false,
            displayTemplate: "/Plugins/ZKEACMS.FormGenerator/DisplayTemplate/Paragraph.html",
            editorTemplate: "/Plugins/ZKEACMS.FormGenerator/EditorTemplate/Paragraph.html"
        },
        {
            Name: "Date",
            DisplayName: "日期",
            Description: "",
            Width: 200,
            Required: false,
            displayTemplate: "/Plugins/ZKEACMS.FormGenerator/DisplayTemplate/Date.html",
            editorTemplate: "/Plugins/ZKEACMS.FormGenerator/EditorTemplate/Date.html"
        },
        {
            Name: "Radio",
            DisplayName: "单选",
            Description: "",
            Width: 200,
            Required: false,
            DefaultSelect: {},
            FieldOptions: [{ DisplayText: "选项1", Value: "" }, { DisplayText: "选项2", Value: "" }],
            displayTemplate: "/Plugins/ZKEACMS.FormGenerator/DisplayTemplate/RadioButton.html",
            editorTemplate: "/Plugins/ZKEACMS.FormGenerator/EditorTemplate/RadioButton.html"
        },
        {
            Name: "Checkbox",
            DisplayName: "多选",
            Description: "",
            Width: 200,
            Format: 1,
            Required: false,
            DefaultSelect: {},
            FieldOptions: [{ DisplayText: "选项1", Value: "" }, { DisplayText: "选项2", Value: "" }],
            displayTemplate: "/Plugins/ZKEACMS.FormGenerator/DisplayTemplate/Checkbox.html",
            editorTemplate: "/Plugins/ZKEACMS.FormGenerator/EditorTemplate/Checkbox.html"
        },
        {
            Name: "Dropdown",
            DisplayName: "下拉菜单",
            Description: "",
            Width: 200,
            Format: 1,
            Required: false,
            DefaultSelect: {},
            FieldOptions: [{ DisplayText: "选项1", Value: "" }, { DisplayText: "选项2", Value: "" }],
            displayTemplate: "/Plugins/ZKEACMS.FormGenerator/DisplayTemplate/DropDown.html",
            editorTemplate: "/Plugins/ZKEACMS.FormGenerator/EditorTemplate/DropDown.html"
        }
    ];
    if ($scope.Fields == null || $scope.Fields.length == 0) {
        $scope.Fields = [angular.copy($scope.templates[0])];
    }
    $scope.fieldInfo = $scope.Fields[0];
    $scope.editTemplate = function (data) {
        $scope.fieldInfo = data;
    }
    $scope.setFieldWidth = function (data, width) {
        data.Style = { width: width };
    }
    $scope.setDefaultOption = function (data, option) {
        for (var i = 0; i < data.FieldOptions.length; i++) {
            data.FieldOptions[i].DefaultSelected = false;
        }
        option.DefaultSelected = true;
        data.DefaultSelect = option;
    }
    $scope.removeOption = function (options, option) {
        var removeIndex = 0;
        for (var i = 0; i < options.length; i++) {
            if (options[i] == option) {
                removeIndex = i;
            }
        }
        options.splice(removeIndex, 1);
    }
    $scope.addOption = function (options) {
        options.push({ DisplayText: "", Value: "", DefaultSelected: false, Order: options.length + 1 });
    }
    var orderBy = $filter('orderBy');
    $scope.sortOptions = function (options, reverse) {
        options = orderBy(options, "DisplayText", reverse);
        for (var i = 0; i < options.length; i++) {
            options[i].Order = i + 1;
        }
    }
    $scope.showOptionValue = function (data, showValue) {
        data.ShowValue = showValue;
        for (var i = 0; i < data.FieldOptions.length; i++) {
            if (!data.FieldOptions[i].Value) {
                data.FieldOptions[i].Value = data.FieldOptions[i].DisplayText;
            }
        }
    }

    $scope.dragOver = function (ev) {       
        var index = 0;
        for (var i = 0; i < ev.currentTarget.parentNode.children.length; i++) {
            if (ev.currentTarget === ev.currentTarget.parentNode.children[i]) {
                index = i;
                break;
            }
        }
        $scope.Fields[index].onDrop = true;
        $scope.$apply();
        ev.preventDefault();
    };
    $scope.dragLeave = function (ev) {
        var index = 0;
        for (var i = 0; i < ev.currentTarget.parentNode.children.length; i++) {
            if (ev.currentTarget === ev.currentTarget.parentNode.children[i]) {
                index = i;
                break;
            }
        }
        $scope.Fields[index].onDrop = false;
        $scope.$apply();
        ev.preventDefault();
    };

    $scope.drag = function (ev) {
        ev.dataTransfer.setData("Field", ev.target.id);
    };

    $scope.drop = function (ev) {
        ev.preventDefault();
        var data = ev.dataTransfer.getData("Field");
        var index = 0;
        for (var i = 0; i < ev.currentTarget.children.length; i++) {
            if (ev.target.parentNode === ev.currentTarget.children[i]) {
                index = i;
                break;
            }
        }
        $scope.Fields[index].onDrop = false;
        for (var i = 0; i < $scope.templates.length; i++) {
            if (data == $scope.templates[i].Name) {
                $scope.Fields.splice(index+1, 0, angular.copy($scope.templates[i]));
            }
        }
        $scope.$apply();
    };
}]);