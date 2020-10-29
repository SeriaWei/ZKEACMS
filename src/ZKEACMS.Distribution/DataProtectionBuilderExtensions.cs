/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses 
 *
 */

using Microsoft.AspNetCore.DataProtection;
using Microsoft.AspNetCore.DataProtection.KeyManagement;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using ZKEACMS.Distribution.Service;

namespace ZKEACMS.Distribution
{
    public static class DataProtectionBuilderExtensions
    {
        public static IDataProtectionBuilder EnableDistribution(this IDataProtectionBuilder builder)
        {
            builder.SetApplicationName("ZKEACMS");
            builder.Services.AddSingleton<IConfigureOptions<KeyManagementOptions>>(services =>
            {
                var repository = services.GetService<IDistributionPersistKeysRepository>();
                return new ConfigureOptions<KeyManagementOptions>(options =>
                {
                    options.XmlRepository = repository;
                });
            });

            return builder;
        }
    }
}
