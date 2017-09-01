var FileUploader = (function () {
    function FileUploader(fileData) {
        this.fileData = fileData;
        this.FileData = fileData;
    }
    FileUploader.prototype.Send = function (url) {
        if (this.FileData.size <= 1051648) {
            var formData = new FormData();
            formData.append('file', this.FileData);
            for (var i = 0; i < this.OtherData.length; i++) {
                formData.append(this.OtherData[i].Name, this.OtherData[i].Vale);
            }
            var xhr = new XMLHttpRequest();
            xhr.open('POST', url);
            xhr.onload = this.OnComplete;
            xhr.onprogress = this.OnProgress;
            xhr.send(formData);
        }
        else {
        }
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
        var range = 1024 * 1024;
        var end = start + range;
        if (end > this.FileData.size) {
            end = this.FileData.size;
        }
        var chunk = this.FileData.slice(start, end);
        var fd = new FormData();
        fd.append("file", chunk, this.FileData.name);
        var xhr = new XMLHttpRequest();
        xhr.open('POST', url);
        if (end == this.FileData.size) {
            xhr.onload = this.OnComplete;
        }
        else {
            var uploader_1 = this;
            xhr.onload = function (e) {
                uploader_1.SliceSend(end + 1, url);
            };
        }
        var progress = this.OnProgress;
        xhr.onprogress = function (e) {
            progress.call(this, e);
        };
        xhr.send(fd);
    };
    return FileUploader;
}());
