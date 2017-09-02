interface KeyValue {
    Name: string;
    Vale: string;
}
class FileUploader {
    FileData: File;
    OtherData: Array<KeyValue>;
    constructor(public fileData) {
        this.FileData = fileData;
    }
    Send(url: string): void {
        this.SliceSend(0, url);
    }
    AddFormData(data: KeyValue): void {
        if (this.OtherData == null) {
            this.OtherData = new Array<KeyValue>();
        }
        this.OtherData.push(data);
    }
    OnComplete(this: XMLHttpRequestEventTarget, e: Event): any {

    }
    OnProgress(this: XMLHttpRequestEventTarget, e: ProgressEvent): any {

    }

    SliceSend(start: number, url: string): void {
        let uploader = this;
        let range = 1024 * 1024;
        let end = start + range;
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
        } else {
            xhr.onload = function (e) {
                uploader.SliceSend(end, url);
            };
        }
        xhr.onprogress = function (e) {
            let event = new ProgressEvent("ProgressEvent", { loaded: e.loaded + start, total: uploader.FileData.size, });
            uploader.OnProgress.call(this, event);
        }
        xhr.send(fd);
    }
}