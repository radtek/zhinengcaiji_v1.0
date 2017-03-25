using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using System.Data;
using System.Windows.Forms;
using System.IO;
using NOAP.CommonDB;
using NOAP.Common;

namespace NOAP.Ftp
{
    public partial class ctlFtpClient : Component
    {
        private readonly string msgContent = "FTP服务器上不存在该文件！";
        private FTPClient _ftpFac;
        private string RemoteSeverPath = "";
        private AsyncCallback callbackOnConnect;
        public ctlFtpClient()
        {
            InitializeComponent();
            callbackOnConnect = new AsyncCallback(OnConnection);
            InitServer();
        }
        public ctlFtpClient(IContainer container)
        {
            container.Add(this);
            InitializeComponent();
            callbackOnConnect = new AsyncCallback(OnConnection);
            InitServer();
        }
        private void InitServer()
        {
            try
            {
                string SqlFTPInfo = "select * from mod_filesmgr_serverinfo where upper(mod_filesmgr_serverinfo.protocal) = 'GZFTP' or upper(mod_filesmgr_serverinfo.china_name) = 'GZFTP'";
                DataTable DTFtp = NOAP.CommonDB.DBAcess.Instance().GetDataTable(SqlFTPInfo);
                
                if (DTFtp.Rows.Count > 0)
                {
                    //string strIP = Common.CommonFunction.ReadIniFile(Common.Global.ApplicationStartPath + "\\Security.ini", "IP", "REPORT");
                    string strIP = DTFtp.Rows[0]["serveraddress"].ToString();
                    if (strIP != "")
                    {
                        exFTPConnection1.ServerAddress = strIP;
                        string strwhere = string.Format("serveraddress='{0}' and (protocal='GZFTP' or china_name = 'GZFTP')", strIP);
                        DataRow[] dr = DTFtp.Select(strwhere);
                        if (dr.Length > 0)
                        {
                            exFTPConnection1.ServerPort = int.Parse(dr[0]["serverport"].ToString());
                            exFTPConnection1.UserName = dr[0]["username"].ToString();
                            exFTPConnection1.Password = dr[0]["password"].ToString();
                            exFTPConnection1.Protocol = FTPType(dr[0]["protocal"].ToString());
                            exFTPConnection1.ServerDirectory = dr[0]["serverdirectory"].ToString();
                        }
                        else
                        {

                        }

                    }
                    else
                    {
                        exFTPConnection1.LicenseKey = "326-2432-9055-7500";
                        exFTPConnection1.LicenseOwner = "metar";
                        exFTPConnection1.ServerAddress = DTFtp.Rows[0]["serveraddress"].ToString();
                        exFTPConnection1.ServerPort = int.Parse(DTFtp.Rows[0]["serverport"].ToString());
                        exFTPConnection1.UserName = DTFtp.Rows[0]["username"].ToString();
                        exFTPConnection1.Password = DTFtp.Rows[0]["password"].ToString();
                        exFTPConnection1.Protocol = FTPType(DTFtp.Rows[0]["protocal"].ToString());
                        exFTPConnection1.ServerDirectory = DTFtp.Rows[0]["serverdirectory"].ToString();
                    }
                }
                if (!exFTPConnection1.IsConnected)
                    exFTPConnection1.BeginConnect(callbackOnConnect, null);
            }
            catch(Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        private EnterpriseDT.Net.Ftp.FileTransferProtocol FTPType(string FTP)
        {
            switch (FTP.ToUpper())
            {
                case "FTP":
                    return EnterpriseDT.Net.Ftp.FileTransferProtocol.FTP;
                case "HTTP":
                    return EnterpriseDT.Net.Ftp.FileTransferProtocol.HTTP;
                case "SFTP":
                    return EnterpriseDT.Net.Ftp.FileTransferProtocol.SFTP;
                case "FTPSExplicit":
                    return EnterpriseDT.Net.Ftp.FileTransferProtocol.FTPSExplicit;
                case "FTPSImplicit":
                    return EnterpriseDT.Net.Ftp.FileTransferProtocol.FTPSImplicit;
                default:
                    return EnterpriseDT.Net.Ftp.FileTransferProtocol.FTP;
            }
        }
        private void OnCreateDirectory(IAsyncResult asynResult)
        {
            exFTPConnection1.EndCreateDirectory(asynResult);
        }
        private void OnConnection(IAsyncResult asynResult)
        {

        }

        public void InitRemoteSeverPath(string dictType, string defaultPath)
        {
            string SqlFTPInfo = "select dict_name from cfg_dictitem  where lower(dict_type)=lower('" + dictType + "')";
            DataTable DTFtp = Common.Global.dbAccess.GetDataTable(SqlFTPInfo);
            if (DTFtp != null && DTFtp.Rows.Count > 0)
            {
                try
                {
                    RemoteSeverPath = DTFtp.Rows[0]["dict_name"].ToString().Trim();
                }
                catch
                {
                    RemoteSeverPath = defaultPath;
                }
            }
            else
            {
                RemoteSeverPath = defaultPath;
            }
        }
        //新增通过FTP地址方式下载方法
        public string DownFTPFile(int groupid, string strFileName, string remoteSeverPath)
        {
            bool strret;
            if (System.Windows.Forms.DialogResult.OK == folderBrowserDialog1.ShowDialog())
            {
                string strLocalFile = folderBrowserDialog1.SelectedPath;
                //strReturn = DownFile(strFileName, strLocalFile);
                try
                {
                    strret = DownFTPFile(groupid, strFileName, strLocalFile, remoteSeverPath);
                }
                catch (Exception ex)
                {
                    return "下载出错：" + ex.Message;
                }
                if (strret)
                {
                    return "下载成功";
                }
                else
                    return "下载出错：连接FTP失败或者FTP服务器上不存在该文件！";
            }
            return "";
        }

        //新增通过FTP地址方式下载方法
        public bool DownFTPFile(int groupid, string strFileName, string strLocalFile, string remoteSeverPath)
        {
            string filename = "";
            string pathname = "";
            try
            {
                if(_ftpFac==null)
                    _ftpFac = new FTPClient(exFTPConnection1.ServerAddress, exFTPConnection1.UserName, exFTPConnection1.Password,exFTPConnection1.ServerPort);
                strFileName = strFileName.Replace("\\", "/").TrimStart('/');
                if (groupid < 0)
                {
                    //string rppath = getReportPath((-groupid).ToString());
                    if (strFileName.IndexOf("/") > -1)
                    {
                        filename = strFileName.Substring(strFileName.LastIndexOf("/"), strFileName.Length - strFileName.LastIndexOf("/"));
                        pathname = remoteSeverPath + "/" + strFileName.Substring(0, strFileName.LastIndexOf("/"));
                    }
                }
                else
                {
                    if (strFileName.IndexOf("/") > -1)
                    {
                        filename = strFileName.Substring(strFileName.LastIndexOf("/"), strFileName.Length - strFileName.LastIndexOf("/"));
                        pathname = remoteSeverPath + "/" + strFileName.Substring(0, strFileName.LastIndexOf("/"));
                    }
                    else
                    {
                        throw new Exception(msgContent);
                        return false;
                    }
                }
                //if (_ftpFac.fileCheckExist(pathname, filename.TrimStart('/')))
                //{
                bool result = _ftpFac.fileDownload(strLocalFile, filename, pathname, filename);
                if (!result)
                {
                    string errstring = string.Format("无法下载以下地址的文件：ftp://{0}/{1}{2}", exFTPConnection1.ServerAddress, pathname, filename);
                    string errstring2 = "";
                    #if DEBUG
                    errstring2 = string.Format("\n 端口为：{2} 登陆用户名：{0} 密码：{1}", exFTPConnection1.UserName, exFTPConnection1.Password, exFTPConnection1.ServerPort);
                    #endif
                    LogFile.WriteToFile("", errstring + errstring2, 2);
                }
                string filelastname = filename.Substring(filename.LastIndexOf("."), filename.Length - filename.LastIndexOf(".")).ToLower();
                if (filelastname == ".zip" || filelastname == ".rar")
                {
                    UnZipClass.UnZip(strLocalFile + filename, strLocalFile, "");
                    if (File.Exists(strLocalFile + filename))
                    {
                        File.Delete(strLocalFile + filename);
                    }
                }
                return result;
            }
            catch (Exception ex)
            {
                string errstring = string.Format("无法下载以下地址的文件：ftp://{0}/{1}{2}", exFTPConnection1.ServerAddress, pathname, filename);
                string errstring2 = "";
                #if DEBUG
                errstring2 = string.Format("\n 端口为：{2} 登陆用户名：{0} 密码：{1}", exFTPConnection1.UserName, exFTPConnection1.Password, exFTPConnection1.ServerPort);
                #endif
                LogFile.WriteToFile(ex.Message, errstring + errstring2, 2);
                if (ex.Message == msgContent)
                    throw new Exception(msgContent);
                else
                    throw new Exception("连接FTP失败或者FTP服务器上不存在该文件！");
            }
            //}
            //else
            //{
            //    throw new Exception("FTP服务器上不存在该文件");
            //}

        }
        private string getReportPath(string groupid)
        {
            string str = "select reportpath from mod_report_sql where group_id={0}";
            str = string.Format(str, groupid);
            string retPath = Common.Global.dbAccess.ExecScalar(str).ToString();
            return retPath;
            //string str = "select groupid,TEMPLATENAME from mod_f1report_template where TEMPLATEID={0} ";
            //str = string.Format(str,groupid);
            //DataTable dt = Common.Global.dbAccess.GetDataTable(str);
            //if (dt.Rows.Count > 0)
            //{
            //    string gpid = dt.Rows[0]["groupid"].ToString();
            //    string tempname = dt.Rows[0]["TEMPLATENAME"].ToString();
            //    ret += tempname;
            //    ret = getReportPath(gpid) + "/" + ret;
            //}
            //return ret;
        }

        public string DownFile(string strFileName)
        {
            string strReturn = "";
            if (System.Windows.Forms.DialogResult.OK == folderBrowserDialog1.ShowDialog())
            {
                string strLocalFile = folderBrowserDialog1.SelectedPath;
                strReturn = DownFile(strFileName, strLocalFile);
            }
            return strReturn;
        }

        public string DownFile(string strFileName, string strLocalFile)
        {
            string strReturn = "";
            string sTemp = exFTPConnection1.ServerDirectory;
            try
            {
                exFTPConnection1.ServerDirectory += RemoteSeverPath;
                if (!exFTPConnection1.IsConnected)
                {
                    exFTPConnection1.BeginConnect(callbackOnConnect, null);
                }
                Encoding ASCII = Encoding.Default;
                Byte[] cmdBytes = ASCII.GetBytes(strFileName.ToCharArray());

                exFTPConnection1.DataEncoding = Encoding.Default;
                exFTPConnection1.CommandEncoding = Encoding.Default;


                if (exFTPConnection1.Exists(System.Text.Encoding.Default.GetString(cmdBytes)))
                {
                    exFTPConnection1.DownloadFile(strLocalFile, strFileName);//Encoding.Unicode.GetString(cmdBytes));
                    strReturn = strLocalFile + "\\" + strFileName;
                }
            }
            catch (Exception err)
            {
                MessageBox.Show("下载文件错误：" + err.Message);
            }
            finally
            {
                exFTPConnection1.ServerDirectory = sTemp;
            }
            return strReturn;
        }
        public bool UpLoad(string localPath, string remoteFile)
        {
            bool isOK = false;
            IAsyncResult iAsyncResult = null;
            try
            {
                if (!exFTPConnection1.IsConnected)
                {
                    iAsyncResult = exFTPConnection1.BeginConnect(callbackOnConnect, null);
                    exFTPConnection1.Connect();
                }

                iAsyncResult = exFTPConnection1.BeginUploadFile(localPath, RemoteSeverPath + "\\" + remoteFile, false, null, null);
                exFTPConnection1.UploadFile(localPath, RemoteSeverPath + "\\" + remoteFile, false);
                exFTPConnection1.EndUploadFile(iAsyncResult);
                isOK = true;
            }
            catch
            {
                try
                {
                    if (!exFTPConnection1.IsConnected)
                    {
                        iAsyncResult = exFTPConnection1.BeginConnect(callbackOnConnect, null);
                        exFTPConnection1.Connect();
                    }

                    iAsyncResult = exFTPConnection1.BeginUploadFile(localPath, RemoteSeverPath + "\\" + remoteFile, false, null, null);
                    exFTPConnection1.UploadFile(localPath, RemoteSeverPath + "\\" + remoteFile, false);
                    exFTPConnection1.EndUploadFile(iAsyncResult);
                    isOK = true;
                }
                catch
                {
                    try
                    {
                        if (!exFTPConnection1.IsConnected)
                        {
                            iAsyncResult = exFTPConnection1.BeginConnect(callbackOnConnect, null);
                            exFTPConnection1.Connect();
                        }

                        iAsyncResult = exFTPConnection1.BeginUploadFile(localPath, RemoteSeverPath + "\\" + remoteFile, false, null, null);
                        exFTPConnection1.UploadFile(localPath, RemoteSeverPath + "\\" + remoteFile, false);
                        exFTPConnection1.EndUploadFile(iAsyncResult);
                        isOK = true;
                    }
                    catch
                    {
                        try
                        {
                            if (!exFTPConnection1.IsConnected)
                            {
                                iAsyncResult = exFTPConnection1.BeginConnect(callbackOnConnect, null);
                                exFTPConnection1.Connect();
                            }

                            iAsyncResult = exFTPConnection1.BeginUploadFile(localPath, RemoteSeverPath + "\\" + remoteFile, false, null, null);
                            exFTPConnection1.UploadFile(localPath, RemoteSeverPath + "\\" + remoteFile, false);
                            exFTPConnection1.EndUploadFile(iAsyncResult);
                            isOK = true;
                        }
                        catch (Exception err)
                        {
                            isOK = false;
                            Console.WriteLine("上传文件错误:" + err.Message);
                        }
                    }
                }
            }
            return isOK;
        }
        public void DeleteFile(string remoteFile)
        {
            try
            {
                if (!exFTPConnection1.IsConnected)
                    exFTPConnection1.BeginConnect(callbackOnConnect, null);
                exFTPConnection1.DeleteFile(RemoteSeverPath + "\\" + remoteFile);
            }
            catch (Exception err)
            {
                Console.WriteLine("删除文件错误：" + err.Message);
            }
        }
        public void MakeDir(string directory)
        {
            try
            {
                IAsyncResult iAsyncResult = null;
                if (!exFTPConnection1.IsConnected)
                    iAsyncResult = exFTPConnection1.BeginConnect(OnConnection, null);
                iAsyncResult = exFTPConnection1.BeginCreateDirectory(RemoteSeverPath + "\\" + directory, OnCreateDirectory, null);
                //exFTPConnection1.Close(false);
            }
            catch (Exception err)
            {
                Console.WriteLine("创建目录错误：" + err.Message);
            }
        }
    }
}
