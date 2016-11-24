/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.ComponentModel;
using Microsoft.AspNetCore.Http;

namespace Easy.Mvc.ValueProvider
{
    public class Cookie : ICookie
    {
        private readonly HttpContext _httpContext;
        private const float DefaultExpireDurationMinutes = 43200; // 1 month
        private const bool DefaultHttpOnly = true;
        private const bool ExpireWithBrowser = false;

        public Cookie(IHttpContextAccessor httpContextAccessor)
        {
            this._httpContext = httpContextAccessor.HttpContext;
        }

        public T GetValue<T>(string name)
        {
            return GetValue<T>(name, false);
        }

        public T GetValue<T>(string name, bool expireOnceRead)
        {
            var cookie = _httpContext.Request.Cookies[name];
            T value = default(T);

            if (cookie != null)
            {
                if (!string.IsNullOrWhiteSpace(cookie))
                {
                    TypeConverter converter = TypeDescriptor.GetConverter(typeof(T));

                    try
                    {
                        value = (T)converter.ConvertFromString(cookie);
                    }
                    catch (NotSupportedException)
                    {
                        if (converter.CanConvertFrom(typeof(string)))
                        {
                            value = (T)converter.ConvertFrom(cookie);
                        }
                    }
                }

                if (expireOnceRead)
                {
                    _httpContext.Response.Cookies.Delete(name);
                }
            }

            return value;
        }

        public void SetValue<T>(string name, T value)
        {
            SetValue(name, value, DefaultExpireDurationMinutes, DefaultHttpOnly, ExpireWithBrowser);
        }

        public void SetValue<T>(string name, T value, float expireDurationInMinutes)
        {
            SetValue(name, value, expireDurationInMinutes, DefaultHttpOnly, ExpireWithBrowser);
        }

        public void SetValue<T>(string name, T value, bool httpOnly, bool expireWithBrowser)
        {
            SetValue(name, value, DefaultExpireDurationMinutes, httpOnly, expireWithBrowser);
        }

        public void SetValue<T>(string name, T value, float expireDurationInMinutes, bool httpOnly, bool expireWithBrowser)
        {
            TypeConverter converter = TypeDescriptor.GetConverter(typeof(T));

            string cookieValue = string.Empty;

            try
            {
                cookieValue = converter.ConvertToString(value);
            }
            catch (NotSupportedException)
            {
                if (converter.CanConvertTo(typeof(string)))
                {
                    cookieValue = (string)converter.ConvertTo(value, typeof(string));
                }
            }

            if (!string.IsNullOrWhiteSpace(cookieValue))
            {

                if (expireWithBrowser)
                {

                    _httpContext.Response.Cookies.Append(name, cookieValue);
                }
                else
                {
                    _httpContext.Response.Cookies.Append(name, cookieValue, new CookieOptions
                    {
                        Expires = DateTime.Now.AddMinutes(expireDurationInMinutes),
                        HttpOnly = httpOnly
                    });
                }

            }
        }
    }
}