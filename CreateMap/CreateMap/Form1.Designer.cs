namespace CreateMap
{
    partial class Form1
    {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows 窗体设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            this.sourceBtn = new System.Windows.Forms.Button();
            this.targetBtn = new System.Windows.Forms.Button();
            this.generateBtn = new System.Windows.Forms.Button();
            this.mutilButton = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.processText = new System.Windows.Forms.Label();
            this.tileText = new System.Windows.Forms.Label();
            this.alignType1 = new System.Windows.Forms.RadioButton();
            this.alignType2 = new System.Windows.Forms.RadioButton();
            this.alignType3 = new System.Windows.Forms.RadioButton();
            this.panel1 = new System.Windows.Forms.Panel();
            this.panel2 = new System.Windows.Forms.Panel();
            this.imageType1 = new System.Windows.Forms.RadioButton();
            this.imageType3 = new System.Windows.Forms.RadioButton();
            this.imageType2 = new System.Windows.Forms.RadioButton();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.xGridText = new System.Windows.Forms.TextBox();
            this.yGridText = new System.Windows.Forms.TextBox();
            this.sourceText = new System.Windows.Forms.TextBox();
            this.outputPathText = new System.Windows.Forms.TextBox();
            this.mapParentFolderText = new System.Windows.Forms.TextBox();
            this.parentFolderOutputText = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.panel3 = new System.Windows.Forms.Panel();
            this.outBmpType = new System.Windows.Forms.RadioButton();
            this.outJpgType = new System.Windows.Forms.RadioButton();
            this.smallMapWidthText = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.smallMapHeightText = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.blockWidthText = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.blockHeightText = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.totalBlockNumText = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            this.gapText = new System.Windows.Forms.TextBox();
            this.preName = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.label13 = new System.Windows.Forms.Label();
            this.splitMapSourceText = new System.Windows.Forms.TextBox();
            this.button4 = new System.Windows.Forms.Button();
            this.splitOutDirectoryText = new System.Windows.Forms.TextBox();
            this.button5 = new System.Windows.Forms.Button();
            this.splitBlockHeightText = new System.Windows.Forms.TextBox();
            this.label14 = new System.Windows.Forms.Label();
            this.splitBlockWidthText = new System.Windows.Forms.TextBox();
            this.label15 = new System.Windows.Forms.Label();
            this.button6 = new System.Windows.Forms.Button();
            this.splitGapText = new System.Windows.Forms.TextBox();
            this.splitPreNameText = new System.Windows.Forms.TextBox();
            this.label16 = new System.Windows.Forms.Label();
            this.label17 = new System.Windows.Forms.Label();
            this.splitStartValueText = new System.Windows.Forms.TextBox();
            this.splitNumText = new System.Windows.Forms.TextBox();
            this.label18 = new System.Windows.Forms.Label();
            this.label19 = new System.Windows.Forms.Label();
            this.panel4 = new System.Windows.Forms.Panel();
            this.splitXyOption = new System.Windows.Forms.RadioButton();
            this.splitNumberOption = new System.Windows.Forms.RadioButton();
            this.splitYxOption = new System.Windows.Forms.RadioButton();
            this.splitStartXyNumText = new System.Windows.Forms.TextBox();
            this.label20 = new System.Windows.Forms.Label();
            this.panel1.SuspendLayout();
            this.panel2.SuspendLayout();
            this.panel3.SuspendLayout();
            this.panel4.SuspendLayout();
            this.SuspendLayout();
            // 
            // sourceBtn
            // 
            this.sourceBtn.Location = new System.Drawing.Point(22, 340);
            this.sourceBtn.Name = "sourceBtn";
            this.sourceBtn.Size = new System.Drawing.Size(75, 23);
            this.sourceBtn.TabIndex = 0;
            this.sourceBtn.Text = "单个地图";
            this.sourceBtn.UseVisualStyleBackColor = true;
            this.sourceBtn.Click += new System.EventHandler(this.sourceBtnClick);
            // 
            // targetBtn
            // 
            this.targetBtn.Location = new System.Drawing.Point(22, 369);
            this.targetBtn.Name = "targetBtn";
            this.targetBtn.Size = new System.Drawing.Size(75, 23);
            this.targetBtn.TabIndex = 1;
            this.targetBtn.Text = "输出目录";
            this.targetBtn.UseVisualStyleBackColor = true;
            this.targetBtn.Click += new System.EventHandler(this.outputBtnClick);
            // 
            // generateBtn
            // 
            this.generateBtn.Location = new System.Drawing.Point(285, 413);
            this.generateBtn.Name = "generateBtn";
            this.generateBtn.Size = new System.Drawing.Size(97, 23);
            this.generateBtn.TabIndex = 4;
            this.generateBtn.Text = "单个地图开始";
            this.generateBtn.UseVisualStyleBackColor = true;
            this.generateBtn.MouseClick += new System.Windows.Forms.MouseEventHandler(this.generateBtn_MouseClick);
            // 
            // mutilButton
            // 
            this.mutilButton.Location = new System.Drawing.Point(285, 531);
            this.mutilButton.Name = "mutilButton";
            this.mutilButton.Size = new System.Drawing.Size(97, 23);
            this.mutilButton.TabIndex = 9;
            this.mutilButton.Text = "多个地图开始";
            this.mutilButton.UseVisualStyleBackColor = true;
            this.mutilButton.Click += new System.EventHandler(this.mutilStartClick);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(22, 489);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(75, 23);
            this.button2.TabIndex = 6;
            this.button2.Text = "输出目录";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.mutilOutputSelectClick);
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(22, 460);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(75, 23);
            this.button3.TabIndex = 5;
            this.button3.Text = "地图总目录";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.parentFolderClick);
            // 
            // processText
            // 
            this.processText.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.processText.Location = new System.Drawing.Point(385, 531);
            this.processText.Name = "processText";
            this.processText.Size = new System.Drawing.Size(192, 23);
            this.processText.TabIndex = 10;
            // 
            // tileText
            // 
            this.tileText.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.tileText.Location = new System.Drawing.Point(232, 304);
            this.tileText.Name = "tileText";
            this.tileText.Size = new System.Drawing.Size(192, 23);
            this.tileText.TabIndex = 11;
            // 
            // alignType1
            // 
            this.alignType1.AutoSize = true;
            this.alignType1.Location = new System.Drawing.Point(10, 16);
            this.alignType1.Name = "alignType1";
            this.alignType1.Size = new System.Drawing.Size(41, 16);
            this.alignType1.TabIndex = 12;
            this.alignType1.TabStop = true;
            this.alignType1.Text = "x_y";
            this.alignType1.UseVisualStyleBackColor = true;
            // 
            // alignType2
            // 
            this.alignType2.AutoSize = true;
            this.alignType2.Location = new System.Drawing.Point(10, 38);
            this.alignType2.Name = "alignType2";
            this.alignType2.Size = new System.Drawing.Size(41, 16);
            this.alignType2.TabIndex = 13;
            this.alignType2.TabStop = true;
            this.alignType2.Text = "y_x";
            this.alignType2.UseVisualStyleBackColor = true;
            // 
            // alignType3
            // 
            this.alignType3.AutoSize = true;
            this.alignType3.Location = new System.Drawing.Point(10, 60);
            this.alignType3.Name = "alignType3";
            this.alignType3.Size = new System.Drawing.Size(59, 16);
            this.alignType3.TabIndex = 14;
            this.alignType3.TabStop = true;
            this.alignType3.Text = "1-1000";
            this.alignType3.UseVisualStyleBackColor = true;
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.alignType1);
            this.panel1.Controls.Add(this.alignType3);
            this.panel1.Controls.Add(this.alignType2);
            this.panel1.Location = new System.Drawing.Point(48, 60);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(87, 100);
            this.panel1.TabIndex = 15;
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.imageType1);
            this.panel2.Controls.Add(this.imageType3);
            this.panel2.Controls.Add(this.imageType2);
            this.panel2.Location = new System.Drawing.Point(341, 60);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(87, 100);
            this.panel2.TabIndex = 16;
            // 
            // imageType1
            // 
            this.imageType1.AutoSize = true;
            this.imageType1.Location = new System.Drawing.Point(10, 16);
            this.imageType1.Name = "imageType1";
            this.imageType1.Size = new System.Drawing.Size(47, 16);
            this.imageType1.TabIndex = 12;
            this.imageType1.TabStop = true;
            this.imageType1.Text = ".jpg";
            this.imageType1.UseVisualStyleBackColor = true;
            // 
            // imageType3
            // 
            this.imageType3.AutoSize = true;
            this.imageType3.Location = new System.Drawing.Point(10, 60);
            this.imageType3.Name = "imageType3";
            this.imageType3.Size = new System.Drawing.Size(47, 16);
            this.imageType3.TabIndex = 14;
            this.imageType3.TabStop = true;
            this.imageType3.Text = ".bmp";
            this.imageType3.UseVisualStyleBackColor = true;
            // 
            // imageType2
            // 
            this.imageType2.AutoSize = true;
            this.imageType2.Location = new System.Drawing.Point(10, 38);
            this.imageType2.Name = "imageType2";
            this.imageType2.Size = new System.Drawing.Size(47, 16);
            this.imageType2.TabIndex = 13;
            this.imageType2.TabStop = true;
            this.imageType2.Text = ".png";
            this.imageType2.UseVisualStyleBackColor = true;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(126, 122);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(53, 12);
            this.label1.TabIndex = 17;
            this.label1.Text = "横排格子";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(219, 123);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(53, 12);
            this.label2.TabIndex = 18;
            this.label2.Text = "竖排格子";
            // 
            // xGridText
            // 
            this.xGridText.Location = new System.Drawing.Point(179, 119);
            this.xGridText.Name = "xGridText";
            this.xGridText.Size = new System.Drawing.Size(36, 21);
            this.xGridText.TabIndex = 19;
            this.xGridText.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
            // 
            // yGridText
            // 
            this.yGridText.Location = new System.Drawing.Point(276, 119);
            this.yGridText.Name = "yGridText";
            this.yGridText.Size = new System.Drawing.Size(36, 21);
            this.yGridText.TabIndex = 20;
            // 
            // sourceText
            // 
            this.sourceText.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.sourceText.Location = new System.Drawing.Point(115, 342);
            this.sourceText.Name = "sourceText";
            this.sourceText.Size = new System.Drawing.Size(551, 21);
            this.sourceText.TabIndex = 21;
            // 
            // outputPathText
            // 
            this.outputPathText.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.outputPathText.Location = new System.Drawing.Point(115, 369);
            this.outputPathText.Name = "outputPathText";
            this.outputPathText.Size = new System.Drawing.Size(551, 21);
            this.outputPathText.TabIndex = 22;
            // 
            // mapParentFolderText
            // 
            this.mapParentFolderText.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.mapParentFolderText.Location = new System.Drawing.Point(115, 462);
            this.mapParentFolderText.Name = "mapParentFolderText";
            this.mapParentFolderText.Size = new System.Drawing.Size(551, 21);
            this.mapParentFolderText.TabIndex = 23;
            // 
            // parentFolderOutputText
            // 
            this.parentFolderOutputText.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.parentFolderOutputText.Location = new System.Drawing.Point(115, 491);
            this.parentFolderOutputText.Name = "parentFolderOutputText";
            this.parentFolderOutputText.Size = new System.Drawing.Size(551, 21);
            this.parentFolderOutputText.TabIndex = 24;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(372, 45);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(29, 12);
            this.label3.TabIndex = 25;
            this.label3.Text = "输入";
            this.label3.Click += new System.EventHandler(this.label3_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(513, 45);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(29, 12);
            this.label4.TabIndex = 26;
            this.label4.Text = "输出";
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.outBmpType);
            this.panel3.Controls.Add(this.outJpgType);
            this.panel3.Location = new System.Drawing.Point(480, 60);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(101, 100);
            this.panel3.TabIndex = 27;
            // 
            // outBmpType
            // 
            this.outBmpType.AutoSize = true;
            this.outBmpType.Location = new System.Drawing.Point(13, 38);
            this.outBmpType.Name = "outBmpType";
            this.outBmpType.Size = new System.Drawing.Size(47, 16);
            this.outBmpType.TabIndex = 15;
            this.outBmpType.TabStop = true;
            this.outBmpType.Text = ".bmp";
            this.outBmpType.UseVisualStyleBackColor = true;
            // 
            // outJpgType
            // 
            this.outJpgType.AutoSize = true;
            this.outJpgType.Location = new System.Drawing.Point(13, 16);
            this.outJpgType.Name = "outJpgType";
            this.outJpgType.Size = new System.Drawing.Size(47, 16);
            this.outJpgType.TabIndex = 15;
            this.outJpgType.TabStop = true;
            this.outJpgType.Text = ".jpg";
            this.outJpgType.UseVisualStyleBackColor = true;
            // 
            // smallMapWidthText
            // 
            this.smallMapWidthText.Location = new System.Drawing.Point(118, 206);
            this.smallMapWidthText.Name = "smallMapWidthText";
            this.smallMapWidthText.Size = new System.Drawing.Size(61, 21);
            this.smallMapWidthText.TabIndex = 29;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(59, 209);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(53, 12);
            this.label5.TabIndex = 28;
            this.label5.Text = "小地图宽";
            this.label5.Click += new System.EventHandler(this.label5_Click);
            // 
            // smallMapHeightText
            // 
            this.smallMapHeightText.Location = new System.Drawing.Point(118, 229);
            this.smallMapHeightText.Name = "smallMapHeightText";
            this.smallMapHeightText.Size = new System.Drawing.Size(61, 21);
            this.smallMapHeightText.TabIndex = 31;
            this.smallMapHeightText.TextChanged += new System.EventHandler(this.textBox2_TextChanged);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(59, 232);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(53, 12);
            this.label6.TabIndex = 30;
            this.label6.Text = "小地图高";
            this.label6.Click += new System.EventHandler(this.label6_Click);
            // 
            // blockWidthText
            // 
            this.blockWidthText.Location = new System.Drawing.Point(253, 206);
            this.blockWidthText.Name = "blockWidthText";
            this.blockWidthText.Size = new System.Drawing.Size(61, 21);
            this.blockWidthText.TabIndex = 33;
            this.blockWidthText.TextChanged += new System.EventHandler(this.textBox3_TextChanged);
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(194, 209);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(53, 12);
            this.label7.TabIndex = 32;
            this.label7.Text = "地图块宽";
            this.label7.Click += new System.EventHandler(this.label7_Click);
            // 
            // blockHeightText
            // 
            this.blockHeightText.Location = new System.Drawing.Point(253, 232);
            this.blockHeightText.Name = "blockHeightText";
            this.blockHeightText.Size = new System.Drawing.Size(61, 21);
            this.blockHeightText.TabIndex = 35;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(194, 235);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(53, 12);
            this.label8.TabIndex = 34;
            this.label8.Text = "地图块高";
            // 
            // totalBlockNumText
            // 
            this.totalBlockNumText.Location = new System.Drawing.Point(397, 206);
            this.totalBlockNumText.Name = "totalBlockNumText";
            this.totalBlockNumText.Size = new System.Drawing.Size(61, 21);
            this.totalBlockNumText.TabIndex = 37;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(329, 209);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(65, 12);
            this.label9.TabIndex = 36;
            this.label9.Text = "地图总张数";
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(331, 233);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 38;
            this.button1.Text = "计算";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.calculateGridNumHandler);
            // 
            // gapText
            // 
            this.gapText.Location = new System.Drawing.Point(276, 90);
            this.gapText.Name = "gapText";
            this.gapText.Size = new System.Drawing.Size(36, 21);
            this.gapText.TabIndex = 42;
            // 
            // preName
            // 
            this.preName.Location = new System.Drawing.Point(161, 90);
            this.preName.Name = "preName";
            this.preName.Size = new System.Drawing.Size(54, 21);
            this.preName.TabIndex = 41;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(220, 94);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(41, 12);
            this.label10.TabIndex = 40;
            this.label10.Text = "分隔符";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(126, 93);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(29, 12);
            this.label11.TabIndex = 39;
            this.label11.Text = "前缀";
            // 
            // label12
            // 
            this.label12.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.label12.Location = new System.Drawing.Point(688, 9);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(2, 600);
            this.label12.TabIndex = 43;
            this.label12.Text = "label12";
            // 
            // label13
            // 
            this.label13.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.label13.Location = new System.Drawing.Point(1372, 8);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(2, 600);
            this.label13.TabIndex = 46;
            this.label13.Text = "label13";
            this.label13.Click += new System.EventHandler(this.label13_Click);
            // 
            // splitMapSourceText
            // 
            this.splitMapSourceText.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.splitMapSourceText.Location = new System.Drawing.Point(799, 200);
            this.splitMapSourceText.Name = "splitMapSourceText";
            this.splitMapSourceText.Size = new System.Drawing.Size(551, 21);
            this.splitMapSourceText.TabIndex = 45;
            this.splitMapSourceText.TextChanged += new System.EventHandler(this.textBox1_TextChanged_1);
            // 
            // button4
            // 
            this.button4.Location = new System.Drawing.Point(696, 198);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(97, 23);
            this.button4.TabIndex = 44;
            this.button4.Text = "切割地图选择";
            this.button4.UseVisualStyleBackColor = true;
            this.button4.Click += new System.EventHandler(this.selectSplitMapHandler);
            // 
            // splitOutDirectoryText
            // 
            this.splitOutDirectoryText.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.splitOutDirectoryText.Location = new System.Drawing.Point(799, 227);
            this.splitOutDirectoryText.Name = "splitOutDirectoryText";
            this.splitOutDirectoryText.Size = new System.Drawing.Size(551, 21);
            this.splitOutDirectoryText.TabIndex = 48;
            // 
            // button5
            // 
            this.button5.Location = new System.Drawing.Point(696, 228);
            this.button5.Name = "button5";
            this.button5.Size = new System.Drawing.Size(75, 23);
            this.button5.TabIndex = 47;
            this.button5.Text = "输出目录";
            this.button5.UseVisualStyleBackColor = true;
            this.button5.Click += new System.EventHandler(this.selectSplitOutputHandler);
            // 
            // splitBlockHeightText
            // 
            this.splitBlockHeightText.Location = new System.Drawing.Point(894, 269);
            this.splitBlockHeightText.Name = "splitBlockHeightText";
            this.splitBlockHeightText.Size = new System.Drawing.Size(61, 21);
            this.splitBlockHeightText.TabIndex = 52;
            this.splitBlockHeightText.TextChanged += new System.EventHandler(this.textBox3_TextChanged_1);
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.Location = new System.Drawing.Point(842, 272);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(41, 12);
            this.label14.TabIndex = 51;
            this.label14.Text = "块高度";
            this.label14.Click += new System.EventHandler(this.label14_Click);
            // 
            // splitBlockWidthText
            // 
            this.splitBlockWidthText.Location = new System.Drawing.Point(755, 269);
            this.splitBlockWidthText.Name = "splitBlockWidthText";
            this.splitBlockWidthText.Size = new System.Drawing.Size(61, 21);
            this.splitBlockWidthText.TabIndex = 50;
            this.splitBlockWidthText.TextChanged += new System.EventHandler(this.textBox4_TextChanged);
            // 
            // label15
            // 
            this.label15.AutoSize = true;
            this.label15.Location = new System.Drawing.Point(707, 272);
            this.label15.Name = "label15";
            this.label15.Size = new System.Drawing.Size(41, 12);
            this.label15.TabIndex = 49;
            this.label15.Text = "块宽度";
            this.label15.Click += new System.EventHandler(this.label15_Click);
            // 
            // button6
            // 
            this.button6.Location = new System.Drawing.Point(949, 321);
            this.button6.Name = "button6";
            this.button6.Size = new System.Drawing.Size(97, 23);
            this.button6.TabIndex = 53;
            this.button6.Text = "开始";
            this.button6.UseVisualStyleBackColor = true;
            this.button6.Click += new System.EventHandler(this.startSplitMapHandler);
            // 
            // splitGapText
            // 
            this.splitGapText.Location = new System.Drawing.Point(924, 90);
            this.splitGapText.Name = "splitGapText";
            this.splitGapText.Size = new System.Drawing.Size(36, 21);
            this.splitGapText.TabIndex = 62;
            this.splitGapText.Text = "_";
            // 
            // splitPreNameText
            // 
            this.splitPreNameText.Location = new System.Drawing.Point(809, 90);
            this.splitPreNameText.Name = "splitPreNameText";
            this.splitPreNameText.Size = new System.Drawing.Size(54, 21);
            this.splitPreNameText.TabIndex = 61;
            // 
            // label16
            // 
            this.label16.AutoSize = true;
            this.label16.Location = new System.Drawing.Point(868, 94);
            this.label16.Name = "label16";
            this.label16.Size = new System.Drawing.Size(41, 12);
            this.label16.TabIndex = 60;
            this.label16.Text = "分隔符";
            // 
            // label17
            // 
            this.label17.AutoSize = true;
            this.label17.Location = new System.Drawing.Point(774, 93);
            this.label17.Name = "label17";
            this.label17.Size = new System.Drawing.Size(29, 12);
            this.label17.TabIndex = 59;
            this.label17.Text = "前缀";
            // 
            // splitStartValueText
            // 
            this.splitStartValueText.Location = new System.Drawing.Point(924, 119);
            this.splitStartValueText.Name = "splitStartValueText";
            this.splitStartValueText.Size = new System.Drawing.Size(36, 21);
            this.splitStartValueText.TabIndex = 58;
            this.splitStartValueText.Text = "0";
            // 
            // splitNumText
            // 
            this.splitNumText.Location = new System.Drawing.Point(809, 117);
            this.splitNumText.Name = "splitNumText";
            this.splitNumText.Size = new System.Drawing.Size(36, 21);
            this.splitNumText.TabIndex = 57;
            // 
            // label18
            // 
            this.label18.AutoSize = true;
            this.label18.Location = new System.Drawing.Point(867, 123);
            this.label18.Name = "label18";
            this.label18.Size = new System.Drawing.Size(41, 12);
            this.label18.TabIndex = 56;
            this.label18.Text = "初始值";
            // 
            // label19
            // 
            this.label19.AutoSize = true;
            this.label19.Location = new System.Drawing.Point(774, 122);
            this.label19.Name = "label19";
            this.label19.Size = new System.Drawing.Size(29, 12);
            this.label19.TabIndex = 55;
            this.label19.Text = "位数";
            // 
            // panel4
            // 
            this.panel4.Controls.Add(this.splitXyOption);
            this.panel4.Controls.Add(this.splitNumberOption);
            this.panel4.Controls.Add(this.splitYxOption);
            this.panel4.Location = new System.Drawing.Point(696, 60);
            this.panel4.Name = "panel4";
            this.panel4.Size = new System.Drawing.Size(87, 100);
            this.panel4.TabIndex = 54;
            // 
            // splitXyOption
            // 
            this.splitXyOption.AutoSize = true;
            this.splitXyOption.Location = new System.Drawing.Point(10, 16);
            this.splitXyOption.Name = "splitXyOption";
            this.splitXyOption.Size = new System.Drawing.Size(41, 16);
            this.splitXyOption.TabIndex = 12;
            this.splitXyOption.TabStop = true;
            this.splitXyOption.Text = "x_y";
            this.splitXyOption.UseVisualStyleBackColor = true;
            // 
            // splitNumberOption
            // 
            this.splitNumberOption.AutoSize = true;
            this.splitNumberOption.Location = new System.Drawing.Point(10, 60);
            this.splitNumberOption.Name = "splitNumberOption";
            this.splitNumberOption.Size = new System.Drawing.Size(59, 16);
            this.splitNumberOption.TabIndex = 14;
            this.splitNumberOption.TabStop = true;
            this.splitNumberOption.Text = "1-1000";
            this.splitNumberOption.UseVisualStyleBackColor = true;
            // 
            // splitYxOption
            // 
            this.splitYxOption.AutoSize = true;
            this.splitYxOption.Location = new System.Drawing.Point(10, 38);
            this.splitYxOption.Name = "splitYxOption";
            this.splitYxOption.Size = new System.Drawing.Size(41, 16);
            this.splitYxOption.TabIndex = 13;
            this.splitYxOption.TabStop = true;
            this.splitYxOption.Text = "y_x";
            this.splitYxOption.UseVisualStyleBackColor = true;
            // 
            // splitStartXyNumText
            // 
            this.splitStartXyNumText.Location = new System.Drawing.Point(1023, 89);
            this.splitStartXyNumText.Name = "splitStartXyNumText";
            this.splitStartXyNumText.Size = new System.Drawing.Size(36, 21);
            this.splitStartXyNumText.TabIndex = 64;
            this.splitStartXyNumText.Text = "0";
            // 
            // label20
            // 
            this.label20.AutoSize = true;
            this.label20.Location = new System.Drawing.Point(966, 93);
            this.label20.Name = "label20";
            this.label20.Size = new System.Drawing.Size(53, 12);
            this.label20.TabIndex = 63;
            this.label20.Text = "初始值xy";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1368, 626);
            this.Controls.Add(this.splitStartXyNumText);
            this.Controls.Add(this.label20);
            this.Controls.Add(this.splitGapText);
            this.Controls.Add(this.splitPreNameText);
            this.Controls.Add(this.label16);
            this.Controls.Add(this.label17);
            this.Controls.Add(this.splitStartValueText);
            this.Controls.Add(this.splitNumText);
            this.Controls.Add(this.label18);
            this.Controls.Add(this.label19);
            this.Controls.Add(this.panel4);
            this.Controls.Add(this.button6);
            this.Controls.Add(this.splitBlockHeightText);
            this.Controls.Add(this.label14);
            this.Controls.Add(this.splitBlockWidthText);
            this.Controls.Add(this.label15);
            this.Controls.Add(this.splitOutDirectoryText);
            this.Controls.Add(this.button5);
            this.Controls.Add(this.label13);
            this.Controls.Add(this.splitMapSourceText);
            this.Controls.Add(this.button4);
            this.Controls.Add(this.label12);
            this.Controls.Add(this.gapText);
            this.Controls.Add(this.preName);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.totalBlockNumText);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.blockHeightText);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.blockWidthText);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.smallMapHeightText);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.smallMapWidthText);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.panel3);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.parentFolderOutputText);
            this.Controls.Add(this.mapParentFolderText);
            this.Controls.Add(this.outputPathText);
            this.Controls.Add(this.sourceText);
            this.Controls.Add(this.yGridText);
            this.Controls.Add(this.xGridText);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.tileText);
            this.Controls.Add(this.processText);
            this.Controls.Add(this.mutilButton);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.generateBtn);
            this.Controls.Add(this.targetBtn);
            this.Controls.Add(this.sourceBtn);
            this.Name = "Form1";
            this.Text = "地图合成";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            this.panel4.ResumeLayout(false);
            this.panel4.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button sourceBtn;
        private System.Windows.Forms.Button targetBtn;
        private System.Windows.Forms.Button generateBtn;
        private System.Windows.Forms.Button mutilButton;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Label processText;
        private System.Windows.Forms.Label tileText;
        private System.Windows.Forms.RadioButton alignType1;
        private System.Windows.Forms.RadioButton alignType2;
        private System.Windows.Forms.RadioButton alignType3;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.RadioButton imageType1;
        private System.Windows.Forms.RadioButton imageType3;
        private System.Windows.Forms.RadioButton imageType2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox xGridText;
        private System.Windows.Forms.TextBox yGridText;
        private System.Windows.Forms.TextBox sourceText;
        private System.Windows.Forms.TextBox outputPathText;
        private System.Windows.Forms.TextBox mapParentFolderText;
        private System.Windows.Forms.TextBox parentFolderOutputText;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.RadioButton outBmpType;
        private System.Windows.Forms.RadioButton outJpgType;
        private System.Windows.Forms.TextBox smallMapWidthText;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox smallMapHeightText;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox blockWidthText;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox blockHeightText;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TextBox totalBlockNumText;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.TextBox gapText;
        private System.Windows.Forms.TextBox preName;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.TextBox splitMapSourceText;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.TextBox splitOutDirectoryText;
        private System.Windows.Forms.Button button5;
        private System.Windows.Forms.TextBox splitBlockHeightText;
        private System.Windows.Forms.Label label14;
        private System.Windows.Forms.TextBox splitBlockWidthText;
        private System.Windows.Forms.Label label15;
        private System.Windows.Forms.Button button6;
        private System.Windows.Forms.TextBox splitGapText;
        private System.Windows.Forms.TextBox splitPreNameText;
        private System.Windows.Forms.Label label16;
        private System.Windows.Forms.Label label17;
        private System.Windows.Forms.TextBox splitStartValueText;
        private System.Windows.Forms.TextBox splitNumText;
        private System.Windows.Forms.Label label18;
        private System.Windows.Forms.Label label19;
        private System.Windows.Forms.Panel panel4;
        private System.Windows.Forms.RadioButton splitXyOption;
        private System.Windows.Forms.RadioButton splitNumberOption;
        private System.Windows.Forms.RadioButton splitYxOption;
        private System.Windows.Forms.TextBox splitStartXyNumText;
        private System.Windows.Forms.Label label20;
    }
}

