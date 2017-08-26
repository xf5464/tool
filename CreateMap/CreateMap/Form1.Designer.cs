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
            this.panel1.SuspendLayout();
            this.panel2.SuspendLayout();
            this.panel3.SuspendLayout();
            this.SuspendLayout();
            // 
            // sourceBtn
            // 
            this.sourceBtn.Location = new System.Drawing.Point(152, 340);
            this.sourceBtn.Name = "sourceBtn";
            this.sourceBtn.Size = new System.Drawing.Size(75, 23);
            this.sourceBtn.TabIndex = 0;
            this.sourceBtn.Text = "单个地图";
            this.sourceBtn.UseVisualStyleBackColor = true;
            this.sourceBtn.Click += new System.EventHandler(this.sourceBtnClick);
            // 
            // targetBtn
            // 
            this.targetBtn.Location = new System.Drawing.Point(152, 369);
            this.targetBtn.Name = "targetBtn";
            this.targetBtn.Size = new System.Drawing.Size(75, 23);
            this.targetBtn.TabIndex = 1;
            this.targetBtn.Text = "输出目录";
            this.targetBtn.UseVisualStyleBackColor = true;
            this.targetBtn.Click += new System.EventHandler(this.outputBtnClick);
            // 
            // generateBtn
            // 
            this.generateBtn.Location = new System.Drawing.Point(415, 413);
            this.generateBtn.Name = "generateBtn";
            this.generateBtn.Size = new System.Drawing.Size(97, 23);
            this.generateBtn.TabIndex = 4;
            this.generateBtn.Text = "单个地图开始";
            this.generateBtn.UseVisualStyleBackColor = true;
            this.generateBtn.MouseClick += new System.Windows.Forms.MouseEventHandler(this.generateBtn_MouseClick);
            // 
            // mutilButton
            // 
            this.mutilButton.Location = new System.Drawing.Point(415, 531);
            this.mutilButton.Name = "mutilButton";
            this.mutilButton.Size = new System.Drawing.Size(97, 23);
            this.mutilButton.TabIndex = 9;
            this.mutilButton.Text = "多个地图开始";
            this.mutilButton.UseVisualStyleBackColor = true;
            this.mutilButton.Click += new System.EventHandler(this.mutilStartClick);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(152, 489);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(75, 23);
            this.button2.TabIndex = 6;
            this.button2.Text = "输出目录";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.mutilOutputSelectClick);
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(152, 460);
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
            this.processText.Location = new System.Drawing.Point(515, 531);
            this.processText.Name = "processText";
            this.processText.Size = new System.Drawing.Size(192, 23);
            this.processText.TabIndex = 10;
            // 
            // tileText
            // 
            this.tileText.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.tileText.Location = new System.Drawing.Point(362, 304);
            this.tileText.Name = "tileText";
            this.tileText.Size = new System.Drawing.Size(192, 23);
            this.tileText.TabIndex = 11;
            // 
            // alignType1
            // 
            this.alignType1.AutoSize = true;
            this.alignType1.Location = new System.Drawing.Point(13, 16);
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
            this.alignType2.Location = new System.Drawing.Point(13, 38);
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
            this.alignType3.Location = new System.Drawing.Point(13, 60);
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
            this.panel1.Location = new System.Drawing.Point(178, 60);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(87, 100);
            this.panel1.TabIndex = 15;
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.imageType1);
            this.panel2.Controls.Add(this.imageType3);
            this.panel2.Controls.Add(this.imageType2);
            this.panel2.Location = new System.Drawing.Point(471, 60);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(87, 100);
            this.panel2.TabIndex = 16;
            // 
            // imageType1
            // 
            this.imageType1.AutoSize = true;
            this.imageType1.Location = new System.Drawing.Point(13, 16);
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
            this.imageType3.Location = new System.Drawing.Point(13, 60);
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
            this.imageType2.Location = new System.Drawing.Point(13, 38);
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
            this.label1.Location = new System.Drawing.Point(256, 122);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(53, 12);
            this.label1.TabIndex = 17;
            this.label1.Text = "横排格子";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(349, 123);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(53, 12);
            this.label2.TabIndex = 18;
            this.label2.Text = "竖排格子";
            // 
            // xGridText
            // 
            this.xGridText.Location = new System.Drawing.Point(309, 119);
            this.xGridText.Name = "xGridText";
            this.xGridText.Size = new System.Drawing.Size(36, 21);
            this.xGridText.TabIndex = 19;
            this.xGridText.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
            // 
            // yGridText
            // 
            this.yGridText.Location = new System.Drawing.Point(406, 119);
            this.yGridText.Name = "yGridText";
            this.yGridText.Size = new System.Drawing.Size(36, 21);
            this.yGridText.TabIndex = 20;
            // 
            // sourceText
            // 
            this.sourceText.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.sourceText.Location = new System.Drawing.Point(245, 342);
            this.sourceText.Name = "sourceText";
            this.sourceText.Size = new System.Drawing.Size(551, 21);
            this.sourceText.TabIndex = 21;
            // 
            // outputPathText
            // 
            this.outputPathText.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.outputPathText.Location = new System.Drawing.Point(245, 369);
            this.outputPathText.Name = "outputPathText";
            this.outputPathText.Size = new System.Drawing.Size(551, 21);
            this.outputPathText.TabIndex = 22;
            // 
            // mapParentFolderText
            // 
            this.mapParentFolderText.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.mapParentFolderText.Location = new System.Drawing.Point(245, 462);
            this.mapParentFolderText.Name = "mapParentFolderText";
            this.mapParentFolderText.Size = new System.Drawing.Size(551, 21);
            this.mapParentFolderText.TabIndex = 23;
            // 
            // parentFolderOutputText
            // 
            this.parentFolderOutputText.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.parentFolderOutputText.Location = new System.Drawing.Point(245, 491);
            this.parentFolderOutputText.Name = "parentFolderOutputText";
            this.parentFolderOutputText.Size = new System.Drawing.Size(551, 21);
            this.parentFolderOutputText.TabIndex = 24;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(502, 45);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(29, 12);
            this.label3.TabIndex = 25;
            this.label3.Text = "输入";
            this.label3.Click += new System.EventHandler(this.label3_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(643, 45);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(29, 12);
            this.label4.TabIndex = 26;
            this.label4.Text = "输出";
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.outBmpType);
            this.panel3.Controls.Add(this.outJpgType);
            this.panel3.Location = new System.Drawing.Point(610, 60);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(101, 100);
            this.panel3.TabIndex = 27;
            // 
            // outBmpType
            // 
            this.outBmpType.AutoSize = true;
            this.outBmpType.Location = new System.Drawing.Point(16, 38);
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
            this.outJpgType.Location = new System.Drawing.Point(16, 16);
            this.outJpgType.Name = "outJpgType";
            this.outJpgType.Size = new System.Drawing.Size(47, 16);
            this.outJpgType.TabIndex = 15;
            this.outJpgType.TabStop = true;
            this.outJpgType.Text = ".jpg";
            this.outJpgType.UseVisualStyleBackColor = true;
            // 
            // smallMapWidthText
            // 
            this.smallMapWidthText.Location = new System.Drawing.Point(248, 206);
            this.smallMapWidthText.Name = "smallMapWidthText";
            this.smallMapWidthText.Size = new System.Drawing.Size(61, 21);
            this.smallMapWidthText.TabIndex = 29;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(189, 209);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(53, 12);
            this.label5.TabIndex = 28;
            this.label5.Text = "小地图宽";
            this.label5.Click += new System.EventHandler(this.label5_Click);
            // 
            // smallMapHeightText
            // 
            this.smallMapHeightText.Location = new System.Drawing.Point(248, 229);
            this.smallMapHeightText.Name = "smallMapHeightText";
            this.smallMapHeightText.Size = new System.Drawing.Size(61, 21);
            this.smallMapHeightText.TabIndex = 31;
            this.smallMapHeightText.TextChanged += new System.EventHandler(this.textBox2_TextChanged);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(189, 232);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(53, 12);
            this.label6.TabIndex = 30;
            this.label6.Text = "小地图高";
            this.label6.Click += new System.EventHandler(this.label6_Click);
            // 
            // blockWidthText
            // 
            this.blockWidthText.Location = new System.Drawing.Point(383, 206);
            this.blockWidthText.Name = "blockWidthText";
            this.blockWidthText.Size = new System.Drawing.Size(61, 21);
            this.blockWidthText.TabIndex = 33;
            this.blockWidthText.TextChanged += new System.EventHandler(this.textBox3_TextChanged);
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(324, 209);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(53, 12);
            this.label7.TabIndex = 32;
            this.label7.Text = "地图块宽";
            this.label7.Click += new System.EventHandler(this.label7_Click);
            // 
            // blockHeightText
            // 
            this.blockHeightText.Location = new System.Drawing.Point(383, 232);
            this.blockHeightText.Name = "blockHeightText";
            this.blockHeightText.Size = new System.Drawing.Size(61, 21);
            this.blockHeightText.TabIndex = 35;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(324, 235);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(53, 12);
            this.label8.TabIndex = 34;
            this.label8.Text = "地图块高";
            // 
            // totalBlockNumText
            // 
            this.totalBlockNumText.Location = new System.Drawing.Point(527, 206);
            this.totalBlockNumText.Name = "totalBlockNumText";
            this.totalBlockNumText.Size = new System.Drawing.Size(61, 21);
            this.totalBlockNumText.TabIndex = 37;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(459, 209);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(65, 12);
            this.label9.TabIndex = 36;
            this.label9.Text = "地图总张数";
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(461, 233);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 38;
            this.button1.Text = "计算";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.calculateGridNumHandler);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(948, 626);
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
    }
}

