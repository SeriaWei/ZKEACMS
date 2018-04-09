//https://github.com/dotnetcore/Alipay.AopSdk.Core/blob/master/Alipay.AopSdk.AspnetCore/AlipayService.cs
using Alipay.AopSdk.AspnetCore;
using Alipay.AopSdk.Core;
using Alipay.AopSdk.Core.Util;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.DataArchived;

namespace ZKEACMS.Shop.Service
{
    public class AlipayService : IAlipayService
    {
        public AlipayOptions Options { get; set; }

        public const string SettingKey = "ZKEACMS.Shop.AliPayConfigOptions";

        private readonly IAopClient _aopClient;
        public AlipayService(IOptions<AlipayOptions> alipayOptions, IDataArchivedService dataArchivedService)
        {
            Options = dataArchivedService.Get(SettingKey, () => alipayOptions.Value);
            _aopClient = new DefaultAopClient(Options.Gatewayurl, Options.AppId, Options.PrivateKey, "json", "1.0",
                Options.SignType, Options.AlipayPublicKey, Options.CharSet, Options.IsKeyFromFile);
        }
        public T Execute<T>(IAopRequest<T> request) where T : AopResponse
        {
            return _aopClient.Execute(request);
        }

        public T Execute<T>(IAopRequest<T> request, string session) where T : AopResponse
        {
            return _aopClient.Execute(request, session);
        }

        public T Execute<T>(IAopRequest<T> request, string session, string appAuthToken) where T : AopResponse
        {
            return _aopClient.Execute(request, session, appAuthToken);
        }

        public T pageExecute<T>(IAopRequest<T> request) where T : AopResponse
        {
            return _aopClient.pageExecute(request);
        }

        public T pageExecute<T>(IAopRequest<T> request, string session, string reqMethod) where T : AopResponse
        {
            return _aopClient.pageExecute(request, session, reqMethod);
        }

        public T SdkExecute<T>(IAopRequest<T> request) where T : AopResponse
        {
            return _aopClient.SdkExecute(request);
        }

        public bool RSACheckV1(Dictionary<string, string> data)
        {
            return AlipaySignature.RSACheckV1(data, Options.AlipayPublicKey, Options.CharSet, Options.SignType, false);
        }
    }
}
