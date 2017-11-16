using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ZKEACMS.Shop.Payment
{
    public class AliPayConfig
    {
        /// <summary>
        /// 应用ID,您的APPID
        /// </summary>
        public string AppId { get; set; }
        /// <summary>
        /// 合作商户uid
        /// </summary>
        public string Uid { get; set; }
        /// <summary>
        /// 支付宝网关
        /// </summary>
        public string Gatewayurl { get; set; }
        /// <summary>
        /// 商户私钥，您的原始格式RSA私钥
        /// </summary>
        public string PrivateKey { get; set; }
        /// <summary>
        /// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
        /// </summary>
        public string AlipayPublicKey { get; set; }
        /// <summary>
        /// 签名方式
        /// </summary>
        public string SignType { get; set; }
        /// <summary>
        /// 编码格式
        /// </summary>
        public string CharSet { get; set; }
    }
}
