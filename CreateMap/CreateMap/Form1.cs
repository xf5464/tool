﻿using System;
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

namespace CreateMap
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            splits = new char[1];

            splits[0] = '_';

            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            this.alignType1.Select();

            this.imageType1.Select();
        }


        private Regex rgx = new Regex(@"\d+_\d+");

        private char[] splits;

        private void sourceBtnClick(object sender, EventArgs e)
        {
            FolderBrowserDialog dialog = new FolderBrowserDialog();
            dialog.Description = "请选择文件路径";
            if (dialog.ShowDialog() == DialogResult.OK)
            {
                string foldPath = dialog.SelectedPath;

                this.sourceText.Text = foldPath;
            }
        }

        private int mapTileTotal = 0;

        private int mapTileNowCount = 0;

        private void drawToImage(Bitmap bitmap, List<FileInfo> files, String outputPath, String foldName)
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

                this.tileText.Text = mapTileNowCount + "/" + mapTileTotal;

                this.tileText.Invalidate();
                this.tileText.Update();
                //tileText.refresh();
                Application.DoEvents();

            }

            String outputPathString = outputPath + "\\" + foldName + ".jpg";
            bitmap.Save(outputPathString);

            bitmap.Dispose();
        }

        private String getFoldeName(String folderName)
        {

            int index1 = folderName.LastIndexOf("\\");

            String name = folderName.Substring(index1 + 1, folderName.Length - index1 - 1);

            return name;
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

        private int compareYXFileInfo(FileInfo a, FileInfo b)
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

            int vIndex1 = Convert.ToInt32(aHV[0]);

            int hIndex1 = Convert.ToInt32(aHV[1]);

            int vIndex2 = Convert.ToInt32(bHV[0]);

            int hIndex2 = Convert.ToInt32(bHV[1]);

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

        private String[] getHVIndex(FileInfo file)
        {
            MatchCollection matches = rgx.Matches(file.FullName);

            if (matches.Count > 0)
            {
                Match match = matches[0];

                String[] data = match.Value.Split(splits);

                return data;
            }

            return null;
        }

        private void outputBtnClick(object sender, EventArgs e)
        {
            FolderBrowserDialog dialog = new FolderBrowserDialog();
            dialog.Description = "请选择输出文件夹路径";
            if (dialog.ShowDialog() == DialogResult.OK)
            {
                string foldPath = dialog.SelectedPath;

                this.outputPathText.Text = foldPath;
            }
        }

        private void generateBtn_MouseClick(object sender, MouseEventArgs e)
        {
            //MessageBox.Show("已选择文件夹:" + foldPath, "选择文件夹提示", MessageBoxButtons.OK, MessageBoxIcon.Information);

            if (this.sourceText.Text == "")
            {
                MessageBox.Show("请选择地图目录");
                return;
            }

            if (this.outputPathText.Text == "")
            {
                MessageBox.Show("请选择输出目录");
                return;
            }

            this.confirmOptions();

            generateOneMapFolder(this.sourceText.Text, this.outputPathText.Text);

            MessageBox.Show("完成");
        }

        private void generateOneMapFolder(String path, String outputPath)
        {
            DirectoryInfo TheFolder = new DirectoryInfo(path);


            //遍历文件
            List<FileInfo> files = new List<FileInfo>();

            FileInfo[] ret = TheFolder.GetFiles();

            foreach (FileInfo temp in ret)
            {
                if (temp.FullName.ToLower().IndexOf(this.imageType) == -1)
                {
                    continue;
                }

                files.Add(temp);
            }

            if (this.alignType == XY_ALIGN_TYPE)
            {
                drawXYType(files, path, outputPath);
            }
            else if (this.alignType == YX_ALIGN_TYPE)
            {
                drawYXType(files, path, outputPath);
            }
            else if (this.alignType == SPLIT_ALIGN_TYPE)
            {
                drawSplitType(files, path, outputPath);
            }
            
        }

        private void drawXYType(List<FileInfo> files, String path, String outputPath)
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

            drawToImage(bitmap, files, outputPath, folderName);
        }

        private void drawYXType(List<FileInfo> files, String path, String outputPath)
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

            drawToImage(bitmap, files, outputPath, folderName);
        }

        private void drawSplitType(List<FileInfo> files, String path, String outputPath)
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

            drawToImage(bitmap, files, outputPath, folderName);
        }

        private void confirmOptions()
        {
            if (this.alignType1.Checked)
            {
                alignType = XY_ALIGN_TYPE;
            }
            else if (this.alignType2.Checked)
            {
                alignType = YX_ALIGN_TYPE;
            }
            else if (this.alignType3.Checked)
            {
                alignType = SPLIT_ALIGN_TYPE;

                splitX = int.Parse(this.xGridText.Text);
                splitY = int.Parse(this.yGridText.Text);
            }

            if (this.imageType1.Checked)
            {
                this.imageType = JPG_TYPE;
            }
            else if (this.imageType2.Checked)
            {
                this.imageType = PNG_TYPE;
            }
            else if (this.imageType3.Checked)
            {
                this.imageType = BMP_TYPE;
            }
        }

        private const int XY_ALIGN_TYPE = 1;

        private const int YX_ALIGN_TYPE = 2;

        private const int SPLIT_ALIGN_TYPE = 3;

        private const String JPG_TYPE = ".jpg";

        private const String PNG_TYPE = ".png";

        private const String BMP_TYPE = ".bmp";

        private String imageType;

        private int alignType;

        private int splitX;

        private int splitY;

        private void mutilStartClick(object sender, EventArgs e)
        {
            if (this.mapParentFolderText.Text == "")
            {
                MessageBox.Show("请选择地图父目录");
                return;
            }

            if (this.parentFolderOutputText.Text == "")
            {
                MessageBox.Show("请选择输出目录");
                return;
            }

            if (this.alignType3.Checked)
            {
                MessageBox.Show("此模式只适用单张地图");
                return;
            }

            this.confirmOptions();

            DirectoryInfo TheFolder = new DirectoryInfo(this.mapParentFolderText.Text);

            //遍历文件

            DirectoryInfo[] directorys = TheFolder.GetDirectories();

            totalMapCount = directorys.Length;

            finishedMapCount = 0;

            foreach (DirectoryInfo oneDirectory in directorys)
            {
                generateOneMapFolder(oneDirectory.FullName, this.parentFolderOutputText.Text);

                finishedMapCount++;

                this.processText.Text = finishedMapCount + "/" + totalMapCount;

                this.processText.Invalidate();
                this.processText.Update();
                //tileText.refresh();
                Application.DoEvents();
            }

            MessageBox.Show("完成");
        }

        private int totalMapCount = 0;

        private int finishedMapCount = 0;

        private void parentFolderClick(object sender, EventArgs e)
        {
            FolderBrowserDialog dialog = new FolderBrowserDialog();
            dialog.Description = "请选择地图父目录";
            if (dialog.ShowDialog() == DialogResult.OK)
            {
                string foldPath = dialog.SelectedPath;

                this.mapParentFolderText.Text = foldPath;
            }
        }

        private void mutilOutputSelectClick(object sender, EventArgs e)
        {
            FolderBrowserDialog dialog = new FolderBrowserDialog();
            dialog.Description = "请选择输出文件夹路径";
            if (dialog.ShowDialog() == DialogResult.OK)
            {
                string foldPath = dialog.SelectedPath;

                this.parentFolderOutputText.Text = foldPath;
            }
        }

        private void checkedListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

    }
}
