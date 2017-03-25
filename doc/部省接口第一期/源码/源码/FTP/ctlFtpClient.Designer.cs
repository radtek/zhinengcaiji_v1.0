namespace NOAP.Ftp
{
    partial class ctlFtpClient
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

        #region 组件设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要
        /// 使用代码编辑器修改此方法的内容。

        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ctlFtpClient));
            this.folderBrowserDialog1 = new System.Windows.Forms.FolderBrowserDialog();
            this.exFTPConnection1 = new EnterpriseDT.Net.Ftp.ExFTPConnection(this.components);
            // 
            // exFTPConnection1
            // 
            this.exFTPConnection1.CommandEncoding = ((System.Text.Encoding)(resources.GetObject("exFTPConnection1.CommandEncoding")));
            this.exFTPConnection1.EventsEnabled = true;
            this.exFTPConnection1.LicenseKey = "326-2432-9055-7500";
            this.exFTPConnection1.LicenseOwner = "metar";
            this.exFTPConnection1.ParentControl = null;
            this.exFTPConnection1.Password = "WosBj";
            this.exFTPConnection1.ServerAddress = "10.2.129.211";
            this.exFTPConnection1.ServerDirectory = "/";
            this.exFTPConnection1.UseGuiThreadIfAvailable = true;
            this.exFTPConnection1.UserName = "administrator";

        }

        #endregion

        private System.Windows.Forms.FolderBrowserDialog folderBrowserDialog1;
        private EnterpriseDT.Net.Ftp.ExFTPConnection exFTPConnection1;
    }
}
