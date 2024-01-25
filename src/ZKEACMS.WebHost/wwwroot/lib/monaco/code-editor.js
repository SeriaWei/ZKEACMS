var codeEditor = (function () {
    require.config({ paths: { vs: '/lib/monaco/min/vs' } });

    if ($.validator) {        
       var validators = {
            "json": {
                valid: function (value, element) {
                    return monaco.editor.getModelMarkers().length == 0;
                },
                getErrors: function (value, element) {
                    var models = monaco.editor.getModelMarkers();
                    if (models.length == 0) return "Unknown error";
                    var message = "";
                    for (var i = 0; i < models.length; i++) {
                        message += models[i].message + " on line: " + models[i].startLineNumber + ", at column: " + models[i].startColumn;
                        break;
                    }
                    return message;
                }
            }
        }

        $.validator.addMethod("lan", function (value, element) {
            if (element.dataset.val == null || element.dataset.val === false || element.dataset.val === "false") return true;

            var validator = validators[element.dataset.lan];
            if (validator == null) return true;

            return validator.valid(value, element);
        }, function (value, element) {
            var validator = validators[element.dataset.lan];
            if (validator == null) return "Unknown error";

            return validator.getErrors(value, element);
        });
        $.validator.unobtrusive.adapters.add('lan', [], function (options) {
            options.rules["lan"] = {}
        });
    }

    return {
        createAsync: function (ele) {
            return new Promise(resolve => {
                require(['vs/editor/editor.main'], function () {
                    const event = new CustomEvent("editor.ready", { detail: { editor: monaco } });
                    ele.dispatchEvent(event);
                    var codeContainer = document.createElement("div");
                    codeContainer.style.width = ele.dataset.width || (ele.clientWidth + "px");
                    codeContainer.style.minHeight = ele.dataset.height || "500px";
                    codeContainer.style.border = "1px solid #ccc";
                    codeContainer.style.backgroundColor = "#fff";
                    ele.style = "border:0;clip:rect(0 0 0 0);-webkit-clip-path:inset(50%);clip-path:inset(50%);height:1px;overflow:hidden;padding:0;position:absolute;width:1px;white-space:nowrap;";
                    ele.parentElement.insertBefore(codeContainer, ele);
                    var editor = monaco.editor.create(codeContainer, {
                        value: ele.value,
                        language: ele.dataset.lan || "razor",
                        scrollBeyondLastLine: false,
                        minimap: { enabled: false }
                    });
                    editor.onDidChangeModelContent(e => {
                        ele.value = editor.getValue();
                    });
                    resolve(editor);
                });
            });
        },
        createToAsync: function (container, code, language) {
            return new Promise(resolve => {
                require(['vs/editor/editor.main'], function () {
                    const event = new CustomEvent("editor.ready", { detail: { editor: monaco } });
                    container.dispatchEvent(event);
                    var editor = monaco.editor.create(container, {
                        value: code,
                        language: language,
                        scrollBeyondLastLine: false,
                        minimap: { enabled: false }
                    });
                    resolve(editor);
                });
            });

        }
    }
})();