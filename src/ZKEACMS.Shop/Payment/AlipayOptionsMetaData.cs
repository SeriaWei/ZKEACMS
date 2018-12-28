using Alipay.AopSdk.AspnetCore;
using Easy.MetaData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ZKEACMS.Shop.Payment
{
    public class AlipayOptionsMetaData : ViewMetaData<AlipayOptions>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.CharSet).AsHidden();
            ViewConfig(m => m.IsKeyFromFile).AsHidden();
            ViewConfig(m => m.SignType).AsHidden().Required();


            ViewConfig(m => m.AppId).AsTextBox().Required();
            ViewConfig(m => m.Uid).AsTextBox().Required().SetDisplayName("商户UID");
            ViewConfig(m => m.Gatewayurl).AsTextBox().Required().SetDisplayName("支付宝网关");
            ViewConfig(m => m.AlipayPublicKey).AsTextArea().Required().SetDisplayName("应用公钥");
            ViewConfig(m => m.PrivateKey).AsTextArea().Required().SetDisplayName("应用私钥");
        }
    }
}
