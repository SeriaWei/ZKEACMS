/*!
 * http://www.zkea.net/
 * Copyright 2016 ZKEASOFT
 * http://www.zkea.net/licenses
 */
tinymce.PluginManager.add('bootstrap', function (editor) {
    //----------------------------------------------------------------//
    function insertButton(cla) {
        editor.undoManager.transact(function () {
            editor.selection.setContent(editor.dom.createHTML("a", { "class": cla, "href": "http://t.cn/RzV2ojF" }, "按钮"));
        });
        editor.focus();
        editor.nodeChanged();
    }

    function insertColumns(cla) {
        var html = '<div class="container-fluid"><div class="row">';
        for (var i = 0; i < cla.length; i++) {
            html += '<div class="col-sm-' + cla[i] + '"><p>' + (i + 1) + '. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.' + '</p></div>';
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
            editor.selection.setContent(editor.dom.createHTML("div", { "class": cla, role: "alert" }, "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas."));
        });
        editor.focus();
        editor.nodeChanged();
    }

    function insertPanel(cla) {
        var html = '<div class="' + cla + '">\
                      <div class="panel-heading">Morbi</div>\
                      <div class="panel-body">\
                        <h1>HTML Ipsum Presents</h1>\
                        <p><strong>Pellentesque habitant morbi tristique</strong> senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. <em>Aenean ultricies mi vitae est.</em> Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, <code>commodo vitae</code>, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. <a href="#">Donec non enim</a> in turpis pulvinar facilisis. Ut felis.</p>\
                        <h2>Header Level 2</h2>\
                        <ol>\
                           <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>\
                           <li>Aliquam tincidunt mauris eu risus.</li>\
                        </ol>\
                        <blockquote><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna. Cras in mi at felis aliquet congue. Ut a est eget ligula molestie gravida. Curabitur massa. Donec eleifend, libero at sagittis mollis, tellus est malesuada tellus, at luctus turpis elit sit amet quam. Vivamus pretium ornare est.</p></blockquote>\
                        <h3>Header Level 3</h3>\
                        <ul>\
                           <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>\
                           <li>Aliquam tincidunt mauris eu risus.</li>\
                        </ul>\
                      </div>\
                      <div class="panel-footer">Aliquam tincidunt mauris eu risus.</div>\
                    </div>';
        editor.undoManager.transact(function () {
            editor.selection.setContent(html);
        });
        editor.focus();
        editor.nodeChanged();
    }

    editor.ui.registry.addButton('bootstrap', {
        icon: 'template',
        tooltip: '模板',
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
                                    type: "grid",
                                    columns: 2,
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
                                        }
                                    ]
                                },
                                {
                                    type: "htmlpanel",
                                    html:"<hr/>"
                                },
                                {
                                    type: "grid",
                                    columns: 2,
                                    items: [
                                        {
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
                                        }, {
                                            type: 'button',
                                            name: 'btn btn-link',
                                            text: '链接'
                                        }
                                    ]
                                }
                            ]
                        },
                        {
                            title: "分列",
                            items: [
                                {
                                    type: "grid", columns: 2,
                                    items: [
                                        {
                                            type: 'button', text: "6 - 6", name: "6-6"
                                        },
                                        {
                                            type: 'button', text: "7 - 5", name: "7-5"
                                        },
                                        {
                                            type: 'button', text: "8 - 4", name: "8-4"
                                        }
                                    ]
                                },
                                {
                                    type: "htmlpanel",
                                    html: "<hr/>"
                                },
                                {
                                    type: "grid", columns: 2,
                                    items: [
                                        {
                                            type: 'button', text: "9 - 3", name: "9-3"
                                        },
                                        {
                                            type: 'button', text: "5 - 7", name: "5-7"
                                        },
                                        {
                                            type: 'button', text: "4 - 8", name: "4-8"
                                        }
                                    ]
                                },
                                {
                                    type: "htmlpanel",
                                    html: "<hr/>"
                                },
                                {
                                    type: "grid", columns: 2,
                                    items: [
                                        {
                                            type: 'button', text: "3 - 9", name: "3-9"
                                        },
                                        {
                                            type: 'button', text: "4 - 4 - 4", name: "4-4-4"
                                        },
                                        {
                                            type: 'button', text: "3 - 6 - 3", name: "3-6-3"
                                        }
                                    ]
                                },
                                {
                                    type: "htmlpanel",
                                    html: "<hr/>"
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
                                    type: "grid", columns: 2,
                                    items: [
                                        {
                                            type: 'button', text: "默认", name: "alert alert-default"
                                        },
                                        {
                                            type: 'button', text: "主要", name: "alert alert-primary"
                                        },
                                        {
                                            type: 'button', text: "危险", name: "alert alert-danger"
                                        }
                                    ]
                                },
                                {
                                    type: "htmlpanel",
                                    html: "<hr/>"
                                },
                                {
                                    type: "grid", columns: 2,
                                    items: [
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
                                }                                
                            ]
                        },
                        {
                            title: "面板",
                            items: [
                                {
                                    type: "grid", columns: 2,
                                    items: [
                                        {
                                            type: 'button', text: "默认", name: "panel panel-default"
                                        },
                                        {
                                            type: 'button', text: "主要", name: "panel panel-primary"
                                        },
                                        {
                                            type: 'button', text: "危险", name: "panel panel-danger"
                                        }
                                    ]
                                },
                                {
                                    type: "htmlpanel",
                                    html: "<hr/>"
                                },
                                {
                                    type: "grid", columns: 2,
                                    items: [
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
                        }
                    ]
                },
                buttons: [
                    {
                        type: 'cancel',
                        name: 'cancel',
                        text: '取消'
                    },
                    {
                        type: 'submit',
                        name: 'cancel',
                        text: '确定',
                        primary: true
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