/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */


using System.Collections.Generic;
using System.Drawing;

namespace ZKEACMS.Captcha
{
    public interface IImageGenerator
    {
        Color FontColor { get; set; }
        Color Background { get; set; }
        ushort Width { get; set; }
        ushort Height { get; set; }
        IList<FontFamily> Fonts { get; }

        byte[] Generate(string text);
    }
}