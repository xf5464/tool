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
            this.sourceText = new System.Windows.Forms.Label();
            this.outputPathText = new System.Windows.Forms.Label();
            this.generateBtn = new System.Windows.Forms.Button();
            this.mutilButton = new System.Windows.Forms.Button();
            this.parentFolderOutputText = new System.Windows.Forms.Label();
            this.mapParentFolderText = new System.Windows.Forms.Label();
            this.button2 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.processText = new System.Windows.Forms.Label();
            this.tileText = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // sourceBtn
            // 
            this.sourceBtn.Location = new System.Drawing.Point(12, 80);
            this.sourceBtn.Name = "sourceBtn";
            this.sourceBtn.Size = new System.Drawing.Size(75, 23);
            this.sourceBtn.TabIndex = 0;
            this.sourceBtn.Text = "单个地图";
            this.sourceBtn.UseVisualStyleBackColor = true;
            this.sourceBtn.Click += new System.EventHandler(this.sourceBtnClick);
            // 
            // targetBtn
            // 
            this.targetBtn.Location = new System.Drawing.Point(12, 109);
            this.targetBtn.Name = "targetBtn";
            this.targetBtn.Size = new System.Drawing.Size(75, 23);
            this.targetBtn.TabIndex = 1;
            this.targetBtn.Text = "输出目录";
            this.targetBtn.UseVisualStyleBackColor = true;
            this.targetBtn.Click += new System.EventHandler(this.outputBtnClick);
            // 
            // sourceText
            // 
            this.sourceText.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.sourceText.Location = new System.Drawing.Point(103, 85);
            this.sourceText.Name = "sourceText";
            this.sourceText.Size = new System.Drawing.Size(551, 18);
            this.sourceText.TabIndex = 2;
            // 
            // outputPathText
            // 
            this.outputPathText.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.outputPathText.Location = new System.Drawing.Point(103, 114);
            this.outputPathText.Name = "outputPathText";
            this.outputPathText.Size = new System.Drawing.Size(551, 18);
            this.outputPathText.TabIndex = 3;
            // 
            // generateBtn
            // 
            this.generateBtn.Location = new System.Drawing.Point(275, 153);
            this.generateBtn.Name = "generateBtn";
            this.generateBtn.Size = new System.Drawing.Size(97, 23);
            this.generateBtn.TabIndex = 4;
            this.generateBtn.Text = "单个地图开始";
            this.generateBtn.UseVisualStyleBackColor = true;
            this.generateBtn.MouseClick += new System.Windows.Forms.MouseEventHandler(this.generateBtn_MouseClick);
            // 
            // mutilButton
            // 
            this.mutilButton.Location = new System.Drawing.Point(275, 271);
            this.mutilButton.Name = "mutilButton";
            this.mutilButton.Size = new System.Drawing.Size(97, 23);
            this.mutilButton.TabIndex = 9;
            this.mutilButton.Text = "多个地图开始";
            this.mutilButton.UseVisualStyleBackColor = true;
            this.mutilButton.Click += new System.EventHandler(this.mutilStartClick);
            // 
            // parentFolderOutputText
            // 
            this.parentFolderOutputText.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.parentFolderOutputText.Location = new System.Drawing.Point(103, 234);
            this.parentFolderOutputText.Name = "parentFolderOutputText";
            this.parentFolderOutputText.Size = new System.Drawing.Size(551, 18);
            this.parentFolderOutputText.TabIndex = 8;
            // 
            // mapParentFolderText
            // 
            this.mapParentFolderText.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.mapParentFolderText.Location = new System.Drawing.Point(103, 205);
            this.mapParentFolderText.Name = "mapParentFolderText";
            this.mapParentFolderText.Size = new System.Drawing.Size(551, 18);
            this.mapParentFolderText.TabIndex = 7;
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(12, 229);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(75, 23);
            this.button2.TabIndex = 6;
            this.button2.Text = "输出目录";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.mutilOutputSelectClick);
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(12, 200);
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
            this.processText.Location = new System.Drawing.Point(375, 271);
            this.processText.Name = "processText";
            this.processText.Size = new System.Drawing.Size(192, 23);
            this.processText.TabIndex = 10;
            // 
            // tileText
            // 
            this.tileText.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.tileText.Location = new System.Drawing.Point(216, 26);
            this.tileText.Name = "tileText";
            this.tileText.Size = new System.Drawing.Size(192, 23);
            this.tileText.TabIndex = 11;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(666, 386);
            this.Controls.Add(this.tileText);
            this.Controls.Add(this.processText);
            this.Controls.Add(this.mutilButton);
            this.Controls.Add(this.parentFolderOutputText);
            this.Controls.Add(this.mapParentFolderText);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.generateBtn);
            this.Controls.Add(this.outputPathText);
            this.Controls.Add(this.sourceText);
            this.Controls.Add(this.targetBtn);
            this.Controls.Add(this.sourceBtn);
            this.Name = "Form1";
            this.Text = "地图合成";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button sourceBtn;
        private System.Windows.Forms.Button targetBtn;
        private System.Windows.Forms.Label sourceText;
        private System.Windows.Forms.Label outputPathText;
        private System.Windows.Forms.Button generateBtn;
        private System.Windows.Forms.Button mutilButton;
        private System.Windows.Forms.Label parentFolderOutputText;
        private System.Windows.Forms.Label mapParentFolderText;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Label processText;
        private System.Windows.Forms.Label tileText;
    }
}

