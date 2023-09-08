/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Microsoft.AspNetCore.Hosting;
using SixLabors.Fonts;
using SixLabors.ImageSharp;
using SixLabors.ImageSharp.Drawing.Processing;
using SixLabors.ImageSharp.Formats;
using SixLabors.ImageSharp.Formats.Jpeg;
using SixLabors.ImageSharp.Formats.Png;
using SixLabors.ImageSharp.PixelFormats;
using SixLabors.ImageSharp.Processing;
using System;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace ZKEACMS.Captcha
{
    public class DefaultImageGenerator : IImageGenerator
    {
        public DefaultImageGenerator(IWebHostEnvironment webHostEnvironment)
        {
            string fontDir = Path.Combine(webHostEnvironment.WebRootPath, "fonts");
            var fontCollection = new FontCollection();
            foreach (var item in Directory.GetFiles(fontDir, "*.ttf"))
            {
                fontCollection.Add(item);
            }
            FontFamilies = fontCollection.Families.ToArray();
        }
        public FontFamily[] FontFamilies { get; set; }
        public Color[] TextColor { get; set; } = new Color[] 
        {
            Color.Blue, Color.Black, Color.Red, Color.Brown, Color.Green, Color.DarkBlue, Color.DarkCyan,
            Color.DarkGoldenrod, Color.DarkGray, Color.DarkGreen, Color.DarkKhaki, Color.DarkMagenta, Color.DarkOliveGreen, Color.DarkOrange,Color.DarkOrchid,
            Color.DarkRed,Color.DarkSalmon, Color.DarkSeaGreen,Color.DarkSlateBlue,Color.DarkTurquoise,Color.DarkViolet
        };
        public Color[] DrawLinesColor { get; set; } = new Color[] { Color.LightBlue, Color.LightCoral, Color.LightCyan, Color.LightGray, Color.LightPink, Color.LightSalmon, Color.LightSeaGreen, Color.LightSkyBlue, Color.LightSlateGray, Color.LightSteelBlue };
        public float MinLineThickness { get; set; } = 0.7f;
        public float MaxLineThickness { get; set; } = 2.0f;
        public ushort Width { get; set; } = 100;
        public ushort Height { get; set; } = 35;
        public ushort NoiseRate { get; set; } = 20;
        public Color[] NoiseRateColor { get; set; } = new Color[] { Color.LightBlue, Color.LightCoral, Color.LightCyan, Color.LightGray, Color.LightPink, Color.LightSalmon, Color.LightSeaGreen, Color.LightSkyBlue, Color.LightSlateGray, Color.LightSteelBlue };
        public byte FontSize { get; set; } = 25;
        public FontStyle FontStyle { get; set; } = FontStyle.Regular;
        public EncoderTypes EncoderType { get; set; } = EncoderTypes.Jpeg;
        public IImageEncoder Encoder { get { return GetEncoder(EncoderType); } }
        public byte DrawLines { get; set; } = 5;
        public byte MaxRotationDegrees { get; set; } = 5;

        private Random _random { get; set; } = new Random(DateTime.Now.Microsecond);

        public byte[] Generate(string text)
        {
            byte[] result;

            using (var imgText = new Image<Rgba32>(Width, Height))
            {
                float position = 0;
                byte startWith = (byte)_random.Next(0, 10);
                imgText.Mutate(ctx => ctx.BackgroundColor(Color.Transparent));
                var fontFamily = FontFamilies[_random.Next(0, FontFamilies.Length)];
                var font = new Font(fontFamily, FontSize, FontStyle);

                foreach (char c in text)
                {
                    var location = new PointF(startWith + position, _random.Next(0, 13));
                    imgText.Mutate(ctx => ctx.DrawText(c.ToString(), font, TextColor[_random.Next(0, TextColor.Length)], location));
                    position += TextMeasurer.MeasureSize(c.ToString(), new TextOptions(font)).Width;
                }

                var rotation = GetRotation();
                imgText.Mutate(ctx => ctx.Transform(rotation));

                ushort size = (ushort)TextMeasurer.MeasureSize(text, new TextOptions(font)).Width;
                var img = new Image<Rgba32>(size + 10 + 5, Height);
                img.Mutate(ctx => ctx.BackgroundColor(Color.White));

                Parallel.For(0, DrawLines, i =>
                {
                    int x0 = _random.Next(0, _random.Next(0, 30));
                    int y0 = _random.Next(10, img.Height);
                    int x1 = _random.Next(img.Width / 2, img.Width);
                    int y1 = _random.Next(0, img.Height);
                    img.Mutate(ctx =>
                            ctx.DrawLine(TextColor[_random.Next(0, TextColor.Length)].WithAlpha(0.5f),
                                          GenerateNextFloat(MinLineThickness, MaxLineThickness),
                                          new PointF[] { new PointF(x0, y0), new PointF(x1, y1) })
                            );
                });

                Parallel.For(0, NoiseRate, i =>
                {
                    int x0 = _random.Next(0, img.Width);
                    int y0 = _random.Next(0, img.Height);
                    int size = _random.Next(1, 4);
                    img.Mutate(
                                ctx =>
                                {
                                    ctx.Fill(NoiseRateColor[_random.Next(0, NoiseRateColor.Length)], new RectangleF(new PointF(x0, y0), new SizeF(size, size)));
                                }
                            );
                });

                img.Mutate(ctx => ctx.DrawImage(imgText, 0.80f));

                img.Mutate(x =>
                {
                    x.Resize(Width, Height);
                });

                using (var ms = new MemoryStream())
                {
                    img.Save(ms, Encoder);
                    result = ms.ToArray();
                }
            }

            return result;
        }

        public static IImageEncoder GetEncoder(EncoderTypes encoderType)
        {
            IImageEncoder encoder;
            switch (encoderType)
            {
                case EncoderTypes.Png:
                    encoder = new PngEncoder();
                    break;
                case EncoderTypes.Jpeg:
                    encoder = new JpegEncoder();
                    break;
                default:
                    throw new ArgumentException($"Encoder '{encoderType}' not found!");
            };
            return encoder;
        }
        private float GenerateNextFloat(double min = -3.40282347E+38, double max = 3.40282347E+38)
        {
            double range = max - min;
            double sample = _random.NextDouble();
            double scaled = (sample * range) + min;
            float result = (float)scaled;
            return result;
        }

        private AffineTransformBuilder GetRotation()
        {
            var builder = new AffineTransformBuilder();
            var pointF = new PointF(_random.Next(0, Width), _random.Next(0, Height));
            var rotationDegrees = _random.Next(0, MaxRotationDegrees);
            var result = builder.PrependRotationDegrees(rotationDegrees, pointF);
            return result;
        }
    }
}
