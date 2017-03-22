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
            string valuStr = null;
            T value = default(T);

            if (_httpContext.Request.Cookies.TryGetValue(name, out valuStr))
            {
                if (!string.IsNullOrWhiteSpace(valuStr))
                {
                    TypeConverter converter = TypeDescriptor.GetConverter(typeof(T));

                    try
                    {
                        value = (T)converter.ConvertFromString(valuStr);
                    }
                    catch (NotSupportedException)
                    {
                        if (converter.CanConvertFrom(typeof(string)))
                        {
                            value = (T)converter.ConvertFrom(valuStr);
                        }
                    }
                }

                if (expireOnceRead)
                {
                    Delete(name);
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

        public void Delete(string name)
        {
            _httpContext.Response.Cookies.Append(name, "", new CookieOptions { Expires = DateTime.Now.AddDays(-1d) });
        }
    }
}