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
            ViewConfig(m => m.Uid).AsTextBox().Required();
            ViewConfig(m => m.Gatewayurl).AsTextBox().Required();
            ViewConfig(m => m.AlipayPublicKey).AsTextArea().Required();
            ViewConfig(m => m.PrivateKey).AsTextArea().Required();
        }
    }
}
