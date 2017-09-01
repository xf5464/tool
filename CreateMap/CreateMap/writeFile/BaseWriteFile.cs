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


namespace CreateMap
{
    class BaseWriteFile
    {

        public BaseWriteFile()
        {

        }

        private String[] splits;

        protected String[] Splits
        {
            get { return splits; }
        }

        protected int mapTileTotal = 0;

        protected int mapTileNowCount = 0;

        public virtual void draw(List<FileInfo> files, String path, String outputPath, Label titleText)
        {
        }

        protected Regex rgx = null;

        protected String[] getHVIndex(FileInfo file)
        {

            if (rgx == null)
            {
                rgx = new Regex(@"\d+" + this.gapName + @"\d+");
            }

            if (Splits == null)
            {
                splits = new String[] { this.gapName };
            }

            String inputName = file.FullName;

            if (this.preName != "")
            {
                Regex temp = new Regex(this.preName);

                inputName = file.FullName.Replace(this.preName, "");
            }


            MatchCollection matches = rgx.Matches(inputName);

            if (matches.Count > 0)
            {
                Match match = matches[0];

                String[] data = match.Value.Split(Splits, StringSplitOptions.RemoveEmptyEntries);

                return data;
            }

            return null;
        }

        protected String getFoldeName(String folderName)
        {

            int index1 = folderName.LastIndexOf("\\");

            String name = folderName.Substring(index1 + 1, folderName.Length - index1 - 1);

            return name;
        }

        public String outputType;

        public String preName;

        public String gapName;
    }
}
