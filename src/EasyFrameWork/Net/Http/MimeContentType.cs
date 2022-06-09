using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Easy.Net.Http
{
    public class MimeContentType
    {
        public const string Json = "application/json";
        public const string Form = "application/x-www-form-urlencoded";
        public const string MultipartRegex = "^multipart/.*$";
        public const string TextRegex = "^text/.*$";
    }
}
