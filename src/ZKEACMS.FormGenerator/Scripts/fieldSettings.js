angular.module("fieldSetting", []).controller("setting", ['$scope', '$filter', function ($scope, $filter) {
    $scope.templates = [
        {
            Name: "Label",
            DisplayName: "标题",
            Description: "",
            Placeholder: "",
            IsRequired: false,
            RequiredMessage:"这是必填项",
            Size: 4,
            Column: "col-md-12",
            RegexPattern: "",
            RegexMessage: ""
        },
        {
            Name: "SingleLine",
            DisplayName: "单行输入",
            Description: "",
            Placeholder: "",
            IsRequired: false,
            RequiredMessage: "这是必填项",
            Size: 4,
            Column: "col-md-12",
            RegexPattern: "",
            RegexMessage: ""
        },
        {
            Name: "Number",
            DisplayName: "数字",
            Description: "",
            Placeholder: "",
            IsRequired: false,
            RequiredMessage: "这是必填项",
            Size: 4,
            Column: "col-md-12",
            RegexPattern: "",
            RegexMessage: ""
            //AdditionalSettings: [{ DisplayText: "最大值", Name: "num-max", Value: "" }, { DisplayText: "最小值", Name: "mum-min", Value: "" }]
        },
        {
            Name: "Email",
            DisplayName: "邮箱地址",
            Description: "",
            Placeholder: "",
            IsRequired: false,
            RequiredMessage: "这是必填项",
            Size: 4,
            Column: "col-md-12",
            RegexPattern: "",
            RegexMessage: ""
        },
        {
            Name: "Phone",
            DisplayName: "电话",
            Description: "",
            Placeholder: "",
            IsRequired: false,
            RequiredMessage: "这是必填项",
            Size: 4,
            Column: "col-md-12",
            RegexPattern: "",
            RegexMessage: ""
        },
        {
            Name: "Paragraph",
            DisplayName: "多行输入",
            Description: "",
            Placeholder: "",
            IsRequired: false,
            RequiredMessage: "这是必填项",
            Size: 4,
            Column: "col-md-12",
            RegexPattern: "",
            RegexMessage: ""
        },
        {
            Name: "Date",
            DisplayName: "日期",
            Description: "",
            IsRequired: false,
            RequiredMessage: "这是必填项",
            Size: 4,
            Column: "col-md-12",
            RegexPattern: "",
            RegexMessage: ""
        },
        {
            Name: "Radio",
            DisplayName: "单项选择",
            Description: "",
            IsRequired: false,
            RequiredMessage: "这是必填项",
            Size: 4,
            Column: "col-md-12",
            FieldOptions: [{ DisplayText: "选项1" }, { DisplayText: "选项2" }],
            RegexPattern: "",
            RegexMessage: ""
        },
        {
            Name: "Dropdown",
            DisplayName: "下拉选项",
            Description: "",
            IsRequired: false,
            RequiredMessage: "这是必填项",
            Size: 4,
            Column: "col-md-12",
            FieldOptions: [{ DisplayText: "选项1" }, { DisplayText: "选项2" }],
            RegexPattern: "",
            RegexMessage: ""
        },
        {
            Name: "Checkbox",
            DisplayName: "多项选择",
            Description: "",
            IsRequired: false,
            RequiredMessage: "这是必填项",
            Size: 4,
            Column: "col-md-12",
            FieldOptions: [{ DisplayText: "选项1" }, { DisplayText: "选项2" }],
            RegexPattern: "",
            RegexMessage: ""
        },
        {
            Name: "Address",
            DisplayName: "省份地址",
            Description: "",
            IsRequired: false,
            RequiredMessage: "这是必填项",
            Size: 4,
            Column: "col-md-12",
            RegexPattern: "",
            RegexMessage: ""
        },
        {
            Name: "ValidCode",
            DisplayName: "验证码",
            Description: "",
            Placeholder: "",
            IsRequired: true,
            RequiredMessage: "这是必填项",
            Size: 4,
            Column: "col-md-12",
            RegexPattern: "",
            RegexMessage: ""
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
    $scope.removeField = function (field) {
        $scope.Fields = $scope.Fields.filter(function (item) { return item != field });
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
        options.push({ DisplayText: "", Value: "", DefaultSelected: false });
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
        var index = 0;
        for (var i = 0; i < ev.currentTarget.parentNode.children.length; i++) {
            if (ev.currentTarget === ev.currentTarget.parentNode.children[i]) {
                index = i;
                break;
            }
        }
        ev.dataTransfer.setData("Text", ev.target.id + ";" + index);
    };

    $scope.drop = function (ev) {
        ev.preventDefault();
        var data = ev.dataTransfer.getData("Text").split(";");
        var index = 0;
        for (var i = 0; i < ev.currentTarget.parentNode.children.length; i++) {
            if (ev.currentTarget === ev.currentTarget.parentNode.children[i]) {
                index = i;
                break;
            }
        }
        $scope.Fields[index].onDrop = false;
        if (data[0]) {
            var name = data[0];
            for (var i = 0; i < $scope.templates.length; i++) {
                if (name == $scope.templates[i].Name) {
                    $scope.Fields.splice(index + 1, 0, angular.copy($scope.templates[i]));
                }
            }
        } else {
            var startIndex = parseInt(data[1]);
            $scope.Fields.splice(index, 0, $scope.Fields.splice(startIndex, 1)[0]);
        }

        $scope.$apply();
    };
    $scope.columnCute = function (field, index) {
        return field.Column || "col-md-12";
    }
    //Saving
    $scope.save = function () {
        $scope.Message = null;
        if (!$.trim($scope.Title)) {
            $scope.Message = "请输入表单的名称";
            return;
        }
        Easy.Block();
        $.ajax({
            type: 'POST',
            dataType: 'json',
            url: $scope.saveUrl,
            data: JSON.stringify({
                ID: $scope.ID,
                Title: $scope.Title,
                Description: $scope.Description,
                Description: $scope.Description,
                Status: $scope.Status,
                CreateBy: $scope.CreateBy,
                CreatebyName: $scope.CreatebyName,
                CreateDate: $scope.CreateDate,
                LastUpdateBy: $scope.LastUpdateBy,
                LastUpdateByName: $scope.LastUpdateByName,
                LastUpdateDate: $scope.LastUpdateDate,
                NotificationReceiver: $scope.NotificationReceiver,
                FormFields: $scope.Fields
            }),
            contentType: 'application/json; charset=utf-8',
            async: true,
            success: function (data) {
                if (data.message) {
                    $scope.Message = data.message;
                    $scope.$apply();
                }
                else {
                    window.location.href = '/Admin/Form';
                }
            }
        });
    }
}]);