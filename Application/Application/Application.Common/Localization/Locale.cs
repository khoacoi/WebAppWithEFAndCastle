using Microsoft.Practices.ServiceLocation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Application.Common.Localization
{
    public static class Locale
    {
        public static string GetString(string key, Type resourceType, params object[] paras)
        {
            var localizer = ServiceLocator.Current.GetInstance<ILocalizer>();
            return localizer.GetString(key, resourceType, paras);
        }
    }
}
