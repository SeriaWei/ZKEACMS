/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using SixLabors.Fonts;
using SixLabors.ImageSharp;
using SixLabors.ImageSharp.Drawing.Processing;
using SixLabors.ImageSharp.PixelFormats;
using SixLabors.ImageSharp.Processing;
using System.IO;
using System.Threading.Tasks;
using System.Numerics;
using SixLabors.ImageSharp.Formats;
using SixLabors.ImageSharp.Formats.Png;
using SixLabors.ImageSharp.Formats.Jpeg;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Hosting;

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
        public Color[] TextColor { get; set; } = new Color[] { Color.Blue, Color.Black, Color.Red, Color.Brown, Color.Green };
        public Color[] DrawLinesColor { get; set; } = new Color[] { Color.LightBlue, Color.LightCoral, Color.LightCyan, Color.LightGray, Color.LightPink, Color.LightSalmon, Color.LightSeaGreen, Color.LightSkyBlue, Color.LightSlateGray, Color.LightSteelBlue };
        public float MinLineThickness { get; set; } = 0.7f;
        public float MaxLineThickness { get; set; } = 2.0f;
        public ushort Width { get; set; } = 200;
        public ushort Height { get; set; } = 70;
        public ushort NoiseRate { get; set; } = 300;
        public Color[] NoiseRateColor { get; set; } = new Color[] { Color.LightBlue, Color.LightCoral, Color.LightCyan, Color.LightGray, Color.LightPink, Color.LightSalmon, Color.LightSeaGreen, Color.LightSkyBlue, Color.LightSlateGray, Color.LightSteelBlue };
        public byte FontSize { get; set; } = 45;
        public FontStyle FontStyle { get; set; } = FontStyle.Regular;
        public EncoderTypes EncoderType { get; set; } = EncoderTypes.Jpeg;
        public IImageEncoder Encoder { get { return GetEncoder(EncoderType); } }
        public byte DrawLines { get; set; } = 5;
        public byte MaxRotationDegrees { get; set; } = 5;

        public byte[] Generate(string text)
        {
            byte[] result;

            using (var imgText = new Image<Rgba32>(Width, Height))
            {
                float position = 0;
                Random random = new Random();
                byte startWith = (byte)random.Next(5, 10);
                imgText.Mutate(ctx => ctx.BackgroundColor(Color.Transparent));
                FontFamily fontFamily = FontFamilies[random.Next(0, FontFamilies.Length)];
                Font font = new Font(fontFamily, FontSize, FontStyle);

                foreach (char c in text)
                {
                    var location = new PointF(startWith + position, random.Next(6, 13));
                    imgText.Mutate(ctx => ctx.DrawText(c.ToString(), font, TextColor[random.Next(0, TextColor.Length)], location));
                    position += TextMeasurer.Measure(c.ToString(), new TextOptions(font)).Width;
                }

                AffineTransformBuilder rotation = GetRotation();
                imgText.Mutate(ctx => ctx.Transform(rotation));

                ushort size = (ushort)TextMeasurer.Measure(text, new TextOptions(font)).Width;
                var img = new Image<Rgba32>(size + 10 + 5, Height);
                img.Mutate(ctx => ctx.BackgroundColor(Color.White));

                Parallel.For(0, DrawLines, i =>
                {
                    int x0 = random.Next(0, random.Next(0, 30));
                    int y0 = random.Next(10, img.Height);
                    int x1 = random.Next(img.Width / 2, img.Width);
                    int y1 = random.Next(0, img.Height);
                    img.Mutate(ctx =>
                            ctx.DrawLines(TextColor[random.Next(0, TextColor.Length)],
                                          GenerateNextFloat(MinLineThickness, MaxLineThickness),
                                          new PointF[] { new PointF(x0, y0), new PointF(x1, y1) })
                            );
                });

                img.Mutate(ctx => ctx.DrawImage(imgText, 0.80f));

                Parallel.For(0, NoiseRate, i =>
                {
                    int x0 = random.Next(0, img.Width);
                    int y0 = random.Next(0, img.Height);
                    img.Mutate(
                                ctx => ctx
                                    .DrawLines(NoiseRateColor[random.Next(0, NoiseRateColor.Length)],
                                    GenerateNextFloat(0.5, 1.5), new PointF[] { new Vector2(x0, y0), new Vector2(x0, y0) })
                            );
                });

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
                    throw new ArgumentException($"Encoder '{ encoderType }' not found!");
            };
            return encoder;
        }
        private float GenerateNextFloat(double min = -3.40282347E+38, double max = 3.40282347E+38)
        {
            Random random = new Random();
            double range = max - min;
            double sample = random.NextDouble();
            double scaled = (sample * range) + min;
            float result = (float)scaled;
            return result;
        }

        private AffineTransformBuilder GetRotation()
        {
            Random random = new Random();
            var builder = new AffineTransformBuilder();
            var width = random.Next(10, Width);
            var height = random.Next(10, Height);
            var pointF = new PointF(width, height);
            var rotationDegrees = random.Next(0, MaxRotationDegrees);
            var result = builder.PrependRotationDegrees(rotationDegrees, pointF);
            return result;
        }
    }
}
