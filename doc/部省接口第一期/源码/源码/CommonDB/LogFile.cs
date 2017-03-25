using System;
using System.IO ;
using System.Windows.Forms;

namespace NOAP.CommonDB
{
	/// <summary>
	/// WriteErrToFile 的摘要说明。
	/// </summary>
	public class LogFile
	{
	    /// <summary>
		/// 执行的SQL时发生错误或者未执行时，写入文件
		/// </summary>
		/// <param name="strSQL">执行的SQL 语句</param>
		/// <param name="strMessage">发生的错误信息</param>
        /// <param name="nSignify">发生的严重程度</param>
		public static void WriteToFile(string strSQL,string strMessage,int nSignify)
		{
            try
            {
                string sPath = Application.StartupPath + "\\Log\\";
                if (!Directory.Exists(sPath))
                    Directory.CreateDirectory(sPath);

                string strFilePath = sPath + DateTime.Now.ToString("yyyyMMddHH") + ".txt";
                StreamWriter m_streamWriter;
                if (File.Exists(strFilePath))
                {
                    m_streamWriter = File.AppendText(strFilePath);
                }
                else
                {
                    FileStream fs = File.Create(strFilePath);
                    m_streamWriter = new StreamWriter(fs);
                }

                string strSignify;
                switch (nSignify)
                {
                    case 0:
                        strSignify = "正常";
                        break;
                    case 1:
                        strSignify = "轻微";
                        break;
                    case 2:
                        strSignify = "严重";
                        break;
                    default:
                        strSignify = "正常";
                        break;
                }

                m_streamWriter.WriteLine(string.Format("[{0}][严重程度：{1}]", DateTime.Now.ToString("HH:mm:ss"), strSignify));
                m_streamWriter.WriteLine(string.Format("错误信息：{0}", strMessage));
                m_streamWriter.WriteLine(
                    string.Format("----------------------------------------------------------------------"));
                m_streamWriter.WriteLine(string.Format("执行的SQL语句：{0}", strSQL));
                m_streamWriter.WriteLine(string.Format("\n\n"));

                //关闭此文件
                m_streamWriter.Flush();
                m_streamWriter.Close();
            }catch{}
		}
	}
}
