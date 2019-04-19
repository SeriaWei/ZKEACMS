/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.DataTransfer
{
    public interface IValueTypeConvert
    {
        Type SupportType { get; }
        object Convert(string value);
    }
}
