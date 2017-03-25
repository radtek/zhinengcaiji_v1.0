using System;
using System.IO ;
using System.Windows.Forms;

namespace NOAP.CommonDB
{
	/// <summary>
	/// WriteErrToFile ��ժҪ˵����
	/// </summary>
	public class LogFile
	{
	    /// <summary>
		/// ִ�е�SQLʱ�����������δִ��ʱ��д���ļ�
		/// </summary>
		/// <param name="strSQL">ִ�е�SQL ���</param>
		/// <param name="strMessage">�����Ĵ�����Ϣ</param>
        /// <param name="nSignify">���������س̶�</param>
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
                        strSignify = "����";
                        break;
                    case 1:
                        strSignify = "��΢";
                        break;
                    case 2:
                        strSignify = "����";
                        break;
                    default:
                        strSignify = "����";
                        break;
                }

                m_streamWriter.WriteLine(string.Format("[{0}][���س̶ȣ�{1}]", DateTime.Now.ToString("HH:mm:ss"), strSignify));
                m_streamWriter.WriteLine(string.Format("������Ϣ��{0}", strMessage));
                m_streamWriter.WriteLine(
                    string.Format("----------------------------------------------------------------------"));
                m_streamWriter.WriteLine(string.Format("ִ�е�SQL��䣺{0}", strSQL));
                m_streamWriter.WriteLine(string.Format("\n\n"));

                //�رմ��ļ�
                m_streamWriter.Flush();
                m_streamWriter.Close();
            }catch{}
		}
	}
}
