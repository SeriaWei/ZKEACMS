using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Runtime.InteropServices;

namespace ZKEACMS.Captcha
{
    public class DefaultImageGenerator : IImageGenerator
    {
        private const float V = 4F;
        public DefaultImageGenerator()
        {
            Width = 200;
            Height = 70;
            Fonts = new List<FontFamily>
            {
                new FontFamily("Times New Roman"),
                new FontFamily("Georgia"),
                new FontFamily("Arial"),
                new FontFamily("Comic Sans MS")
            };

            FontColor = Color.Blue;
            Background = Color.White;
        }

        public Color FontColor { get; set; }

        public Color Background { get; set; }

        public ushort Width { get; set; }

        public ushort Height { get; set; }

        public IList<FontFamily> Fonts { get; private set; }

        public byte[] Generate(string text)
        {
            bool isWindowsOS = RuntimeInformation.IsOSPlatform(OSPlatform.Windows);
            var random = new Random();

            FontFamily familyName = Fonts[random.Next(Fonts.Count - 1)];
            var bitmap = new Bitmap(
                Width,
                Height,
                PixelFormat.Format32bppArgb);

            using (Graphics graph = Graphics.FromImage(bitmap))
            {
                graph.SmoothingMode = SmoothingMode.AntiAlias;
                var rect = new Rectangle(0, 0, Width, Height);

                // Fill in the background.
                using (var brush = new HatchBrush(
                    HatchStyle.SmallConfetti,
                    Color.LightGray,
                    Background))
                {
                    graph.FillRectangle(brush, rect);

                    // Set up the text format.
                    var format = new StringFormat
                    {
                        Alignment = StringAlignment.Center,
                        LineAlignment = StringAlignment.Center,
                        FormatFlags = StringFormatFlags.NoWrap | StringFormatFlags.NoClip,
                        Trimming = StringTrimming.None
                    };

                    format.SetMeasurableCharacterRanges(new[] { new CharacterRange(0, text.Length) });

                    // Set up the text font.
                    RectangleF size;
                    float fontSize = rect.Height + 1;
                    Font font = null;
                    // Adjust the font size until the text fits within the image.
                    do
                    {
                        if (font != null)
                            font.Dispose();
                        fontSize--;
                        font = new Font(
                            familyName,
                            fontSize,
                            FontStyle.Bold);
                        size = graph.MeasureCharacterRanges(text, font, rect, format)[0].GetBounds(graph);
                    } while (size.Width > rect.Width || size.Height > rect.Height);

                    var path = new GraphicsPath();
                    path.AddString(
                        text,
                        font.FontFamily,
                        (int)font.Style,
                        graph.DpiY * font.Size / 72, rect,
                        format);

                    var matrix = new Matrix();
                    if (isWindowsOS)
                    {
                        PointF[] points =
                            {
                                new PointF(
                                    random.Next(rect.Width)/V,
                                    random.Next(rect.Height)/V),
                                new PointF(
                                    rect.Width - random.Next(rect.Width)/V,
                                    random.Next(rect.Height)/V),
                                new PointF(
                                    random.Next(rect.Width)/V,
                                    rect.Height - random.Next(rect.Height)/V),
                                new PointF(
                                    rect.Width - random.Next(rect.Width)/V,
                                    rect.Height - random.Next(rect.Height)/V)
                            };

                        matrix.Translate(0F, 0F);
                        path.Warp(points, rect, matrix, WarpMode.Perspective, 0F); //Not work on linux
                    }
                    else
                    {
                        matrix.Translate(0F, random.Next(-rect.Height, rect.Height) / 5F);
                        path.Transform(matrix);
                    }

                    // Draw the text.
                    using (var hatchBrush = new HatchBrush(
                        HatchStyle.LargeConfetti,
                        Color.LightGray,
                        FontColor))
                    {
                        graph.FillPath(hatchBrush, path);

                        // Add some random noise.
                        int m = Math.Max(rect.Width, rect.Height);
                        for (int i = 0; i < (int)(rect.Width * rect.Height / 30F); i++)
                        {
                            int x = random.Next(rect.Width);
                            int y = random.Next(rect.Height);
                            int w = random.Next(m / 50);
                            int h = random.Next(m / 50);
                            graph.FillEllipse(hatchBrush, x, y, w, h);
                        }
                    }
                    // Clean up.

                    format.Dispose();
                    font.Dispose();
                    path.Dispose();
                    matrix.Dispose();
                }
            }
            AdjustRippleEffect(bitmap);
            using (bitmap)
            {
                using (MemoryStream ms = new MemoryStream())
                {
                    bitmap.Save(ms, ImageFormat.Jpeg);
                    return ms.ToArray();
                }
            }
        }

        void AdjustRippleEffect(Bitmap baseMap)
        {
            short nWave = 6;
            int nWidth = baseMap.Width;
            int nHeight = baseMap.Height;

            Point[,] pt = new Point[nWidth, nHeight];

            for (int x = 0; x < nWidth; ++x)
            {
                for (int y = 0; y < nHeight; ++y)
                {
                    var xo = nWave * Math.Sin(2.0 * 3.1415 * y / 128.0);
                    var yo = nWave * Math.Cos(2.0 * 3.1415 * x / 128.0);

                    var newX = x + xo;
                    var newY = y + yo;

                    if (newX > 0 && newX < nWidth)
                    {
                        pt[x, y].X = (int)newX;
                    }
                    else
                    {
                        pt[x, y].X = 0;
                    }


                    if (newY > 0 && newY < nHeight)
                    {
                        pt[x, y].Y = (int)newY;
                    }
                    else
                    {
                        pt[x, y].Y = 0;
                    }
                }
            }

            Bitmap bSrc = (Bitmap)baseMap.Clone();

            BitmapData bitmapData = baseMap.LockBits(new Rectangle(0, 0, baseMap.Width, baseMap.Height), ImageLockMode.ReadWrite, PixelFormat.Format24bppRgb);
            BitmapData bmSrc = bSrc.LockBits(new Rectangle(0, 0, bSrc.Width, bSrc.Height), ImageLockMode.ReadWrite, PixelFormat.Format24bppRgb);

            int scanline = bitmapData.Stride;

            IntPtr scan0 = bitmapData.Scan0;
            IntPtr srcScan0 = bmSrc.Scan0;

            unsafe
            {
                byte* p = (byte*)(void*)scan0;
                byte* pSrc = (byte*)(void*)srcScan0;

                int nOffset = bitmapData.Stride - baseMap.Width * 3;

                for (int y = 0; y < nHeight; ++y)
                {
                    for (int x = 0; x < nWidth; ++x)
                    {
                        var xOffset = pt[x, y].X;
                        var yOffset = pt[x, y].Y;

                        if (yOffset >= 0 && yOffset < nHeight && xOffset >= 0 && xOffset < nWidth)
                        {
                            if (pSrc != null)
                            {
                                p[0] = pSrc[yOffset * scanline + xOffset * 3];
                                p[1] = pSrc[yOffset * scanline + xOffset * 3 + 1];
                                p[2] = pSrc[yOffset * scanline + xOffset * 3 + 2];
                            }
                        }

                        p += 3;
                    }
                    p += nOffset;
                }
            }

            baseMap.UnlockBits(bitmapData);
            bSrc.UnlockBits(bmSrc);
            bSrc.Dispose();
        }
    }
}
