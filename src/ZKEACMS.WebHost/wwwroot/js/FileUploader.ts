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
        } else {
            
           

        }
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
        let range = 1024 * 1024;
        let end = start + range;
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
        } else {
            let uploader = this;
            xhr.onload = function (e) {
                uploader.SliceSend(end + 1, url);
            };
        }       
       
        var progress = this.OnProgress;
        xhr.onprogress = function (e) {
           

            
            progress.call(this, e);
        }
        xhr.send(fd);
    }
}