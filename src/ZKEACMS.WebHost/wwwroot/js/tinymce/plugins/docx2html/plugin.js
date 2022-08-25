/*!
 * http://www.zkea.net/
 * Copyright 2022 ZKEASOFT
 * http://www.zkea.net/licenses
 */
tinymce.PluginManager.add('docx2html', function (editor) {
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
                mammoth.convertToHtml({ arrayBuffer: arrayBuffer })
                    .then(displayResult)
                    .catch(function (e) {
                        displayResult({});
                    })
                    .done();
            
        };
        var fileInput = document.getElementById("form-docx2html-field-file");
        reader.readAsArrayBuffer(fileInput.files[0]);
    }
    editor.ui.registry.addButton('docx2html', {
        icon: 'gamma',
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
                                html: '<div class="tox-form__group"><input type="file" class="tox-textfield" id="form-docx2html-field-file"></div>'
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