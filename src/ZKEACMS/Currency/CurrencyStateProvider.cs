/* http://www.zkea.net/ 
 * Copyright 2021 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy;
using Easy.Mvc.StateProviders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ZKEACMS.Currency;
using ZKEACMS.Setting;

namespace ZKEACMS.Currency
{
    public class CurrencyStateProvider : IApplicationContextStateProvider
    {
        private readonly ICurrencyService _currencyService;
        private readonly IApplicationSettingService _applicationSettingService;

        public CurrencyStateProvider(ICurrencyService currencyService, IApplicationSettingService applicationSettingService)
        {
            _currencyService = currencyService;
            _applicationSettingService = applicationSettingService;
        }

        public string Name => "Currency";

        public Func<IApplicationContext, T> Get<T>()
        {
            var currencyOption = _applicationSettingService.Get<CurrencyOption>();
            CurrencyEntry currency = null;
            if (currencyOption.CurrencyID > 0)
            {
                currency = _currencyService.Get(currencyOption.CurrencyID);
            }
            else
            {
                currency = _currencyService.Get(m => m.Code == "CNY").FirstOrDefault();
            }
            if (currency == null)
            {
                currency = new CurrencyEntry
                {
                    Title = "Chinese Renmenbi",
                    Code = "CNY",
                    Symbol = "￥"
                };
            }
            currencyOption.CurrencyID = currency.ID;
            currencyOption.Name = currency.Title;
            currencyOption.Code = currency.Code;
            currencyOption.Symbol = currency.Symbol;
            return (context) =>
            {
                return (T)(object)currencyOption;
            };
        }
    }
}
