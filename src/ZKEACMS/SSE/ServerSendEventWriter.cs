using Microsoft.AspNetCore.Http;
using System;
using System.Buffers;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.SSE
{
    public class ServerSendEventWriter : IDisposable
    {
        private readonly HttpContext _httpContext;

        public ServerSendEventWriter(HttpContext httpContext)
        {
            _httpContext = httpContext;
        }

        public string LastEventId
        {
            get
            {
                return _httpContext.Request.Headers["Last-Event-ID"];
            }
        }

        public async Task WriteAsync(ServerSendEvent sse)
        {
            await _httpContext.Response.BodyWriter.WriteAsync(Encoding.UTF8.GetBytes(sse.ToString()));
            await _httpContext.Response.BodyWriter.FlushAsync();
        }
        public async Task WriteAsync(string data)
        {
            await WriteAsync(new ServerSendEvent { Data = data });
        }

        public void Dispose()
        {
            _httpContext.Response.BodyWriter.Write(Encoding.UTF8.GetBytes(ServerSendEvent.End.ToString()));
        }
    }
}
