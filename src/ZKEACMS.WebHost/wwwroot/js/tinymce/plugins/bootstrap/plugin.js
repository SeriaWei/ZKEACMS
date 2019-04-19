/*!
 * http://www.zkea.net/
 * Copyright 2016 ZKEASOFT
 * http://www.zkea.net/licenses
 */
tinymce.PluginManager.add('bootstrap', function (editor) {
    //----------------------------------------------------------------//
    function insertButton(cla) {
        editor.undoManager.transact(function () {
            editor.selection.setContent(editor.dom.createHTML("a", { "class": cla,"href":"http://www.zkea.net" }, "按钮"));
        });
        editor.focus();
        editor.nodeChanged();
    }

    editor.addMenuItem('insertbutton', {
        icon: '',
        text: '插入按钮',
        context: 'insert',
        menu: [
            {
                text: "扁平", onclick: function () {
                    insertButton("btn btn-flat");
                }
            },
            {
                text: "默认", onclick: function () {
                    insertButton("btn btn-default");
                }
            },
            {
                text: "主要", onclick: function () {
                    insertButton("btn btn-primary");
                }
            },
            {
                text: "危险", onclick: function () {
                    insertButton("btn btn-danger");
                }
            },
            {
                text: "警告", onclick: function () {
                    insertButton("btn btn-warning");
                }
            },
            {
                text: "信息", onclick: function () {
                    insertButton("btn btn-info");
                }
            },
            {
                text: "成功", onclick: function () {
                    insertButton("btn btn-success");
                }
            }
        ],
        prependToContext: false
    });
    //----------------------------------------------------------------//
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

    editor.addMenuItem('insertcolumns', {
        icon: '',
        text: '插入列',
        context: 'insert',
        menu: [
            {
                text: "6 - 6", onclick: function () {
                    insertColumns([6, 6]);
                }
            },
            {
                text: "7 - 5", onclick: function () {
                    insertColumns([7, 5]);
                }
            },
            {
                text: "8 - 4", onclick: function () {
                    insertColumns([8, 4]);
                }
            },
            {
                text: "9 - 3", onclick: function () {
                    insertColumns([9, 3]);
                }
            },
            {
                text: "5 - 7", onclick: function () {
                    insertColumns([5, 7]);
                }
            },
            {
                text: "4 - 8", onclick: function () {
                    insertColumns([4, 8]);
                }
            },
            {
                text: "3 - 9", onclick: function () {
                    insertColumns([3, 9]);
                }
            },
            {
                text: "4 - 4 - 4", onclick: function () {
                    insertColumns([4, 4, 4]);
                }
            },
            {
                text: "3 - 6 - 3", onclick: function () {
                    insertColumns([3, 6, 3]);
                }
            },
            {
                text: "3 - 3 - 3 - 3", onclick: function () {
                    insertColumns([3, 3, 3, 3]);
                }
            }
        ],
        prependToContext: false
    });
    //----------------------------------------------------------------//

    function insertAlert(cla) {
        editor.undoManager.transact(function () {
            editor.selection.setContent(editor.dom.createHTML("div", { "class": cla, role: "alert" }, "这是一则重要的消息,欢迎使用ZKEACMS进行创作"));
        });
        editor.focus();
        editor.nodeChanged();
    }

    editor.addMenuItem('insertAlert', {
        icon: '',
        text: '插入警告框',
        context: 'insert',
        menu: [
            {
                text: "默认", onclick: function () {
                    insertAlert("alert alert-default");
                }
            },
            {
                text: "主要", onclick: function () {
                    insertAlert("alert alert-primary");
                }
            },
            {
                text: "危险", onclick: function () {
                    insertAlert("alert alert-danger");
                }
            },
            {
                text: "警告", onclick: function () {
                    insertAlert("alert alert-warning");
                }
            },
            {
                text: "信息", onclick: function () {
                    insertAlert("alert alert-info");
                }
            },
            {
                text: "成功", onclick: function () {
                    insertAlert("alert alert-success");
                }
            }
        ],
        prependToContext: false
    });

    //----------------------------------------------------------------//

    function insertPanel(cla) {
        var html = '<div class="'+cla+'">\
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

    editor.addMenuItem('insertPanel', {
        icon: '',
        text: '插入面板',
        context: 'insert',
        menu: [
            {
                text: "默认", onclick: function () {
                    insertPanel("panel panel-default");
                }
            },
            {
                text: "主要", onclick: function () {
                    insertPanel("panel panel-primary");
                }
            },
            {
                text: "危险", onclick: function () {
                    insertPanel("panel panel-danger");
                }
            },
            {
                text: "警告", onclick: function () {
                    insertPanel("panel panel-warning");
                }
            },
            {
                text: "信息", onclick: function () {
                    insertPanel("panel panel-info");
                }
            },
            {
                text: "成功", onclick: function () {
                    insertPanel("panel panel-success");
                }
            }
        ],
        prependToContext: false
    });
});