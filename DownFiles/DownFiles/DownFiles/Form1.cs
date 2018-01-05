using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Net;
using System.Text.RegularExpressions;
using System.IO;

namespace DownFiles
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();

            regex = new Regex(@"(?<=(.com|.cn)/)(.*)(?=(/[^.*]).)");

            nameRegex = new Regex(@"(?<=(.com|.cn)/)(.*)");

        }

        private Regex nameRegex;

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private String localFolder;

        private void onStartClick(object sender, EventArgs e)
        {
            if (isRunning)
            {
                return;
            }

            isRunning = true;

            String webFile = this.sitesTxt.Text;

            localFolder = this.outputTxt.Text;

            data = File.ReadAllLines(webFile, Encoding.UTF8);

            Array.Sort(data);

            total = data.Length;

            finished = 0;

            downloadFile();
        }

        private Boolean isRunning = false;

        private WebClient wclient;

        private void downloadFile()
        {
            if (finished >= total)
            {
                MessageBox.Show("完成");

                isRunning = false;
            }
            else
            {
                if (wclient == null)
                {
                     wclient = new WebClient();
                }

                String url = data[finished];

                try
                {
                    String local = getLocalPath(url);

                    if (local == "")
                    {
                        update();

                        return;
                    }


                    String folder = localFolder + "/" + local;

                    if (!Directory.Exists(folder))
                    {
                        Directory.CreateDirectory(folder);
                    }

                    String localName = getName(url);

                    String fullName = localFolder + "/" + localName;

                    wclient.DownloadFile(url, fullName);
                }
                catch (WebException error)
                {
                    Console.Write(error);

                    update();

                    return;
                }

                update();
            }
        }

        private void update()
        {
            finished++;

            updatefinishCount();

            downloadFile();
        }

        private void updatefinishCount()
        {
            this.processTxt.Text = this.finished + "/" + this.total;

            this.processTxt.Invalidate();
            this.processTxt.Update();
            //tileText.refresh();
            Application.DoEvents();
        }

        private Regex regex;

        private String getLocalPath(String remote)
        {
            MatchCollection mc = regex.Matches(remote);

            if (mc.Count > 0)
            {
                return mc[0].Value;
            }
            else
            {
                return "";
            }
        }

        private String getName(String remote)
        {
            MatchCollection mc = nameRegex.Matches(remote);

            if (mc.Count > 0)
            {
                return mc[0].Value;
            }
            else
            {
                return "";
            }
        }

        private int total;

        private int finished;

        private String[] data;
    }
}
