/* http://www.zkea.net/ 
 * Copyright 2021 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy;
using Easy.Mvc.StateProviders;
using System;
using System.Collections.Generic;
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
            if (currencyOption.CurrencyID > 0)
            {
                var currency = _currencyService.Get(currencyOption.CurrencyID);
                currencyOption.Name = currency.Title;
                currencyOption.Code = currency.Code;
                currencyOption.Symbol = currency.Symbol;
            }
            else
            {
                currencyOption.Name = "Chinese Renmenbi";
                currencyOption.Code = "CNY";
                currencyOption.Symbol = "￥";
            }
            return (context) =>
            {
                return (T)(object)currencyOption;
            };
        }
    }
}
