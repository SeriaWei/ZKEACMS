/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */


using SixLabors.Fonts;
using SixLabors.ImageSharp;
using SixLabors.ImageSharp.Formats;

namespace ZKEACMS.Captcha
{
    public interface IImageGenerator
    {
        string[] FontFamilies { get; set; }
        Color[] TextColor { get; set; }
        Color[] DrawLinesColor { get; set; }
        float MinLineThickness { get; set; }
        float MaxLineThickness { get; set; }
        ushort Width { get; set; } 
        ushort Height { get; set; } 
        ushort NoiseRate { get; set; } 
        Color[] NoiseRateColor { get; set; } 
        byte FontSize { get; set; } 
        FontStyle FontStyle { get; set; } 
        EncoderTypes EncoderType { get; set; }
        IImageEncoder Encoder { get; }
        byte DrawLines { get; set; } 
        byte MaxRotationDegrees { get; set; }

        byte[] Generate(string text);
    }
}