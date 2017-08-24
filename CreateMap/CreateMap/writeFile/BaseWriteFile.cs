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
            splits = new char[1];

            splits[0] = '_';
        }

        private char[] splits;

        protected int mapTileTotal = 0;

        protected int mapTileNowCount = 0;

        public virtual void draw(List<FileInfo> files, String path, String outputPath, Label titleText)
        {
        }

        protected Regex rgx = new Regex(@"\d+_\d+");

        protected String[] getHVIndex(FileInfo file)
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

        protected String getFoldeName(String folderName)
        {

            int index1 = folderName.LastIndexOf("\\");

            String name = folderName.Substring(index1 + 1, folderName.Length - index1 - 1);

            return name;
        }

        public String outputType;
    }
}
