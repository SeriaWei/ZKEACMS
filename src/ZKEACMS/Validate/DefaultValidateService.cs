///* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy;
using Easy.Extend;
using Easy.Cache;
using Microsoft.AspNetCore.Http;

namespace ZKEACMS.Validate
{
    public class DefaultValidateService : IValidateService
    {
        private const string ValidateCodeKey = "Session_ValidateCode_{0}";
        private readonly IHttpContextAccessor  _httpContextAccessor;
        //private ICacheManager<string> _cacheMgr;
        public DefaultValidateService(IHttpContextAccessor httpContextAccessor /*, ICacheManager<string> cacheManager*/)
        {
            _httpContextAccessor = httpContextAccessor;
            //_cacheMgr = cacheManager;
        }

        public byte[] GenerateCode(int num = 5)
        {
            ValidateCode validateCode = new ValidateCode();
            string code = validateCode.CreateValidateCode(num);
            //string key = GetCacheKey();
            //_cacheMgr.Remove(key);
            //_cacheMgr.Add(key, code);
            _httpContextAccessor.HttpContext.Session.SetString(ValidateCodeKey, code);
            return validateCode.CreateValidateGraphic(code);
        }

        public bool ValidateCode(string code)
        {
            if (code.IsNullOrWhiteSpace()) return false;

            return code.Equals(GetCode());
        }

        public string GetCode()
        {
            return  _httpContextAccessor.HttpContext.Session.GetString(ValidateCodeKey);
            //return _cacheMgr.Get(GetCacheKey());
        }

        private string GetCacheKey()
        {
            return string.Format(ValidateCodeKey, _httpContextAccessor.HttpContext.Session.Id);
        }
    }
}
