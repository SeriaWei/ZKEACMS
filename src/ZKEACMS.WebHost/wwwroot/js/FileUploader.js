var FileUploader = /** @class */ (function () {
    function FileUploader(fileData) {
        this.fileData = fileData;
        this.FileData = fileData;
    }
    FileUploader.prototype.Send = function (url) {
        this.SliceSend(0, url);
    };
    FileUploader.prototype.AddFormData = function (data) {
        if (this.OtherData == null) {
            this.OtherData = new Array();
        }
        this.OtherData.push(data);
    };
    FileUploader.prototype.OnComplete = function (e) {
    };
    FileUploader.prototype.OnProgress = function (e) {
    };
    FileUploader.prototype.SliceSend = function (start, url) {
        var uploader = this;
        var range = 1024 * 1024;
        var end = start + range;
        if (end > this.FileData.size) {
            end = this.FileData.size;
        }
        var chunk = this.FileData.slice(start, end);
        var fd = new FormData();
        fd.append("file", chunk, this.FileData.name);
        if (this.OtherData != null) {
            for (var i = 0; i < this.OtherData.length; i++) {
                fd.append(this.OtherData[i].Name, this.OtherData[i].Vale);
            }
        }
        fd.append("position", start.toString());
        var xhr = new XMLHttpRequest();
        xhr.open('POST', url);
        if (end == this.FileData.size) {
            xhr.onload = this.OnComplete;
        }
        else {
            xhr.onload = function (e) {
                uploader.SliceSend(end, url);
            };
        }
        xhr.onprogress = function (e) {
            var event = new ProgressEvent("ProgressEvent", { loaded: e.loaded + start, total: uploader.FileData.size, });
            uploader.OnProgress.call(this, event);
        };
        xhr.send(fd);
    };
    return FileUploader;
}());
//# sourceMappingURL=FileUploader.js.map