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
using CreateMap.writeFile;

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

            this.outJpgType.Select();
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

        private String getFoldeName(String folderName)
        {

            int index1 = folderName.LastIndexOf("\\");

            String name = folderName.Substring(index1 + 1, folderName.Length - index1 - 1);

            return name;
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

            tileText.Text = "加载文件中";
            tileText.Invalidate();
            tileText.Update();
            //tileText.refresh();
            Application.DoEvents();

            //遍历文件
            List<FileInfo> files = new List<FileInfo>();

            FileInfo[] ret = TheFolder.GetFiles();

            foreach (FileInfo temp in ret)
            {
                if (temp.FullName.ToLower().IndexOf(this.imageType) == -1)
                {
                    continue;
                }

                if (this.alignType == XY_ALIGN_TYPE || this.alignType == YX_ALIGN_TYPE)
                {
                    if (temp.FullName.IndexOf("_") == -1)
                    {
                        continue;
                    }
                }

                files.Add(temp);
            }

            BaseWriteFile write = null;
            if (this.alignType == XY_ALIGN_TYPE)
            {
                //drawXYType(files, path, outputPath);
                write = new XYWriteFile();
            }
            else if (this.alignType == YX_ALIGN_TYPE)
            {
                write = new YXWriteFile();
            }
            else if (this.alignType == SPLIT_ALIGN_TYPE)
            {
                write = new NumberWriteFile();

                if (this.xGridText.Text == "" || this.yGridText.Text == "")
                {
                    MessageBox.Show("请输入行列数目");

                    return;
                }

                (write as NumberWriteFile).setHVGrids(int.Parse(this.xGridText.Text), int.Parse(this.yGridText.Text));
            }

            String outputType = "";

            if (this.outJpgType.Checked)
            {
                outputType = ".jpg";
            }
            else if (this.outBmpType.Checked)
            {
                outputType = ".bmp";
            }

            if (write != null)
            {
                write.outputType = outputType;

                write.draw(files, path, outputPath, this.tileText);
            }
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

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void calculateGridNumHandler(object sender, EventArgs e)
        {
            int smallMapWidth = int.Parse(this.smallMapWidthText.Text);

            int smallMapHeight = int.Parse(this.smallMapHeightText.Text);

            int blockWidth = int.Parse(this.blockWidthText.Text);

            int blockHeight = int.Parse(this.blockHeightText.Text);

            int totalNum = int.Parse(this.totalBlockNumText.Text);

            int k1 = (int)Math.Ceiling(Math.Sqrt(smallMapWidth * blockHeight * totalNum / smallMapHeight / blockWidth));

            int k2 = (int)Math.Floor(Math.Sqrt(smallMapWidth * blockHeight * totalNum / smallMapHeight / blockWidth));

            if (totalNum % k1 == 0)
            {
                this.yGridText.Text = k1.ToString();
                this.xGridText.Text = (totalNum / k1).ToString();
            }
            else if (totalNum % k2 == 0)
            {
                this.yGridText.Text = k2.ToString();
                this.xGridText.Text = (totalNum / k2).ToString();
            }
        }
    }
}
