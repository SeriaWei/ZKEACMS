/*!
 * http://www.zkea.net/
 * Copyright 2022 ZKEASOFT
 * http://www.zkea.net/licenses
 */
tinymce.PluginManager.add('docx2html', function (editor) {
    editor.ui.registry.addIcon('word', '<svg fill="#000000" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 30 30" width="24px" height="24px"><path d="M 15 3 A 2 2 0 0 0 14.599609 3.0429688 L 14.597656 3.0410156 L 4.6601562 5.0292969 L 4.6289062 5.0351562 L 4.6269531 5.0371094 A 2 2 0 0 0 3 7 L 3 23 A 2 2 0 0 0 4.6289062 24.964844 L 14.589844 26.957031 L 14.597656 26.958984 A 2 2 0 0 0 15 27 A 2 2 0 0 0 17 25 L 17 5 A 2 2 0 0 0 15 3 z M 19 5 L 19 8 L 23 8 C 23.552 8 24 8.448 24 9 C 24 9.552 23.552 10 23 10 L 19 10 L 19 12 L 23 12 C 23.552 12 24 12.448 24 13 C 24 13.552 23.552 14 23 14 L 19 14 L 19 16 L 23 16 C 23.552 16 24 16.448 24 17 C 24 17.552 23.552 18 23 18 L 19 18 L 19 20 L 23 20 C 23.552 20 24 20.448 24 21 C 24 21.552 23.552 22 23 22 L 19 22 L 19 25 L 25 25 C 26.105 25 27 24.105 27 23 L 27 7 C 27 5.895 26.105 5 25 5 L 19 5 z M 5.2636719 10 L 7.1230469 10 L 8.0625 16.632812 L 8.1503906 16.632812 L 9.2773438 10 L 10.712891 10 L 11.880859 16.632812 L 11.96875 16.632812 L 12.890625 10 L 14.736328 10 L 12.896484 20 L 11.216797 20 L 10.039062 13.873047 L 9.9511719 13.873047 L 8.7949219 20 L 7.1035156 20 L 5.2636719 10 z"/></svg>');
    function loadDependency(callBack) {
        var isDependencyLoaded = document.getElementById("mammoth-convert");
        if (isDependencyLoaded) {
            callBack();
            return;
        }
        Easy.Block()
        var script = document.createElement('script');
        script.onload = function () {
            Easy.UnBlock();
            callBack();
        };
        script.setAttribute("id", "mammoth-convert");
        // ~/lib/mammoth.browser.js
        script.src = "https://cdn.bootcdn.net/ajax/libs/mammoth/1.4.21/mammoth.browser.min.js";
        document.head.appendChild(script);
    }
    function ConvertToHtml(displayResult) {
        var reader = new FileReader();
        reader.onload = function (loadEvent) {
            var arrayBuffer = loadEvent.target.result;
            var options = {
                styleMap: [
                    "table => table.table.table-hover.table-bordered.table-striped:fresh"
                ]
            };
            mammoth.convertToHtml({ arrayBuffer: arrayBuffer }, options).then(displayResult)
                .catch(function (e) {
                    displayResult({});
                })
                .done();

        };
        var fileInput = document.getElementById("form-docx2html-field-file");
        reader.readAsArrayBuffer(fileInput.files[0]);
    }
    editor.ui.registry.addButton('docx2html', {
        icon: 'word',
        tooltip: 'Word',
        onAction: function () {
            loadDependency(function () {
                editor.windowManager.open({
                    title: 'Word',
                    body: {
                        type: 'panel',
                        items: [
                            {
                                type: 'htmlpanel',
                                html: '<div class="tox-form__group"><input type="file" accept=".docx" class="tox-textfield" id="form-docx2html-field-file"></div>'
                            }
                        ]
                    },
                    buttons: [
                        {
                            type: 'cancel',
                            text: 'cancel'
                        },
                        {
                            type: 'submit',
                            text: 'OK'
                        }
                    ],
                    onSubmit: function (api) {
                        Easy.Block();
                        ConvertToHtml(function (result) {
                            Easy.UnBlock();
                            if (result.value) {
                                editor.undoManager.transact(function () {
                                    editor.selection.setContent(result.value);
                                });
                            }
                        });
                        api.close();
                    }
                });
            });

        }
    });
});