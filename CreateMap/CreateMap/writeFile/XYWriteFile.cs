using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Windows.Forms;
using System.Text.RegularExpressions;
using System.Threading;


namespace CreateMap.writeFile
{
    class XYWriteFile : BaseWriteFile
    {

        override public void draw(List<FileInfo> files, String path, String outputPath, Label tileText)
        {
            files.Sort(compareXYFileInfo);

            int totalWidth = 0;

            int totalHeight = 0;

            int lastHIndex = 0;

            int lastVIndex = 0;

            int lastImageWidth = 0;

            int lastImageHeight = 0;

            int nowX = 0;

            int nowY = 0;

            tileText.Text = "加载文件中";

            foreach (FileInfo NextFile in files)
            {
                Bitmap image1 = (Bitmap)Image.FromFile(NextFile.FullName, true);

                String[] data = getHVIndex(NextFile);

                if (data != null && data.Length >= 2)
                {

                    int hIndex = Convert.ToInt32(data[0]);

                    int vIndex = Convert.ToInt32(data[1]);

                    if (hIndex > lastHIndex)
                    {
                        if (totalWidth == 0)
                        {
                            totalWidth = nowX;
                        }

                        nowX = 0;

                        nowY += lastImageHeight;
                    }

                    lastHIndex = hIndex;

                    lastVIndex = vIndex;

                    lastImageWidth = image1.Width;

                    lastImageHeight = image1.Height;

                    nowX += image1.Width;
                }

            }

            totalHeight = nowY + lastImageHeight;

            Bitmap bitmap = new Bitmap(Convert.ToInt32(totalWidth), Convert.ToInt32(totalHeight), System.Drawing.Imaging.PixelFormat.Format16bppRgb565);

            String folderName = getFoldeName(path);

            drawToImage(bitmap, files, outputPath, folderName, tileText);
        }

        private int compareXYFileInfo(FileInfo a, FileInfo b)
        {

            String[] aHV = getHVIndex(a);

            String[] bHV = getHVIndex(b);

            if (aHV == null || aHV.Length < 2)
            {
                return -1;
            }

            if (bHV == null || bHV.Length < 2)
            {
                return 1;
            }

            int hIndex1 = Convert.ToInt32(aHV[0]);

            int vIndex1 = Convert.ToInt32(aHV[1]);

            int hIndex2 = Convert.ToInt32(bHV[0]);

            int vIndex2 = Convert.ToInt32(bHV[1]);

            if (hIndex1 < hIndex2)
            {
                return -1;
            }
            else if (hIndex1 > hIndex2)
            {
                return 1;
            }
            else
            {
                if (vIndex1 < vIndex2)
                {
                    return -1;
                }
                else if (vIndex1 > vIndex2)
                {
                    return 1;
                }
                else
                {
                    return 0;
                }
            }
        }


        private void drawToImage(Bitmap bitmap, List<FileInfo> files, String outputPath, String foldName, Label tileText)
        {
            Graphics formGraphics = Graphics.FromImage(bitmap);

            int lastHIndex = 0;

            int lastVIndex = 0;

            int lastImageWidth = 0;

            int lastImageHeight = 0;

            int nowX = 0;

            int nowY = 0;

            mapTileNowCount = 0;

            mapTileTotal = files.Count;

            foreach (FileInfo NextFile in files)
            {
                Bitmap image1 = (Bitmap)Image.FromFile(NextFile.FullName, true);

                String[] data = getHVIndex(NextFile);

                if (data != null && data.Length >= 2)
                {

                    int hIndex = Convert.ToInt32(data[0]);

                    int vIndex = Convert.ToInt32(data[1]);

                    if (hIndex > lastHIndex)
                    {
                        nowX = 0;

                        nowY += lastImageHeight;
                    }


                    TextureBrush texture = new TextureBrush(image1);
                    texture.WrapMode = System.Drawing.Drawing2D.WrapMode.Tile;

                    formGraphics.FillRectangle(texture,
                        new RectangleF(nowX, nowY, image1.Width, image1.Height));

                    lastHIndex = hIndex;

                    lastVIndex = vIndex;

                    lastImageWidth = image1.Width;

                    lastImageHeight = image1.Height;

                    nowX += image1.Width;
                }

                mapTileNowCount++;

                tileText.Text = mapTileNowCount + "/" + mapTileTotal;

                tileText.Invalidate();
                tileText.Update();
                //tileText.refresh();
                Application.DoEvents();

            }

            String outputPathString = outputPath + "\\" + foldName + ".jpg";
            bitmap.Save(outputPathString);

            bitmap.Dispose();
        }
    }
}
