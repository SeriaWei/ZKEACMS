/*!
 * http://www.zkea.net/
 * Copyright 2016 ZKEASOFT
 * http://www.zkea.net/licenses
 */
tinymce.PluginManager.add('bootstrap', function (editor) {
    //----------------------------------------------------------------//
    function insertButton(cla) {
        editor.undoManager.transact(function () {
            editor.selection.setContent(editor.dom.createHTML("a", { "class": cla, "href": "http://www.zkea.net" }, "按钮"));
        });
        editor.focus();
        editor.nodeChanged();
    }

    function insertColumns(cla) {
        var html = '<div class="container-fluid"><div class="row">';
        for (var i = 0; i < cla.length; i++) {
            html += '<div class="col-sm-' + cla[i] + '"><p>' + '列 ' + (i + 1) + '</p></div>';
        }
        html += '</div></div>';
        editor.undoManager.transact(function () {
            editor.selection.setContent(html);
        });
        editor.focus();
        editor.nodeChanged();
    }

    function insertAlert(cla) {
        editor.undoManager.transact(function () {
            editor.selection.setContent(editor.dom.createHTML("div", { "class": cla, role: "alert" }, "这是一则重要的消息,欢迎使用ZKEACMS进行创作"));
        });
        editor.focus();
        editor.nodeChanged();
    }

    function insertPanel(cla) {
        var html = '<div class="' + cla + '">\
                      <div class="panel-heading">相关链接</div>\
                      <div class="panel-body">\
                        <p><a target="_blank" href="https://github.com/SeriaWei/ASP.NET-MVC-CMS">GitHub</a></p>\
                        <p><a target="_blank" href="http://git.oschina.net/seriawei/ASP.NET-MVC-CMS">开源中国</a></p>\
                        <p><a target="_blank" href="http://www.zkea.net">ZKEASOFT</a></p>\
                        <p><a target="_blank" href="http://www.zkea.net/zkeacms/donate">捐助</a></p>\
                      </div>\
                      <div class="panel-footer">脚注</div>\
                    </div>';
        editor.undoManager.transact(function () {
            editor.selection.setContent(html);
        });
        editor.focus();
        editor.nodeChanged();
    }

    editor.ui.registry.addButton('bootstrap', {
        icon: 'copy',
        tooltip: 'Bootstrap',
        onAction: function () {
            editor.windowManager.open({
                title: "Bootstrap",
                body: {
                    type: "tabpanel",
                    tabs: [
                        {
                            title: "按钮",
                            items: [
                                {
                                    type: 'button',
                                    name: 'btn btn-default',
                                    text: '默认'
                                }, {
                                    type: 'button',
                                    name: 'btn btn-flat',
                                    text: '扁平'
                                }, {
                                    type: 'button',
                                    name: 'btn btn-primary',
                                    text: '主要'
                                }, {
                                    type: 'button',
                                    name: 'btn btn-danger',
                                    text: '危险'
                                }, {
                                    type: 'button',
                                    name: 'btn btn-warning',
                                    text: '警告'
                                }, {
                                    type: 'button',
                                    name: 'btn btn-info',
                                    text: '信息'
                                }, {
                                    type: 'button',
                                    name: 'btn btn-success',
                                    text: '成功'
                                }
                            ]
                        },
                        {
                            title: "分列",
                            items: [
                                {
                                    type: 'button', text: "6 - 6", name: "6-6"
                                },
                                {
                                    type: 'button', text: "7 - 5", name: "7-5"
                                },
                                {
                                    type: 'button', text: "8 - 4", name: "8-4"
                                },
                                {
                                    type: 'button', text: "9 - 3", name: "9-3"
                                },
                                {
                                    type: 'button', text: "5 - 7", name: "5-7"
                                },
                                {
                                    type: 'button', text: "4 - 8", name: "4-8"
                                },
                                {
                                    type: 'button', text: "3 - 9", name: "3-9"
                                },
                                {
                                    type: 'button', text: "4 - 4 - 4", name: "4-4-4"
                                },
                                {
                                    type: 'button', text: "3 - 6 - 3", name: "3-6-3"
                                },
                                {
                                    type: 'button', text: "3 - 3 - 3 - 3", name: "3-3-3-3"
                                }
                            ]
                        },
                        {
                            title: "警告框",
                            items: [
                                {
                                    type: 'button', text: "默认", name: "alert alert-default"
                                },
                                {
                                    type: 'button', text: "主要", name: "alert alert-primary"
                                },
                                {
                                    type: 'button', text: "危险", name: "alert alert-danger"
                                },
                                {
                                    type: 'button', text: "警告", name: "alert alert-warning"
                                },
                                {
                                    type: 'button', text: "信息", name: "alert alert-info"
                                },
                                {
                                    type: 'button', text: "成功", name: "alert alert-success"
                                }
                            ]
                        },
                        {
                            title: "面板",
                            items: [
                                {
                                    type: 'button', text: "默认", name: "panel panel-default"
                                },
                                {
                                    type: 'button', text: "主要", name: "panel panel-primary"
                                },
                                {
                                    type: 'button', text: "危险", name: "panel panel-danger"
                                },
                                {
                                    type: 'button', text: "警告", name: "panel panel-warning"
                                },
                                {
                                    type: 'button', text: "信息", name: "panel panel-info"
                                },
                                {
                                    type: 'button', text: "成功", name: "panel panel-success"
                                }
                            ]
                        }
                    ]
                },
                buttons: [
                    {
                        type: 'submit',
                        name: 'cancel',
                        text: '确定',
                        primary: true
                    },
                    {
                        type: 'cancel',
                        name: 'cancel',
                        text: '取消'
                    }
                ],
                onAction: function (dialogApi, actionData) {
                    if (actionData.name.indexOf("btn") >= 0) {
                        insertButton(actionData.name);
                    }
                    else if (actionData.name.indexOf("alert") >= 0) {
                        insertAlert(actionData.name);
                    }
                    else if (actionData.name.indexOf("panel") >= 0) {
                        insertPanel(actionData.name);
                    }
                    else if (actionData.name.indexOf("-")) {
                        insertColumns(actionData.name.split("-"));
                    }
                    dialogApi.close();
                }
            })
        }
    });
});