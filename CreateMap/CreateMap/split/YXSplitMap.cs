using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;
using System.Drawing.Imaging;
using System.Windows.Forms;
using System.Drawing.Drawing2D;

namespace CreateMap.split
{
    class YXSplitMap : BaseSplitMap
    {

        private String splitElement;

        private int startNum;

        public void setExtraData(String splitElementValue, int startNumValue)
        {
            splitElement = splitElementValue;

            startNum = startNumValue;
        }

        override public void split(String sourceText, String outputFolder, int blockWidth, int blockHeight, String preName, Label titleText)
        {
            Bitmap image1 = (Bitmap)Image.FromFile(sourceText, true);

            int horizontalNum = (int)Math.Ceiling((Double)image1.Width / blockWidth);

            int verticalNum = (int)Math.Ceiling((Double)image1.Height / blockHeight);

            int finished = 0;

            int total = horizontalNum * verticalNum;

            ImageAttributes ia = new ImageAttributes();

            ia.SetWrapMode(WrapMode.TileFlipXY);

            for (int i = 0; i < verticalNum; i++)
            {
                for (int j = 0; j < horizontalNum; j++)
                {
                    Bitmap bitmap = new Bitmap(blockWidth, blockHeight);

                    //创建作图区域
                    Graphics graphic = Graphics.FromImage(bitmap);

                    graphic.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.NearestNeighbor;
                    
                    //截取原图相应区域写入作图区
                    graphic.DrawImage(image1, new Rectangle(0, 0, blockWidth, blockHeight), blockWidth * j, blockHeight * i, blockWidth, blockHeight, GraphicsUnit.Pixel, ia);
                    
                    //从作图区生成新图
                    Image saveImage = Image.FromHbitmap(bitmap.GetHbitmap());

                    String toImagePath = outputFolder + "\\" + preName + (j + startNum).ToString() + this.splitElement + (i + startNum).ToString() + ".jpg";
                    //保存图片
                    saveImage.Save(toImagePath, ImageFormat.Jpeg);
                    
                    //释放资源   
                    saveImage.Dispose();
                    graphic.Dispose();

                    finished++;

                    titleText.Text = finished + "/" + total;

                    titleText.Invalidate();
                    titleText.Update();
                    //tileText.refresh();
                    Application.DoEvents();
                }
            }
        }

    }
}
