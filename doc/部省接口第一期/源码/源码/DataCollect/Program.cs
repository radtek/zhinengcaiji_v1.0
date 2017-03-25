using System;
using System.Threading;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using System.Diagnostics;

namespace DataCollect
{
    static class Program
    {
        /// <summary>
        /// 应用程序的主入口点。
        /// </summary>
        [STAThread]
        static void Main()
        {

            //防止一台机器上跑两个以上的集团接口(包含多用户)
            Process[] ps = Process.GetProcessesByName("DataCollect");
            if (ps.Length > 1)
            {
                XtraMessageBox.Show("省公司接口已经运行(DataCollect.exe)。\r\n如果想重启此程序，请先关闭已经运行省公司接口程序。", @"提示", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            // Modified on 2010-04-03 by G.Ren
            // 防止一台机器上跑两个以上的省公司接口
            //bool bCreatedNew;
            //Mutex m = new Mutex(false, "DataCollect.exe", out bCreatedNew);
            //if (!bCreatedNew)
            //{
            //    XtraMessageBox.Show("省公司接口已经运行(DataCollect.exe)。\r\n如果想重启此程序，请先关闭已经运行省公司接口程序。", @"提示", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            //    return;
            //}

            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new DataCollectFrm());
        }
    }
}
