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
    class NumberWriteFile : BaseWriteFile
    {

        public NumberWriteFile()
        {
            dotSplits = new char[1];

            dotSplits[0] = '.';
        }

        private int horozitalNum;

        private int verticalNum;

        public void setHVGrids(int hNum, int vNum)
        {
            horozitalNum = hNum;

            verticalNum = vNum;
        }

        override public void draw(List<FileInfo> files, String path, String outputPath, Label tileText)
        {
            files.Sort(compareNumberFileInfo);

            int totalWidth = 0;

            int totalHeight = 0;

            int lastHIndex = 0;

            int lastVIndex = 0;

            int lastImageWidth = 0;

            int lastImageHeight = 0;

            int nowX = 0;

            int nowY = 0;

            tileText.Text = "加载文件中";

            int horizotalCount = 0;

            foreach (FileInfo NextFile in files)
            {
                Bitmap image1 = (Bitmap)Image.FromFile(NextFile.FullName, true);

                horizotalCount++;

                if (horizotalCount > verticalNum)
                {
                    if (totalWidth == 0)
                    {
                        totalWidth = nowX;
                    }

                    nowX = 0;

                    nowY += lastImageHeight;

                    horizotalCount = 1;
                }

                lastImageWidth = image1.Width;

                lastImageHeight = image1.Height;

                nowX += image1.Width;

            }

            totalHeight = nowY + lastImageHeight;

            Bitmap bitmap = new Bitmap(Convert.ToInt32(totalWidth), Convert.ToInt32(totalHeight), System.Drawing.Imaging.PixelFormat.Format16bppRgb565);

            String folderName = getFoldeName(path);

            drawToImage(bitmap, files, outputPath, folderName, tileText);
        }

        private char[] dotSplits;

        private int getNameNum(FileInfo a)
        {
            return int.Parse(a.Name.Split(dotSplits)[0]);
        }

        private int compareNumberFileInfo(FileInfo a, FileInfo b)
        {

            int num1 = getNameNum(a);

            int num2 = getNameNum(b);

            if (num1 > num2)
            {
                return 1;
            }
            else if (num1 < num2)
            {
                return -1;
            }
            else
            {
                return 0;
            }
        }

        private void drawToImage(Bitmap bitmap, List<FileInfo> files, String outputPath, String foldName, Label tileText)
        {
            Graphics formGraphics = Graphics.FromImage(bitmap);

            int lastImageWidth = 0;

            int lastImageHeight = 0;

            int nowX = 0;

            int nowY = 0;

            mapTileNowCount = 0;

            mapTileTotal = files.Count;

            int horizotalCount = 0;

            foreach (FileInfo NextFile in files)
            {
                Bitmap image1 = (Bitmap)Image.FromFile(NextFile.FullName, true);

                horizotalCount++;

                if (horizotalCount > verticalNum)
                {
                    nowX = 0;

                    nowY += lastImageHeight;

                    horizotalCount = 1;
                }

                TextureBrush texture = new TextureBrush(image1);
                texture.WrapMode = System.Drawing.Drawing2D.WrapMode.Tile;

                formGraphics.FillRectangle(texture,
                    new RectangleF(nowX, nowY, image1.Width, image1.Height));

                Console.WriteLine(NextFile.FullName + " x:" + nowX + " y:" + nowY);

                lastImageWidth = image1.Width;

                lastImageHeight = image1.Height;

                nowX += image1.Width;

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
