/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */

namespace Easy.Mvc
{
    public class AjaxResult
    {
        public AjaxResult()
        {

        }
        public AjaxResult(AjaxStatus status, string msg)
        {
            this.Message = msg;
            this.Status = status;
        }
        public string Message { get; set; }
        public string Location { get; set; }
        public object Data { get; set; }
        public AjaxStatus Status { get; set; }
    }
    public enum AjaxStatus
    {
        Normal = 1,
        Warn = 2,
        Error = 3,
        Redirect = 4
    }
}
