var codeEditor = (function () {
    require.config({ paths: { vs: '/lib/monaco/min/vs' } });

    return {
        createAsync: function (ele) {
            return new Promise(resolve => {
                require(['vs/editor/editor.main'], function () {
                    var codeContainer = document.createElement("div");
                    codeContainer.style.width = ele.clientWidth + "px";
                    codeContainer.style.minHeight = "500px";
                    codeContainer.style.border = "1px solid #ccc";
                    codeContainer.style.backgroundColor = "#fff";
                    ele.style = "border:0;clip:rect(0 0 0 0);-webkit-clip-path:inset(50%);clip-path:inset(50%);height:1px;overflow:hidden;padding:0;position:absolute;width:1px;white-space:nowrap;";
                    ele.parentElement.insertBefore(codeContainer, ele);
                    var editor = monaco.editor.create(codeContainer, {
                        value: ele.value,
                        language: ele.dataset.lan || "razor",
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
                    var editor = monaco.editor.create(container, {
                        value: code,
                        language: language
                    });
                    resolve(editor);
                });
            });

        }
    }
})();