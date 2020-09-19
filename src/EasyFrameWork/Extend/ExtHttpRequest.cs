/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Microsoft.AspNetCore.Http;
using System;
using System.Linq;

namespace Easy.Extend
{
    public static class ExtHttpRequest
    {
        public static string[] GetUserLanguages(this HttpRequest httpRequest)
        {
            return httpRequest.GetTypedHeaders()
                .AcceptLanguage
                ?.OrderByDescending(x => x.Quality ?? 1)
                .Select(x => x.Value.ToString())
                .ToArray() ?? Array.Empty<string>();
        }
    }
}
