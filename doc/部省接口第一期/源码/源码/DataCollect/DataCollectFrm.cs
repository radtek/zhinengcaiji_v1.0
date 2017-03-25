/**
 * Name         : DataCollect
 * Description  : ʡ�ļ��ӿڡ�
 * Author       : 
 * History      : Modified on 2010-06-03 by G.Ren
 *                Modified by chenwz from 2010-07-21 till now
 * */
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using DataCollect.CommonFun;
using System.Collections;
using DevExpress.XtraGrid.Views.Grid;
using NOAP.Common;
using NOAP.CommonDB;
using NOAP.Ftp;

namespace DataCollect
{
    public partial class DataCollectFrm : XtraForm
    {       
        private string _startupPath = string.Empty;  // ������·��
        private string _proEnName = string.Empty; //��ǰʡ��Ӣ�ļ�д
        private string _proChName = string.Empty; // ��ǰʡ��������
        private string _localRootPath = string.Empty; //����FTP�ļ���Ŀ¼

        //private string _isRepair = string.Empty;//��ȡ���ã��ж��Ƿ����޵�ģʽ


        private string _isFull = string.Empty;//��ȡ���ã��ж��Ƿ����������ݵ����������Դ���(�㶫ר��)
        private string _isNull = string.Empty;//��ȡ���ã��ж��Ƿ�����������Ϊ�յĴ���(�㶫ר��)
        private string _isCdl = string.Empty;//��ȡ���ã��ж��Ƿ�������դ�����ݵ����⴦��(�㶫ר��)
        private string _isSpecial = string.Empty;//��ȡ���ã��ж��Ƿ���38���ؼ�ָ��ͻ��(ȫ��ͨ��)

        private clsPerf _bizLayer = null; // ҵ�����
        private DataTable _dtCity = new DataTable("cfg_city");        
        private DataTable _dtVendor = new DataTable("vendor");
        private Dictionary<string, string> _mscCitys = null;
        private Dictionary<string, string> _msc = null;
        private Dictionary<string, string> _mscName = null;
        private bool _ftpIsDone = false; // ftp�����ϴ�
        private Dictionary<string, DictItem> _uploadFailed = null;// �ϴ�ʧ�� TEXT FileName  Value ftpPath
        private bool _confRunning = false; // �����������ڲɼ��ϴ�
        private bool _perfRunning = false;  // �����������ڲɼ��ϴ�
        private bool _cdlRunning = false;    // �����������ڲɼ��ϴ�
        private bool _deleteRunning = false;//����ɾ�������ļ�
        private bool _testRunning=false;//�����ϴ�������Ϣ
        private bool _useRunning = false;//�����ϴ�ƽ̨ʹ�����ͳ������
        
        //private bool _paraRunning = false;//�����ϴ��߽�������������

        private bool _paraHWRunning = false;//�����ϴ��߽������������ݻ�Ϊ
        private bool _paraZTERunning = false;//�����ϴ��߽�����������������
        private bool _paraALURunning = false;//�����ϴ��߽���������������Ѷ

        private bool _isFind = false;//��ʶ�Ƿ��ҵ��滻�ļ�
        private bool _isDown = false;
        //private bool _isTemp = true;//��ʶ�㶫����ʱ�������
        //private bool _tempRunning = false;
        private FTPClient _ftpClient = null; // FTP
        //private string _ftpRootPath = string.Empty;  // ��ǰʡ��FTP��Ŀ¼

        //Ŀ¼
        private const string ConstCdl = "CDL";  // CDL
        private const string ConstConf = "CONF";// CONF
        private const string ConstPerf = "PERF"; // PERF
        private const string ConstWork = "WORK";// WORK
        private const string ConstBackUp = "BACKUP";//BACKUP
        //����Ŀ¼
        private const string ConstComplaint = "COMPLAINT";
        private const string ConstPara = "PARA";
        private const string ConstWorkTest = "WORKTEST";
        private const string ConstVergeSite = "VERGESITE";
        private Dictionary<string, CityInfo> _cityInfo = null;
        
        private ArrayList _checkMscArray = null;
        private ArrayList _checkCityArray = null;
        private ArrayList _checkProvArray = null;
        private bool timeFlag = false;//��ʶ����������4�㻹��20��
        private DataTable dtLog = new DataTable();
        private DataRow drLog = null;
        private DataRow drExLog = null;
        private DataRow drEvLog = null;
        private DataRow drEvExLog = null;
        private int city1xCountM = 0;
        private int cityDoCountM = 0;
        private int city1xCountE = 0;
        private int cityDoCountE = 0;
        private string city1xListM = string.Empty;
        private string cityDoListM = string.Empty;
        private string city1xListE = string.Empty;
        private string cityDoListE = string.Empty;
        private string perf1xMsc = string.Empty;
        private string perfDoMsc = string.Empty;
        private string perf1xCity = string.Empty;
        private string perfDoCity = string.Empty;
        private List<string> fail1xCityM= new List<string>();
        private List<string> failDoCityM = new List<string>();
        private List<string> fail1xCityE = new List<string>();
        private List<string> failDoCityE = new List<string>();

        //��������datatable��������ָ֤����ȷ��
        private DataTable dtMsc1X = null;
        private DataTable dtMscDo = null;
        private DataTable dtCity1X = null;
        private DataTable dtCityDo = null;

        delegate void LogDataSourceCallBack(DataTable dt);
        delegate void WriteExcelLog(string logname);

        private System.Timers.Timer _timerPerf;
        private System.Timers.Timer _timerConf;
        private System.Timers.Timer _timerCdl;
        private System.Timers.Timer _timerFtp;
        private System.Timers.Timer _timerDelete;   
        private System.Timers.Timer _timerTest;
        private System.Timers.Timer _timerUse;
        //private System.Timers.Timer _timerPara;

        private System.Timers.Timer _timerParaHW;
        private System.Timers.Timer _timerParaZTE;
        private System.Timers.Timer _timerParaALU;
        //private System.Timers.Timer _timerTemp;//������ʱ����

        /// <summary>
        /// Excel�������
        /// </summary>
        private static int _MaxRow = 65530;
       

        //�̵߳���ˢ�����ݻص�����
        private void RefreshDataSource(DataTable dt)
        {
            //TODO;Test
            //dt.Rows.Add("Str1", "Str2", "Str3", "Str4", "Str5", "Str6", "Str7", "Str8", "Str9", "Str10", "Str11",
            //            "Str12", "Str13", "Str14");            
            gcLog.DataSource = dt;
        }

        private void WriteExcelToLog(string logname)
        {
            gcLog.ExportToXls(logname);
        }

        public DataCollectFrm()
        {
            InitializeComponent();
        }

        #region ��ʼ��ͳ����־���
        private void InitDataTable(DataTable dt)
        {
            try
            {
                dt.Columns.Add(new DataColumn("STAT_DATE", typeof(string)));
                dt.Columns.Add(new DataColumn("STAT_PROV", typeof(string)));
                dt.Columns.Add(new DataColumn("CITY_COUNT", typeof(string)));
                dt.Columns.Add(new DataColumn("MSC_COUNT", typeof(string)));
                dt.Columns.Add(new DataColumn("BSC_COUNT", typeof(string)));
                dt.Columns.Add(new DataColumn("BTS_COUNT", typeof(string)));
                dt.Columns.Add(new DataColumn("1X_PERF_PROV", typeof(string)));
                dt.Columns.Add(new DataColumn("1X_PERF_CITY", typeof(string)));
                dt.Columns.Add(new DataColumn("1X_PERF_MSC", typeof(string)));
                dt.Columns.Add(new DataColumn("DO_PERF_PROV", typeof(string)));
                dt.Columns.Add(new DataColumn("DO_PERF_CITY", typeof(string)));
                dt.Columns.Add(new DataColumn("DO_PERF_MSC", typeof(string)));
                dt.Columns.Add(new DataColumn("1X_CDL_CITY", typeof(string)));
                dt.Columns.Add(new DataColumn("DO_CDL_CITY", typeof(string)));
            }
            catch(Exception ex)
            {                
                AddErr("��ʼ��ͳ����־������", ex.Message);
            }
        }
        #endregion

        #region ��ʼ�����к�ʱ���ϵ
        private void LoadCheckMscArray()
        {
            string[] _timeArray = {"00:00:00", "01:00:00", "02:00:00", "03:00:00", "04:00:00", "05:00:00", "06:00:00", "07:00:00",
                                   "08:00:00", "09:00:00", "10:00:00", "11:00:00", "12:00:00", "13:00:00", "14:00:00", "15:00:00",
                                   "16:00:00", "17:00:00", "18:00:00", "19:00:00", "20:00:00", "21:00:00", "22:00:00", "23:00:00"};
            if (_checkMscArray == null)
            {
                _checkMscArray = new ArrayList();
            }

            for (int i = 0; i < _timeArray.Length; i++)
            {                
                foreach(string key in _msc.Keys)
                {
                    _checkMscArray.Add(_timeArray[i]+"|"+_msc[key].ToString());
                }
            }
        }

        private void LoadCheckCityArray()
        {
            string[] _timeArray = {"00:00:00", "01:00:00", "02:00:00", "03:00:00", "04:00:00", "05:00:00", "06:00:00", "07:00:00",
                                   "08:00:00", "09:00:00", "10:00:00", "11:00:00", "12:00:00", "13:00:00", "14:00:00", "15:00:00",
                                   "16:00:00", "17:00:00", "18:00:00", "19:00:00", "20:00:00", "21:00:00", "22:00:00", "23:00:00"};
            if (_checkCityArray == null)
            {
                _checkCityArray = new ArrayList();
            }

            for (int i = 0; i < _timeArray.Length; i++)
            {
                for (int j = 0; j < _dtCity.Rows.Count; j++)
                {
                    if (_proChName == "����")
                    {
                        if (_dtCity.Rows[j]["CITY_NAME"].ToString() == "����")
                        {
                            _checkCityArray.Add(_timeArray[i] + "|" + "����");
                            _checkCityArray.Add(_timeArray[i] + "|" + "Ǳ��");
                            _checkCityArray.Add(_timeArray[i] + "|" + "����");
                        }
                        else
                        {
                            _checkCityArray.Add(_timeArray[i] + "|" + _dtCity.Rows[j]["CITY_NAME"].ToString());
                        }
                    }
                    else
                    {
                        _checkCityArray.Add(_timeArray[i] + "|" + _dtCity.Rows[j]["CITY_NAME"].ToString());
                    }
                }
            }
        }

        private void LoadCheckProvArray()
        {
            string[] _timeArray ={"00:00:00", "01:00:00", "02:00:00", "03:00:00", "04:00:00", "05:00:00", "06:00:00", "07:00:00",
                                   "08:00:00", "09:00:00", "10:00:00", "11:00:00", "12:00:00", "13:00:00", "14:00:00", "15:00:00",
                                   "16:00:00", "17:00:00", "18:00:00", "19:00:00", "20:00:00", "21:00:00", "22:00:00", "23:00:00"};
            if (_checkProvArray == null)
            {
                _checkProvArray = new ArrayList();
            }

            for (int i = 0; i < _timeArray.Length; i++)
            {
                _checkProvArray.Add(_timeArray[i] + "|" +"ʡ");
            }
        }
        #endregion

        //���ݿ���ϴӱ��ض�ȡ��ʼ��ʱ��������Ϣ
        private void GetConfigData(string filename,ref DataTable dt)
        {
            try
            {
                using (System.IO.StreamReader reader = new StreamReader(filename, System.Text.Encoding.GetEncoding("GB2312")))
                {
                    int k = 0;
                    dt.Columns.Clear();
                    dt.Rows.Clear();

                    while (reader.Peek() > 0)
                    {
                        if (k == 0)
                        {
                            //��ͷ
                            string[] head = reader.ReadLine().Split(',');
                            for (int i = 0; i < head.Length; i++)
                            {
                                dt.Columns.Add(head[i]);
                            }
                        }
                        else
                        {
                            //����
                            string str = reader.ReadLine();
                            string[] data = str.Split(',');
                            DataRow dr = dt.NewRow();
                            for (int i = 0; i < data.Length; i++)
                            {
                                dr[i] = data[i];
                            }
                            dt.Rows.Add(dr);
                        }
                        k++;
                    }
                }
            }
            catch (Exception ex)
            {
                AddErr("��ȡ���س�ʼ������ʧ��", ex.Message);
            }
        }

        /// <summary>
        /// ���ݳ�ʼ������
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void DataCollectFrm_Load(object sender, EventArgs e)
        {
            try
            {                
                DevExpress.Data.CurrencyDataController.DisableThreadingProblemsDetection = true;
                //_isRepair = System.Configuration.ConfigurationSettings.AppSettings["ShowMeTheMoney"];//���_isRepair=1�����ϱ�����������

                _isFull = System.Configuration.ConfigurationSettings.AppSettings["IsFull"];//���_isFull=1����������ݽ��������Դ���
                _isNull = System.Configuration.ConfigurationSettings.AppSettings["IsNull"];//���_isNull=1����������ݽ��п�ֵ����
                _isCdl = System.Configuration.ConfigurationSettings.AppSettings["IsCdl"];//���_isCdl=1��Ի������ݽ��д���
                _isSpecial = System.Configuration.ConfigurationSettings.AppSettings["IsSpecial"];//���_isSpecial=1���38���ؼ�ָ������жϴ���

                #region ��ʼ������                
                //��ʼ��ͳ����־���
                InitDataTable(dtLog);
                drLog = dtLog.NewRow();
                drExLog = dtLog.NewRow();
                drEvLog = dtLog.NewRow();
                drEvExLog = dtLog.NewRow();

                _proChName = ConfigurationManager.AppSettings["CFG_PROVICE"].ToString(); //ʡ����������
                
                //��װͳ����־����STAT_PROV�ֶ�
                //drLog["STAT_PROV"] = ConfigurationManager.AppSettings["CFG_PROVICE"].ToString();
                //drExLog["STAT_PROV"] = ConfigurationManager.AppSettings["CFG_PROVICE"].ToString();

                //��װͳ����־����1X_PERF_PROV��DO_PERF_PROV�ֶ�
                //drLog["1X_PERF_PROV"] = "24";               
                //drLog["DO_PERF_PROV"] = "24";
                //drExLog["1X_PERF_PROV"] = "";
                //drExLog["DO_PERF_PROV"] = "";


                _proEnName = ConfigurationManager.AppSettings["PROVIENAME"].ToString(); //ʡ��Ӣ������
                _startupPath = Application.StartupPath;
                _localRootPath = _startupPath + "\\FTP";

                DataDate.DateTime = DateTime.Now.AddDays(-1);

                //��װͳ����־����STAT_DATE�ֶ�
                //drLog["STAT_DATE"] = DataDate.DateTime.ToShortDateString();
                //drExLog["STAT_DATE"] = DataDate.DateTime.ToShortDateString(); ;

                
                
                _bizLayer = new clsPerf();
                _bizLayer.startPath = _startupPath;
                _uploadFailed = new Dictionary<string, DictItem>();

                #endregion

                // TODO; TEST
                //DataDate.DateTime = Convert.ToDateTime("2010-03-14");


                try
                {
                    Global.InitConnection(); // ��ʼ�����ݿ�����
                }
                catch
                {
                    _isDown = true;
                }

                #region ��ʼ��FtpClient

                DataTable dtServerInfo=new DataTable();
                if (!_isDown)
                {
                    dtServerInfo =
                        DBAcess.Instance().GetDataTable(
                            "SELECT SERVERADDRESS AS IP ,SERVERPORT AS PORT ,SERVERDIRECTORY AS FTPROOT ,USERNAME,PASSWORD FROM MOD_FILESMGR_SERVERINFO WHERE UPPER(MOD_FILESMGR_SERVERINFO.PROTOCAL) = 'GZFTP' OR UPPER(MOD_FILESMGR_SERVERINFO.CHINA_NAME) = 'GZFTP'");
                }
                else
                {
                    GetConfigData(_startupPath + "\\ftp.csv", ref dtServerInfo);
                }
                if (dtServerInfo == null || dtServerInfo.Rows.Count == 0)
                {
                    throw new Exception("MOD_FILESMGR_SERVERINFO ��û��ʡ�ļ��ӿ�FTP�������");
                }
                else
                {
                    _ftpClient = new FTPClient(dtServerInfo.Rows[0]["ip"].ToString(),
                                               dtServerInfo.Rows[0]["username"].ToString(),
                                               dtServerInfo.Rows[0]["password"].ToString(),
                                               Convert.ToInt32(dtServerInfo.Rows[0]["port"].ToString()));                
                }                

                #endregion

                #region ��ȡ���������Ϣ

                if (!_isDown)
                {
                    _dtCity =
                        DBAcess.Instance().GetDataTable(
                            "SELECT CITY_ID,CITY_NAME,VENDOR,ENNAME,LONGITUDE_LB,LATITUDE_LB,LONGITUDE_RB,LATITUDE_RB FROM CFG_CITY WHERE CITY_ID IN(SELECT CITY_ID FROM NE_BTS_C)");
                    if (_dtCity == null || _dtCity.Rows.Count == 0)
                        throw new Exception("û�г��п��Լ��أ�������CFG_CITY��");
                }
                else
                {
                    //���ݿ��޷����Ӵӱ��ض�city�б�
                    GetConfigData(_startupPath + "\\city.csv", ref _dtCity);
                }

                if (_cityInfo == null)
                {
                    _cityInfo = new Dictionary<string, CityInfo>();
                }

                //��װͳ����־����CITY_COUNT�ֶ�
                if (_proChName == "����")
                {
                    drLog["CITY_COUNT"] = (_dtCity.Rows.Count + 2).ToString();
                    drExLog["CITY_COUNT"] = (_dtCity.Rows.Count+2).ToString();
                }
                else
                {
                    drLog["CITY_COUNT"] = _dtCity.Rows.Count.ToString();
                    drExLog["CITY_COUNT"] = _dtCity.Rows.Count.ToString();
                }

                foreach (DataRow row in _dtCity.Rows)
                {
                    string cityId = row["CITY_ID"].ToString().Trim();
                    CityInfo c = new CityInfo();
                    c.CityId = cityId;
                    c.CityName = row["CITY_NAME"].ToString().Trim();
                    c.Vendor = row["VENDOR"].ToString().Trim();
                    c.EnName = row["ENNAME"].ToString().Trim();
                    c.LongitudeL = Convert.ToDouble(row["longitude_lb"].ToString()); //���� ���Ͻ�
                    c.LatitudeL = Convert.ToDouble(row["latitude_lb"].ToString()); //γ��
                    c.LongitudeR = Convert.ToDouble(row["longitude_rb"].ToString());
                    c.LatitudeR = Convert.ToDouble(row["latitude_rb"].ToString());
                    c.Width = _bizLayer.GetDistance(c.LatitudeR, c.LongitudeL, c.LatitudeR, c.LongitudeR);
                    c.Height = _bizLayer.GetDistance(c.LatitudeR, c.LongitudeL, c.LatitudeL, c.LongitudeL);

                    if (!_cityInfo.ContainsKey(cityId))
                        _cityInfo.Add(cityId, c);
                }

                //����ʡ�������жϣ�������������ţ�Ǳ��������
                if (_proChName == "����")
                {
                    CityInfo c1 = new CityInfo();
                    c1.CityId = "7281";
                    c1.CityName = "����";
                    c1.Vendor = "ZY0810";
                    c1.EnName = "TM";
                    c1.LongitudeL = Convert.ToDouble("112.554948939739");//(row["longitude_lb"].ToString()); //���� ���Ͻ�
                    c1.LatitudeL = Convert.ToDouble("30.3628909717566");//(row["latitude_lb"].ToString()); //γ��
                    c1.LongitudeR = Convert.ToDouble("113.463885836121");//(row["longitude_rb"].ToString());
                    c1.LatitudeR = Convert.ToDouble("30.9185912035854");//(row["latitude_rb"].ToString());
                    c1.Width = _bizLayer.GetDistance(c1.LatitudeR, c1.LongitudeL, c1.LatitudeR, c1.LongitudeR);
                    c1.Height = _bizLayer.GetDistance(c1.LatitudeR, c1.LongitudeL, c1.LatitudeL, c1.LongitudeL);
                    
                    if (!_cityInfo.ContainsKey("7281"))
                        _cityInfo.Add("7281", c1);

                    
                    CityInfo c2 = new CityInfo();
                    c2.CityId = "7282";
                    c2.CityName = "Ǳ��";
                    c2.Vendor = "ZY0810";
                    c2.EnName = "QJ";
                    c2.LongitudeL = Convert.ToDouble("112.48839036399");// (row["longitude_lb"].ToString()); //���� ���Ͻ�
                    c2.LatitudeL = Convert.ToDouble("30.0594034426983");//(row["latitude_lb"].ToString()); //γ��
                    c2.LongitudeR = Convert.ToDouble("112.987305606778");//(row["longitude_rb"].ToString());
                    c2.LatitudeR = Convert.ToDouble("30.6390179523902");//(row["latitude_rb"].ToString());
                    c2.Width = _bizLayer.GetDistance(c2.LatitudeR, c2.LongitudeL, c2.LatitudeR, c2.LongitudeR);
                    c2.Height = _bizLayer.GetDistance(c2.LatitudeR, c2.LongitudeL, c2.LatitudeL, c2.LongitudeL);

                    if (!_cityInfo.ContainsKey("7282"))
                        _cityInfo.Add("7282", c2);
                    
                    CityInfo c3 = new CityInfo();
                    c3.CityId = "7283";
                    c3.CityName = "����";
                    c3.Vendor = "ZY0810";
                    c3.EnName = "XT";
                    c3.LongitudeL = Convert.ToDouble("112.9211380487");//(row["longitude_lb"].ToString()); //���� ���Ͻ�
                    c3.LatitudeL = Convert.ToDouble("30.0938540605515");//(row["latitude_lb"].ToString()); //γ��
                    c3.LongitudeR = Convert.ToDouble("113.831491835957");//(row["longitude_rb"].ToString());
                    c3.LatitudeR = Convert.ToDouble("30.5367314329121");//(row["latitude_rb"].ToString());
                    c3.Width = _bizLayer.GetDistance(c3.LatitudeR, c3.LongitudeL, c3.LatitudeR, c3.LongitudeR);
                    c3.Height = _bizLayer.GetDistance(c3.LatitudeR, c3.LongitudeL, c3.LatitudeL, c3.LongitudeL);

                    if (!_cityInfo.ContainsKey("7283"))
                        _cityInfo.Add("7283", c3);

                }

                // ��ȡ������еĳ���
                if (!_isDown)
                {
                    _dtVendor =
                        DBAcess.Instance().GetDataTable(
                            @"select distinct(vendor) as vendor from ne_bts_c where city_id in(select city_id from cfg_city)");
                }
                else
                {
                    GetConfigData(_startupPath + "\\vendor.csv", ref _dtVendor);
                }

                _mscCitys = new Dictionary<string, string>();
                _msc = new Dictionary<string, string>();
                _mscName = new Dictionary<string, string>();

                DataTable dtMscCity = new DataTable();
                if (!_isDown)
                {
                    dtMscCity = DBAcess.Instance().GetDataTable(@"select distinct b.mscname as msc, d.city_name from cfg_bsc_map_city b ,cfg_city d where b.city_id = d.city_id order by b.mscname");
                }
                else
                {
                    //���ݿ��޷����Ӵӱ��ض�ȡ������Ϣ
                    GetConfigData(_startupPath + "\\msc_city.csv", ref dtMscCity);
                }
                
                if (dtMscCity != null && dtMscCity.Rows.Count>0)
                {
                    DataView dv = new DataView(dtMscCity);
                    DataTable dt = dv.ToTable(true, "MSC");
                    for(int x=0;x<dt.Rows.Count;x++)
                    {
                        DataRow[] drs = dtMscCity.Select(string.Format("MSC ='{0}'", dt.Rows[x]["MSC"].ToString().Trim()));
                        if(drs.Length>0)
                        {
                            string citys = drs[0]["city_name"].ToString().Trim();
                            string mscname = drs[0]["city_name"].ToString() + "." + dt.Rows[x]["MSC"].ToString().Trim();

                            //string citys = drs.Aggregate(string.Empty, (current, dr) => string.IsNullOrEmpty(current) ? dr["city_name"].ToString() : string.Format("{0}|{1}", current, dr["city_name"].ToString()));

                            //string mscname=drs.Aggregate(string.Empty,(current,dr)=>string.IsNullOrEmpty(current)?dr["city_name"].ToString()+"."+dt.Rows[x]["MSC"].ToString().Trim():string.Format("{0}|{1}",current,dr["city_name"].ToString()+"."+dt.Rows[x]["MSC"].ToString().Trim()));


                            if (!_mscCitys.ContainsKey(dt.Rows[x]["MSC"].ToString().Trim()))
                            {
                                _mscCitys.Add(dt.Rows[x]["MSC"].ToString().Trim(), citys);
                            }
                            if (!_msc.ContainsKey(dt.Rows[x]["MSC"].ToString().Trim()))
                            {
                                _msc.Add(dt.Rows[x]["MSC"].ToString().Trim(), dt.Rows[x]["MSC"].ToString().Trim());
                            }
                            if (!_mscName.ContainsKey(dt.Rows[x]["MSC"].ToString().Trim()))
                            {
                                _mscName.Add(dt.Rows[x]["MSC"].ToString().Trim(), mscname);
                            }
                        }
                    }
                }
                
                

                //��ʼ�����к�ʱ���Ӧ��ϵ
                LoadCheckMscArray();
                LoadCheckCityArray();
                LoadCheckProvArray();

                #endregion

                #region ��ʼ��Timer

                _timerConf = new System.Timers.Timer(1000); // ���� 1��
                _timerConf.Elapsed += new System.Timers.ElapsedEventHandler(timerConf_Tick);
                _timerPerf = new System.Timers.Timer(1000); // ���� 4��
                _timerPerf.Elapsed += new System.Timers.ElapsedEventHandler(timerPerf_Tick);
                _timerCdl = new System.Timers.Timer(1000);  // ���� 3��                
                _timerCdl.Elapsed += new System.Timers.ElapsedEventHandler(timerCdl_Tick);
                _timerUse = new System.Timers.Timer(1000); //ƽ̨ʹ�����ͳ�� 2��
                _timerUse.Elapsed+=new System.Timers.ElapsedEventHandler(timerUse_Tick);
                //_timerPara = new System.Timers.Timer(1000);//�߽��������������ϱ� 2��
                //_timerPara.Elapsed+=new System.Timers.ElapsedEventHandler(timerPara_Tick);
                _timerTest = new System.Timers.Timer(1000); //������Ϣ ÿ��3��2��
                _timerTest.Elapsed+=new System.Timers.ElapsedEventHandler(timerTest_Tick);
                _timerFtp = new System.Timers.Timer(300000);  // Ftp ÿ5����
                _timerFtp.Elapsed += new System.Timers.ElapsedEventHandler(timerFtp_Tick);

                _timerParaHW = new System.Timers.Timer(1000);
                _timerParaHW.Elapsed+=new System.Timers.ElapsedEventHandler(timerParaHW_Tick);
                _timerParaZTE = new System.Timers.Timer(1000);
                _timerParaZTE.Elapsed+=new System.Timers.ElapsedEventHandler(timerParaZTE_Tick);
                _timerParaALU = new System.Timers.Timer(1000);
                _timerParaALU.Elapsed+=new System.Timers.ElapsedEventHandler(timerParaALU_Tick);

                //_timerTemp = new System.Timers.Timer(1000);//��ʱ����
                //_timerTemp.Elapsed+=new System.Timers.ElapsedEventHandler(timerTemp_Tick);

                _timerDelete = new System.Timers.Timer(1000);//ɾ��backup 5��
                _timerDelete.Elapsed += new System.Timers.ElapsedEventHandler(timerDelete_Tick);

                _timerConf.Enabled = true; // ��������
                _timerPerf.Enabled = true; // ����
                _timerCdl.Enabled = true; // ����
                _timerFtp.Enabled = true; // FTP
                _timerDelete.Enabled = true;//ɾ��backup
                _timerTest.Enabled = true;//������Ϣ
                _timerUse.Enabled = true;//ƽ̨ʹ�����ͳ������
                //_timerPara.Enabled = true;//ʡ�ʱ߽�վ����

                _timerParaHW.Enabled = true;
                _timerParaZTE.Enabled = true;
                _timerParaALU.Enabled = true;
                //_timerTemp.Enabled = true;

                #endregion

                //�����¹淶��Ҫ����ļ���Ŀ¼
                CreateNewFiles();

                // ����WORK�ļ���
                CreateWorkFiles();

                //���������ļ���,����14������
                CreateBackFiles();

                GetExistFileToUploadFailed(); // ��ȡδ�ϴ�������

                //TODO;Test
                //RefreshDataSource(dtLog);
            }
            catch (Exception ex)
            {
                AddErr("ʡ�ļ��ӿڼ��س���", ex.Message);
            }
        }

        /// <summary>
        /// �鿴�Ƿ������õ�ʱ��
        /// </summary>
        /// <param name="dateTime">���õ�ʱ��</param>
        /// <param name="isRun">��������</param>
        /// <returns></returns>
        private bool CheckTime(DateTime dateTime,bool isRun)
        {
            TimeSpan ts = dateTime.Subtract(DateTime.Now);
            return ts.Hours == 0 && ts.Minutes == 0 && (ts.Seconds <= 0 && !isRun);
            //return true;
        }

        private bool CheckDayTime(DateTime dateTime,bool isRun)
        {
            TimeSpan ts = dateTime.Subtract(DateTime.Now);
            return dateTime.Day==3&&ts.Minutes==0&&(ts.Seconds<=0&&!isRun);
        }

        private void ComplaintCollect(DateTime updateTime,string bizType)
        {
            try
            {
                string filePath = string.Empty;//�ļ�·��
                string filename = string.Empty;//�ļ�����
                string ftpPerfFilePath = string.Format("{0}/", ConstComplaint);

                try
                {
                    ComplaintOutReport(updateTime, bizType, out filePath, out filename);
                }
                catch (Exception ex)
                {
                    AddErr(string.Format("����CSV����{0}", filename), ex.Message);
                    return;
                }

                string tempFileName = string.Format("{0}\\{1}", filePath, filename);
                FileInfo fileinfo = new FileInfo(tempFileName);
                bool ret = false;
                try
                {
                    ret = _ftpClient.fileUpload(fileinfo, ftpPerfFilePath, filename);
                    AddMsg(string.Format("�ϱ��ɹ�{0}", filename));
                }
                catch (Exception ex)
                {
                    AddErr(string.Format("{0}�ϴ�ʧ�ܣ��������ϴ�", filename), ex.Message);
                    ret = false;
                }

                if (!ret)
                {
                    AddUploadFailedFileToShareDic(tempFileName, ftpPerfFilePath, filename);
                }
                else
                {
                    string desFileName = tempFileName.Replace(string.Format("{0}\\", ConstWorkTest), string.Format("{0}\\{1}\\", ConstBackUp, ConstWorkTest));
                    File.Copy(tempFileName, desFileName, true);
                    File.Delete(tempFileName);
                }
            }
            catch (Exception ex)
            {
                AddErr(string.Format("���ɿͻ�Ͷ��ͳ�����ݳ���", bizType), ex.Message);
            }
        }

        private void ParaCollect(DateTime updateTime,string vendor,string bizType,string level,string isSameFreq)
        {
            try
            {
                string filePath = string.Empty;//�ļ�·��
                string filename = string.Empty;//�ļ�����
                string ftpParaFilePath = string.Format("{0}/", ConstPara);

                try
                {                                        
                    ParaOutReport(updateTime,out filePath,out filename,vendor,bizType,level,isSameFreq);
                }
                catch (Exception ex)
                {
                    AddErr(string.Format("����CSV����{0}", filename), ex.Message);
                    return;
                }

                string tempFileName = string.Format("{0}\\{1}", filePath, filename);
                FileInfo fileinfo = new FileInfo(tempFileName);
                bool ret = false;
                try
                {
                    ret = _ftpClient.fileUpload(fileinfo, ftpParaFilePath, filename);
                    AddMsg(string.Format("�ϱ��ɹ�{0}", filename));
                }
                catch (Exception ex)
                {
                    AddErr(string.Format("{0}�ϴ�ʧ�ܣ��������ϴ�", filename), ex.Message);
                    ret = false;
                }

                if (!ret)
                {
                    AddUploadFailedFileToShareDic(tempFileName, ftpParaFilePath, filename);
                }
                else
                {
                    string desFileName = tempFileName.Replace(string.Format("{0}\\", ConstPara), string.Format("{0}\\{1}\\", ConstBackUp, ConstPara));
                    File.Copy(tempFileName, desFileName, true);
                    File.Delete(tempFileName);
                }

            }
            catch (Exception ex)
            {
                AddErr("����ʡ�ʱ߽�������ݳ���", ex.Message);
            }
        }

        private void UseCollect(DateTime updateTime)
        {
            try
            {
                string filePath = string.Empty;//�ļ�·��
                string filename = string.Empty;//�ļ�����
                string ftpUseFilePath = string.Format("{0}/", ConstWork);

                try
                {                    
                    UseOutReport(updateTime, out filePath, out filename);
                }
                catch (Exception ex)
                {
                    AddErr(string.Format("����CSV����{0}", filename), ex.Message);
                    return;
                }

                string tempFileName = string.Format("{0}\\{1}", filePath, filename);
                FileInfo fileinfo = new FileInfo(tempFileName);
                bool ret = false;
                try
                {
                    ret = _ftpClient.fileUpload(fileinfo, ftpUseFilePath, filename);
                    AddMsg(string.Format("�ϱ��ɹ�{0}", filename));
                }
                catch (Exception ex)
                {
                    AddErr(string.Format("{0}�ϴ�ʧ�ܣ��������ϴ�", filename), ex.Message);
                    ret = false;
                }

                if (!ret)
                {
                    AddUploadFailedFileToShareDic(tempFileName, ftpUseFilePath, filename);
                }
                else
                {
                    string desFileName = tempFileName.Replace(string.Format("{0}\\", ConstWork), string.Format("{0}\\{1}\\", ConstBackUp, ConstWork));
                    File.Copy(tempFileName, desFileName, true);
                    File.Delete(tempFileName);
                }

            }
            catch (Exception ex)
            {
                AddErr("����ƽ̨ʹ�����ͳ������", ex.Message);
            }
        }

        private void TestCollect(DateTime updateTime,string bizType)
        {
            try
            {
                string filePath=string.Empty;//�ļ�·��
                string filename=string.Empty;//�ļ�����
                string ftpPerfFilePath=string.Format("{0}/",ConstWorkTest);

                try
                {
                    TestOutReport(updateTime,bizType,out filePath,out filename);
                }
                catch(Exception ex)
                {
                    AddErr(string.Format("����CSV����{0}",filename),ex.Message);
                    return;
                }

                string tempFileName = string.Format("{0}\\{1}", filePath, filename);
                FileInfo fileinfo = new FileInfo(tempFileName);
                bool ret = false;
                try
                {
                    ret = _ftpClient.fileUpload(fileinfo, ftpPerfFilePath, filename);
                    AddMsg(string.Format("�ϱ��ɹ�{0}", filename));
                }
                catch (Exception ex)
                {
                    AddErr(string.Format("{0}�ϴ�ʧ�ܣ��������ϴ�", filename), ex.Message);
                    ret = false;
                }

                if (!ret)
                {
                    AddUploadFailedFileToShareDic(tempFileName, ftpPerfFilePath, filename);
                }
                else
                {
                    string desFileName = tempFileName.Replace(string.Format("{0}\\", ConstWorkTest), string.Format("{0}\\{1}\\", ConstBackUp, ConstWorkTest));
                    File.Copy(tempFileName, desFileName, true);
                    File.Delete(tempFileName);
                }
                
            }
            catch(Exception ex)
            {
                AddErr(string.Format("����{0} ������Ϣ���ݳ���", bizType), ex.Message);
            }
        }

        /// <summary>
        /// �������ݲɼ�
        /// </summary>
        /// <param name="updateTime"></param>
        /// <param name="bizType"></param>
        private void ConfCollect(DateTime updateTime,string bizType)
        {
            try
            {
                string filePath = string.Empty; // �ļ�·��
                string filename = string.Empty; // �ļ�����
                string ftpPerfFilePath = string.Format("{0}/", ConstConf);

                try
                {
                    ConfOutReport(updateTime, bizType, out filePath, out filename);
                }
                catch (Exception ex)
                {
                    AddErr(string.Format("����CSV����{0}", filename), ex.Message);
                    return;
                }

                string tempFileName = string.Format("{0}\\{1}", filePath, filename);
                FileInfo fileinfo = new FileInfo(tempFileName);
                bool ret = false;
                try
                {
                    ret = _ftpClient.fileUpload(fileinfo, ftpPerfFilePath, filename);
                    AddMsg(string.Format("�ϱ��ɹ�{0}", filename));
                }
                catch (Exception ex)
                {
                    AddErr(string.Format("{0}�ϴ�ʧ�ܣ��������ϴ�", filename), ex.Message);
                    ret = false;
                }

                if (!ret)
                {
                    AddUploadFailedFileToShareDic(tempFileName, ftpPerfFilePath, filename);
                }
                else
                {
                    string desFileName = tempFileName.Replace(string.Format("{0}\\", ConstConf), string.Format("{0}\\{1}\\", ConstBackUp, ConstConf));
                    File.Copy(tempFileName, desFileName, true);
                    File.Delete(tempFileName);
                }
            }
            catch (Exception ex)
            {
                AddErr(string.Format("����{0} �������ݳ���", bizType), ex.Message);
            }
        }

        /// <summary>
        /// �ͻ�Ͷ��ͳ�������ļ�����
        /// </summary>
        /// <param name="updateTime"></param>
        /// <param name="filePath"></param>
        /// <param name="filename"></param>
        void ComplaintOutReport(DateTime updateTime,string bizType,out string filePath, out string filename)
        {
            filename = "";
            try
            {
                if (updateTime <= Convert.ToDateTime(string.Format("{0} 05:00:00", DateTime.Now.ToString("yyyy-MM-dd")))
                    &&
                    updateTime >= Convert.ToDateTime(string.Format("{0} 00:00:00", DateTime.Now.ToString("yyyy-MM-dd"))))
                {
                    // �ڵ����賿5��ǰ�ϱ������������ϱ���������
                    updateTime = updateTime.AddDays(-1);
                    //���ܵ��ļ�����������(GD_COMPLAINT_1X_20101220.csv)
                    filename = string.Format("{0}_COMPLAINT_{1}_{2}.csv", _proEnName, bizType.ToUpper(),
                                             updateTime.ToString("yyyyMM"));
                }
                else
                {
                    // �������ǲ����ϱ�����ʱ������
                    //���ܵ��ļ�����������(GD_CONF_MSC_20100325_N.csv)
                    filename = string.Format("{0}_COMPLAINT_{1}_{2}_{3}.csv", _proEnName, bizType.ToUpper(),
                                             updateTime.ToString("yyyyMM"), 1);
                }

                filePath = string.Format("{0}\\{1}\\COMPLAINT", _localRootPath, _proEnName);
                DataTable dtResult = new DataTable(); // ��ѯ���
                ArrayList lstFormula = new ArrayList(); // enName 
                ArrayList lstChName = new ArrayList(); // chinaName

                if (bizType == "1X")
                {
                    try
                    {
                        _bizLayer.GetComplaintColumn(out lstChName, out lstFormula);                        
                        dtResult=_bizLayer.GetComplaintData(lstFormula,_proChName,updateTime,bizType.ToUpper());
                    }
                    catch (Exception ex)
                    {
                        AddErr(ex.Message, "��ѯ1X�ͻ�Ͷ��ͳ�����ݳ���");
                        //if (ex.Message == "ORAERROR")
                        //{
                        //    ConfExceptionReport(ref dtResult, ref lstChName, bizType, updateTime);
                        //}
                    }
                }
                else
                {
                    try
                    {
                        _bizLayer.GetComplaintColumn(out lstChName, out lstFormula);
                        dtResult = _bizLayer.GetComplaintData(lstFormula, _proChName, updateTime,bizType.ToUpper());
                    }
                    catch (Exception ex)
                    {
                        AddErr(ex.Message, "��ѯ���е�·������Ϣ����");
                        //if (ex.Message == "ORAERROR")
                        //{
                        //    ConfExceptionReport(ref dtResult, ref lstChName, bizType, updateTime);
                        //}
                    }
                }                

                if (dtResult == null || dtResult.Columns.Count == 0 || dtResult.Rows.Count == 0)
                {

                    throw new Exception("û�в鵽����");
                    //ConfExceptionReport(ref dtResult, ref lstChName, bizType, updateTime);
                }
                _bizLayer.ExportCsv(dtResult, filename, filePath, lstChName, new ArrayList(), new ArrayList());
            }
            catch (Exception ex)
            {
                throw new Exception(string.Format("��������{0}�ļ����������ǹ�ʽ���ô������{1} ", filename, ex.Message));
            }
        }

        /// <summary>
        /// ʡ�ʱ߽������������
        /// </summary>
        /// <param name="updateTime"></param>
        /// <param name="filtPath"></param>
        /// <param name="filename"></param>
        void ParaOutReport(DateTime updateTime, out string filePath, out string filename,string vendor,string bizType,string level,string isSameFreq)
        {
            filename = "";

            try
            {
                #region ��Ϊ
                if (vendor == "ZY0808")
                {
                    if (updateTime <= Convert.ToDateTime(string.Format("{0} 05:00:00", DateTime.Now.ToString("yyyy-MM-dd")))
                    &&
                    updateTime >= Convert.ToDateTime(string.Format("{0} 00:00:00", DateTime.Now.ToString("yyyy-MM-dd"))))
                    {
                        // �ڵ����賿5��ǰ�ϱ������������ϱ���������
                        updateTime = updateTime.AddDays(-1);

                        if (isSameFreq == "SF")//ͬƵ
                        {
                            //�߽������������ļ�����������(BJ_PARA_VCARRNBR_ZTE_1X_20091018.csv)
                            filename = string.Format("{0}_{1}_VCARRNBRSF_{2}_{3}_{4}.csv", _proEnName, ConstPara, "HW", bizType.ToUpper(),
                                                     updateTime.ToString("yyyyMMdd"));
                        }
                        else//��Ƶ
                        {
                            filename = string.Format("{0}_{1}_VCARRNBRDF_{2}_{3}_{4}.csv", _proEnName, ConstPara, "HW", bizType.ToUpper(),
                                updateTime.ToString("yyyyMMdd"));
                        }
                    }
                    else
                    {
                        // �������ǲ����ϱ�����ʱ������                      
                        if (isSameFreq == "SF")//ͬƵ
                        {
                            //�߽������������ļ�����������(BJ_PARA_VCARRNBR_ZTE_1X_20091018.csv)
                            filename = string.Format("{0}_{1}_VCARRNBRSF_{2}_{3}_{4}_{5}.csv", _proEnName, ConstPara, "HW", bizType.ToUpper(),
                                                     updateTime.ToString("yyyyMMdd"), 1);
                        }
                        else//��Ƶ
                        {
                            filename = string.Format("{0}_{1}_VCARRNBRDF_{2}_{3}_{4}_{5}.csv", _proEnName, ConstPara, "HW", bizType.ToUpper(),
                                updateTime.ToString("yyyyMMdd"), 1);
                        }
                    }

                    filePath = string.Format("{0}\\{1}\\PARA", _localRootPath, _proEnName);
                    DataTable dtResult = new DataTable(); // ��ѯ���
                    ArrayList lstFormula = new ArrayList(); // enName 
                    ArrayList lstChName = new ArrayList(); // chinaName
                    ArrayList lstLogicExpress = new ArrayList(); // logicExpress

                    try
                    {
                        //datatype=13Ϊ��������������,14Ϊ������Ƶ������
                        _bizLayer.GetParaColumn(out lstLogicExpress,out lstChName, out lstFormula, vendor,level=="CELL"?13:14,bizType.ToUpper()=="1X"?1:2,isSameFreq);
                        dtResult = _bizLayer.GetParaData(lstFormula, _proChName, updateTime, vendor, level, bizType,isSameFreq);
                    }
                    catch (Exception ex)
                    {
                        AddErr(ex.Message, "��ѯ��Ϊ�߽������������ݳ���" + filename);
                    }


                    if (dtResult == null || dtResult.Columns.Count == 0 || dtResult.Rows.Count == 0)
                    {
                        throw new Exception("û�в鵽����");
                    }                    
                    _bizLayer.ExportParaCsv(dtResult, filename, filePath, lstChName, lstLogicExpress);
                }
                #endregion

                #region ����
                else if (vendor == "ZY0804")
                {
                    if (updateTime <= Convert.ToDateTime(string.Format("{0} 05:00:00", DateTime.Now.ToString("yyyy-MM-dd")))
                    &&
                    updateTime >= Convert.ToDateTime(string.Format("{0} 00:00:00", DateTime.Now.ToString("yyyy-MM-dd"))))
                    {
                        // �ڵ����賿5��ǰ�ϱ������������ϱ���������
                        updateTime = updateTime.AddDays(-1);

                        if (level == "CELL")//������
                        {
                            //�߽������������ļ�����������(BJ_PARA_VSECTORNBR_ZTE_1X_20091018.csv)
                            filename = string.Format("{0}_{1}_VSECTORNBR_{2}_{3}_{4}.csv", _proEnName, ConstPara, "ZTE", bizType.ToUpper(),
                                                     updateTime.ToString("yyyyMMdd"));
                        }
                        else//��Ƶ��
                        {
                            //�߽������������ļ�����������(BJ_PARA_VCARRNBR_ZTE_1X_20091018.csv)
                            filename = string.Format("{0}_{1}_VCARRNBR_{2}_{3}_{4}.csv", _proEnName, ConstPara, "ZTE", bizType.ToUpper(),
                                updateTime.ToString("yyyyMMdd"));
                        }
                    }
                    else
                    {
                        if (level == "CELL")//������
                        {
                            //�߽������������ļ�����������(BJ_PARA_VSECTORNBR_ZTE_1X_20091018.csv)
                            filename = string.Format("{0}_{1}_VSECTORNBR_{2}_{3}_{4}_{5}.csv", _proEnName, ConstPara, "ZTE", bizType.ToUpper(),
                                                     updateTime.ToString("yyyyMMdd"), 1);
                        }
                        else//��Ƶ��
                        {
                            //�߽������������ļ�����������(BJ_PARA_VCARRNBR_ZTE_1X_20091018.csv)
                            filename = string.Format("{0}_{1}_VCARRNBR_{2}_{3}_{4}_{5}.csv", _proEnName, ConstPara, "ZTE", bizType.ToUpper(),
                                updateTime.ToString("yyyyMMdd"), 1);
                        }
                    }

                    filePath = string.Format("{0}\\{1}\\PARA", _localRootPath, _proEnName);
                    DataTable dtResult = new DataTable(); // ��ѯ���
                    ArrayList lstFormula = new ArrayList(); // enName 
                    ArrayList lstChName = new ArrayList(); // chinaName
                    ArrayList lstLogicExpress = new ArrayList(); // logicExpress


                    try
                    {
                        _bizLayer.GetParaColumn(out lstLogicExpress,out lstChName, out lstFormula, vendor,level == "CELL" ? 13 : 14,bizType.ToUpper()=="1X"?1:2,"");
                        dtResult = _bizLayer.GetParaData(lstFormula, _proChName, updateTime, vendor, level, bizType,isSameFreq);                        
                    }
                    catch (Exception ex)
                    {
                        AddErr(ex.Message, "��ѯ���˱߽������������ݳ���" + filename);
                    }


                    if (dtResult == null || dtResult.Columns.Count == 0 || dtResult.Rows.Count == 0)
                    {
                        throw new Exception("û�в鵽����");
                    }                    
                    _bizLayer.ExportParaCsv(dtResult, filename, filePath, lstChName, lstLogicExpress);
                }
                #endregion

                #region ��Ѷ
                else
                {

                    if (updateTime <= Convert.ToDateTime(string.Format("{0} 05:00:00", DateTime.Now.ToString("yyyy-MM-dd")))
                    &&
                    updateTime >= Convert.ToDateTime(string.Format("{0} 00:00:00", DateTime.Now.ToString("yyyy-MM-dd"))))
                    {
                        // �ڵ����賿5��ǰ�ϱ������������ϱ���������
                        updateTime = updateTime.AddDays(-1);

                        if (level == "CELL")//������
                        {
                            //�߽������������ļ�����������(BJ_PARA_VSECTORNBR_ALU_1X_20091018.csv)
                            filename = string.Format("{0}_{1}_VSECTORNBR_{2}_{3}_{4}.csv", _proEnName, ConstPara, "ALU", bizType.ToUpper(),
                                                     updateTime.ToString("yyyyMMdd"));
                        }
                        else//��Ƶ��
                        {
                            //�߽������������ļ�����������(BJ_PARA_VCARRNBR_ALU_1X_20091018.csv)
                            filename = string.Format("{0}_{1}_VCARRNBR_{2}_{3}_{4}.csv", _proEnName, ConstPara, "ALU", bizType.ToUpper(),
                                updateTime.ToString("yyyyMMdd"));
                        }
                    }
                    else
                    {
                        if (level == "CELL")//������
                        {
                            //�߽������������ļ�����������(BJ_PARA_VSECTORNBR_ALU_1X_20091018.csv)
                            filename = string.Format("{0}_{1}_VSECTORNBR_{2}_{3}_{4}_{5}.csv", _proEnName, ConstPara, "ALU", bizType.ToUpper(),
                                                     updateTime.ToString("yyyyMMdd"), 1);
                        }
                        else//��Ƶ��
                        {
                            //�߽������������ļ�����������(BJ_PARA_VCARRNBR_ALU_1X_20091018.csv)
                            filename = string.Format("{0}_{1}_VCARRNBR_{2}_{3}_{4}_{5}.csv", _proEnName, ConstPara, "ALU", bizType.ToUpper(),
                                updateTime.ToString("yyyyMMdd"), 1);
                        }
                    }

                    filePath = string.Format("{0}\\{1}\\PARA", _localRootPath, _proEnName);
                    DataTable dtResult = new DataTable(); // ��ѯ���
                    ArrayList lstFormula = new ArrayList(); // enName 
                    ArrayList lstChName = new ArrayList(); // chinaName
                    ArrayList lstLogicExpress = new ArrayList(); // logicExpress


                    try
                    {
                        _bizLayer.GetParaColumn(out lstLogicExpress,out lstChName, out lstFormula, vendor,level == "CELL" ? 13 : 14,bizType.ToUpper()=="1X"?1:2,"");
                        dtResult = _bizLayer.GetParaData(lstFormula, _proChName, updateTime, vendor, level, bizType,isSameFreq);
                    }
                    catch (Exception ex)
                    {
                        AddErr(ex.Message, "��ѯ��Ѷ�߽������������ݳ���" + filename);
                    }


                    if (dtResult == null || dtResult.Columns.Count == 0 || dtResult.Rows.Count == 0)
                    {
                        throw new Exception("û�в鵽����");
                    }                    
                    _bizLayer.ExportParaCsv(dtResult, filename, filePath, lstChName, lstLogicExpress);
                }
                #endregion
            }
            catch (Exception ex)
            {
                throw new Exception(string.Format("���������߽����{0}�ļ����������ǹ�ʽ���ô������{1} ", filename, ex.Message));
            }
        }

        /// <summary>
        /// ƽ̨ʹ�����ͳ����������
        /// </summary>
        /// <param name="updateTime"></param>
        /// <param name="filePath"></param>
        /// <param name="filename"></param>
        void UseOutReport(DateTime updateTime, out string filePath, out string filename)
        {
            filename = "";
            try
            {
                if (updateTime <= Convert.ToDateTime(string.Format("{0} 05:00:00", DateTime.Now.ToString("yyyy-MM-dd")))
                    &&
                    updateTime >= Convert.ToDateTime(string.Format("{0} 00:00:00", DateTime.Now.ToString("yyyy-MM-dd"))))
                {
                    // �ڵ����賿5��ǰ�ϱ������������ϱ���������
                    updateTime = updateTime.AddDays(-1);
                    //���ܵ��ļ�����������(GD_WORKTEST_CITYHP_201012.csv)
                    filename = string.Format("{0}_RNOPUSESTAT_{1}.csv", _proEnName,
                                             updateTime.ToString("yyyyMMdd"));
                }
                else
                {
                    // �������ǲ����ϱ�����ʱ������
                    //���ܵ��ļ�����������(GD_CONF_MSC_20100325_N.csv)
                    filename = string.Format("{0}_RNOPUSESTAT_{1}_{2}.csv", _proEnName,
                                             updateTime.ToString("yyyyMMdd"), 1);
                }

                filePath = string.Format("{0}\\{1}\\WORK", _localRootPath, _proEnName);               
                DataTable dtModule = new DataTable();//ģ����
                DataTable dtUser = new DataTable();//�û�                
                ArrayList lstChName = new ArrayList(); // ģ���� csv�ļ�ͷ
                ArrayList lstUserChName = new ArrayList();//�û��� csv�ļ�ͷ

                lstChName.Add("ʡ��");
                lstChName.Add("ʱ���");
                lstChName.Add("ģ������");
                lstChName.Add("ģ��������");

                lstUserChName.Add("ʡ��");
                lstUserChName.Add("ʱ���");
                lstUserChName.Add("��˺�����");
                lstUserChName.Add("��˺ŵ�½����");
                lstUserChName.Add("��˺ŵ�½ʱ��");
                
                try
                {                    
                    dtModule = _bizLayer.GetModuleData(updateTime,_proChName);                    
                    //dtUser = _bizLayer.GetUserData(updateTime, _proChName);
                    dtUser = _bizLayer.GetUser(updateTime, _proChName);

                    #region �û�����ʱ��\��¼����
                    int loginCount = 0;//ÿ���û�ÿ���¼����
                    //sTimeWhere = sTimeWhere.Replace("operatetime", "entertime");

                    for (int i = 0; i < dtUser.Rows.Count; i++)
                    {
                        string username = dtUser.Rows[i]["USERNAME"].ToString().Trim();


                        //string sTimeWhere = string.Format("entertime>=to_date('{0} 00:00:00','YYYY-MM-DD HH24:MI:SS') and entertime<=to_date('{0} 23:59:59','YYYY-MM-DD HH24:MI:SS')", updateTime.ToShortDateString());
                        //string loadsqlstr = string.Format("select loginname,entertime,exittime from sec_loginlog where {0} and loginname ='{1}' ", sTimeWhere, username);
                        //DataTable TimeTalbe = Global.dbAccess.GetDataTable(loadsqlstr);

                        DataTable TimeTable = _bizLayer.GetSingleUser(updateTime, username);

                        double loginTimeCout = 0;
                        loginCount = 0;
                        for (int j = 0; j < TimeTable.Rows.Count; j++)
                        {
                            string TimeName = TimeTable.Rows[j]["USERNAME"].ToString().Trim();
                            if (!string.IsNullOrEmpty(TimeTable.Rows[j]["ENTERTIME"].ToString().Trim()) && !string.IsNullOrEmpty(TimeTable.Rows[j]["EXITTIME"].ToString().Trim()))
                            {
                                DateTime Startime = Convert.ToDateTime(TimeTable.Rows[j]["ENTERTIME"].ToString());
                                DateTime Endtime = Convert.ToDateTime(TimeTable.Rows[j]["EXITTIME"].ToString());
                                TimeSpan star = new TimeSpan(Startime.Ticks);
                                TimeSpan end = new TimeSpan(Endtime.Ticks);
                                TimeSpan time = end.Subtract(star).Duration();
                                double tempuserloginTimeCout = 0;
                                double.TryParse(time.TotalMinutes.ToString(), out tempuserloginTimeCout);
                                tempuserloginTimeCout = Math.Round(tempuserloginTimeCout, 2);
                                if (tempuserloginTimeCout > 5)
                                {
                                    loginCount++;
                                }
                            }
                        }

                        #region ��¼ʱ��
                        //TimeTalbe.Columns.Remove("loginname");
                        this.dicSpanLoginTime.Clear();
                        CalcLoginTime(TimeTable);
                        foreach (DateTime ent in this.dicSpanLoginTime.Keys)
                        {
                            DateTime Startime = ent;
                            DateTime Endtime = dicSpanLoginTime[ent];
                            TimeSpan star = new TimeSpan(Startime.Ticks);
                            TimeSpan end = new TimeSpan(Endtime.Ticks);
                            TimeSpan time = end.Subtract(star).Duration();
                            double userloginTimeCout = 0;
                            double.TryParse(time.TotalHours.ToString(), out userloginTimeCout);
                            loginTimeCout += userloginTimeCout;
                        }
                        dtUser.Rows[i]["SUMTIME"] = Math.Round(loginTimeCout, 2);
                        #endregion
                        dtUser.Rows[i]["COUNT"] = loginCount;
                    }

                    #endregion


                    if ((dtModule == null || dtModule.Columns.Count == 0 || dtModule.Rows.Count == 0) && (dtUser == null || dtUser.Columns.Count == 0 || dtUser.Rows.Count == 0))
                    {
                        throw new Exception("û�в鵽����");
                    }
                    _bizLayer.ExportDoubleCsv(dtModule, dtUser, filename, filePath, "ģ������", "��û���", lstChName, lstUserChName);                                        
                }
                catch (Exception ex)
                {
                    AddErr(ex.Message, "��ѯƽ̨ʹ�����ͳ�����ݳ���");                    
                }                                                                  
            }
            catch (Exception ex)
            {
                throw new Exception(string.Format("��������{0}�ļ����������ǹ�ʽ���ô������{1} ", filename, ex.Message));
            }
        }

        /// <summary>
        /// ������Ϣ�ļ�����
        /// </summary>
        /// <param name="updateTime"></param>
        /// <param name="bizType"></param>
        /// <param name="filePath"></param>
        /// <param name="filename"></param>
        void TestOutReport(DateTime updateTime,string bizType,out string filePath,out string filename)
        {
            filename="";
            try
            {
                if (updateTime <= Convert.ToDateTime(string.Format("{0} 05:00:00", DateTime.Now.ToString("yyyy-MM-dd")))
                    &&
                    updateTime >= Convert.ToDateTime(string.Format("{0} 00:00:00", DateTime.Now.ToString("yyyy-MM-dd"))))
                {
                    // �ڵ����賿5��ǰ�ϱ������������ϱ���������
                    updateTime = updateTime.AddDays(-1);
                    //���ܵ��ļ�����������(GD_WORKTEST_CITYHP_201012.csv)
                    filename = string.Format("{0}_WORKTEST_{1}_{2}.csv", _proEnName, bizType.ToUpper(),
                                             updateTime.ToString("yyyyMM"));
                }
                else
                {
                    // �������ǲ����ϱ�����ʱ������
                    //���ܵ��ļ�����������(GD_CONF_MSC_20100325_N.csv)
                    filename = string.Format("{0}_WORKTEST_{1}_{2}_{3}.csv", _proEnName, bizType.ToUpper(),
                                             updateTime.ToString("yyyyMM"), 1);                    
                }

                filePath = string.Format("{0}\\{1}\\WORKTEST", _localRootPath, _proEnName);
                DataTable dtResult = new DataTable(); // ��ѯ���
                ArrayList lstFormula = new ArrayList(); // enName 
                ArrayList lstChName = new ArrayList(); // chinaName

                if (bizType == "CITYHP")
                {
                    try
                    {
                        _bizLayer.GetTestColumn(out lstChName, out lstFormula, 1);
                        dtResult = _bizLayer.GetTestCityHPData(lstFormula, _proChName, updateTime);                        
                    }
                    catch(Exception ex) 
                    {
                        AddErr(ex.Message,"��ѯ�����ȵ������Ϣ����");
                        //if (ex.Message == "ORAERROR")
                        //{
                        //    ConfExceptionReport(ref dtResult, ref lstChName, bizType, updateTime);
                        //}
                    }
                }
                else if (bizType == "CITYROAD")
                {
                    try
                    {
                        _bizLayer.GetTestColumn(out lstChName, out lstFormula, 2);
                        dtResult = _bizLayer.GetTestCityRoadData(lstFormula, _proChName, updateTime);                        
                    }
                    catch (Exception ex)
                    {
                        AddErr(ex.Message,"��ѯ���е�·������Ϣ����");
                        //if (ex.Message == "ORAERROR")
                        //{
                        //    ConfExceptionReport(ref dtResult, ref lstChName, bizType, updateTime);
                        //}
                    }
                }                    
                else if (bizType == "VILLAGE")
                {
                    try
                    {
                        _bizLayer.GetTestColumn(out lstChName, out lstFormula, 3);
                        dtResult = _bizLayer.GetTestVillageData(lstFormula, _proChName, updateTime);                        
                    }
                    catch (Exception ex)
                    {
                        AddErr(ex.Message,"��ѯ�����������Ϣ����");
                        //if (ex.Message == "ORAERROR")
                        //{
                        //    ConfExceptionReport(ref dtResult, ref lstChName, bizType, updateTime);
                        //}
                    }
                }
                
                if (dtResult == null || dtResult.Columns.Count == 0 || dtResult.Rows.Count == 0)
                {

                    throw new Exception("û�в鵽����");
                    //ConfExceptionReport(ref dtResult, ref lstChName, bizType, updateTime);
                }  
                _bizLayer.ExportCsv(dtResult, filename, filePath, lstChName, new ArrayList(), new ArrayList());
            }
            catch (Exception ex)
            {
                throw new Exception(string.Format("��������{0}�ļ����������ǹ�ʽ���ô������{1} ", filename, ex.Message));
            }
        }

        /// <summary>
        /// �����ļ�����
        /// </summary>
        /// <param name="updateTime"></param>
        /// <param name="bizType"></param>
        /// <param name="filePath"></param>
        /// <param name="filename"></param>
        void ConfOutReport(DateTime updateTime, string bizType, out string filePath, out string filename)
        {
            filename = "";
            try
            {
                if (updateTime <= Convert.ToDateTime(string.Format("{0} 05:00:00", DateTime.Now.ToString("yyyy-MM-dd")))
                    &&
                    updateTime >= Convert.ToDateTime(string.Format("{0} 00:00:00", DateTime.Now.ToString("yyyy-MM-dd"))))
                {
                    // �ڵ����賿5��ǰ�ϱ������������ϱ���������
                    updateTime = updateTime.AddDays(-1);
                    //���ܵ��ļ�����������(GD_CONF_MSC_20100325.csv)
                    filename = string.Format("{0}_CONF_{1}_{2}.csv", _proEnName, bizType.ToUpper(),
                                             updateTime.ToString("yyyyMMdd"));
                }
                else
                {
                    // �������ǲ����ϱ�����ʱ������
                    //���ܵ��ļ�����������(GD_CONF_MSC_20100325_N.csv)
                    filename = string.Format("{0}_CONF_{1}_{2}_{3}.csv", _proEnName, bizType.ToUpper(),
                                             updateTime.ToString("yyyyMMdd"), 1);                    
                }

                filePath = string.Format("{0}\\{1}\\CONF", _localRootPath, _proEnName);
                DataTable dtResult = new DataTable(); // ��ѯ���
                ArrayList lstFormula = new ArrayList(); // enName 
                ArrayList lstChName = new ArrayList(); // chinaName

                if (bizType == "MSC")
                {
                    try
                    {
                        _bizLayer.GetConfColumn(out lstChName, out lstFormula, 1);

                        dtResult = _bizLayer.GetConfMscData(lstFormula, _proChName, updateTime);

                        if (dtResult.Rows.Count > 0)
                        {
                            for(int i=0;i<dtResult.Rows.Count;i++)
                            {
                                if (_mscCitys.ContainsKey(dtResult.Rows[i]["ID1002"].ToString().Trim()))
                                {
                                    dtResult.Rows[i]["ID1005"] = _mscCitys[dtResult.Rows[i]["ID1002"].ToString().Trim()];
                                }
                                if (_mscName.ContainsKey(dtResult.Rows[i]["ID1002"].ToString().Trim()))
                                {
                                    dtResult.Rows[i]["ID1010"] = _mscName[dtResult.Rows[i]["ID1002"].ToString().Trim()];
                                }
                            }
                        }

                        //��װͳ����־������������(MSC_COUNT)�ֶ�
                        drLog["MSC_COUNT"] = dtResult.Rows.Count.ToString();
                        drExLog["MSC_COUNT"] = "";
                    }
                    catch(Exception ex) 
                    {
                        if (ex.Message == "ORAERROR")
                        {
                            ConfExceptionReport(ref dtResult, ref lstChName, bizType, updateTime);
                        }
                    }
                }
                else if (bizType == "BSC")
                {
                    try
                    {
                        _bizLayer.GetConfColumn(out lstChName, out lstFormula, 2);

                        dtResult = _bizLayer.GetConfBscData(lstFormula, _proChName, updateTime);

                        //��װͳ����־������������(BSC_COUNT)�ֶ�
                        drLog["BSC_COUNT"] = dtResult.Rows.Count.ToString();
                        drExLog["BSC_COUNT"] = "";
                    }
                    catch (Exception ex)
                    {
                        if (ex.Message == "ORAERROR")
                        {
                            ConfExceptionReport(ref dtResult, ref lstChName, bizType, updateTime);
                        }
                    }
                }
                else if (bizType == "BTS")
                {
                    if (System.Configuration.ConfigurationSettings.AppSettings["UpdateLongAndLat"].ToString() == "1")
                    {
                        try
                        {
                            // ��CFG_MAP_DEV_TO_NE�����NE_BTS_C��ľ�γ��
                            DBAcess.Instance().ExecNonQuery(@"update ne_bts_c b
   set (b.longitude, b.latitude) =
       (select a.lng, a.lat
          from (select max(t.longitude) lng,
                       max(t.latitude) lat,
                       ne_bts_id id
                  from cfg_map_dev_to_ne t
                 where t.longitude is not null
                   and t.latitude is not null
                   and t.ne_bts_id is not null
                 group by ne_bts_id) a
         where b.ne_sys_id = a.id)
 where longitude is null
   and latitude is null");
                            AddErr("��γ�ȸ������", "");
                        }
                        catch (Exception ex)
                        {
                            AddErr("��γ�ȸ��³���", ex.Message);
                        }
                    }

                    try
                    {
                        _bizLayer.GetConfColumn(out lstChName, out lstFormula, 3);

                        DataTable dt = _bizLayer.GetConfBtsData(lstFormula, _proChName, updateTime);

                        //if (dt == null || dt.Columns.Count == 0 || dt.Rows.Count == 0)
                        //    throw new Exception("û�в鵽����");

                        _bizLayer.FilDatable(ref dtResult, dt, dt.Columns[1].ColumnName.Trim());

                        //��װͳ����־������������(BTS_COUNT)�ֶ�
                        drLog["BTS_COUNT"] = dtResult.Rows.Count.ToString();
                        drExLog["BTS_COUNT"] = "";
                    }
                    catch (Exception ex)
                    {
                        if (ex.Message == "ORAERROR")
                        {
                            ConfExceptionReport(ref dtResult, ref lstChName, bizType, updateTime);
                        }
                    }
                }
                else if (bizType == "SECTOR")
                {                                        
                    try
                    {
                        _bizLayer.GetConfColumn(out lstChName, out lstFormula, 4);

                        DataTable dt = _bizLayer.GetConfSectorData(lstFormula, _proChName, updateTime);                        

                        _bizLayer.FilDatable(ref dtResult, dt, dt.Columns[1].ColumnName.Trim());

                        //��װͳ����־������������(BTS_COUNT)�ֶ�
                        //drLog["BTS_COUNT"] = dtResult.Rows.Count.ToString();
                        //drExLog["BTS_COUNT"] = "";
                    }
                    catch (Exception ex)
                    {
                        if (ex.Message == "ORAERROR")
                        {
                            ConfExceptionReport(ref dtResult, ref lstChName, bizType, updateTime);
                        }
                    }
                }
                else if (bizType == "WLANHP")
                {
                    
                    try
                    {
                        _bizLayer.GetConfColumn(out lstChName, out lstFormula, 5);
                        DataTable dt = _bizLayer.GetConfHPData(lstFormula, _proChName, updateTime);
                        _bizLayer.FilDatable(ref dtResult, dt, dt.Columns[1].ColumnName.Trim());

                        //ȡ��map���е���Ϣ,��串��������EVDO������Ϣ1,2,3;
                        DataTable dtFill = _bizLayer.GetMapData();
                        try
                        {
                            foreach (DataRow dr in dtResult.Rows)
                            {
                                if (dr["ID5011"] != DBNull.Value)
                                {
                                    DataRow[] oneRows = dtFill.Select(string.Format("NE_CELL_ID='{0}'", dr["ID5011"].ToString()));
                                    if (oneRows.Length > 0)
                                    {
                                        dr["ID5011"] = oneRows[0]["FULLNAME"].ToString();
                                    }
                                }
                                if (dr["ID5012"] != DBNull.Value)
                                {
                                    DataRow[] twoRows = dtFill.Select(string.Format("NE_CELL_ID={0}", dr["ID5012"].ToString()));
                                    if (twoRows.Length > 0)
                                    {
                                        dr["ID5012"] = twoRows[0]["FULLNAME"].ToString();
                                    }
                                }
                                if (dr["ID5013"] != DBNull.Value)
                                {
                                    DataRow[] threeRows = dtFill.Select(string.Format("NE_CELL_ID={0}", dr["ID5013"].ToString()));
                                    if (threeRows.Length > 0)
                                    {
                                        dr["ID5013"] = threeRows[0]["FULLNAME"].ToString();
                                    }
                                }
                            }
                        }
                        catch
                        {
 
                        }
                    }
                    catch (Exception ex)
                    {
                        if (ex.Message == "ORAERROR")
                        {
                            ConfExceptionReport(ref dtResult, ref lstChName, bizType, updateTime);
                        }
                    }
                }
                else if (bizType == "BLINDPOINT")
                {

                    try
                    {
                        _bizLayer.GetConfColumn(out lstChName, out lstFormula, 6);
                        DataTable dt = _bizLayer.GetConfBlindData(lstFormula, _proChName, updateTime);
                        dtResult = dt.Copy();
                        //_bizLayer.FilDatable(ref dtResult, dt, dt.Columns[1].ColumnName.Trim());                        
                    }
                    catch (Exception ex)
                    {
                        if (ex.Message == "ORAERROR")
                        {
                            ConfExceptionReport(ref dtResult, ref lstChName, bizType, updateTime);
                        }
                    }
                }


                if (dtResult == null || dtResult.Columns.Count == 0 || dtResult.Rows.Count == 0)
                {

                    //throw new Exception("û�в鵽����");
                    ConfExceptionReport(ref dtResult, ref lstChName, bizType, updateTime);

                }  

                _bizLayer.ExportCsv(dtResult, filename, filePath, lstChName, new ArrayList(), new ArrayList());
            }
            catch (Exception ex)
            {
                throw new Exception(string.Format("��������{0}�ļ����������ǹ�ʽ���ô������{1} ", filename, ex.Message));
            }
        }

        private void ConfExceptionReport(ref DataTable dtResult, ref ArrayList lstChName, string bizType, DateTime updateTime)
        {
            DirectoryInfo diConf = new DirectoryInfo(string.Format("{0}\\{1}\\{2}\\{3}",_localRootPath,_proEnName,ConstBackUp,ConstConf));
            string backfilepath=string.Format("{0}\\{1}\\{2}\\{3}",_localRootPath,_proEnName,ConstBackUp,ConstConf);
            FileSystemInfo[] fsi = diConf.GetFileSystemInfos();
            if (fsi.Length > 0)
            {
                for (int i = 14; i > 0; i--)
                {                                                       
                    string tempfilename = string.Format("{0}_CONF_{1}_{2}.csv", _proEnName, bizType.ToUpper(),
                                         updateTime.AddDays(-i).ToString("yyyyMMdd"));                            
                    foreach (FileSystemInfo fs in fsi)
                    {
                        if (fs.Name == tempfilename)
                        {                                    
                            //����csvд��datatable                                    
                            using (System.IO.StreamReader reader = new StreamReader(fs.FullName, System.Text.Encoding.GetEncoding("GB2312")))
                            {
                                int k = 0;
                                dtResult.Columns.Clear();
                                dtResult.Rows.Clear();
                                lstChName.Clear();
                                while (reader.Peek() > 0)
                                {
                                    if (k == 0)
                                    {
                                        string[] head = reader.ReadLine().Split(',');
                                        foreach (string s in head)
                                        {
                                            lstChName.Add(s);
                                        }
                                        for (int m = 0; m < head.Length; m++)
                                        {
                                            dtResult.Columns.Add("COL" + (m + 1).ToString());
                                        }
                                    }
                                    else
                                    {


                                        string str = reader.ReadLine();
                                        string[] data = str.Split(',');
                                        DataRow dr = dtResult.NewRow();
                                        for (int j = 0; j < data.Length; j++)
                                        {
                                            if (j == 0)//ʱ���
                                            {
                                                dr[j] = updateTime.ToString("yyyy-MM-dd");
                                            }
                                            else
                                            {
                                                dr[j] = data[j];
                                            }
                                        }
                                        dtResult.Rows.Add(dr);
                                    }
                                    k++;
                                }                                
                            }
                            _isFind = true;
                            break;
                            
                        }
                    }
                    if (_isFind)
                    {
                        break;
                    }
                }
            }
            _isFind = false;
            if (dtResult == null || dtResult.Columns.Count == 0 || dtResult.Rows.Count == 0)
            {
                throw new Exception("û�в鵽����");
            }
        
        }


        private void PerfCollectTemp(DateTime updateTime, string mscCity, string bizType,string ofilename)
        {
            try
            {
                string filePath = string.Empty; // �ļ�·��
                string filename = string.Empty; // �ļ�����
                string ftpPerfFilePath = string.Format("{0}/", ConstPerf);

                try
                {
                    if (mscCity == "MSC")
                        //PerfMscOutReport(updateTime, bizType, out filePath, out filename);
                        PerfMscReadAndWrite(updateTime, bizType, out filePath, out filename,ofilename);
                    else
                        //PerfCityOutReport(updateTime, bizType, out filePath, out filename);
                        PerfCityReadAndWrite(updateTime, bizType, out filePath, out filename,ofilename);
                }
                catch (Exception ex)
                {
                    AddErr(string.Format("����CSV����{0}", filename), ex.Message);
                    return;
                }

                string tempFileName = string.Format("{0}\\{1}", filePath, filename);
                FileInfo fileinfo = new FileInfo(tempFileName);
                bool ret = false;
                try
                {
                    ret = _ftpClient.fileUpload(fileinfo, ftpPerfFilePath, filename);
                    AddMsg(string.Format("�ϱ��ɹ�{0}", filename));
                }
                catch (Exception ex)
                {
                    AddErr(string.Format("{0}�ϴ�ʧ�ܣ��������ϴ�", filename), ex.Message);
                    ret = false;
                }

                if (!ret)
                {
                    AddUploadFailedFileToShareDic(tempFileName, ftpPerfFilePath, filename);
                    AddErr(string.Format("{0}�ϴ�ʧ�ܣ��������ϴ�", filename), "");
                }
                else
                {
                    string desFileName = tempFileName.Replace(string.Format("{0}\\", ConstPerf), string.Format("{0}\\{1}\\", ConstBackUp, ConstPerf));
                    File.Copy(tempFileName, desFileName, true);
                    File.Delete(tempFileName);
                }
            }
            catch (Exception ex)
            {
                AddErr(string.Format("MSC ����{0} ���ݳ���", bizType), ex.Message);
            }
        }

        /// <summary>
        /// ����MSC����
        /// </summary>
        /// <param name="updateTime">�ϱ�ʱ��</param>
        /// <param name="mscCity">MSC / CITY �����д</param>
        /// <param name="bizType">ҵ������ 1X ����DO �����д</param>
        private void PerfCollect(DateTime updateTime, string mscCity, string bizType)
        {
            try
            {
                string filePath = string.Empty; // �ļ�·��
                string filename = string.Empty; // �ļ�����
                string ftpPerfFilePath = string.Format("{0}/", ConstPerf);

                try
                {
                    if (mscCity == "MSC")
                        PerfMscOutReport(updateTime, bizType, out filePath, out filename);
                    else
                        PerfCityOutReport(updateTime, bizType, out filePath, out filename);
                }
                catch (Exception ex)
                {
                    AddErr(string.Format("����CSV����{0}", filename), ex.Message);
                    return;
                }

                string tempFileName = string.Format("{0}\\{1}", filePath, filename);
                FileInfo fileinfo = new FileInfo(tempFileName);
                bool ret = false;
                try
                {
                    ret = _ftpClient.fileUpload(fileinfo, ftpPerfFilePath, filename);
                    AddMsg(string.Format("�ϱ��ɹ�{0}", filename));
                }
                catch (Exception ex)
                {
                    AddErr(string.Format("{0}�ϴ�ʧ�ܣ��������ϴ�", filename), ex.Message);
                    ret = false;
                }

                if (!ret)
                {
                    AddUploadFailedFileToShareDic(tempFileName, ftpPerfFilePath, filename);
                    AddErr(string.Format("{0}�ϴ�ʧ�ܣ��������ϴ�", filename), "");
                }
                else
                {
                    string desFileName = tempFileName.Replace(string.Format("{0}\\", ConstPerf), string.Format("{0}\\{1}\\", ConstBackUp, ConstPerf));
                    File.Copy(tempFileName, desFileName, true);
                    File.Delete(tempFileName);
                }
            }
            catch (Exception ex)
            {
                AddErr(string.Format("MSC ����{0} ���ݳ���", bizType), ex.Message);                
            }
        }

        /// <summary>
        /// ��������MSC������
        /// </summary>
        /// <param name="updateTime">�ϱ�ʱ��</param>
        /// <param name="bizType">ҵ������ 1X��DO �����Ǵ�д</param>
        /// <param name="filePath">�ļ�·��</param>
        /// <param name="filename">�ļ�����</param>
        private void PerfMscOutReport(DateTime updateTime, string bizType, out string filePath, out string filename)
        {
            filename = "";
            try
            {
                if (updateTime <= Convert.ToDateTime(string.Format("{0} 05:00:00", DateTime.Now.ToString("yyyy-MM-dd")))
                    &&
                    updateTime >= Convert.ToDateTime(string.Format("{0} 00:00:00", DateTime.Now.ToString("yyyy-MM-dd"))))
                {
                    // �ڵ����賿5��ǰ�ϱ������������ϱ���������
                    updateTime = updateTime.AddDays(-1);
                    //���ܵ��ļ�����������(GD_PERF_MSC_1X_20100325.csv)
                    filename = string.Format("{0}_PERF_MSC_{1}_{2}.csv", _proEnName, bizType.ToUpper(),
                                             updateTime.ToString("yyyyMMdd"));
                }
                else
                {
                    // �������ǲ����ϱ�����ʱ������
                    //���ܵ��ļ�����������(GD_PERF_MSC_1X_20100325_N.csv)
                    filename = string.Format("{0}_PERF_MSC_{1}_{2}_{3}.csv", _proEnName, bizType.ToUpper(),
                                             updateTime.ToString("yyyyMMdd"), 1);
                }

                filePath = string.Format("{0}\\{1}\\PERF", _localRootPath, _proEnName);
                DataTable dtResult = new DataTable(); // ��ѯ���
                ArrayList lstId = new ArrayList(); // id
                ArrayList lstLogicExpress = new ArrayList(); // logicExpress
                ArrayList lstChName = new ArrayList(); // chinaName
                ArrayList lstFormula = new ArrayList(); // enName 
                ArrayList lstExtraName = new ArrayList(); // ����ֶΣ����Ǵ����ñ�cfg_provice_perf�л�ȡ
                Dictionary<string,string> dicValid = new Dictionary<string, string>();//���ʽ�͹�ʽ�Ƿ���Ч��Ӧ��ϵ�ֵ�
                Dictionary<string, string> dicID = new Dictionary<string, string>();//���ʽ��ID��Ӧ��ϵ�ֵ�

                if (bizType.ToUpper() == "1X")
                {
                    try
                    {
                        for (int i = 0; i < _dtVendor.Rows.Count; i++)
                        {

                            _bizLayer.GetPerfColumn(out lstId, out lstLogicExpress, out lstChName, out lstFormula,
                                                    bizType.ToUpper() == "1X" ? 1 : 2, // 1Xҵ�� classCode 1 ,DO classCode 2
                                                    _dtVendor.Rows[i]["vendor"].ToString(),out dicValid,out dicID);

                            DataTable dt = _bizLayer.GetPerfMsc1XData(lstFormula, _dtVendor.Rows[i]["vendor"].ToString(),
                                                                      _proChName,
                                                                      updateTime,
                                                                      out lstExtraName, _mscCitys);
                            if (dt != null && dt.Rows.Count > 0)
                                _bizLayer.BuildDataTable(ref dtResult, dt);
                        }                        
                    }
                    catch (Exception ex)
                    {
                        AddErr("��ѯMSC����1X���ݳ���", ex.Message);
                        //if (ex.Message == "ORAERROR")
                        //{
                        //    _isDown = true;
                        //    PerfMscExceptionReport(ref dtResult, ref lstChName, ref lstExtraName, ref lstLogicExpress, bizType.ToUpper(), updateTime);                            
                        //}
                    }
                }
                else
                {
                    try
                    {
                        for (int i = 0; i < _dtVendor.Rows.Count; i++)
                        {
                            _bizLayer.GetPerfColumn(out lstId, out lstLogicExpress, out lstChName, out lstFormula,
                                                    bizType.ToUpper() == "1X" ? 1 : 2, // 1Xҵ�� classCode 1 ,DO classCode 2
                                                    _dtVendor.Rows[i]["vendor"].ToString(),out dicValid,out dicID);

                            DataTable dt = _bizLayer.GetPerfMscDoData(lstFormula, _dtVendor.Rows[i]["vendor"].ToString(),
                                                                      _proChName,
                                                                      updateTime,
                                                                      out lstExtraName, _mscCitys);
                            if (dt != null && dt.Rows.Count > 0)
                                _bizLayer.BuildDataTable(ref dtResult, dt);
                        }                        
                    }
                    catch (Exception ex)
                    {
                        AddErr("��ѯMSC����DO���ݳ���", ex.Message);
                        //if (ex.Message == "ORAERROR")
                        //{
                        //    _isDown = true;
                        //    PerfMscExceptionReport(ref dtResult, ref lstChName, ref lstExtraName, ref lstLogicExpress, bizType.ToUpper(), updateTime);
                        //}
                    }
                }                

                //���ݿ�����������������ԣ��ؼ�ָ���log�жϣ���������ֱ��д��
                //if (!_isDown)
                //{
                    //�Ƚ���MSC�������ݵ��жϣ��õ���ʵ����дlog  


                    #region MSC��������ȱʧ�ж�
                    try
                    {
                        if (timeFlag)
                        {
                            //20��ֻ�ϴ���������
                            drEvLog["STAT_PROV"] = _proChName;
                            if (_proChName == "����")
                            {
                                drEvLog["CITY_COUNT"] = (_dtCity.Rows.Count + 2).ToString();
                            }
                            else
                            {
                                drEvLog["CITY_COUNT"] = _dtCity.Rows.Count.ToString();
                            }
                            drEvLog["STAT_DATE"] = DateTime.Now.AddDays(-4).ToShortDateString();
                            drEvLog["MSC_COUNT"] = "";
                            drEvLog["BSC_COUNT"] = "";
                            drEvLog["BTS_COUNT"] = "";
                            drEvLog["1X_PERF_PROV"] = "24";
                            drEvLog["DO_PERF_PROV"] = "24";
                            drEvLog["1X_CDL_CITY"] = "";
                            drEvLog["DO_CDL_CITY"] = "";


                            drEvExLog["STAT_PROV"] = _proChName;
                            if (_proChName == "����")
                            {
                                drEvExLog["CITY_COUNT"] = (_dtCity.Rows.Count + 2).ToString();
                            }
                            else
                            {
                                drEvExLog["CITY_COUNT"] = _dtCity.Rows.Count.ToString();
                            }
                            drEvExLog["STAT_DATE"] = DateTime.Now.AddDays(-4).ToShortDateString();
                            drEvExLog["1X_CDL_CITY"] = "";
                            drEvExLog["MSC_COUNT"] = "";
                            drEvExLog["BSC_COUNT"] = "";
                            drEvExLog["BTS_COUNT"] = "";
                            drEvExLog["DO_CDL_CITY"] = "";
                            drEvExLog["1X_PERF_PROV"] = "";
                            drEvExLog["DO_PERF_PROV"] = "";
                        }
                        //if (dtResult == null || dtResult.Columns.Count == 0 || dtResult.Rows.Count == 0)
                        //{
                        //    if (bizType.ToUpper() == "1X")
                        //    {
                        //        drLog["1X_PERF_MSC"] = "0";
                        //        drExLog["1X_PERF_MSC"] = "���е���ȫ��ȱʧ";
                        //    }
                        //    else
                        //    {
                        //        drLog["DO_PERF_MSC"] = "0";
                        //        drExLog["DO_PERF_MSC"] = "���е���ȫ��ȱʧ";
                        //    }

                        //    //throw new Exception("û�в鵽����");
                        //}
                        //else
                        //{
                        drLog["STAT_PROV"] = _proChName;
                        drExLog["STAT_PROV"] = _proChName;
                        if (_proChName == "����")
                        {
                            drLog["CITY_COUNT"] = (_dtCity.Rows.Count + 2).ToString();
                            drExLog["CITY_COUNT"] = (_dtCity.Rows.Count + 2).ToString();
                        }
                        else
                        {
                            drLog["CITY_COUNT"] = _dtCity.Rows.Count.ToString();
                            drExLog["CITY_COUNT"] = _dtCity.Rows.Count.ToString();
                        }

                        drLog["1X_PERF_PROV"] = "24";
                        drLog["DO_PERF_PROV"] = "24";
                        drExLog["1X_PERF_PROV"] = "";
                        drExLog["DO_PERF_PROV"] = "";

                        drLog["STAT_DATE"] = DateTime.Now.AddDays(-1).ToShortDateString();
                        drExLog["STAT_DATE"] = DateTime.Now.AddDays(-1).ToShortDateString();
                        if (bizType.ToUpper() == "1X")
                        {
                            if (timeFlag)
                            {
                                drEvLog["1X_PERF_MSC"] = dtResult.Rows.Count.ToString();
                                perf1xMsc = CheckData("MSC", "1X", dtResult, timeFlag);
                                if (perf1xMsc.Length > 0)
                                {
                                    drEvExLog["1X_PERF_MSC"] = "����ȱʧ��ϸ:" + "\r\n" + perf1xMsc;
                                }
                                else
                                {
                                    drEvExLog["1X_PERF_MSC"] = "";
                                }
                            }
                            else
                            {
                                drLog["1X_PERF_MSC"] = dtResult.Rows.Count.ToString();
                                perf1xMsc = CheckData("MSC", "1X", dtResult, timeFlag);
                                if (perf1xMsc.Length > 0)
                                {
                                    drExLog["1X_PERF_MSC"] = "����ȱʧ��ϸ:" + "\r\n" + perf1xMsc;
                                }
                                else
                                {
                                    drExLog["1X_PERF_MSC"] = "";
                                }
                            }
                        }
                        else
                        {
                            if (timeFlag)
                            {
                                drEvLog["DO_PERF_MSC"] = dtResult.Rows.Count.ToString();
                                perfDoMsc = CheckData("MSC", "DO", dtResult, timeFlag);
                                if (perfDoMsc.Length > 0)
                                {
                                    drEvExLog["DO_PERF_MSC"] = "����ȱʧ��ϸ:" + "\r\n" + perfDoMsc;
                                }
                                else
                                {
                                    drEvExLog["DO_PERF_MSC"] = "";
                                }
                            }
                            else
                            {
                                drLog["DO_PERF_MSC"] = dtResult.Rows.Count.ToString();
                                perfDoMsc = CheckData("MSC", "DO", dtResult, timeFlag);
                                if (perfDoMsc.Length > 0)
                                {
                                    drExLog["DO_PERF_MSC"] = "����ȱʧ��ϸ:" + "\r\n" + perfDoMsc;
                                }
                                else
                                {
                                    drExLog["DO_PERF_MSC"] = "";
                                }
                            }
                        }

                        //}
                    }
                    catch (Exception ex)
                    {
                        AddErr("���MSC�������������Գ���", ex.Message);
                    }
                    #endregion

                    if (_isFull == "1")
                    {
                        #region ���������Դ���
                        try
                        {
                            if (dtResult.Columns.Count > 0 || dtResult.Rows.Count > 0)
                            {
                                string tempresult = CheckData("MSC", bizType, dtResult, false);
                                if (!string.IsNullOrEmpty(tempresult))
                                {
                                    string[] timeCity = tempresult.Split(',');
                                    for (int i = 0; i < timeCity.Length; i++)
                                    {
                                        string[] tempCon = timeCity[i].Split('|');
                                        DataTable dt = _bizLayer.GetMscSupplyData(tempCon[1], DateTime.Now.AddDays(-14).ToString("yyyy-MM-dd") + " " + tempCon[0],
                                            1, bizType.ToUpper() == "1X" ? 1 : 2);

                                        if (dt != null && dt.Rows.Count > 0)
                                        {
                                            for (int j = 0; j < dt.Rows.Count; j++)
                                            {
                                                //��ȡʱ���
                                                int pos = dt.Rows[j]["AF_START_TIME"].ToString().LastIndexOf(' ');
                                                string timehour = dt.Rows[j]["AF_START_TIME"].ToString().Substring(pos + 1);

                                                if (timehour == tempCon[0])
                                                {
                                                    DataRow dr = dtResult.NewRow();
                                                    for (int k = 0; k < lstChName.Count + 5; k++)
                                                    {
                                                        if (k == 1)
                                                        {
                                                            dr[k] = updateTime.ToString("yyyy-MM-dd") + " " + timehour;
                                                        }
                                                        else
                                                        {
                                                            dr[k] = dt.Rows[j][k + 3];
                                                        }

                                                    }

                                                    dtResult.Rows.Add(dr);
                                                    break;
                                                }
                                                else
                                                {
                                                    continue;
                                                }
                                            }
                                        }

                                    }
                                    if (dtResult.Rows.Count > 0)
                                    {
                                        DataView dv = new DataView(dtResult);
                                        dv.Sort = "MSCNAME,START_TIME";
                                        dtResult = dv.ToTable();
                                    }
                                }

                            }
                        }
                        catch (Exception ex)
                        {
                            AddErr("MSC�������������Դ������", ex.Message);
                        }
                        #endregion
                    }

                    if (_isSpecial == "1")
                    {
                        #region 38���ؼ�ָ�������ж�
                        try
                        {
                            if (dtResult.Columns.Count > 0 || dtResult.Rows.Count > 0)
                            {
                                DataTable dtKeyIndex = _bizLayer.GetKeyIndex(bizType.ToUpper() == "1X" ? 1 : 2);
                                string[] indexlist = null;
                                Dictionary<string, string> checkDic = new Dictionary<string, string>();
                                if (dtKeyIndex.Rows.Count > 0)
                                {
                                    string index = dtKeyIndex.Rows[0]["EN_NAME"].ToString();
                                    indexlist = index.Split(',');
                                    for (int i = 0; i < indexlist.Length; i++)
                                    {
                                        if (!checkDic.ContainsKey(indexlist[i]))
                                        {
                                            checkDic.Add("ID" + indexlist[i], "ID" + indexlist[i]);
                                        }
                                    }

                                    for (int i = 0; i < dtResult.Rows.Count; i++)
                                    {
                                        DateTime starttime = Convert.ToDateTime(dtResult.Rows[i]["START_TIME"].ToString());
                                        string cityname = dtResult.Rows[i]["CITY_NAME"].ToString();
                                        //�Ȼ�ȡdatatable�ټ���,��Сlog�ļ�
                                        DataTable dtTemp = _bizLayer.GetCheckValue(starttime, bizType.ToUpper() == "1X" ? 1 : 2, 1, cityname);

                                        for (int j = 0; j < dtResult.Columns.Count; j++)
                                        {
                                            if (checkDic.ContainsKey(dtResult.Columns[j].ColumnName))
                                            {
                                                //object value = _bizLayer.GetCheckValue(starttime, dtResult.Columns[j].ColumnName, bizType.ToUpper() == "1X" ? 1 : 2, 1, cityname);
                                                object value = dtTemp.Compute(string.Format("sum({0})", dtResult.Columns[j].ColumnName), "1=1");
                                                if (value == null || value == DBNull.Value)
                                                {
                                                    continue;
                                                }
                                                else
                                                {
                                                    if (dtResult.Rows[i][j] != DBNull.Value)
                                                    {
                                                        if (Convert.ToDouble(dtResult.Rows[i][j]) > Convert.ToDouble(value) * 5)
                                                        {
                                                            DataTable dtReplace = _bizLayer.GetReplaceValue(starttime, dtResult.Columns[j].ColumnName, bizType.ToUpper() == "1X" ? 1 : 2, 1, cityname);
                                                            if (dtReplace.Rows.Count > 0)
                                                            {
                                                                dtResult.Rows[i][j] = dtReplace.Rows[0][0];
                                                            }
                                                            else
                                                            {
                                                                continue;
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            AddErr("MSC����38��ָ�������жϳ���", ex.Message);
                        }
                        #endregion
                    }
                    
                    
                    #region �����Դ��ָ��
                    Dictionary<string,string> dicResValid = new Dictionary<string,string>();
                    Dictionary<string,string> dicResID = new Dictionary<string,string>();
                    try
                    {
                        ArrayList lstResFormula = new ArrayList();                        
                        Dictionary<string, string> dicRes = new Dictionary<string, string>();          
                       

                        if (bizType.ToUpper() == "1X")
                        {
                            //1X                           
                            _bizLayer.GetResColumn(bizType.ToUpper()=="1X"?1:2,"ZY0808",out dicRes,out lstResFormula,out dicResValid,out dicResID);
                            DataTable dtRes = _bizLayer.GetResMscData(lstResFormula, updateTime);                            

                            if (dtResult.Rows.Count > 0)
                            {
                                for (int i = 0; i < dtResult.Rows.Count; i++)
                                {
                                    DataView dvRes = new DataView(dtRes);
                                    dvRes.RowFilter = string.Format("MSCNAME='{0}' and START_TIME='{1}'", dtResult.Rows[i]["MSCNAME"].ToString(),
                                                                                                        dtResult.Rows[i]["START_TIME"].ToString());
                                    DataTable dtResTemp = dvRes.ToTable();                                   

                                    for (int j = 0; j < dtResult.Columns.Count; j++)
                                    {
                                        if (dtResTemp.Rows.Count > 0)
                                        {
                                            if (dicRes.ContainsKey(dtResult.Columns[j].ColumnName))
                                            {
                                                dtResult.Rows[i][j] = dtResTemp.Rows[0][dicRes[dtResult.Columns[j].ColumnName]];
                                            }
                                        }                                       
                                    }
                                }
                            }

                            //��ȫ�ֱ�����ֵ����ȷ�Լ��ʱʹ��
                            dtMsc1X = new DataTable();                            
                            dtMsc1X = dtResult.Copy();
                        }
                        else
                        {
                            //DO                          
                            _bizLayer.GetResColumn(bizType.ToUpper()=="1X"?1:2,"ZY0808",out dicRes,out lstResFormula,out dicResValid,out dicResID);
                            DataTable dtRes = _bizLayer.GetResMscData(lstResFormula, updateTime);                           

                            if (dtResult.Rows.Count > 0)
                            {
                                for (int i = 0; i < dtResult.Rows.Count; i++)
                                {
                                    DataView dvRes = new DataView(dtRes);
                                    dvRes.RowFilter = string.Format("MSCNAME='{0}' and START_TIME='{1}'", dtResult.Rows[i]["MSCNAME"].ToString(),
                                                                                                         dtResult.Rows[i]["START_TIME"].ToString());
                                    dvRes.RowStateFilter = DataViewRowState.CurrentRows;
                                    DataTable dtResTemp = dvRes.ToTable();                                    

                                    for (int j = 0; j < dtResult.Columns.Count; j++)
                                    {
                                        if (dtResTemp.Rows.Count > 0)
                                        {
                                            if (dicRes.ContainsKey(dtResult.Columns[j].ColumnName))
                                            {
                                                dtResult.Rows[i][j] = dtResTemp.Rows[0][dicRes[dtResult.Columns[j].ColumnName]];
                                            }
                                        }                                        
                                    }
                                }
                            }


                            //��ȫ�ֱ�����ֵ����ȷ�Լ��ʱʹ��
                            dtMscDo = new DataTable();
                            dtMscDo = dtResult.Copy();
                        }
                    }
                    catch(Exception ex)
                    {
                        AddErr("MSC���������Դ��ָ�����", ex.Message);
                    }
                    #endregion
                   
                    if (_isNull == "1")//�޵�ģʽ���޸�Ϊ�յ�����
                    {
                        if (bizType == "1X")
                        {
                            HandleIndexMsc1X(dtResult, dicValid, dicID, dicResValid, dicResID);
                        }
                        else
                        {
                            //HandleIndexMscDo(dtResult);
                            HandleIndexMscDo(dtResult, dicValid, dicID, dicResValid, dicResID);
                        }
                    }      

                    //��ȫ�ֱ�����ֵ����ȷ�Լ��ʱʹ��
                    if (bizType.ToUpper() == "1X")
                    {
                        dtMsc1X = new DataTable();
                        dtMsc1X = dtResult.Copy();
                    }
                    else
                    {
                        dtMscDo = new DataTable();
                        dtMscDo = dtResult.Copy();
                    }                                                
                //}                
                //else
                //{
                //    _isDown = false;
                //}
                if (dtResult != null && dtResult.Rows.Count > 0)
                {

                    _bizLayer.ExportCsv(dtResult, filename, filePath, lstChName, lstExtraName, lstLogicExpress);
                    _bizLayer.InsertPerf(dtResult, bizType.ToUpper() == "1X" ? 1 : 2, 1);
                }
                else
                {
                    AddErr("MSC��������Ϊnull��������", "");
                }
            }
            catch (Exception ex)
            {
                throw new Exception(string.Format("��������{0}�ļ����������ǹ�ʽ���ô������{1} ", filename, ex.Message));
            }
        }

        private void PerfCityExceptionReport(ref DataTable dtResult, ref ArrayList lstChName, ref ArrayList lstExtraName, ref ArrayList lstLogicExpress, string bizType, DateTime updateTime)
        {            
            DirectoryInfo diPerfCity = new DirectoryInfo(string.Format("{0}\\{1}\\{2}\\{3}", _localRootPath, _proEnName, ConstBackUp, ConstPerf));
            string backfilepath = string.Format("{0}\\{1}\\{2}\\{3}", _localRootPath, _proEnName, ConstBackUp, ConstPerf);
            FileSystemInfo[] fsi = diPerfCity.GetFileSystemInfos();
            if (fsi.Length > 0)
            {
                for (int i = 14; i > 0; i--)
                {
                    string tempfilename = string.Format("{0}_PERF_CITY_{1}_{2}.csv", _proEnName, bizType.ToUpper(),
                                             updateTime.AddDays(-i).ToString("yyyyMMdd"));
                    foreach (FileSystemInfo fs in fsi)
                    {
                        if (fs.Name == tempfilename)
                        {
                            //����csvд��datatable                                    
                            using (System.IO.StreamReader reader = new StreamReader(fs.FullName, System.Text.Encoding.GetEncoding("GB2312")))
                            {
                                try
                                {
                                    int k = 0;
                                    dtResult.Columns.Clear();
                                    dtResult.Rows.Clear();

                                    lstChName.Clear();
                                    lstExtraName.Clear();
                                    lstLogicExpress.Clear();

                                    while (reader.Peek() > 0)
                                    {
                                        if (k == 0)
                                        {
                                            string[] head = reader.ReadLine().Split(',');
                                            for (int x = 5; x < head.Length; x++)
                                            {
                                                lstLogicExpress.Add(head[x]);
                                            }

                                            for (int m = 0; m < head.Length; m++)
                                            {
                                                dtResult.Columns.Add("COL" + (m + 1).ToString());
                                            }
                                        }
                                        else if (k == 1)
                                        {
                                            string[] chname = reader.ReadLine().Split(',');
                                            for (int x = 0; x < 5; x++)
                                            {
                                                lstExtraName.Add(chname[x]);
                                            }
                                            for (int x = 5; x < chname.Length; x++)
                                            {
                                                lstChName.Add(chname[x]);
                                            }
                                        }
                                        else
                                        {
                                            string str = reader.ReadLine();
                                            string[] data = str.Split(',');
                                            DataRow dr = dtResult.NewRow();

                                            for (int j = 0; j < data.Length; j++)
                                            {
                                                if (j == 1)//�޸�ʱ���
                                                {
                                                    int pos = data[j].ToString().LastIndexOf(' ');
                                                    string timehour = data[j].ToString().Substring(pos + 1);
                                                    dr[j] = updateTime.ToString("yyyy-MM-dd") + "  " + timehour;
                                                }
                                                else
                                                {
                                                    dr[j] = data[j];
                                                }
                                            }

                                            dtResult.Rows.Add(dr);
                                        }
                                        k++;
                                    }
                                }
                                catch (Exception ex)
                                {
                                    AddErr("��ȡCITY���𲹳��ļ�����", ex.Message);
                                }                               
                            }
                            _isFind = true;
                            break;
                        }
                    }
                    if (_isFind)
                    {
                        break;
                    }
                }
            }
            _isFind = false;
            if (dtResult == null || dtResult.Columns.Count == 0 || dtResult.Rows.Count == 0)
            {
                throw new Exception("û�в鵽����");
            }                  
        }

        private void PerfMscExceptionReport(ref DataTable dtResult, ref ArrayList lstChName, ref ArrayList lstExtraName, ref ArrayList lstLogicExpress,string bizType,DateTime updateTime)
        {
            DirectoryInfo diPerfMsc = new DirectoryInfo(string.Format("{0}\\{1}\\{2}\\{3}", _localRootPath, _proEnName, ConstBackUp, ConstPerf));
            string backfilepath = string.Format("{0}\\{1}\\{2}\\{3}", _localRootPath, _proEnName, ConstBackUp, ConstPerf);
            FileSystemInfo[] fsi = diPerfMsc.GetFileSystemInfos();
            if (fsi.Length > 0)
            {
                for (int i = 14; i > 0; i--)
                {
                    string tempfilename = string.Format("{0}_PERF_MSC_{1}_{2}.csv", _proEnName, bizType.ToUpper(),
                                             updateTime.AddDays(-i).ToString("yyyyMMdd"));                    
                    foreach (FileSystemInfo fs in fsi)
                    {
                        if (fs.Name == tempfilename)
                        {
                            //����csvд��datatable                                    
                            using (System.IO.StreamReader reader = new StreamReader(fs.FullName, System.Text.Encoding.GetEncoding("GB2312")))
                            {
                                try
                                {
                                    int k = 0;
                                    dtResult.Columns.Clear();
                                    dtResult.Rows.Clear();

                                    lstChName.Clear();
                                    lstExtraName.Clear();
                                    lstLogicExpress.Clear();

                                    while (reader.Peek() > 0)
                                    {
                                        if (k == 0)
                                        {
                                            string[] head = reader.ReadLine().Split(',');
                                            for (int x = 5; x < head.Length; x++)
                                            {
                                                lstLogicExpress.Add(head[x]);
                                            }

                                            for (int m = 0; m < head.Length; m++)
                                            {
                                                dtResult.Columns.Add("COL" + (m + 1).ToString());
                                            }
                                        }
                                        else if (k == 1)
                                        {
                                            string[] chname = reader.ReadLine().Split(',');
                                            for (int x = 0; x < 5; x++)
                                            {
                                                lstExtraName.Add(chname[x]);
                                            }
                                            for (int x = 5; x < chname.Length; x++)
                                            {
                                                lstChName.Add(chname[x]);
                                            }
                                        }
                                        else
                                        {
                                            string str = reader.ReadLine();
                                            string[] data = str.Split(',');
                                            DataRow dr = dtResult.NewRow();
                                            for (int j = 0; j < data.Length; j++)
                                            {
                                                if (j == 1)//�޸�ʱ���
                                                {
                                                    int pos = data[j].ToString().LastIndexOf(' ');
                                                    string timehour = data[j].ToString().Substring(pos + 1);
                                                    dr[j] = updateTime.ToString("yyyy-MM-dd") + "  " + timehour;
                                                }
                                                else
                                                {
                                                    dr[j] = data[j];
                                                }

                                            }

                                            dtResult.Rows.Add(dr);
                                        }
                                        k++;
                                    }
                                }
                                catch (Exception ex)
                                {
                                    AddErr("��ȡMSC���𲹳��ļ�����", ex.Message);
                                }                                
                            }
                            _isFind = true;
                            break;
                        }
                    }
                    if (_isFind)
                    {
                        break;
                    }
                }
            }
            _isFind = false;
            if (dtResult == null || dtResult.Columns.Count == 0 || dtResult.Rows.Count == 0)
            {                
                throw new Exception("û�в鵽����");
            }     
        }

        /// <summary>
        /// ��������CITY������
        /// </summary>
        /// <param name="updateTime">�ϱ�ʱ��</param>
        /// <param name="bizType">ҵ������ 1X��DO �����Ǵ�д</param>
        /// <param name="filePath">�ļ�·��</param>
        /// <param name="filename">�ļ�����</param>
        private void PerfCityOutReport(DateTime updateTime, string bizType, out string filePath, out string filename)
        {
            filename = "";
            try
            {
                if (updateTime <= Convert.ToDateTime(string.Format("{0} 05:00:00", DateTime.Now.ToString("yyyy-MM-dd")))
                    &&
                    updateTime >= Convert.ToDateTime(string.Format("{0} 00:00:00", DateTime.Now.ToString("yyyy-MM-dd"))))
                {
                    // �ڵ����賿5��ǰ�ϱ������������ϱ���������
                    updateTime = updateTime.AddDays(-1);
                    //���ܵ��ļ�����������(GD_PERF_CITY_1X_20100325.csv)
                    filename = string.Format("{0}_PERF_CITY_{1}_{2}.csv", _proEnName, bizType.ToUpper(),
                                             updateTime.ToString("yyyyMMdd"));
                }
                else
                {
                    // �������ǲ����ϱ�����ʱ������
                    //���ܵ��ļ�����������(GD_PERF_CITY_1X_20100325_N.csv)
                    filename = string.Format("{0}_PERF_CITY_{1}_{2}_{3}.csv", _proEnName, bizType.ToUpper(),
                                             updateTime.ToString("yyyyMMdd"), 1);
                }

                filePath = string.Format("{0}\\{1}\\PERF", _localRootPath, _proEnName);
                DataTable dtResult = new DataTable(); // ��ѯ���
                ArrayList lstId = new ArrayList(); // id
                ArrayList lstLogicExpress = new ArrayList(); // logicExpress
                ArrayList lstChName = new ArrayList(); // chinaName
                ArrayList lstExtraName = new ArrayList(); // ����ֶΣ����Ǵ����ñ�cfg_provice_perf�л�ȡ
                Dictionary<string, string> dicValid = new Dictionary<string, string>();//���ʽ�͹�ʽ�Ƿ���Ч��Ӧ��ϵ�ֵ�
                Dictionary<string, string> dicID = new Dictionary<string, string>();//���ʽ��ID��Ӧ��ϵ�ֵ�

                Dictionary<string, string> logicExpressEnName = null;

                try
                {
                    logicExpressEnName = _bizLayer.GetPerfProviceColumn(bizType.ToUpper() == "1X" ? 1 : 2);
                }
                catch(Exception ex)
                {
                    AddErr("��ȡʡ��ָ��ͳ�Ʒ�������", ex.Message);
                    //if (ex.Message == "ORAERROR")
                    //{
                    //    _isDown = true;
                    //    PerfCityExceptionReport(ref dtResult, ref lstChName, ref lstExtraName, ref lstLogicExpress, bizType.ToUpper(), updateTime);
                    //}
                }

                DataTable dtVendor = (new DataView(_dtCity)).ToTable(true, "vendor");

                if (bizType.ToUpper() == "1X")
                {
                    Dictionary<string, ArrayList> vendorFormula = new Dictionary<string, ArrayList>();

                    try
                    {
                        for (int x = 0; x < dtVendor.Rows.Count; x++)
                        {
                            ArrayList lstFormula = new ArrayList(); // enName 
                            _bizLayer.GetPerfColumn(out lstId, out lstLogicExpress, out lstChName, out lstFormula,
                                                    bizType.ToUpper() == "1X" ? 1 : 2, // 1Xҵ�� classCode 1 ,DO classCode 2
                                                    dtVendor.Rows[x]["vendor"].ToString(),out dicValid,out dicID);
                            if (!vendorFormula.Keys.Contains(dtVendor.Rows[x]["vendor"].ToString()))
                                vendorFormula.Add(dtVendor.Rows[x]["vendor"].ToString(), lstFormula);
                        }

                      dtResult = _bizLayer.GetCity1XData(vendorFormula, _proChName, updateTime, out lstExtraName);                        
                   }
                    catch (Exception ex)
                    {
                        AddErr("��ѯCITY����1X�������ݳ���", ex.Message);
                        //if (ex.Message == "ORAERROR")
                        //{
                        //    _isDown = true;
                        //    PerfCityExceptionReport(ref dtResult, ref lstChName, ref lstExtraName, ref lstLogicExpress, bizType.ToUpper(), updateTime);
                        //}
                    }
                }
                else
                {
                    Dictionary<string, ArrayList> vendorFormula = new Dictionary<string, ArrayList>();

                    try
                    {
                        for (int x = 0; x < dtVendor.Rows.Count; x++)
                        {
                            ArrayList lstFormula = new ArrayList(); // enName 
                            _bizLayer.GetPerfColumn(out lstId, out lstLogicExpress, out lstChName, out lstFormula,
                                                    bizType.ToUpper() == "1X" ? 1 : 2, // 1Xҵ�� classCode 1 ,DO classCode 2
                                                    dtVendor.Rows[x]["vendor"].ToString(),out dicValid,out dicID);
                            if (!vendorFormula.Keys.Contains(dtVendor.Rows[x]["vendor"].ToString()))
                                vendorFormula.Add(dtVendor.Rows[x]["vendor"].ToString(), lstFormula);
                        }

                        dtResult = _bizLayer.GetCityDoData(vendorFormula, _proChName, updateTime, out lstExtraName);
                    }
                    catch (Exception ex)
                    {
                        AddErr("��ѯCITY����DO�������ݳ���",ex.Message);
                        //if (ex.Message == "ORAERROR")
                        //{
                        //    _isDown = true;
                        //    PerfCityExceptionReport(ref dtResult, ref lstChName, ref lstExtraName, ref lstLogicExpress, bizType.ToUpper(), updateTime);
                        //}
                    }
                }

                
                //if (!_isDown)
                //{


                    #region CITY��������ȱʧ�ж�
                    try
                    {
                        if (timeFlag)
                        {
                            //20��ֻ�ϴ���������
                            drEvLog["STAT_PROV"] = _proChName;
                            if (_proChName == "����")
                            {
                                drEvLog["CITY_COUNT"] = (_dtCity.Rows.Count + 2).ToString();
                            }
                            else
                            {
                                drEvLog["CITY_COUNT"] = _dtCity.Rows.Count.ToString();
                            }
                            drEvLog["STAT_DATE"] = DateTime.Now.AddDays(-4).ToShortDateString();
                            drEvLog["MSC_COUNT"] = "";
                            drEvLog["BSC_COUNT"] = "";
                            drEvLog["BTS_COUNT"] = "";
                            drEvLog["1X_PERF_PROV"] = "24";
                            drEvLog["DO_PERF_PROV"] = "24";
                            drEvLog["1X_CDL_CITY"] = "";
                            drEvLog["DO_CDL_CITY"] = "";


                            drEvExLog["STAT_PROV"] = _proChName;
                            if (_proChName == "����")
                            {
                                drEvExLog["CITY_COUNT"] = (_dtCity.Rows.Count + 2).ToString();
                            }
                            else
                            {
                                drEvExLog["CITY_COUNT"] = _dtCity.Rows.Count.ToString();
                            }
                            drEvExLog["STAT_DATE"] = DateTime.Now.AddDays(-4).ToShortDateString();
                            drEvExLog["1X_CDL_CITY"] = "";
                            drEvExLog["MSC_COUNT"] = "";
                            drEvExLog["BSC_COUNT"] = "";
                            drEvExLog["BTS_COUNT"] = "";
                            drEvExLog["DO_CDL_CITY"] = "";
                            drEvExLog["1X_PERF_PROV"] = "";
                            drEvExLog["DO_PERF_PROV"] = "";
                        }
                        //if (dtResult == null || dtResult.Columns.Count == 0 || dtResult.Rows.Count == 0)
                        //{
                        //    if (bizType.ToUpper() == "1X")
                        //    {
                        //        drLog["1X_PERF_CITY"] = "0";
                        //        drExLog["1X_PERF_CITY"] = "���е���ȫ��ȱʧ";
                        //    }
                        //    else
                        //    {
                        //        drLog["DO_PERF_CITY"] = "0";
                        //        drExLog["DO_PERF_CITY"] = "���е���ȫ��ȱʧ";
                        //    }
                        //    //throw new Exception("û�в鵽����");
                        //}
                        //else
                        //{
                        drLog["STAT_PROV"] = _proChName;
                        drExLog["STAT_PROV"] = _proChName;
                        if (_proChName == "����")
                        {
                            drLog["CITY_COUNT"] = (_dtCity.Rows.Count + 2).ToString();
                            drExLog["CITY_COUNT"] = (_dtCity.Rows.Count + 2).ToString();
                        }
                        else
                        {
                            drLog["CITY_COUNT"] = _dtCity.Rows.Count.ToString();
                            drExLog["CITY_COUNT"] = _dtCity.Rows.Count.ToString();
                        }

                        drLog["1X_PERF_PROV"] = "24";
                        drLog["DO_PERF_PROV"] = "24";
                        drExLog["1X_PERF_PROV"] = "";
                        drExLog["DO_PERF_PROV"] = "";

                        drLog["STAT_DATE"] = DateTime.Now.AddDays(-1).ToShortDateString();
                        drExLog["STAT_DATE"] = DateTime.Now.AddDays(-1).ToShortDateString();
                        if (bizType.ToUpper() == "1X")
                        {
                            if (timeFlag)
                            {
                                drEvLog["1X_PERF_CITY"] = dtResult.Rows.Count.ToString();
                                perf1xCity = CheckData("CITY", "1X", dtResult, timeFlag);
                                if (perf1xCity.Length > 0)
                                {
                                    drEvExLog["1X_PERF_CITY"] = "����ȱʧ��ϸ:" + "\r\n" + perf1xCity;
                                }
                                else
                                {
                                    drEvExLog["1X_PERF_CITY"] = "";
                                }
                            }
                            else
                            {
                                drLog["1X_PERF_CITY"] = dtResult.Rows.Count.ToString();
                                perf1xCity = CheckData("CITY", "1X", dtResult, timeFlag);
                                if (perf1xCity.Length > 0)
                                {
                                    drExLog["1X_PERF_CITY"] = "����ȱʧ��ϸ:" + "\r\n" + perf1xCity;
                                }
                                else
                                {
                                    drExLog["1X_PERF_CITY"] = "";
                                }
                            }

                        }
                        else
                        {
                            if (timeFlag)
                            {
                                drEvLog["DO_PERF_CITY"] = dtResult.Rows.Count.ToString();
                                perfDoCity = CheckData("CITY", "DO", dtResult, timeFlag);
                                if (perfDoCity.Length > 0)
                                {
                                    drEvExLog["DO_PERF_CITY"] = "����ȱʧ��ϸ:" + "\r\n" + perfDoCity;
                                }
                                else
                                {
                                    drEvExLog["DO_PERF_CITY"] = "";
                                }
                            }
                            else
                            {
                                drLog["DO_PERF_CITY"] = dtResult.Rows.Count.ToString();
                                perfDoCity = CheckData("CITY", "DO", dtResult, timeFlag);
                                if (perfDoCity.Length > 0)
                                {
                                    drExLog["DO_PERF_CITY"] = "����ȱʧ��ϸ:" + "\r\n" + perfDoCity;
                                }
                                else
                                {
                                    drExLog["DO_PERF_CITY"] = "";
                                }
                            }
                        }
                        //}
                    }
                    catch (Exception ex)
                    {
                        AddErr("CITY�����ж���������ȱʧ����", ex.Message);
                    }
                    #endregion

                    if (_isFull == "1")
                    {
                        #region �������������⴦��
                        try
                        {
                            string tempresult = CheckData("CITY", bizType, dtResult, false);
                            if (!string.IsNullOrEmpty(tempresult))
                            {
                                string[] timeCity = tempresult.Split(',');
                                for (int i = 0; i < timeCity.Length; i++)
                                {
                                    string[] tempCon = timeCity[i].Split('|');
                                    DataTable dt = _bizLayer.GetSupplyData(tempCon[1], DateTime.Now.AddDays(-14).ToString("yyyy-MM-dd") + " " + tempCon[0],
                                        2, bizType.ToUpper() == "1X" ? 1 : 2);
                                    if (dt != null && dt.Rows.Count > 0)
                                    {
                                        for (int j = 0; j < dt.Rows.Count; j++)
                                        {
                                            //��ȡʱ���
                                            int pos = dt.Rows[j]["AF_START_TIME"].ToString().LastIndexOf(' ');
                                            string timehour = dt.Rows[j]["AF_START_TIME"].ToString().Substring(pos + 1);

                                            if (timehour == tempCon[0])
                                            {
                                                DataRow dr = dtResult.NewRow();
                                                //�޸�ʱ���
                                                //dt.Rows[j]["START_TIME"] = updateTime.ToString("yyyy-MM-dd") + " " + timehour;
                                                for (int k = 0; k < lstChName.Count + 5; k++)
                                                {
                                                    if (k == 1)
                                                    {
                                                        dr[k] = updateTime.ToString("yyyy-MM-dd") + " " + timehour;
                                                    }
                                                    else
                                                    {
                                                        dr[k] = dt.Rows[j][k + 3];
                                                    }
                                                }
                                                dtResult.Rows.Add(dr);
                                                break;
                                            }
                                            else
                                            {
                                                continue;
                                            }
                                        }
                                    }
                                }
                                if (dtResult.Rows.Count > 0)
                                {
                                    //dtResult.Select("1=1", "START_TIME,B1");//��������
                                    DataView dv = new DataView(dtResult);
                                    dv.Sort = "START_TIME,B1";
                                    dtResult = dv.ToTable();
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            AddErr("CITY�������������Դ������", ex.Message);
                        }
                        #endregion
                    }

                    if (_isSpecial == "1")
                    {
                        #region 38���ؼ�ָ�������ж�
                        //if (_isRepair == "0")//_isRepariΪ0ʱ�����޸����ݵĶ����������ڳ��㶫֮��İ汾
                        //{
                            try
                            {
                                DataTable dtKeyIndex = _bizLayer.GetKeyIndex(bizType.ToUpper() == "1X" ? 1 : 2);
                                string[] indexlist = null;
                                Dictionary<string, string> checkDic = new Dictionary<string, string>();
                                if (dtKeyIndex.Rows.Count > 0)
                                {
                                    string index = dtKeyIndex.Rows[0]["EN_NAME"].ToString();
                                    indexlist = index.Split(',');
                                    for (int i = 0; i < indexlist.Length; i++)
                                    {
                                        if (!checkDic.ContainsKey(indexlist[i]))
                                        {
                                            checkDic.Add("ID" + indexlist[i], "ID" + indexlist[i]);
                                        }
                                    }

                                    for (int i = 0; i < dtResult.Rows.Count; i++)
                                    {
                                        DateTime starttime = Convert.ToDateTime(dtResult.Rows[i]["START_TIME"].ToString());
                                        string cityname = dtResult.Rows[i]["B2"].ToString();
                                        DataTable dtTemp = _bizLayer.GetCheckValue(starttime, bizType.ToUpper() == "1X" ? 1 : 2, 2, cityname);

                                        for (int j = 0; j < dtResult.Columns.Count; j++)
                                        {
                                            if (checkDic.ContainsKey(dtResult.Columns[j].ColumnName))
                                            {
                                                object value = dtTemp.Compute(string.Format("sum({0})", dtResult.Columns[j].ColumnName), "1=1");
                                                if (value == null || value == DBNull.Value)
                                                {
                                                    continue;
                                                }
                                                else
                                                {
                                                    if (dtResult.Rows[i][j] != DBNull.Value)
                                                    {
                                                        if (Convert.ToDouble(dtResult.Rows[i][j]) > Convert.ToDouble(value) * 5)
                                                        {
                                                            DataTable dtReplace = _bizLayer.GetReplaceValue(starttime, dtResult.Columns[j].ColumnName, bizType.ToUpper() == "1X" ? 1 : 2, 2, cityname);
                                                            if (dtReplace.Rows.Count > 0)
                                                            {
                                                                dtResult.Rows[i][j] = dtReplace.Rows[0][0];
                                                            }
                                                            else
                                                            {
                                                                continue;
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            catch (Exception ex)
                            {
                                AddErr("CITY����38���ؼ�ָ���жϳ���", ex.Message);
                            }
                        //}
                        #endregion                    
                    }
                                                                           
                    #region �����Դ��ָ��    
                    Dictionary<string,string> dicResValid = new Dictionary<string,string>();
                    Dictionary<string,string> dicResID = new Dictionary<string,string>();
                    try
                    {
                        ArrayList lstResFormula = new ArrayList();                        
                        Dictionary<string, string> dicRes = new Dictionary<string, string>();                        

                        if (bizType.ToUpper() == "1X")
                        {
                            //1X                          
                            _bizLayer.GetResColumn(bizType.ToUpper() == "1X" ? 1 : 2, "ZY0808", out dicRes, out lstResFormula,out dicResValid,out dicResID);
                            DataTable dtRes = _bizLayer.GetResCityData(lstResFormula, _proChName, updateTime);
                           
                            if (dtResult.Rows.Count > 0)
                            {
                                for (int i = 0; i < dtResult.Rows.Count; i++)
                                {
                                    DataView dvRes = new DataView(dtRes);
                                    dvRes.RowFilter = string.Format("B2='{0}' and START_TIME='{1}'", dtResult.Rows[i]["B2"].ToString(),
                                                                                                  dtResult.Rows[i]["START_TIME"].ToString());
                                    DataTable dtResTemp = dvRes.ToTable();                                    
                                    for (int j = 0; j < dtResult.Columns.Count; j++)
                                    {
                                        if (dtResTemp.Rows.Count > 0)
                                        {
                                            if (dicRes.ContainsKey(dtResult.Columns[j].ColumnName))
                                            {
                                                dtResult.Rows[i][j] = dtResTemp.Rows[0][dicRes[dtResult.Columns[j].ColumnName]];
                                            }
                                        }                                       
                                    }
                                }
                            }                           
                        }
                        else
                        {
                            //DO                           
                            _bizLayer.GetResColumn(bizType.ToUpper() == "1X" ? 1 : 2, "ZY0808", out dicRes, out lstResFormula,out dicResValid,out dicResID);
                            DataTable dtRes = _bizLayer.GetResCityData(lstResFormula, _proChName, updateTime);
                            
                            if (dtResult.Rows.Count > 0)
                            {
                                for (int i = 0; i < dtResult.Rows.Count; i++)
                                {
                                    DataView dvRes = new DataView(dtRes);
                                    dvRes.RowFilter = string.Format("B2='{0}' and START_TIME='{1}'", dtResult.Rows[i]["B2"].ToString(),
                                                                                                  dtResult.Rows[i]["START_TIME"].ToString());
                                    DataTable dtResTemp = dvRes.ToTable();
                                    

                                    for (int j = 0; j < dtResult.Columns.Count; j++)
                                    {
                                        if (dtResTemp.Rows.Count > 0)
                                        {
                                            if (dicRes.ContainsKey(dtResult.Columns[j].ColumnName))
                                            {
                                                dtResult.Rows[i][j] = dtResTemp.Rows[0][dicRes[dtResult.Columns[j].ColumnName]];
                                            }
                                        }                                        
                                    }
                                }
                            }                            
                        }
                    }
                    catch(Exception ex)
                    {
                        AddErr("CITY���������Դ��ָ�����",ex.Message);
                    }
                    #endregion                     
                                        
                    if (_isFull == "1")
                    {
                        #region �ж�ʡָ���Ƿ�ȱʧ
                        try
                        {
                            string tempresult = checkProvData(dtResult);
                            if (!string.IsNullOrEmpty(tempresult))
                            {
                                string[] tempProv = tempresult.Split(',');
                                for (int i = 0; i < tempProv.Length; i++)
                                {
                                    string[] tempArray = tempProv[i].Split('|');
                                    DataRow dr = dtResult.NewRow();
                                    dr["B1"] = "ʡ";
                                    dr["START_TIME"] = updateTime.ToString("yyyy-MM-dd") + " " + tempArray[0];
                                    dr["B2"] = _proChName;
                                    dr["B3"] = _proChName;
                                    dr["B4"] = _proChName;

                                    dtResult.Rows.Add(dr);
                                }
                                if (dtResult.Rows.Count > 0)
                                {
                                    //dtResult.Select("1=1", "START_TIME,B1");                                
                                    DataView dv = new DataView(dtResult);
                                    dv.Sort = "START_TIME,B1";
                                    dtResult = dv.ToTable();
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            AddErr("CITY�����ж�ʡָ���Ƿ�ȱʧ����", ex.Message);
                        }
                        #endregion
                    }                 

                    if (_isNull == "1")//�޵�ģʽ���޸�����(�㶫ר��)
                    {
                        if (bizType == "1X")
                        {
                            HandleIndexCity1X(dtResult, dicValid, dicID, dicResValid, dicResID);
                        }
                        else
                        {
                            HandleIndexCityDo(dtResult, dicValid, dicID, dicResValid, dicResID);
                        }
                    }

                    #region �����ʵ�����
                    try
                    {
                        if (dtResult != null && dtResult.Rows.Count > 0)
                        {
                            for (int x = 0; x < dtResult.Rows.Count; x++)
                            {
                                if (dtResult.Rows[x]["B1"].ToString().Trim() == "ʡ")
                                {
                                    try
                                    {
                                        // �ȴ���������кͣ��ʵ�Ϊ0
                                        string startTime = dtResult.Rows[x]["START_TIME"].ToString().Trim();
                                        for (int xx = 0; xx < lstChName.Count; xx++)
                                        {
                                            //MD6.17,MD6.18,MD6.19����ʱ϶ռ���ʵ�ָ�����⴦�� �ܺ�/��������
                                            if (bizType.ToUpper() == "DO" && (xx == 101 || xx == 102 || xx == 103))
                                            {
                                                dtResult.Rows[x][string.Format("ID{0}", xx + 1)] =
                                                    GetThisTimeAvgValue(dtResult, startTime, string.Format("ID{0}", xx + 1));
                                            }
                                            else
                                            {
                                                dtResult.Rows[x][string.Format("ID{0}", xx + 1)] =
                                                    GetThisTimeTotalValue(dtResult,
                                                                          startTime,
                                                                          string.
                                                                              Format(
                                                                                  "ID{0}",
                                                                                  xx +
                                                                                  1));
                                            }
                                        }
                                        // �����ʵ�ָ��.
                                        for (int xx = 0; xx < lstChName.Count; xx++)
                                        {
                                            string id = string.Format("ID{0}", xx + 1);
                                            if (logicExpressEnName.ContainsKey(id))
                                            {
                                                string value = logicExpressEnName[id].Replace('(', ' ').Replace(')', ' ');
                                                if (value.IndexOf('/') > 0)
                                                {
                                                    string numerator = value.Split('/')[0].Trim();
                                                    string denominator = value.Split('/')[1].Trim();

                                                    try
                                                    {
                                                        double nNum = 0; // ����֮�ͻ�֮��
                                                        double nDen = 0;

                                                        #region ������

                                                        if (numerator.IndexOf('-') > 0)
                                                        {
                                                            string[] numss = numerator.Split('-');
                                                            if (numss.Length > 1)
                                                            {
                                                                // ����������Ϊ0
                                                                nNum = Convert.ToDouble(dtResult.Rows[x][numss[0].Trim()]);
                                                                if (nNum != 0)
                                                                {
                                                                    for (int xxx = 1; xxx < numss.Length; xxx++)
                                                                    {
                                                                        if (!string.IsNullOrEmpty(numss[xxx].Trim()))
                                                                            nNum -=
                                                                                Convert.ToDouble(
                                                                                    dtResult.Rows[x][numss[xxx].Trim()]);
                                                                    }
                                                                }
                                                            }
                                                        }
                                                        else if (numerator.IndexOf('+') > 0)
                                                        {
                                                            string[] numsa = numerator.Split('+');
                                                            for (int xxx = 0; xxx < numsa.Length; xxx++)
                                                            {
                                                                if (!string.IsNullOrEmpty(numsa[xxx].Trim()))
                                                                    nNum +=
                                                                        Convert.ToDouble(
                                                                            dtResult.Rows[x][numsa[xxx].Trim()]);
                                                            }
                                                        }
                                                        else
                                                        {
                                                            if (numerator.IndexOf('*') > 0)
                                                            {
                                                                try
                                                                {
                                                                    string[] tmp = numerator.Split('*');
                                                                    nNum = Convert.ToDouble(dtResult.Rows[x][tmp[0]].ToString()) *
                                                                           Convert.ToDouble(tmp[1].Trim());
                                                                }
                                                                catch { }
                                                            }
                                                            else
                                                                nNum = Convert.ToDouble(dtResult.Rows[x][numerator].ToString());
                                                        }

                                                        #endregion

                                                        #region ����

                                                        if (denominator.IndexOf('-') > 0)
                                                        {
                                                            string[] numss = denominator.Split('-');
                                                            if (numss.Length > 1)
                                                            {
                                                                nDen = Convert.ToDouble(dtResult.Rows[x][numss[0].Trim()]);
                                                                if (nDen != 0)
                                                                {
                                                                    for (int xxx = 1; xxx < numss.Length; xxx++)
                                                                    {
                                                                        if (!string.IsNullOrEmpty(numss[xxx].Trim()))
                                                                            nDen -=
                                                                                Convert.ToDouble(
                                                                                    dtResult.Rows[x][numss[xxx].Trim()]);
                                                                    }
                                                                }
                                                            }
                                                        }
                                                        else if (denominator.IndexOf('+') > 0)
                                                        {
                                                            string[] numsa = denominator.Split('+');
                                                            for (int xxx = 0; xxx < numsa.Length; xxx++)
                                                            {
                                                                if (!string.IsNullOrEmpty(numsa[xxx].Trim()))
                                                                    nDen +=
                                                                        Convert.ToDouble(
                                                                            dtResult.Rows[x][numsa[xxx].Trim()]);
                                                            }
                                                        }
                                                        else
                                                        {
                                                            if (denominator.IndexOf('*') > 0)
                                                            {
                                                                try
                                                                {
                                                                    string[] tmp = denominator.Split('*');
                                                                    nDen = Convert.ToDouble(dtResult.Rows[x][tmp[0]].ToString()) *
                                                                           Convert.ToDouble(tmp[1].Trim());
                                                                }
                                                                catch { }
                                                            }
                                                            else
                                                                nDen = Convert.ToDouble(dtResult.Rows[x][denominator].ToString());
                                                        }

                                                        #endregion

                                                        if (nDen != 0)
                                                        {                                                            
                                                            double result = Convert.ToDouble(Math.Round((nNum / nDen) * 100, 4));

                                                            //����38���ؼ�ָ�����ʵ������ж�
                                                            //if(id=="ID3"||id=="ID6"||id=="ID9"||id=="ID23"||id=="ID25"||id=="ID28"||id=="ID31"||id=="ID44"||id=="ID51"||id=="ID106")
                                                            //{
                                                            //    if (result >= 100)
                                                            //    {
                                                            //        result = 99.99;
                                                            //    }
                                                            //    if (result <= 0)
                                                            //    {
                                                            //        result = 0.01;
                                                            //    }                                                                                                                                                                                                                                                              
                                                            //}                                                           
                                                            dtResult.Rows[x][id]=result;                                                            
                                                        }
                                                        else
                                                        {
                                                            dtResult.Rows[x][id] = 0;//�����ĸΪ0,��ָ��ֱ��Ϊ0
                                                        }
                                                    }
                                                    catch
                                                    {
                                                    }
                                                }
                                                else
                                                {
                                                    dtResult.Rows[x][id] = (double)0;
                                                }
                                            }
                                        }
                                    }
                                    catch(Exception ex)
                                    {
                                        AddErr("�����ʵ�ָ�����", ex.Message);
                                    }
                                }
                            }
                        }
                    }
                    catch(Exception ex) 
                    {
                        AddErr("�����ʵ��������", ex.Message);
                    }
                    #endregion       
                    
            
                    //��ȫ�ֱ�����ֵ����ȷ�Լ��ʱʹ��
                    if (bizType.ToUpper() == "1X")
                    {
                        dtCity1X = new DataTable();
                        dtCity1X = dtResult.Copy();
                    }
                    else
                    {
                        dtCityDo = new DataTable();
                        dtCityDo = dtResult.Copy();
                    }
                                                        
                //}
                //else
                //{
                //    _isDown = false;
                //}
                if (dtResult != null && dtResult.Rows.Count > 0)
                {
                    _bizLayer.ExportCsv(dtResult, filename, filePath, lstChName, lstExtraName, lstLogicExpress);
                    _bizLayer.InsertPerf(dtResult, bizType.ToUpper() == "1X" ? 1 : 2, 2);
                }
                else
                {
                    AddErr("CITY��������Ϊnull��������", "");
                }
            }
            catch (Exception ex)
            {
                throw new Exception(string.Format("��������{0}�ļ����������ǹ�ʽ���ô������{1} ", filename, ex.Message));
            }
        }

        /// <summary>
        /// ��MD6.17,MD6.18,MD6.19ָ���ƽ��ֵ
        /// </summary>
        /// <param name="dt"></param>
        /// <param name="startTime"></param>
        /// <param name="columnName"></param>
        /// <returns></returns>
        static double GetThisTimeAvgValue(DataTable dt, string startTime, string columnName)
        {
            try
            {
                double value = 0;
                int index = 0;
                if (dt != null && dt.Rows.Count > 0)
                {
                    foreach (DataRow row in
                        dt.Rows.Cast<DataRow>().Where(
                            row =>
                            row["START_TIME"].ToString().Trim() == startTime.Trim()
                            && row["B1"].ToString().Trim() != "ʡ"))
                    {
                        try
                        {
                            if (row[columnName] == DBNull.Value)
                            {
                                row[columnName] = 0;
                            }

                            value += Convert.ToDouble(row[columnName].ToString().Trim());
                            index++;
                        }
                        catch
                        {                           
                            return 0;
                        }
                    }

                    if (value > 0)
                    {
                        value = Convert.ToDouble(Math.Round(value / index, 4));
                    }
                }

                return value;
            }
            catch
            {                
                return 0;
            }
        }

        /// <summary>
        /// �����ָ��֮��
        /// </summary>
        /// <param name="dt"></param>
        /// <param name="startTime"></param>
        /// <param name="columnName"></param>
        /// <returns></returns>
        static double GetThisTimeTotalValue(DataTable dt, string startTime, string columnName)
        {
            try
            {
                double value = 0;
                if (dt != null && dt.Rows.Count > 0)
                {
                    foreach (DataRow row in
                        dt.Rows.Cast<DataRow>().Where(
                            row =>
                            row["START_TIME"].ToString().Trim() == startTime.Trim()
                            && row["B1"].ToString().Trim() != "ʡ"
                            && row[columnName] != DBNull.Value))
                    {
                        try
                        {
                            value += Convert.ToDouble(row[columnName].ToString().Trim());
                        }
                        catch
                        {
                            // �ʵ� ֱ�ӷ���0
                            return 0;
                        }
                    }
                }

                return value;
            }
            catch {
                return 0;
            }
        }

        private void VipCdlCollect(DateTime updateTime,string hotTime,string bizType)
        {
            try
            {
                bool isHanjiang = false;
                foreach (DataRow row in _dtCity.Rows)
                {
                    if (_proChName == "����" && row["city_id"].ToString() == "728")
                    {
                        isHanjiang = true;
                        continue;
                    }

                    VipCdlCollectPerCity(updateTime, hotTime, bizType, row["CITY_ID"].ToString(), row["ENNAME"].ToString(),
                                      row["CITY_NAME"].ToString());
                }

                if (isHanjiang)
                {
                    VipCdlCollectPerCity(updateTime, hotTime, bizType, "7281", "TM",
                                      "����");

                    VipCdlCollectPerCity(updateTime, hotTime, bizType, "7282", "QJ",
                                      "Ǳ��");

                    VipCdlCollectPerCity(updateTime, hotTime, bizType, "7283", "XT",
                                      "����");
                }
            }
            catch (Exception ex)
            {
                AddErr("VIPCDL ѭ�����г���", ex.Message);
            }
        }

        /// <summary>
        /// �����ϴ�
        /// </summary>
        /// <param name="updateTime"></param>
        /// <param name="hotTime"></param>
        /// <param name="bizType"></param>
        private void CdlCollect(DateTime updateTime, string hotTime, string bizType)
        {
            try
            {
                bool isHanjiang = false;
                foreach (DataRow row in _dtCity.Rows)
                {
                    if (_proChName == "����" && row["city_id"].ToString() == "728")
                    {
                        isHanjiang = true;
                        continue;
                    }

                    CdlCollectPerCity(updateTime, hotTime, bizType, row["CITY_ID"].ToString(), row["ENNAME"].ToString(),
                                      row["CITY_NAME"].ToString());
                }

                if (isHanjiang)
                {
                    CdlCollectPerCity(updateTime, hotTime, bizType, "7281", "TM",
                                      "����");

                    CdlCollectPerCity(updateTime, hotTime, bizType, "7282", "QJ",
                                      "Ǳ��");

                    CdlCollectPerCity(updateTime, hotTime, bizType, "7283", "XT",
                                      "����");
                }

                #region �жϻ���10ʱ��20ʱ�����ļ�ȱʧ�ĵ���
                if (hotTime == "MORNING")
                {
                    if (bizType.ToUpper() == "1X")
                    {
                        if (fail1xCityM.Count > 0)
                        {
                            city1xListM = city1xListM.Substring(0, city1xListM.Length - 1);
                            if (isHanjiang)
                            {
                                city1xCountM = _dtCity.Rows.Count + 2 - fail1xCityM.Count;
                            }
                            else
                            {
                                city1xCountM = _dtCity.Rows.Count - fail1xCityM.Count;
                            }
                        }
                        else
                        {
                            if (isHanjiang)
                            {
                                city1xCountM = _dtCity.Rows.Count + 2;
                            }
                            else
                            {
                                city1xCountM = _dtCity.Rows.Count;
                            }
                        }
                    }
                    else
                    {
                        if (failDoCityM.Count > 0)
                        {
                            cityDoListM = cityDoListM.Substring(0, cityDoListM.Length - 1);
                            if (isHanjiang)
                            {
                                cityDoCountM = _dtCity.Rows.Count + 2 - failDoCityM.Count;
                            }
                            else
                            {
                                cityDoCountM = _dtCity.Rows.Count - failDoCityM.Count;
                            }
                        }
                        else
                        {
                            if (isHanjiang)
                            {
                                cityDoCountM = _dtCity.Rows.Count + 2;
                            }
                            else
                            {
                                cityDoCountM = _dtCity.Rows.Count;
                            }
                        }
                    }
                }
                else
                {
                    if (bizType.ToUpper() == "1X")
                    {
                        if (fail1xCityE.Count > 0)
                        {
                            city1xListE = city1xListE.Substring(0, city1xListE.Length - 1);
                            if (isHanjiang)
                            {
                                city1xCountE = _dtCity.Rows.Count + 2 - fail1xCityE.Count;
                            }
                            else
                            {
                                city1xCountE = _dtCity.Rows.Count - fail1xCityE.Count;
                            }
                        }
                        else
                        {
                            if (isHanjiang)
                            {
                                city1xCountE = _dtCity.Rows.Count + 2;
                            }
                            else
                            {
                                city1xCountE = _dtCity.Rows.Count;
                            }
                        }
                    }
                    else
                    {
                        if (failDoCityE.Count > 0)
                        {
                            cityDoListE = cityDoListE.Substring(0, cityDoListE.Length - 1);
                            if (isHanjiang)
                            {
                                cityDoCountE = _dtCity.Rows.Count + 2 - failDoCityE.Count;
                            }
                            else
                            {
                                cityDoCountE = _dtCity.Rows.Count - failDoCityE.Count;
                            }
                               
                        }
                        else
                        {
                            if (isHanjiang)
                            {
                                cityDoCountE = _dtCity.Rows.Count + 2;
                            }
                            else
                            {
                                cityDoCountE = _dtCity.Rows.Count;
                            }
                        }
                    }

                }
                #endregion
            }
            catch (Exception ex)
            {
                AddErr("CDL ѭ�����г���", ex.Message);
            }
        }

        void VipCdlCollectPerCity(DateTime updateTime,string hotTime,string bizType,string cityId,string enName,string cityName)
        {
            try
            {
                string ftpPerfFilePath = string.Format("{0}/", ConstCdl);
                string filePath = string.Empty; // �ļ�·��
                string filename = string.Empty; // �ļ�����

                try
                {
                    if (bizType == "1X")
                        VipCdl1XOutReport(updateTime, hotTime, out filePath, out filename,
                                       cityId, enName, cityName);
                    else
                        VipCdlDoOutReport(updateTime, hotTime, out filePath, out filename,
                                       cityId, enName, cityName);
                }
                catch (Exception ex)
                {
                    AddErr(string.Format("����gz����{0}", filename), ex.Message);
                    return;
                }

                string tempFileName = string.Format("{0}\\{1}", filePath, filename);
                FileInfo fileinfo = new FileInfo(tempFileName);
                bool ret = false;
                try
                {
                    ret = _ftpClient.fileUpload(fileinfo, ftpPerfFilePath, filename);
                    AddMsg(string.Format("�ϱ��ɹ�{0}", filename));
                }
                catch (Exception ex)
                {
                    AddErr(string.Format("{0}�ϴ�ʧ�ܣ��������ϴ�", filename), ex.Message);
                    ret = false;
                }

                if (!ret)
                {
                    AddUploadFailedFileToShareDic(tempFileName, ftpPerfFilePath, filename);
                }
                else
                {
                    string desFileName = tempFileName.Replace(string.Format("{0}\\", ConstCdl), string.Format("{0}\\{1}\\", ConstBackUp, ConstCdl));
                    File.Copy(tempFileName, desFileName, true);
                    File.Delete(tempFileName);
                }
            }
            catch (Exception ex)
            {
                AddErr(string.Format("����{0} ���ݳ���", "VIP"+bizType), ex.Message);
            }
        }

        void CdlCollectPerCity(DateTime updateTime, string hotTime, string bizType,string cityId,string enName,string cityName)
        {
            try
            {
                string ftpPerfFilePath = string.Format("{0}/", ConstCdl);
                string filePath = string.Empty; // �ļ�·��
                string filename = string.Empty; // �ļ�����

                try
                {
                    if (bizType == "1X")
                        Cdl1XOutReport(updateTime, hotTime, out filePath, out filename,
                                       cityId, enName, cityName);
                    else
                        CdlDoOutReport(updateTime, hotTime, out filePath, out filename,
                                       cityId, enName, cityName);
                }
                catch (Exception ex)
                {
                    AddErr(string.Format("����gz����{0}", filename), ex.Message);
                    return;
                }

                string tempFileName = string.Format("{0}\\{1}", filePath, filename);
                FileInfo fileinfo = new FileInfo(tempFileName);
                bool ret = false;
                try
                {
                    ret = _ftpClient.fileUpload(fileinfo, ftpPerfFilePath, filename);
                    AddMsg(string.Format("�ϱ��ɹ�{0}", filename));
                }
                catch (Exception ex)
                {
                    AddErr(string.Format("{0}�ϴ�ʧ�ܣ��������ϴ�", filename), ex.Message);
                    ret = false;
                }

                if (!ret)
                {
                    AddUploadFailedFileToShareDic(tempFileName, ftpPerfFilePath, filename);
                }
                else
                {
                    string desFileName = tempFileName.Replace(string.Format("{0}\\", ConstCdl), string.Format("{0}\\{1}\\", ConstBackUp, ConstCdl));
                    File.Copy(tempFileName, desFileName, true);
                    File.Delete(tempFileName);
                }
            }
            catch (Exception ex)
            {
                AddErr(string.Format("����{0} ���ݳ���", bizType), ex.Message);
            }
        }

        private void VipCdl1XOutReport(DateTime updateTime,string hotTime,out string filePath,out string filename,string cityId,string cityEnName,string cityChName)
        {
            filename = "";
            try
            {
                if (updateTime <= Convert.ToDateTime(string.Format("{0} 05:00:00", DateTime.Now.ToString("yyyy-MM-dd")))
                    &&
                    updateTime >= Convert.ToDateTime(string.Format("{0} 00:00:00", DateTime.Now.ToString("yyyy-MM-dd"))))
                {
                    // �ڵ����賿5��ǰ�ϱ������������ϱ���������
                    updateTime = updateTime.AddDays(-1);
                    //�������ļ�����������(GD_VIPCDL_GZ_1X_2010060410.csv.gz)
                    filename = string.Format("{0}_VIPCDL_{1}_1X_{2}{3}.csv.gz", _proEnName, cityEnName,
                                             updateTime.ToString("yyyyMMdd"), hotTime == "MORNING" ? "10" : "20");
                }
                else
                {
                    // �������ǲ����ϱ�����ʱ������
                    //�������ļ�����������(GD_VIPCDL_GZ_1X_2010060410_N.csv.gz)
                    filename = string.Format("{0}_VIPCDL_{1}_1X_{2}{3}_{4}.csv.gz", _proEnName, cityEnName,
                                             updateTime.ToString("yyyyMMdd"), hotTime == "MORNING" ? "10" : "20", 1);
                }

                filePath = string.Format("{0}\\{1}\\CDL", _localRootPath, _proEnName);

                int XLength = 0;
                int YLength = 0;
                double Initlongitude = 0f;
                double Initlatiude = 0f;
                List<clsPoi> Bigarr = _bizLayer.Bigarray(cityId, out Initlongitude, out Initlatiude, out XLength,
                                                         out YLength,_cityInfo[cityId]);
                Hashtable ht = _bizLayer.viphtdt(cityId,
                                              string.Format("{0} {1}", updateTime.ToString("yyyy-MM-dd"),
                                                            hotTime == "MORNING" ? "10" : "20"), Initlongitude);

                DataTable dtResult = _bizLayer.htgetsmallExistBig(ht, Bigarr); // ��ѯ���
                ArrayList lstLogicExpress = new ArrayList();
                ArrayList lstChName = new ArrayList();
                lstLogicExpress.Add("(" + Initlongitude + "|" + Initlatiude + ")");
                lstLogicExpress.Add("(0|0)");
                lstLogicExpress.Add("(" + XLength + "|" + YLength + ")");
                lstLogicExpress.Add(string.Format("({0} {1}:00:00)", updateTime.ToString("yyyy-MM-dd"),
                                                  hotTime == "MORNING" ? "10" : "20"));

                lstChName.Add("��");
                lstChName.Add("��");
                lstChName.Add("�������д���");
                lstChName.Add("���ݺ��д���");
                lstChName.Add("���ź��д���");
                lstChName.Add("�������е�������");
                lstChName.Add("���ݺ��е�������");
                lstChName.Add("���ź��е�������");                
                lstChName.Add("����EC/IOƽ����");

                DataView dv1XVip = dtResult.DefaultView;
                dv1XVip.RowFilter = " voice_call_num<>0 or voice_drop_num<>0 or data_call_num<>0 or data_drop_num<>0 or sms_call_num<>0 or sms_drop_num<>0 or accesspnstravg<>0";
                DataTable dt1XVip = dv1XVip.ToTable();

                
                if (dt1XVip.Rows.Count == 0||dt1XVip.Columns.Count==0||dt1XVip==null)
                {                        
                    throw new Exception("û�в鵽����");
                }                

                // �����ļ�
                _bizLayer.ExportCsv(dt1XVip, filename.Substring(0, filename.Length - 3), filePath, lstChName,
                                        new ArrayList(), lstLogicExpress);

                // ѹ��
                clsZipFile.GZipFile(string.Format("{0}\\{1}", filePath, filename.Substring(0, filename.Length - 3)),
                                    string.Format("{0}\\{1}", filePath, filename));

                File.Delete(string.Format("{0}\\{1}", filePath, filename.Substring(0, filename.Length - 3)));

            }
            catch (Exception ex)
            {
                throw new Exception(string.Format("���ɻ���{0}�ļ�����{1} ", filename, ex.Message));
            }
        }

        /// <summary>
        /// 1X����
        /// </summary>
        /// <param name="updateTime"></param>
        /// <param name="hotTime"></param>
        /// <param name="filePath"></param>
        /// <param name="filename"></param>
        /// <param name="cityId"></param>
        /// <param name="cityEnName"></param>
        private void Cdl1XOutReport(DateTime updateTime, string hotTime, out string filePath, out string filename, string cityId, string cityEnName,string cityChName)
        {
            filename = "";
            try
            {
                if (updateTime <= Convert.ToDateTime(string.Format("{0} 05:00:00", DateTime.Now.ToString("yyyy-MM-dd")))
                    &&
                    updateTime >= Convert.ToDateTime(string.Format("{0} 00:00:00", DateTime.Now.ToString("yyyy-MM-dd"))))
                {
                    // �ڵ����賿5��ǰ�ϱ������������ϱ���������
                    updateTime = updateTime.AddDays(-1);
                    //�������ļ�����������(GD_CDL_GZ_1X_2010060410.csv.gz)
                    filename = string.Format("{0}_CDL_{1}_1X_{2}{3}.csv.gz", _proEnName, cityEnName,
                                             updateTime.ToString("yyyyMMdd"), hotTime == "MORNING" ? "10" : "20");
                }
                else
                {
                    // �������ǲ����ϱ�����ʱ������
                    //�������ļ�����������(GD_CDL_GZ_1X_2010060410_N.csv.gz)
                    filename = string.Format("{0}_CDL_{1}_1X_{2}{3}_{4}.csv.gz", _proEnName, cityEnName,
                                             updateTime.ToString("yyyyMMdd"), hotTime == "MORNING" ? "10" : "20", 1);
                }

                filePath = string.Format("{0}\\{1}\\CDL", _localRootPath, _proEnName);

                int XLength = 0;
                int YLength = 0;
                double Initlongitude = 0f;
                double Initlatiude = 0f;
                List<clsPoi> Bigarr = _bizLayer.Bigarray(cityId, out Initlongitude, out Initlatiude, out XLength,
                                                         out YLength,_cityInfo[cityId]);
                Hashtable ht = _bizLayer.htdt(cityId,
                                              string.Format("{0} {1}", updateTime.ToString("yyyy-MM-dd"),
                                                            hotTime == "MORNING" ? "10" : "20"), Initlongitude);

                DataTable dtResult = _bizLayer.htgetsmallExistBig(ht, Bigarr); // ��ѯ���
                ArrayList lstLogicExpress = new ArrayList();
                ArrayList lstChName = new ArrayList();
                lstLogicExpress.Add("(" + Initlongitude + "|" + Initlatiude + ")");
                lstLogicExpress.Add("(0|0)");
                lstLogicExpress.Add("(" + XLength + "|" + YLength + ")");
                lstLogicExpress.Add(string.Format("({0} {1}:00:00)", updateTime.ToString("yyyy-MM-dd"),
                                                  hotTime == "MORNING" ? "10" : "20"));

                lstChName.Add("��");
                lstChName.Add("��");
                lstChName.Add("�������д���");
                lstChName.Add("���ݺ��д���");
                lstChName.Add("���ź��д���");
                lstChName.Add("�������е�������");
                lstChName.Add("���ݺ��е�������");                
                lstChName.Add("���ź��е�������");
                lstChName.Add("����EC/IOƽ����");

                DataView dv1X = dtResult.DefaultView;
                dv1X.RowFilter = " voice_call_num<>0 or voice_drop_num<>0 or data_call_num<>0 or data_drop_num<>0 or sms_call_num<>0 or sms_drop_num<>0 or accesspnstravg<>0";
                DataTable dt1X = dv1X.ToTable();

                //��¼��ʵ��ȱʧ���
                if (dt1X.Columns.Count == 0 || dt1X.Rows.Count == 0)
                {
                    if (hotTime == "MORNING")
                    {
                        fail1xCityM.Add(cityId);
                        city1xListM += cityChName + ",";
                    }
                    else
                    {
                        fail1xCityE.Add(cityId);
                        city1xListE += cityChName + ",";
                    }
                }

                #region �޸����ݣ��㶫ר��
                if (_isCdl == "1")//�㶫ר�ã������޸�
                {                   
                    DataTable dt1XCheck = dt1X.Clone();//�����׼���ݵı�
                    Dictionary<string, string> dicData = new Dictionary<string, string>();//��ʵ�����ֵ䣬�к���������key
                    Dictionary<string, string> dicCheck = new Dictionary<string, string>();//��׼�����ֵ䣬�к���������key
                    DirectoryInfo diCdl = new DirectoryInfo(string.Format("{0}\\{1}\\{2}\\{3}", _localRootPath, _proEnName, ConstBackUp, ConstCdl));
                    string backfilepath = string.Format("{0}\\{1}\\{2}\\{3}", _localRootPath, _proEnName, ConstBackUp, ConstCdl);//���ݻ����ļ����Ŀ¼
                    DirectoryInfo diCdlCheck = new DirectoryInfo(string.Format("{0}\\{1}\\{2}\\{3}\\{4}", _localRootPath, _proEnName, ConstBackUp, ConstCdl, "CHECK"));
                    string standardfilepat = string.Format("{0}\\{1}\\{2}\\{3}\\{4}", _localRootPath, _proEnName, ConstBackUp, ConstCdl, "CHECK");//�ȶԵĻ�׼�ļ����ڵ�Ŀ¼


                    #region �Ƚ��ȶԵĻ�׼�ļ�csv�����ڴ���
                    FileSystemInfo[] fsiCheck = diCdlCheck.GetFileSystemInfos();
                    if (fsiCheck.Length > 0)
                    {
                        string checkname = string.Format("{0}_1X_{1}.csv", cityEnName, hotTime == "MORNING" ? "10" : "20");
                        foreach (FileSystemInfo fs in fsiCheck)
                        {
                            try
                            {
                                if (fs.Name == checkname)
                                {
                                    using (System.IO.StreamReader reader = new StreamReader(fs.FullName, System.Text.Encoding.GetEncoding("GB2312")))
                                    {
                                        int k = 0;
                                        while (reader.Peek() > 0)
                                        {
                                            try
                                            {
                                                if (k == 0)//��һ����Ч����
                                                {
                                                    string head = reader.ReadLine();
                                                }
                                                else if (k == 1)//�ڶ�����Ч����
                                                {
                                                    string chname = reader.ReadLine();
                                                }
                                                else//�����п�ʼ����Ч����
                                                {
                                                    string str = reader.ReadLine();
                                                    string[] data = str.Split(',');
                                                    DataRow dr = dt1XCheck.NewRow();
                                                    for (int j = 0; j < data.Length; j++)
                                                    {
                                                        dr[j] = data[j];
                                                    }
                                                    dt1XCheck.Rows.Add(dr);

                                                    //if (!dicCheck.ContainsKey(dr[0].ToString() + "|" + dr[1].ToString()))
                                                    //{
                                                    //���к�����Ϊ�ֵ��key��������
                                                    dicCheck.Add(dr[0].ToString() + "|" + dr[1].ToString(), dr[0].ToString() + "|" + dr[1].ToString());
                                                    //}
                                                }
                                                k++;
                                            }
                                            catch { continue; }
                                        }
                                    }
                                    break;
                                }
                            }
                            catch { continue; }
                        }
                    }
                    #endregion

                    #region ѭ����ʵ�����ݱ����к�����Ϊ�ֵ��key��������
                    foreach (DataRow dr in dt1X.Rows)
                    {
                        try
                        {
                            //if (!dicData.ContainsKey(dr[0].ToString() + "|" + dr[1].ToString()))
                            //{
                            dicData.Add(dr[0].ToString() + "|" + dr[1].ToString(), dr[0].ToString() + "|" + dr[1].ToString());
                            //}
                        }
                        catch { continue; }
                    }
                    #endregion

                    Dictionary<string, string> dicResult = GetCdlCheckResult(dicData, dicCheck);//��ȡ�ȶԼ�¼
                    if (dicResult.Count > 0)//dicResult.Count>0֤��դ��������ȱʧ
                    {
                        #region ���ȱʧ������
                        foreach (string key in dicResult.Keys)
                        {
                            bool isReplace = false;
                            string col = key.Split('|')[0];//ȱʧ���ݵ���
                            string row = key.Split('|')[1];//ȷʵ���ݵ���

                            #region �������ļ�
                            FileSystemInfo[] fsicdl = diCdl.GetFileSystemInfos();
                            if (fsicdl.Length > 0)
                            {
                                for (int i = 14; i > 0; i--)
                                {
                                    string tempfilename = string.Format("{0}_CDL_{1}_1X_{2}{3}.csv.gz", _proEnName, cityEnName,
                                        DateTime.Now.AddDays(-i).ToString("yyyyMMdd"), hotTime == "MORNING" ? "10" : "20");
                                    foreach (FileSystemInfo fs in fsicdl)
                                    {
                                        try
                                        {
                                            if (fs.Name == tempfilename)
                                            {

                                                //�Ƚ�ѹ�ļ�
                                                UnZipClass.UnGzipFile(string.Format("{0}\\{1}", backfilepath, tempfilename),
                                                                      string.Format("{0}\\{1}", backfilepath, tempfilename.Substring(0, tempfilename.Length - 3)));
                                                //����csvд��datatable                                                 
                                                using (System.IO.StreamReader readercdl = new StreamReader(fs.FullName.Substring(0, fs.FullName.Length - 3), System.Text.Encoding.GetEncoding("GB2312")))
                                                {
                                                    int k = 0;
                                                    while (readercdl.Peek() > 0)
                                                    {

                                                        try
                                                        {
                                                            if (k == 0)//��һ����Ч����
                                                            {
                                                                string head = readercdl.ReadLine();
                                                            }
                                                            else if (k == 1)//�ڶ�����Ч����
                                                            {
                                                                string chname = readercdl.ReadLine();
                                                            }
                                                            else//�����п�ʼ����Ч����
                                                            {
                                                                string str = readercdl.ReadLine();
                                                                string[] data = str.Split(',');
                                                                if (col == data[0].ToString() && row == data[1].ToString())//�ҵ���ȱʧ���к���
                                                                {
                                                                    DataRow dr = dt1X.NewRow();
                                                                    for (int j = 0; j < data.Length; j++)
                                                                    {
                                                                        dr[j] = data[j];
                                                                    }
                                                                    dt1X.Rows.Add(dr);
                                                                    isReplace = true;
                                                                    break;
                                                                }
                                                            }
                                                            k++;
                                                        }
                                                        catch { continue; }
                                                    }                                                    
                                                }
                                                //��ȡ֮��ɾ��
                                                File.Delete(string.Format("{0}\\{1}", backfilepath, tempfilename.Substring(0, tempfilename.Length - 3)));
                                                if (isReplace)//�ҵ����滻���ݣ��˳�ѭ��
                                                {
                                                    break;
                                                }
                                            }
                                        }
                                        catch { continue; }
                                    }
                                    if (isReplace)//�ҵ����滻���ݣ��˳�ѭ��
                                    {
                                        break;
                                    }
                                }
                            }
                            #endregion

                            if (!isReplace)//����ʷ������û���ҵ����û�׼�ļ��е��滻
                            {
                                foreach (DataRow dr in dt1XCheck.Rows)
                                {
                                    try
                                    {
                                        if (col == dr[0].ToString() && row == dr[1].ToString())
                                        {
                                            DataRow datarow = dt1X.NewRow();
                                            for (int j = 0; j < dt1XCheck.Columns.Count; j++)
                                            {
                                                datarow[j] = dr[j];
                                            }
                                            dt1X.Rows.Add(datarow);
                                            break;
                                        }
                                    }
                                    catch { continue; }
                                }
                            }
                        }
                        #endregion

                        //����
                        if (dt1X.Rows.Count > 0)
                        {
                            //DataView dv = new DataView(dt1X);
                            //dv.Sort = "col desc";
                            //dt1X = dv.ToTable();                            

                            DataView dv = dt1X.DefaultView;
                            dv.Sort = "col asc";
                            dt1X = dv.ToTable();
                        }
                    }                                       
                }
                #endregion

                if (dt1X.Rows.Count == 0 || dt1X.Columns.Count == 0 || dt1X == null)
                {
                    _bizLayer.InsertCount(_proChName, updateTime, cityId, cityChName, 3, 1, 0, hotTime == "MORNING" ? "10" : "20");//û�в鵽����ʱ����¼��Ϊ0
                    throw new Exception("û�в鵽����");
                }
                //#region ���㶫֮�⣬����ʡ������ǰ�ϰ汾������դ�����ݵ��쳣
                //else//���㶫֮�⣬����ʡ�����ϵİ汾
                //{
                //    if (dt1X.Columns.Count == 0 || dt1X.Rows.Count == 0)
                //    {
                //        //throw new Exception("û�в鵽����");
                //        if (hotTime == "MORNING")
                //        {
                //            fail1xCityM.Add(cityId);
                //            city1xListM += cityChName + ",";
                //        }
                //        else
                //        {
                //            fail1xCityE.Add(cityId);
                //            city1xListE += cityChName + ",";
                //        }

                //        DirectoryInfo diCdl = new DirectoryInfo(string.Format("{0}\\{1}\\{2}\\{3}", _localRootPath, _proEnName, ConstBackUp, ConstCdl));
                //        string backfilepath = string.Format("{0}\\{1}\\{2}\\{3}", _localRootPath, _proEnName, ConstBackUp, ConstCdl);
                //        FileSystemInfo[] fsi = diCdl.GetFileSystemInfos();
                //        if (fsi.Length > 0)
                //        {
                //            for (int i = 14; i > 0; i--)
                //            {
                //                string tempfilename = string.Format("{0}_CDL_{1}_1X_{2}{3}.csv.gz", _proEnName, cityEnName,
                //                                 DateTime.Now.AddDays(-i).ToString("yyyyMMdd"), hotTime == "MORNING" ? "10" : "20");
                //                foreach (FileSystemInfo fs in fsi)
                //                {
                //                    if (fs.Name == tempfilename)
                //                    {
                //                        //�Ƚ�ѹ�ļ�
                //                        UnZipClass.UnGzipFile(string.Format("{0}\\{1}", backfilepath, tempfilename),
                //                                              string.Format("{0}\\{1}", backfilepath, tempfilename.Substring(0, tempfilename.Length - 3)));
                //                        //����csvд��datatable                                    
                //                        System.IO.StreamReader reader = new StreamReader(fs.FullName.Substring(0, fs.FullName.Length - 3), System.Text.Encoding.GetEncoding("GB2312"));
                //                        int k = 0;
                //                        while (reader.Peek() > 0)
                //                        {
                //                            if (k == 0)
                //                            {
                //                                string head = reader.ReadLine();
                //                            }
                //                            else if (k == 1)
                //                            {
                //                                string chname = reader.ReadLine();
                //                            }
                //                            else
                //                            {
                //                                string str = reader.ReadLine();
                //                                string[] data = str.Split(',');
                //                                DataRow dr = dt1X.NewRow();
                //                                for (int j = 0; j < data.Length; j++)
                //                                {
                //                                    dr[j] = data[j];
                //                                }
                //                                dt1X.Rows.Add(dr);
                //                            }
                //                            k++;
                //                        }
                //                        reader.Close();

                //                        _isFind = true;


                //                        //��ȡ֮��ɾ��
                //                        File.Delete(string.Format("{0}\\{1}", backfilepath, tempfilename.Substring(0, tempfilename.Length - 3)));
                //                        break;
                //                    }
                //                }
                //                if (_isFind)
                //                {
                //                    break;
                //                }
                //            }
                //        }
                //        _isFind = false;
                //        if (dt1X.Rows.Count == 0 || dt1X.Columns.Count == 0 || dt1X == null)
                //        {
                //            _bizLayer.InsertCount(_proChName, updateTime, cityId, cityChName, 3, 1, 0, hotTime == "MORNING" ? "10" : "20");//û�в鵽����ʱ����¼��Ϊ0
                //            throw new Exception("û�в鵽����");
                //        }
                //    }
                //}
                //#endregion

                // �����ļ�
                _bizLayer.ExportCsv(dt1X, filename.Substring(0, filename.Length - 3), filePath, lstChName,
                                        new ArrayList(), lstLogicExpress);

                _bizLayer.InsertCount(_proChName, updateTime, cityId, cityChName, 3, 1, dt1X.Rows.Count, hotTime == "MORNING" ? "10" : "20");//�м�¼ʱ����¼Ϊ��ʵ�ϱ��ļ�¼����

                // ѹ��
                clsZipFile.GZipFile(string.Format("{0}\\{1}", filePath, filename.Substring(0, filename.Length - 3)),
                                    string.Format("{0}\\{1}", filePath, filename));

                File.Delete(string.Format("{0}\\{1}", filePath, filename.Substring(0, filename.Length - 3)));

            }
            catch (Exception ex)
            {
                throw new Exception(string.Format("���ɻ���{0}�ļ�����{1} ", filename, ex.Message));
            }
        }

        private void VipCdlDoOutReport(DateTime updateTime, string hotTime, out string filePath, out string filename, string cityId, string cityEnName,string cityChName)
        {
            filename = "";
            try
            {
                if (updateTime <= Convert.ToDateTime(string.Format("{0} 05:00:00", DateTime.Now.ToString("yyyy-MM-dd")))
                    &&
                    updateTime >= Convert.ToDateTime(string.Format("{0} 00:00:00", DateTime.Now.ToString("yyyy-MM-dd"))))
                {
                    // �ڵ����賿5��ǰ�ϱ������������ϱ���������
                    updateTime = updateTime.AddDays(-1);
                    //�������ļ�����������(GD_CDL_GZ_DO_2010060410.csv.gz)
                    filename = string.Format("{0}_VIPCDL_{1}_DO_{2}{3}.csv.gz", _proEnName, cityEnName,
                                             updateTime.ToString("yyyyMMdd"), hotTime == "MORNING" ? "10" : "20");
                }
                else
                {
                    // �������ǲ����ϱ�����ʱ������
                    //�������ļ�����������(GD_CDL_GZ_1X_2010060410_N.csv.gz)
                    filename = string.Format("{0}_VIPCDL_{1}_DO_{2}{3}_{4}.csv.gz", _proEnName, cityEnName,
                                             updateTime.ToString("yyyyMMdd"), hotTime == "MORNING" ? "10" : "20", 1);
                }

                filePath = string.Format("{0}\\{1}\\CDL", _localRootPath, _proEnName);

                int XLength = 0;
                int YLength = 0;
                double Initlongitude = 0f;
                double Initlatiude = 0f;
                List<clsPoi> Bigarr = _bizLayer.Bigarray(cityId, out Initlongitude, out Initlatiude, out XLength,
                                                         out YLength, _cityInfo[cityId]);
                Hashtable htDo = _bizLayer.viphtdtDo(cityId,
                                              string.Format("{0} {1}", updateTime.ToString("yyyy-MM-dd"),
                                                            hotTime == "MORNING" ? "10" : "20"), Initlongitude);

                DataTable dtResult = _bizLayer.htgetsmallExistBigDo(htDo, Bigarr); // ��ѯ���

                ArrayList lstLogicExpress = new ArrayList();
                ArrayList lstChName = new ArrayList();

                lstLogicExpress.Add("(" + Initlongitude + "|" + Initlatiude + ")");
                lstLogicExpress.Add("(0|0)");
                lstLogicExpress.Add("(" + XLength + "|" + YLength + ")");
                lstLogicExpress.Add(string.Format("({0} {1}:00:00)", updateTime.ToString("yyyy-MM-dd"),
                                                  hotTime == "MORNING" ? "10" : "20"));

                lstChName.Add("��");
                lstChName.Add("��");
                lstChName.Add("���ݺ��д���");


                //����Ϊ�յ��м�¼��DO���Ρ�
                DataView dv = dtResult.DefaultView;
                dv.RowFilter = "DODATA_CALL_NUM<>0";
                DataTable dtDo = dv.ToTable();

                if (dtDo.Columns.Count == 0 || dtDo.Rows.Count == 0)
                {                                       
                    throw new Exception("û�в鵽����");

                }

                // �����ļ�
                _bizLayer.ExportCsv(dtDo, filename.Substring(0, filename.Length - 3), filePath, lstChName,
                                        new ArrayList(), lstLogicExpress);

                // ѹ��
                clsZipFile.GZipFile(string.Format("{0}\\{1}", filePath, filename.Substring(0, filename.Length - 3)),
                                    string.Format("{0}\\{1}", filePath, filename));

                File.Delete(string.Format("{0}\\{1}", filePath, filename.Substring(0, filename.Length - 3)));

            }
            catch (Exception ex)
            {
                throw new Exception(string.Format("���ɻ���{0}�ļ�����{1} ", filename, ex.Message));
            }
        }

        /// <summary>
        /// DO����
        /// </summary>
        /// <param name="updateTime"></param>
        /// <param name="hotTime"></param>
        /// <param name="filePath"></param>
        /// <param name="filename"></param>
        /// <param name="cityId"></param>
        /// <param name="cityEnName"></param>
        private void CdlDoOutReport(DateTime updateTime, string hotTime, out string filePath, out string filename, string cityId, string cityEnName,string cityChName)
        {
            filename = "";
            try
            {
                if (updateTime <= Convert.ToDateTime(string.Format("{0} 05:00:00", DateTime.Now.ToString("yyyy-MM-dd")))
                    &&
                    updateTime >= Convert.ToDateTime(string.Format("{0} 00:00:00", DateTime.Now.ToString("yyyy-MM-dd"))))
                {
                    // �ڵ����賿5��ǰ�ϱ������������ϱ���������
                    updateTime = updateTime.AddDays(-1);
                    //�������ļ�����������(GD_CDL_GZ_DO_2010060410.csv.gz)
                    filename = string.Format("{0}_CDL_{1}_DO_{2}{3}.csv.gz", _proEnName, cityEnName,
                                             updateTime.ToString("yyyyMMdd"), hotTime == "MORNING" ? "10" : "20");
                }
                else
                {
                    // �������ǲ����ϱ�����ʱ������
                    //�������ļ�����������(GD_CDL_GZ_1X_2010060410_N.csv.gz)
                    filename = string.Format("{0}_CDL_{1}_DO_{2}{3}_{4}.csv.gz", _proEnName, cityEnName,
                                             updateTime.ToString("yyyyMMdd"), hotTime == "MORNING" ? "10" : "20", 1);
                }

                filePath = string.Format("{0}\\{1}\\CDL", _localRootPath, _proEnName);

                int XLength = 0;
                int YLength = 0;
                double Initlongitude = 0f;
                double Initlatiude = 0f;
                List<clsPoi> Bigarr = _bizLayer.Bigarray(cityId, out Initlongitude, out Initlatiude, out XLength,
                                                         out YLength, _cityInfo[cityId]);
                Hashtable htDo = _bizLayer.htdtDo(cityId,
                                              string.Format("{0} {1}", updateTime.ToString("yyyy-MM-dd"),
                                                            hotTime == "MORNING" ? "10" : "20"), Initlongitude);

                DataTable dtResult = _bizLayer.htgetsmallExistBigDo(htDo, Bigarr); // ��ѯ���

                ArrayList lstLogicExpress = new ArrayList();
                ArrayList lstChName = new ArrayList();

                lstLogicExpress.Add("(" + Initlongitude + "|" + Initlatiude + ")");
                lstLogicExpress.Add("(0|0)");
                lstLogicExpress.Add("(" + XLength + "|" + YLength + ")");
                lstLogicExpress.Add(string.Format("({0} {1}:00:00)", updateTime.ToString("yyyy-MM-dd"),
                                                  hotTime == "MORNING" ? "10" : "20"));

                lstChName.Add("��");
                lstChName.Add("��");
                lstChName.Add("���ݺ��д���");


                //����Ϊ�յ��м�¼��DO���Ρ�
                DataView dv = dtResult.DefaultView;
                dv.RowFilter = "DODATA_CALL_NUM<>0";
                DataTable dtDo = dv.ToTable();


                //��¼��ʵ��ȱʧ���
                if (dtDo.Columns.Count == 0 || dtDo.Rows.Count == 0)
                {
                    if (hotTime == "MORNING")
                    {
                        failDoCityM.Add(cityId);
                        cityDoListM += cityChName + ",";
                    }
                    else
                    {
                        failDoCityE.Add(cityId);
                        cityDoListE += cityChName + ",";
                    }
                }
                #region �޸����ݣ��㶫ר��
                if (_isCdl == "1")//�޸����ݣ��㶫ר��
                {                    
                    DataTable dtDoCheck=dtDo.Clone();//�����׼���ݵı�
                    Dictionary<string, string> dicData = new Dictionary<string, string>();//��ʵ�����ֵ䣬�к���������key
                    Dictionary<string, string> dicCheck = new Dictionary<string, string>();//��׼�����ֵ䣬�к���������key
                    DirectoryInfo diCdl = new DirectoryInfo(string.Format("{0}\\{1}\\{2}\\{3}", _localRootPath, _proEnName, ConstBackUp, ConstCdl));
                    string backfilepath = string.Format("{0}\\{1}\\{2}\\{3}", _localRootPath, _proEnName, ConstBackUp, ConstCdl);//���ݻ����ļ����Ŀ¼
                    DirectoryInfo diCdlCheck = new DirectoryInfo(string.Format("{0}\\{1}\\{2}\\{3}\\{4}", _localRootPath, _proEnName, ConstBackUp, ConstCdl, "CHECK"));
                    string standardfilepat = string.Format("{0}\\{1}\\{2}\\{3}\\{4}", _localRootPath, _proEnName, ConstBackUp, ConstCdl, "CHECK");//�ȶԵĻ�׼�ļ����ڵ�Ŀ¼


                    #region �Ƚ��ȶԵĻ�׼�ļ�csv�����ڴ���
                    FileSystemInfo[] fsiCheck = diCdlCheck.GetFileSystemInfos();
                    if (fsiCheck.Length > 0)
                    {
                        string checkname = string.Format("{0}_DO_{1}.csv", cityEnName, hotTime == "MORNING" ? "10" : "20");
                        foreach (FileSystemInfo fs in fsiCheck)
                        {
                            try
                            {
                                if (fs.Name == checkname)
                                {
                                    using (System.IO.StreamReader reader = new StreamReader(fs.FullName, System.Text.Encoding.GetEncoding("GB2312")))
                                    {
                                        int k = 0;
                                        while (reader.Peek() > 0)
                                        {
                                            try
                                            {
                                                if (k == 0)//��һ����Ч����
                                                {
                                                    string head = reader.ReadLine();
                                                }
                                                else if (k == 1)//�ڶ�����Ч����
                                                {
                                                    string chname = reader.ReadLine();
                                                }
                                                else//�����п�ʼ����Ч����
                                                {
                                                    string str = reader.ReadLine();
                                                    string[] data = str.Split(',');
                                                    DataRow dr = dtDoCheck.NewRow();
                                                    for (int j = 0; j < data.Length; j++)
                                                    {
                                                        dr[j] = data[j];
                                                    }
                                                    dtDoCheck.Rows.Add(dr);
                                                    //if (!dicCheck.ContainsKey(dr[0].ToString() + "|" + dr[1].ToString()))
                                                    //{
                                                    //���к�����Ϊ�ֵ��key��������
                                                    dicCheck.Add(dr[0].ToString() + "|" + dr[1].ToString(), dr[0].ToString() + "|" + dr[1].ToString());
                                                    //}
                                                }
                                                k++;
                                            }
                                            catch { continue; }
                                        }
                                    }
                                    break;
                                }
                            }
                            catch { continue; }
                        }
                    }
                    #endregion

                    #region ѭ����ʵ�����ݱ����к�����Ϊ�ֵ��key��������
                    foreach (DataRow dr in dtDo.Rows)
                    {
                        try
                        {
                            //if (!dicData.ContainsKey(dr[0].ToString() + "|" + dr[1].ToString()))
                            //{
                                dicData.Add(dr[0].ToString() + "|" + dr[1].ToString(), dr[0].ToString() + "|" + dr[1].ToString());
                            //}
                        }
                        catch { continue; }
                    }
                    #endregion

                    Dictionary<string, string> dicResult = GetCdlCheckResult(dicData, dicCheck);//��ȡ�ȶԼ�¼
                    if (dicResult.Count > 0)//dicResult.Count>0֤��դ��������ȱʧ
                    {
                        #region ���ȱʧ������
                        foreach (string key in dicResult.Keys)
                        {
                            bool isReplace = false;
                            string col = key.Split('|')[0];//ȱʧ���ݵ���
                            string row = key.Split('|')[1];//ȷʵ���ݵ���

                            #region �������ļ�
                            FileSystemInfo[] fsicdl = diCdl.GetFileSystemInfos();
                            if (fsicdl.Length > 0)
                            {
                                for (int i = 14; i > 0; i--)
                                {
                                    string tempfilename = string.Format("{0}_CDL_{1}_DO_{2}{3}.csv.gz", _proEnName, cityEnName,
                                        DateTime.Now.AddDays(-i).ToString("yyyyMMdd"), hotTime == "MORNING" ? "10" : "20");
                                    foreach (FileSystemInfo fs in fsicdl)
                                    {
                                        try
                                        {
                                            if (fs.Name == tempfilename)
                                            {
                                                //�Ƚ�ѹ�ļ�
                                                UnZipClass.UnGzipFile(string.Format("{0}\\{1}", backfilepath, tempfilename),
                                                                      string.Format("{0}\\{1}", backfilepath, tempfilename.Substring(0, tempfilename.Length - 3)));
                                                //����csvд��datatable                                                 
                                                using (System.IO.StreamReader readercdl = new StreamReader(fs.FullName.Substring(0, fs.FullName.Length - 3), System.Text.Encoding.GetEncoding("GB2312")))
                                                {
                                                    int k = 0;
                                                    while (readercdl.Peek() > 0)
                                                    {
                                                        try
                                                        {
                                                            if (k == 0)//��һ����Ч����
                                                            {
                                                                string head = readercdl.ReadLine();
                                                            }
                                                            else if (k == 1)//�ڶ�����Ч����
                                                            {
                                                                string chname = readercdl.ReadLine();
                                                            }
                                                            else//�����п�ʼ����Ч����
                                                            {
                                                                string str = readercdl.ReadLine();
                                                                string[] data = str.Split(',');
                                                                if (col == data[0].ToString() && row == data[1].ToString())//�ҵ���ȱʧ���к���
                                                                {
                                                                    DataRow dr = dtDo.NewRow();
                                                                    for (int j = 0; j < data.Length; j++)
                                                                    {
                                                                        dr[j] = data[j];
                                                                    }
                                                                    dtDo.Rows.Add(dr);
                                                                    isReplace = true;
                                                                    break;
                                                                }
                                                            }
                                                            k++;
                                                        }
                                                        catch { continue; }
                                                    }
                                                }
                                                //��ȡ֮��ɾ��
                                                File.Delete(string.Format("{0}\\{1}", backfilepath, tempfilename.Substring(0, tempfilename.Length - 3)));
                                                if (isReplace)//�ҵ����滻���ݣ��˳�ѭ��
                                                {
                                                    break;
                                                }
                                            }
                                        }
                                        catch { continue; }
                                    }
                                    if (isReplace)//�ҵ����滻���ݣ��˳�ѭ��
                                    {
                                        break;
                                    }
                                }
                            }
                            #endregion

                            if (!isReplace)//����ʷ������û���ҵ����û�׼�ļ��е��滻
                            {
                                foreach(DataRow dr in dtDoCheck.Rows)
                                {
                                    if (col == dr[0].ToString() && row == dr[1].ToString())
                                    {
                                        DataRow datarow = dtDo.NewRow();
                                        for (int j = 0; j < dtDoCheck.Columns.Count; j++)
                                        {
                                            datarow[j] = dr[j];                                            
                                        }
                                        dtDo.Rows.Add(datarow);
                                        break;
                                    }
                                }
                            }
                        }
                        #endregion

                        //����
                        if (dtDo.Rows.Count > 0)
                        {
                            DataView dvDo = dtDo.DefaultView;
                            dvDo.Sort = "col asc";
                            dtDo = dvDo.ToTable();
                        }
                    }                                                                               
                }
                #endregion

                if (dtDo.Rows.Count == 0 || dtDo.Columns.Count == 0 || dtDo == null)
                {
                    _bizLayer.InsertCount(_proChName, updateTime, cityId, cityChName, 3, 2, 0, hotTime == "MORNING" ? "10" : "20");//û�в鵽����ʱ����¼��Ϊ0
                    throw new Exception("û�в鵽����");
                }

                //#region ���㶫֮�������ʡ������ǰ���ϰ汾����դ���쳣
                //else
                //{
                //    if (dtDo.Columns.Count == 0 || dtDo.Rows.Count == 0)
                //    {
                //        //throw new Exception("û�в鵽����");

                //        if (hotTime == "MORNING")
                //        {
                //            failDoCityM.Add(cityId);
                //            cityDoListM += cityChName + ",";
                //        }
                //        else
                //        {
                //            failDoCityE.Add(cityId);
                //            cityDoListE += cityChName + ",";
                //        }

                //        DirectoryInfo diCdl = new DirectoryInfo(string.Format("{0}\\{1}\\{2}\\{3}", _localRootPath, _proEnName, ConstBackUp, ConstCdl));
                //        string backfilepath = string.Format("{0}\\{1}\\{2}\\{3}", _localRootPath, _proEnName, ConstBackUp, ConstCdl);
                //        FileSystemInfo[] fsi = diCdl.GetFileSystemInfos();
                //        if (fsi.Length > 0)
                //        {
                //            for (int i = 14; i > 0; i--)
                //            {
                //                string tempfilename = string.Format("{0}_CDL_{1}_DO_{2}{3}.csv.gz", _proEnName, cityEnName,
                //                                 DateTime.Now.AddDays(-i).ToString("yyyyMMdd"), hotTime == "MORNING" ? "10" : "20");
                //                foreach (FileSystemInfo fs in fsi)
                //                {
                //                    if (fs.Name == tempfilename)
                //                    {
                //                        //�Ƚ�ѹ�ļ�
                //                        UnZipClass.UnGzipFile(string.Format("{0}\\{1}", backfilepath, tempfilename),
                //                                              string.Format("{0}\\{1}", backfilepath, tempfilename.Substring(0, tempfilename.Length - 3)));
                //                        //����csvд��datatable                                    
                //                        System.IO.StreamReader reader = new StreamReader(fs.FullName.Substring(0, fs.FullName.Length - 3), System.Text.Encoding.GetEncoding("GB2312"));
                //                        int k = 0;
                //                        while (reader.Peek() > 0)
                //                        {
                //                            if (k == 0)
                //                            {
                //                                string head = reader.ReadLine();
                //                            }
                //                            else if (k == 1)
                //                            {
                //                                string chname = reader.ReadLine();
                //                            }
                //                            else
                //                            {
                //                                string str = reader.ReadLine();
                //                                string[] data = str.Split(',');
                //                                DataRow dr = dtDo.NewRow();
                //                                for (int j = 0; j < data.Length; j++)
                //                                {
                //                                    dr[j] = data[j];
                //                                }
                //                                dtDo.Rows.Add(dr);
                //                            }
                //                            k++;
                //                        }

                //                        reader.Close();

                //                        _isFind = true;
                //                        //�����ɾ��
                //                        File.Delete(string.Format("{0}\\{1}", backfilepath, tempfilename.Substring(0, tempfilename.Length - 3)));
                //                        break;
                //                    }
                //                }
                //                if (_isFind)
                //                {
                //                    break;
                //                }
                //            }
                //        }
                //        _isFind = false;
                //        if (dtDo.Rows.Count == 0 || dtDo.Columns.Count == 0 || dtDo == null)
                //        {
                //            _bizLayer.InsertCount(_proChName, updateTime, cityId, cityChName, 3, 2, 0, hotTime == "MORNING" ? "10" : "20");//û�в鵽����ʱ����¼��Ϊ0
                //            throw new Exception("û�в鵽����");
                //        }
                //    }
                //}
                //#endregion

                // �����ļ�
                _bizLayer.ExportCsv(dtDo, filename.Substring(0, filename.Length - 3), filePath, lstChName,
                                        new ArrayList(), lstLogicExpress);

                _bizLayer.InsertCount(_proChName, updateTime, cityId, cityChName, 3, 2, dtDo.Rows.Count, hotTime == "MORNING" ? "10" : "20");//��ѯ������ʱ����¼Ϊ��ʵ���ϱ���¼����

                // ѹ��
                clsZipFile.GZipFile(string.Format("{0}\\{1}", filePath, filename.Substring(0, filename.Length - 3)),
                                    string.Format("{0}\\{1}", filePath, filename));

                File.Delete(string.Format("{0}\\{1}", filePath, filename.Substring(0, filename.Length - 3)));

            }
            catch (Exception ex)
            {
                throw new Exception(string.Format("���ɻ���{0}�ļ�����{1} ", filename, ex.Message));
            }
        }

        #region �ش�������

        /// <summary>
        /// �ϴ��߳�
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void timerFtp_Tick(object sender, EventArgs e)
        {
            try
            {
                if (!_ftpIsDone)
                {
                    _ftpIsDone = true;

                    GetExistWordFile();

                    ReUpload();
                    _ftpIsDone = false;
                }
            }
            catch (Exception ex)
            {
                AddErr("�ϴ��߳�����ʧ��", ex.Message);
            }
        }

        /// <summary>
        /// �ش�
        /// </summary>
        void ReUpload()
        {
            List<string> values = _uploadFailed.Keys.ToList();

            foreach (string s in values)
            {
                try
                {
                    FileInfo fileInfo = new FileInfo(_uploadFailed[s].ItemText); // test -> filename
                    bool ret = false;
                    try
                    {
                        ret = _ftpClient.fileUpload(fileInfo, _uploadFailed[s].ItemValue.ToString(), s); // value -> ftpPath
                    }
                    catch (Exception ex)
                    {
                        AddErr(string.Format("�ļ�{0}��{1}����ʧ��", s, DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")),
                               ex.Message);
                        ret = false;
                    }
                    if (ret)
                    {            
                        //ת�Ʊ���+ɾ��            
                        string backpath = _proEnName + "\\" + ConstBackUp + "\\";
                        string destpath = _uploadFailed[s].ItemText.Replace(_proEnName + "\\", backpath);

                        File.Copy(_uploadFailed[s].ItemText, destpath);
                        File.Delete(_uploadFailed[s].ItemText);

                        DeleteUploadFailedFileToShareDic(s);
                        AddErr(string.Format("�ļ�{0}��{1}�����ɹ�", s, DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")),
                               "");
                    }
                    else
                    {
                        bool retExists = File.Exists(_uploadFailed[s].ItemText);
                        if (!retExists)
                            DeleteUploadFailedFileToShareDic(s);
                    }
                }
                catch
                {                    
                    continue;
                }
            }
        }

        private delegate void AddUpdateHandler(string fileName, string ftpPath, string ftpFileName);
        void AddUploadFailedFileToShareDic(string fileName ,string ftpPath,string ftpFileName)
        {
            try
            {
                if (InvokeRequired)
                {
                    AddUpdateHandler handler = new AddUpdateHandler(AddUploadFailedFileToShareDic);
                    Invoke(handler, new object[] { fileName, ftpPath, ftpFileName });
                }
                else
                {
                    lock (_uploadFailed)
                    {
                        if (!_uploadFailed.ContainsKey(ftpFileName))
                            _uploadFailed.Add(ftpFileName, new DictItem(fileName, ftpPath));
                    }
                }
            }
            catch (Exception ex)
            {
                AddErr("���δ�ϴ��б�ʧ�� ",ex.Message);
            }
        }

        private delegate void DeleteUpdateHandler(string ftpFileName);
        void DeleteUploadFailedFileToShareDic(string ftpFileName)
        {
            try
            {
                if (InvokeRequired)
                {
                    DeleteUpdateHandler handler = new DeleteUpdateHandler(DeleteUploadFailedFileToShareDic);
                    Invoke(handler, new object[] { ftpFileName });
                }
                else
                {
                    lock (_uploadFailed)
                    {
                        if (_uploadFailed.ContainsKey(ftpFileName))
                            _uploadFailed.Remove(ftpFileName);
                    }
                }
            }
            catch (Exception ex)
            {
                AddErr("ɾ��δ�ϴ��б�ʧ�� ",ex.Message);
            }
        }

        /// <summary>
        /// ��ȡδ�ϴ����ļ�
        /// </summary>
        void GetExistFileToUploadFailed()
        {
            try
            {
                string filePath = string.Format("{0}\\{1}", _localRootPath, _proEnName);
                if (!Directory.Exists(filePath))
                    return;

                // ����
                string filePathCdl = string.Format("{0}\\{1}", filePath, ConstCdl);
                DirectoryInfo dirCdl = new DirectoryInfo(filePathCdl);
                FileInfo[] fileCdl = dirCdl.GetFiles();
                foreach (FileInfo f in fileCdl.Where(f => f.Name.ToLower().IndexOf(".gz") > 0))
                    AddUploadFailedFileToShareDic(f.FullName, string.Format("{0}/", ConstCdl), f.Name);

                // ����
                string filePathPerf = string.Format("{0}\\{1}", filePath, ConstPerf);
                DirectoryInfo dirPerf = new DirectoryInfo(filePathPerf);
                FileInfo[] filePerf = dirPerf.GetFiles();
                foreach (FileInfo f in filePerf)
                    AddUploadFailedFileToShareDic(f.FullName, string.Format("{0}/", ConstPerf), f.Name);

                // ��������
                string filePathConf = string.Format("{0}\\{1}", filePath, ConstConf);
                DirectoryInfo dirConf = new DirectoryInfo(filePathConf);
                FileInfo[] fileConf = dirConf.GetFiles();
                foreach (FileInfo f in fileConf)
                    AddUploadFailedFileToShareDic(f.FullName, string.Format("{0}/", ConstConf), f.Name);

                GetExistWordFile();                
            }
            catch(Exception ex)
            {
                AddErr("��ȡδ�ϴ����ļ�ʧ�� ",ex.Message);
            }
        }

        /// <summary>
        /// ����WORKĿ¼�ļ��У�����û��ύ���ļ���
        /// </summary>
        void CreateWorkFiles()
        {
            try
            {
                string workFilesPath = string.Format("{0}\\{1}\\{2}", _localRootPath, _proEnName,
                                                     ConstWork);

                if (!Directory.Exists(workFilesPath))
                    Directory.CreateDirectory(workFilesPath);
            }
            catch(Exception ex)
            {
                AddErr("����WORKĿ¼�ļ���ʧ�� ",ex.Message);
            }
        }

        /// <summary>
        /// ��ȡWork�ļ����ļ�
        /// </summary>
        void GetExistWordFile()
        {
            try
            {
                string filePath = string.Format("{0}\\{1}", _localRootPath, _proEnName);
                if (!Directory.Exists(filePath))
                    return;
                // ������Ա���� �������������� �����Ǳ�����
                string filePathWork = string.Format("{0}\\{1}", filePath, ConstWork);
                DirectoryInfo dirWork = new DirectoryInfo(filePathWork);
                FileInfo[] fileWork = dirWork.GetFiles();
                foreach (FileInfo f in fileWork)
                    AddUploadFailedFileToShareDic(f.FullName, string.Format("{0}/", ConstWork), f.Name);                
            }
            catch(Exception ex)
            {
                AddErr("��ȡWork�ļ����ļ�ʧ�� ",ex.Message);
            }
        }

        #endregion 

        #region FormClosing
        private void DataCollectFrm_FormClosing(object sender, FormClosingEventArgs e)
        {
            nfIcon.Visible = true;
            Visible = false;
            e.Cancel = true;
        }
        #endregion

        #region д��־
        delegate void _AddErr(string msg, string stackTrace);
        /// <summary>
        /// д��־
        /// </summary>
        /// <param name="msg"></param>
        /// <param name="stackTrace"></param>
        void AddErr(string msg, string stackTrace)
        {
            try
            {
                if (InvokeRequired)
                {
                    _AddErr s = new _AddErr(AddErr);
                    Invoke(s, new object[] { msg, stackTrace });
                }
                else
                {
                    if (lstBoxLog.Items.Count > 500)
                        lstBoxLog.Items.Clear();
                    if (!string.IsNullOrEmpty(msg))
                    {
                        lstBoxLog.Items.Add(msg);
                        lstBoxLog.SelectedIndex = lstBoxLog.Items.Count - 1;
                    }
                    WriteToFile(msg,stackTrace);
                }
            }
            catch
            { }
        }

        delegate void _AddMsg(string msg);
        /// <summary>
        /// д��־
        /// </summary>
        /// <param name="msg"></param>
        void AddMsg(string msg)
        {
            try
            {
                if (InvokeRequired)
                {
                    _AddMsg s = new _AddMsg(AddMsg);
                    Invoke(s, new object[] { msg});
                }
                else
                {
                    if (lstBoxUploadLog.Items.Count > 500)
                        lstBoxUploadLog.Items.Clear();
                    if (!string.IsNullOrEmpty(msg))
                    {
                        lstBoxUploadLog.Items.Add(msg);
                        lstBoxUploadLog.SelectedIndex = lstBoxUploadLog.Items.Count - 1;
                    }
                }
            }
            catch(Exception ex)
            {
                AddErr("��д�ϱ���־ʧ��", ex.Message);
            }
        }

        /// <summary>
        ///  д��־
        /// </summary>
        /// <param name="msg"></param>
        /// <param name="stackTrace"></param>
        void WriteToFile(string msg, string stackTrace)
        {
            _bizLayer.WriteToFile(_startupPath, msg, stackTrace);
        }

        #endregion

        #region UploadButton
        private void btnConfMsc_Click(object sender, EventArgs e)
        {
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), false);
            ConfCollect(DataDate.DateTime, "MSC");
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), true);
        }
        
        private void btnConfBsc_Click(object sender, EventArgs e)
        {
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), false);
            ConfCollect(DataDate.DateTime, "BSC");
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), true);
        }

        private void btnConfBts_Click(object sender, EventArgs e)
        {
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), false);
            ConfCollect(DataDate.DateTime, "BTS");
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), true);
        }

        private void btnPerfMsc1x_Click(object sender, EventArgs e)
        {
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), false);
            PerfCollect(DataDate.DateTime, "MSC", "1X");
            CheckIndexMsc1X();
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), true);
        }

        private void btnPerfMscDo_Click(object sender, EventArgs e)
        {
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), false);
            PerfCollect(DataDate.DateTime, "MSC", "DO");
            CheckIndexMscDo();
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), true);
        }

        private void btnPerfCity1x_Click(object sender, EventArgs e)
        {
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), false);
            PerfCollect(DataDate.DateTime, "CITY", "1X");
            CheckIndexCity1X();
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), true);
        }

        private void btnPerfCityDo_Click(object sender, EventArgs e)
        {
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), false);
            PerfCollect(DataDate.DateTime, "CITY", "DO");
            CheckIndexCityDo();
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), true);
        }

        private void btnCdl101x_Click(object sender, EventArgs e)
        {
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), false);
            CdlCollect(DataDate.DateTime, "MORNING", "1X");
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), true);
        }

        private void btnCdl10Do_Click(object sender, EventArgs e)
        {
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), false);
            CdlCollect(DataDate.DateTime, "MORNING", "DO");
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), true);
        }

        private void btnCdl201x_Click(object sender, EventArgs e)
        {
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), false);
            CdlCollect(DataDate.DateTime, "EVENING", "1X");
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), true);
        }

        private void btnCdl20Do_Click(object sender, EventArgs e)
        {
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), false);
            CdlCollect(DataDate.DateTime, "EVENING", "DO");
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), true);
        }

        #endregion

        #region Timer
        /// <summary>
        /// �������ݣ�ÿ���賿1���ϱ�
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void timerConf_Tick(object sender, EventArgs e)
        {
            try
            {
                if (CheckTime(Convert.ToDateTime(string.Format("{0} 01:00:00", DateTime.Now.ToString("yyyy-MM-dd"))), _confRunning))
                {
                    _confRunning = true;
                    ConfCollect(DateTime.Now, "MSC");
                    Thread.Sleep(60000);
                    Application.DoEvents();

                    ConfCollect(DateTime.Now, "BSC");
                    Thread.Sleep(60000);
                    Application.DoEvents();

                    ConfCollect(DateTime.Now, "BTS");
                    Thread.Sleep(60000);
                    Application.DoEvents();

                    ConfCollect(DateTime.Now, "SECTOR");
                    Thread.Sleep(60000);
                    Application.DoEvents();

                    ConfCollect(DateTime.Now, "WLANHP");
                    Thread.Sleep(60000);
                    Application.DoEvents();

                    //ConfCollect(DateTime.Now, "BLINDPOINT");       

                    //�ͻ�Ͷ��ͳ������
                    ComplaintCollect(DateTime.Now, "1X");
                    Thread.Sleep(60000);
                    Application.DoEvents();

                    ComplaintCollect(DateTime.Now, "DO");
                    Thread.Sleep(60000);
                    Application.DoEvents();
                    _confRunning = false;

                    DataDate.DateTime = DateTime.Now.AddDays(-1);
                }
            }
            catch (Exception ex)
            {
                AddErr("�����ϱ�����ʧ��", ex.Message);
            }
        }

        delegate void SetButtonStatusHandler(bool value);
        /// <summary>
        /// ���ð�ť״̬
        /// </summary>
        /// <param name="value"></param>
        void SetButtonStatus(bool value)
        {
            btnConfMsc.Enabled = value;
            btnConfBsc.Enabled = value;
            btnConfBts.Enabled = value;
            btnConfSector.Enabled = value;
            btnConfHot.Enabled = value;
            btnConfBlind.Enabled = value;
            btnPerfMsc1x.Enabled = value;
            btnPerfMscDo.Enabled = value;
            btnPerfCity1x.Enabled = value;
            btnPerfCityDo.Enabled = value;
            btnCdl101x.Enabled = value;
            btnCdl10Do.Enabled = value;
            btnCdl201x.Enabled = value;
            btnCdl20Do.Enabled = value;
            btnVipCdl101X.Enabled = value;
            btnVipCdl10DO.Enabled = value;
            btnVipCdl201X.Enabled = value;
            btnVipCdl20DO.Enabled = value;
            btnWorkTest.Enabled = value;
            btnComplaint1X.Enabled = value;
        }

        /// <summary>
        /// �������ݣ�ÿ���賿4���ϱ���
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void timerPerf_Tick(object sender, EventArgs e)
        {
            try
            {                
                DateTime dateTime = DateTime.Now;
                bool run = false;
                if (CheckTime(Convert.ToDateTime(string.Format("{0} 04:00:00", DateTime.Now.ToString("yyyy-MM-dd"))),
                              _perfRunning))
                {
                    run = true;
                }
                else if (CheckTime(
                    Convert.ToDateTime(string.Format("{0} 20:00:00", DateTime.Now.ToString("yyyy-MM-dd"))),
                    _perfRunning))
                {
                    timeFlag = true;
                    run = true;
                    dateTime = dateTime.AddDays(-4);
                }

                if (run)
                {
                    //���ȫ�ֱ���
                    perf1xCity = string.Empty;
                    perf1xMsc = string.Empty;
                    perfDoCity = string.Empty;
                    perfDoMsc = string.Empty;

                    _perfRunning = true;
                    // Msc1X �����ϱ�
                    try
                    {
                        PerfCollect(dateTime, "MSC", "1X");
                    }
                    catch
                    {
                    }
                    Thread.Sleep(60000);
                    Application.DoEvents();

                    // Msc DO �����ϱ�try
                    try
                    {
                        PerfCollect(dateTime, "MSC", "DO");
                    }
                    catch
                    {
                    }
                    Thread.Sleep(60000);
                    Application.DoEvents();

                    // CITY 1X �����ϱ�try
                    try
                    {
                        PerfCollect(dateTime, "CITY", "1X");
                    }
                    catch
                    {
                    }
                    Thread.Sleep(60000);
                    Application.DoEvents();

                    // CITY DO �����ϱ�try
                    try
                    {
                        PerfCollect(dateTime, "CITY", "DO");
                    }
                    catch
                    {
                    }
                    Application.DoEvents();

                    _perfRunning = false;

                    //ͳ����־�������Դ
                    dtLog.Rows.Clear();
                    if (timeFlag)
                    {
                        dtLog.Rows.Add(drEvLog);
                        dtLog.Rows.Add(drEvExLog);
                    }
                    else
                    {
                        dtLog.Rows.Add(drLog);
                        dtLog.Rows.Add(drExLog);
                    }

                    //gcLog.DataSource = dtLog;                    
                    gcLog.Invoke(new LogDataSourceCallBack(RefreshDataSource), dtLog);

                    string logname=string.Empty;
                    if (timeFlag)
                    {
                        logname = _startupPath + "\\Log\\" + "PERF_LOG_" + dateTime.AddDays(4).ToShortDateString() + "-20" + ".XLS";
                        timeFlag = false;
                    }
                    else
                    {
                        logname = _startupPath + "\\Log\\" + "ALL_LOG_" + dateTime.ToShortDateString() + "-04" + ".XLS";
                    }
                    //gcLog.ExportToXls(logname);                                       
                    //gcLog.Invoke(new WriteExcelLog(WriteExcelToLog), logname);  
                    _bizLayer.InsertLog(dtLog);
                    ExportToExcelFast(bgLog, logname);

                    //�ж�ָ��׼ȷ�ԣ���������ο���Χ�������
                    CheckIndexMsc1X();
                    CheckIndexMscDo();
                    CheckIndexCity1X();
                    CheckIndexCityDo();
                }
            }
            catch (Exception ex)
            {
                AddErr("�����ϱ�����ʧ��", ex.Message);
            }
        }

        //private void timerTemp_Tick(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        DateTime dateTime = DateTime.Now;
        //        bool run = false;
        //        if (CheckTime(Convert.ToDateTime(string.Format("{0} 04:30:00", DateTime.Now.ToString("yyyy-MM-dd"))),
        //                      _tempRunning) &&_isTemp)
        //        {
        //            run = true;
        //        }

        //        if (run)
        //        {
        //            _tempRunning = true;
        //            PerfCollectTemp(dateTime, "MSC", "1X","MSC1X.csv");
        //            Thread.Sleep(60000);
        //            Application.DoEvents();
        //            PerfCollectTemp(dateTime, "MSC", "DO","MSCDO.csv");
        //            Thread.Sleep(60000);
        //            Application.DoEvents();
        //            PerfCollectTemp(dateTime, "CITY", "1X","CITY1X.csv");
        //            Thread.Sleep(60000);
        //            Application.DoEvents();
        //            PerfCollectTemp(dateTime, "CITY", "DO","CITYDO.csv");
        //            _tempRunning = false;
        //        }

        //    }
        //    catch(Exception ex)
        //    {
        //        AddErr(ex.Message, "0");
        //    }
        //}

        private void timerTest_Tick(object sender,EventArgs e)
        {
            try
            {
                if (CheckDayTime(Convert.ToDateTime(string.Format("{0} 02:00:00", DateTime.Now.ToString("yyyy-MM-dd"))), _testRunning))
                {
                    _testRunning=true;                    

                    //������Ϣ
                    TestCollect(DateTime.Now, "CITYHP");
                    Thread.Sleep(60000);
                    Application.DoEvents();

                    TestCollect(DateTime.Now,"CITYROAD");
                    Thread.Sleep(60000);
                    Application.DoEvents();

                    TestCollect(DateTime.Now,"VILLAGE");
                    Thread.Sleep(60000);
                    Application.DoEvents();

                    //ä����Ϣ�ϱ�
                    ConfCollect(DateTime.Now, "BLINDPOINT");
                    Thread.Sleep(60000);
                    Application.DoEvents();

                    _testRunning=false;
                }
            }
            catch(Exception ex)
            {
                AddErr("������Ϣ�ϱ�����ʧ��", ex.Message);
            }
        }

        //private void timerPara_Tick(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        if (CheckTime(Convert.ToDateTime(string.Format("{0} 02:00:00", DateTime.Now.ToString("yyyy-MM-dd"))), _paraRunning))
        //        {
        //            _paraRunning = true;
        //            Para(DateTime.Now);                    
        //            Thread.Sleep(60000);
        //            Application.DoEvents();
        //            _paraRunning = false;
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        AddErr("�߽��������������ϱ�����ʧ��", ex.Message);
        //    }
        //}

        //��Ϊ
        private void timerParaHW_Tick(object sender, EventArgs e)
        {
            try
            {
                if (CheckTime(Convert.ToDateTime(string.Format("{0} 01:00:00", DateTime.Now.ToString("yyyy-MM-dd"))), _paraHWRunning))
                {
                    foreach (DataRow dr in _dtVendor.Rows)
                    {
                        if (dr["VENDOR"].ToString() == "ZY0808")
                        {
                            _paraHWRunning = true;          
                  
                            ParaCollect(DataDate.DateTime, dr["VENDOR"].ToString(), "1X", "CARR", "SF");//��Ϊ1XͬƵ��Ƶ��
                            ParaCollect(DataDate.DateTime, dr["VENDOR"].ToString(), "1X", "CARR", "DF");//��Ϊ1X��Ƶ��Ƶ��
                            ParaCollect(DataDate.DateTime, dr["VENDOR"].ToString(), "DO", "CARR", "SF");//��ΪDOͬƵ��Ƶ��
                            ParaCollect(DataDate.DateTime, dr["VENDOR"].ToString(), "DO", "CARR", "DF");//��ΪDO��Ƶ��Ƶ��

                            Thread.Sleep(60000);
                            Application.DoEvents();
                            _paraHWRunning = false;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                AddErr("��Ϊ�߽��������������ϱ�����ʧ��", ex.Message);
            }
        }

        private void timerParaZTE_Tick(object sender, EventArgs e)
        {
            try
            {
                if (CheckTime(Convert.ToDateTime(string.Format("{0} 01:00:00", DateTime.Now.ToString("yyyy-MM-dd"))), _paraZTERunning))
                {
                    foreach (DataRow dr in _dtVendor.Rows)
                    {
                        if (dr["VENDOR"].ToString() == "ZY0804")
                        {
                            _paraZTERunning = true;

                            ParaCollect(DataDate.DateTime, dr["VENDOR"].ToString(), "1X", "CELL", "");//����1X������(�ڽ�С��)
                            ParaCollect(DataDate.DateTime, dr["VENDOR"].ToString(), "1X", "CARR", "");//����1X��Ƶ��(ͬƵ&��Ƶ)

                            ParaCollect(DataDate.DateTime, dr["VENDOR"].ToString(), "DO", "CARR", "");//����DO��Ƶ��(ͬƵ&��Ƶ)
                            
                            Thread.Sleep(60000);
                            Application.DoEvents();
                            _paraZTERunning = false;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                AddErr("���˱߽��������������ϱ�����ʧ��", ex.Message);
            }
        }

        private void timerParaALU_Tick(object sender, EventArgs e)
        {
            try
            {
                if (CheckTime(Convert.ToDateTime(string.Format("{0} 01:00:00", DateTime.Now.ToString("yyyy-MM-dd"))), _paraALURunning))
                {
                    foreach (DataRow dr in _dtVendor.Rows)
                    {
                        if (dr["VENDOR"].ToString() == "ZY0810")
                        {
                            _paraALURunning = true;

                            ParaCollect(DataDate.DateTime, dr["VENDOR"].ToString(), "1X", "CELL", "SF");//����1X������(ͬƵ) ����1X�������޲�������
                            //ParaCollect(DataDate.DateTime, dr["VENDOR"].ToString(), "1X", "CARR", "DF");//����1X��Ƶ��(��Ƶ) Ŀǰ���ʵ�����ֻ�ɵ�������,����Ƶ��
                            ParaCollect(DataDate.DateTime, dr["VENDOR"].ToString(), "DO", "CELL", "");//����DO��������
                            
                            Thread.Sleep(60000);
                            Application.DoEvents();
                            _paraALURunning = false;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                AddErr("��Ѷ�߽��������������ϱ�����ʧ��", ex.Message);
            }
        }

        private void timerUse_Tick(object sender, EventArgs e)
        {
            try
            {
                if (CheckTime(Convert.ToDateTime(string.Format("{0} 02:00:00", DateTime.Now.ToString("yyyy-MM-dd"))), _useRunning))
                {
                    _useRunning = true;

                    UseCollect(DateTime.Now);
                    Thread.Sleep(60000);
                    Application.DoEvents();

                    _useRunning = false;                   
                }
            }
            catch (Exception ex)
            {
                AddErr("ƽ̨ʹ�����ͳ�������ϱ�����ʧ��", ex.Message);
            }
        }

        /// <summary>
        /// �������ݣ�ÿ���賿3���ϱ���
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void timerCdl_Tick(object sender, EventArgs e)
        {
            try
            {                
                if (CheckTime(Convert.ToDateTime(string.Format("{0} 02:00:00", DateTime.Now.ToString("yyyy-MM-dd"))), _cdlRunning))
                {
                    //���ȫ�ֱ���
                    fail1xCityM.Clear();
                    fail1xCityE.Clear();
                    failDoCityM.Clear();
                    failDoCityE.Clear();

                    city1xListM = string.Empty;
                    city1xListE = string.Empty;
                    cityDoListM = string.Empty;
                    cityDoListE = string.Empty;

                    _cdlRunning = true;

                    CdlCollect(DateTime.Now, "MORNING", "1X");
                    Thread.Sleep(60000);
                    Application.DoEvents();

                    CdlCollect(DateTime.Now, "MORNING", "DO");
                    Thread.Sleep(60000);
                    Application.DoEvents();

                    CdlCollect(DateTime.Now, "EVENING", "1X");
                    Thread.Sleep(60000);
                    Application.DoEvents();

                    CdlCollect(DateTime.Now, "EVENING", "DO");
                    Thread.Sleep(60000);
                    Application.DoEvents();

                    VipCdlCollect(DateTime.Now,"MORNING","1X");
                    Thread.Sleep(60000);
                    Application.DoEvents();

                    VipCdlCollect(DateTime.Now,"MORNING","DO");
                    Thread.Sleep(60000);
                    Application.DoEvents();

                    VipCdlCollect(DateTime.Now,"EVENING","1X");
                    Thread.Sleep(60000);
                    Application.DoEvents();

                    VipCdlCollect(DateTime.Now,"EVENING","DO");
                    Thread.Sleep(60000);
                    Application.DoEvents();

                    _cdlRunning = false;


                    //��װͳ����־���
                    drLog["1X_CDL_CITY"] = (city1xCountM + city1xCountE).ToString();
                    drLog["DO_CDL_CITY"] = (cityDoCountM + cityDoCountE).ToString();

                    drExLog["1X_CDL_CITY"] = "10ʱ����ȱʧ����:" + city1xListM + ";" + "\r\n" + "20ʱ����ȱʧ����:" + city1xListE + ";";
                    drExLog["DO_CDL_CITY"] = "10ʱ����ȱʧ����:" + cityDoListM + ";" + "\r\n" + "20ʱ����ȱʧ����:" + cityDoListE + ";";
                }
            }
            catch (Exception ex)
            {
                AddErr("�����ϱ�����ʧ��", ex.Message);
            }
        }
        #endregion

        /// <summary>
        /// ɾ��backup���ݣ�ÿ���賿6�㡣
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>        
        private void timerDelete_Tick(object sender,EventArgs e)
        {
            try
            {
                if (CheckTime(Convert.ToDateTime(string.Format("{0} 06:00:00", DateTime.Now.ToString("yyyy-MM-dd"))), _deleteRunning))
                {
                    _deleteRunning = true;
                    DeleteBackFiles();
                    Thread.Sleep(60000);
                    Application.DoEvents();
                    _deleteRunning = false;
                }                
            }
            catch (Exception ex)
            {
                AddErr("ɾ����������ʧ��", ex.Message);
            }
        }

        #region ����������ݵ�������

        private string checkProvData(DataTable dt)
        {
            string checkResult = string.Empty;
            try
            {
                Dictionary<string, string> _checkDic = new Dictionary<string, string>();
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    if (!_checkDic.ContainsKey(dt.Rows[i]["START_TIME"].ToString().Substring(11, 8) +
                                              "|" + dt.Rows[i]["B1"].ToString().Trim()))
                    {
                        _checkDic.Add(dt.Rows[i]["START_TIME"].ToString().Substring(11, 8) +
                                              "|" + dt.Rows[i]["B1"].ToString(), dt.Rows[i]["B1"].ToString());
                    }                    
                }

                for (int i = 0; i < _checkProvArray.Count; i++)
                {
                    if (!_checkDic.ContainsKey(_checkProvArray[i].ToString()))
                    {
                        checkResult += _checkProvArray[i].ToString() + ",";
                    }
                }
                if (!string.IsNullOrEmpty(checkResult))
                {
                    checkResult = checkResult.Substring(0, checkResult.Length - 1);
                }
                return checkResult;
            }
            catch(Exception ex)
            {
                checkResult = "";
                AddErr("���ʡָ��������ʧ��", ex.Message);
                return checkResult;
            }
        }

        private string CheckData(string conType, string bizType,DataTable dt,bool timeFlag)
        {
            string checkResult = string.Empty;
            try
            {
                if (conType == "MSC")
                {
                    Dictionary<string, string> _checkDic = new Dictionary<string, string>();
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        if (!_checkDic.ContainsKey(dt.Rows[i]["START_TIME"].ToString().Substring(11,8) +
                                                  "|" + dt.Rows[i]["MSC"].ToString()))
                        {
                            _checkDic.Add(dt.Rows[i]["START_TIME"].ToString().Substring(11,8) +
                                                  "|" + dt.Rows[i]["MSC"].ToString(),dt.Rows[i]["MSC"].ToString());
                        }
                    }

                    for (int i = 0; i < _checkMscArray.Count; i++)
                    {
                        if (!_checkDic.ContainsKey(_checkMscArray[i].ToString()))
                        {
                            checkResult += _checkMscArray[i].ToString() + ",";
                        }
                    }
                    if (!string.IsNullOrEmpty(checkResult))
                    {
                        checkResult = checkResult.Substring(0, checkResult.Length - 1);
                    }
                }
                else
                {
                    Dictionary<string, string> _checkCityDic = new Dictionary<string, string>();
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        if (dt.Rows[i]["B1"].ToString() == "����")
                        {
                            if (!_checkCityDic.ContainsKey(dt.Rows[i]["START_TIME"].ToString().Substring(11, 8) +
                                                          "|" + dt.Rows[i]["B2"].ToString()))
                            {
                                _checkCityDic.Add(dt.Rows[i]["START_TIME"].ToString().Substring(11, 8) +
                                                          "|" + dt.Rows[i]["B2"].ToString(), dt.Rows[i]["B2"].ToString());
                            }
                        }
                    }

                    for (int i = 0; i < _checkCityArray.Count; i++)
                    {
                        if (!_checkCityDic.ContainsKey(_checkCityArray[i].ToString()))
                        {
                            checkResult += _checkCityArray[i].ToString() + ",";
                        }
                    }
                    if (!string.IsNullOrEmpty(checkResult))
                    {
                        checkResult = checkResult.Substring(0, checkResult.Length - 1);
                    }
                }
                return checkResult;
            }
            catch (Exception ex)
            {
                checkResult = "";                
                AddErr("�����������������ʧ��", ex.Message);
                return checkResult;
            }
        }
        #endregion

        private void nfIcon_MouseDoubleClick(object sender, MouseEventArgs e)
        {            
            Visible = true;
            nfIcon.Visible = false;
        }

        private void disMainToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Visible = true;
            nfIcon.Visible = false;
        }

        private void restartMainToolStripMenuItem_Click(object sender, EventArgs e)
        {
            nfIcon.Visible = false;
            System.Diagnostics.Process.Start(string.Format("{0}\\{1}", Environment.CurrentDirectory,
                                                           "DataCollect.exe"));
            Environment.Exit(-1);
        }

        private void ExcelExportToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                if (bgLog.RowCount < 1)
                {
                    AddMsg("�����ݵ���");
                    return;
                }
                if (DialogResult.OK == saveDlg.ShowDialog(this))
                {
                    string strfilepath = saveDlg.FileName;
                    //gcLog.ExportToXls(strfilepath);
                    ExportToExcelFast(bgLog, strfilepath);
                    AddMsg("����ɹ�");
                }
            }
            catch (Exception ex)
            {
                AddErr("�����ļ�ʧ��", ex.Message);
            }
        }

        #region ����Excel����
        public bool ExportToExcelFast(GridView gv, string saveFileName)
        {
            System.DateTime beginTime;
            System.DateTime afterTime;

            if (gv == null)
                return false;
            beginTime = DateTime.Now;
            Excel.ApplicationClass xlApp = null;
            //Excel.Workbooks workbooks = null;
            Excel.Workbook xlBook = null;
            Excel.Worksheet xlSheet = null;

            //����
            Excel.Range range = null;            

            Excel.Range rangeDataType = null;
            Excel.Range rangeConf = null;
            Excel.Range rangePerf1x = null;
            Excel.Range rangePerfDo = null;           


            List<DictItem> rangeList = new List<DictItem>();

            DataRow dr = null;

            try
            {
                // ����Excel����                    
                xlApp = new Excel.ApplicationClass();
                if (xlApp == null)
                {
                    return false;
                }
                xlApp.Application.DisplayAlerts = false;
                // ����Excel������
                xlBook = xlApp.Workbooks.Add(true);
                DictItem dItem = null;
                string sFieldName = "";
                int nRow = 0;
                //����Ҫ����������(�е��ֶ�û��ʾ�������ֶβ��ܵ���)
                int nCol = 0;
                for (int j = 0; j < gv.Columns.Count; j++)
                {
                    if (!gv.Columns[j].Visible)
                        continue;
                    sFieldName = gv.Columns[j].FieldName.ToString().Trim().ToUpper();
                    if (sFieldName == "DATAROWID" || sFieldName == "ROWID" || sFieldName == "")
                        continue;
                    nCol++;
                }
                if (nCol == 0)
                {                    
                    afterTime = DateTime.Now;
                    KillExcelProcess(beginTime, afterTime);
                    return false;
                }
                else if (nCol > 254)
                    nCol = 254;

                //����Ҫ�������ٸ�sheet
                int nSheetPage = (int) Math.Ceiling((double) gv.RowCount/(double) _MaxRow); //��������ٸ�sheet
                int nSheetRow = _MaxRow;
                nRow = 0;
                for (int j = 0; j < nSheetPage; j++)
                {
                    rangeList.Clear();
                    //��������Ҫ������sheet
                    if (j == nSheetPage - 1)
                        nSheetRow = (gv.RowCount%_MaxRow);
                    //����sheet
                    xlSheet =
                        (Excel.Worksheet) xlBook.Worksheets.Add(Type.Missing, Type.Missing, Type.Missing, Type.Missing);
                                                     

                    // ������������
                    //object[,] objData = new object[nSheetRow + 1,nCol];
                    object[,] objData = new object[nSheetRow + 2, nCol];
                    // ��ȡ�б���
                    int nnCol = 0;

                    for (int x = 0; x < gv.Columns.Count; x++)
                    {
                        if (!gv.Columns[x].Visible)
                            continue;                        
                        if (x <= 2)
                        {
                            objData[0, nnCol] = "��������";
                        }
                        else if (x <= 5&&x>2)
                        {
                            objData[0, nnCol] = "��������";
                        }
                        else if (x <= 8 && x > 5)
                        {
                            objData[0, nnCol] = "1X��������";
                        }
                        else if (x <= 11 && x > 8)                        
                        {
                            objData[0, nnCol] = "DO��������";
                        }
                        else if (x == 12)
                        {
                            objData[0, nnCol] = "1X��������";
                        }
                        else if (x == 13)
                        {
                            objData[0, nnCol] = "DO��������";
                        }
                        nnCol++;
                        if (nnCol >= 254)
                            break;
                    }

                    for (int k = 0; k < gv.Columns.Count; k++)
                    {
                        if (!gv.Columns[k].Visible)
                            continue;
                        sFieldName = gv.Columns[k].FieldName.ToString().Trim().ToUpper();
                        if (sFieldName == "DATAROWID" || sFieldName == "ROWID" || sFieldName == "")
                            continue;
                        objData[1, k] = gv.Columns[k].Caption;
                        //objData[0, nnCol] = gv.Columns[k].Caption;
                        //nnCol++;
                        if (nnCol >= 254)
                            break;
                    }

                    // ��ȡ����
                    for (int k = 2; k <= nSheetRow+1; k++)
                    {
                        if (nRow <= gv.RowCount - 1)
                        {
                            dr = gv.GetDataRow(nRow);
                            if (dr == null)
                            {
                                nRow++;
                                continue;
                            }

                            nnCol = 0;
                            for (int l = 0; l < gv.Columns.Count; l++)
                            {
                                if (!gv.Columns[l].Visible)
                                    continue;
                                try
                                {
                                    sFieldName = gv.Columns[l].FieldName.ToString().Trim().ToUpper();
                                    if (sFieldName == "DATAROWID" || sFieldName == "ROWID" || sFieldName == "")
                                        continue;

                                    string sTemp = dr[sFieldName].ToString();
                                    if (sTemp.Length <= 850)
                                        objData[k, nnCol] = dr[sFieldName]; //" " + sTemp + " ";
                                    else
                                    {
                                        objData[k, nnCol] = "   ";
                                        dItem = new DictItem();
                                        dItem.ItemText = sTemp;
                                        dItem.ItemValue = k;
                                        dItem.Tag = nnCol;
                                        rangeList.Add(dItem);
                                    }

                                }
                                catch
                                {
                                }
                                nnCol++;
                                if (nnCol > 254)
                                    break;
                            }
                        }
                        nRow++;
                        Application.DoEvents();
                    }
                    // д��Excel
                    range = xlSheet.get_Range(xlSheet.Cells[1, 1], xlSheet.Cells[nSheetRow + 2, nCol]);
                    range.HorizontalAlignment = Excel.Constants.xlCenter;
                    //range.NumberFormatLocal = "@";
                    //range.NumberFormat = "@";
                    try
                    {
                        range.Value2 = objData;                                               
                    }
                    catch
                    {
                    }
                    for (int m = 0; m < rangeList.Count; m++)
                    {
                        dItem = rangeList[m];
                        range = xlSheet.get_Range(xlSheet.Cells[Convert.ToInt32(dItem.ItemValue) + 2,
                                                                Convert.ToInt32(dItem.Tag) + 1],
                                                  xlSheet.Cells[
                                                      Convert.ToInt32(dItem.ItemValue) + 2,
                                                      Convert.ToInt32(dItem.Tag) + 1]);
                        range.Value2 = dItem.ItemText;
                    }
                    rangeList.Clear();
                    xlSheet.Columns.EntireColumn.AutoFit(); //�п�����Ӧ��

                    //�ϲ���ͷ
                    rangeDataType = xlSheet.get_Range("A1", "C1");
                    rangeDataType.MergeCells = true;                    
                    rangeDataType.HorizontalAlignment = Excel.Constants.xlCenter;                      

                    rangeConf = xlSheet.get_Range("D1", "F1");
                    rangeConf.MergeCells = true;
                    rangeConf.HorizontalAlignment = Excel.Constants.xlCenter;                      

                    rangePerf1x = xlSheet.get_Range("G1", "I1");
                    rangePerf1x.MergeCells = true;
                    rangePerf1x.HorizontalAlignment = Excel.Constants.xlCenter;                      

                    rangePerfDo = xlSheet.get_Range("J1", "L1");
                    rangePerfDo.MergeCells = true;                    
                    rangePerfDo.HorizontalAlignment = Excel.Constants.xlCenter;                      
                    
                }
            }
            catch (Exception err)
            {                
                afterTime = DateTime.Now;
                KillExcelProcess(beginTime, afterTime);
                AddErr("�����ļ�ʱ����,�ļ����������򿪣�\n", err.Message);
                return false;
            }

            // ����
            try
            {                
                xlBook.Saved = true;
                xlBook.SaveCopyAs(saveFileName);
                xlApp.Workbooks.Close();
                xlApp.Quit();
                xlApp.Application.Quit();
                System.Runtime.InteropServices.Marshal.ReleaseComObject(range);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(rangeDataType);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(rangeConf);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(rangePerf1x);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(rangePerfDo);               
                System.Runtime.InteropServices.Marshal.ReleaseComObject(xlSheet);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(xlBook);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(xlApp);                        
                AddMsg("�����ѵ�����" + saveFileName + "�ļ���");
            }
            catch (Exception err)
            {                
                afterTime = DateTime.Now;
                KillExcelProcess(beginTime, afterTime);
                AddMsg("�����ļ�ʱ����,�ļ����������򿪣�\n" + err.Message);
                return false;
            }            
            finally
            {                
                afterTime = DateTime.Now;
                KillExcelProcess(beginTime, afterTime);                
            }
            return true;
        }
        #endregion

        #region ɱ����
        public void KillExcelProcess(System.DateTime beginTime, System.DateTime afterTime)
        {
            try
            {
                System.Diagnostics.Process[] excelProcess = System.Diagnostics.Process.GetProcessesByName("EXCEL");

                foreach (System.Diagnostics.Process process in excelProcess)
                {
                    if (process != null)
                    {
                        if (process.StartTime > beginTime && process.StartTime < afterTime)
                        {
                            process.Kill();                            
                        }
                    }
                }
            }
            catch(Exception ex)
            {
                AddErr("����excel����ʧ��", ex.Message);
            }
        }
        #endregion

        //�����¹淶�����ӵ�Ŀ¼2011-1-8 chenwz
        void CreateNewFiles()
        {
            try
            {                
                string complaintFilesPath=string.Format("{0}\\{1}\\{2}",_localRootPath,_proEnName,ConstComplaint);
                if (!Directory.Exists(complaintFilesPath))
                {
                    Directory.CreateDirectory(complaintFilesPath);
                }

                string paraFilesPath = string.Format("{0}\\{1}\\{2}", _localRootPath, _proEnName, ConstPara);
                if (!Directory.Exists(paraFilesPath))
                {
                    Directory.CreateDirectory(paraFilesPath);
                }                

                string worktestFilesPath = string.Format("{0}\\{1}\\{2}", _localRootPath, _proEnName, ConstWorkTest);
                if (!Directory.Exists(worktestFilesPath))
                {
                    Directory.CreateDirectory(worktestFilesPath);
                }

                string vergesiteFilesPath = string.Format("{0}\\{1}\\{2}", _localRootPath, _proEnName, ConstVergeSite);
                if (!Directory.Exists(vergesiteFilesPath))
                {
                    Directory.CreateDirectory(vergesiteFilesPath);
                }
            }
            catch (Exception ex)
            {
                AddErr("��������Ŀ¼ʧ��", ex.Message);
            }
        }

        //��������Ŀ¼
        void CreateBackFiles()
        {            
            try
            {
                string confFilesPath = string.Format("{0}\\{1}\\{2}\\{3}", _localRootPath,_proEnName,ConstBackUp,ConstConf);
                if (!Directory.Exists(confFilesPath))
                {
                    Directory.CreateDirectory(confFilesPath);
                }

                string perfFilesPath = string.Format("{0}\\{1}\\{2}\\{3}", _localRootPath, _proEnName,ConstBackUp,ConstPerf);
                if (!Directory.Exists(perfFilesPath))
                {
                    Directory.CreateDirectory(perfFilesPath);
                }

                string cdlFilesPath = string.Format("{0}\\{1}\\{2}\\{3}", _localRootPath, _proEnName,ConstBackUp,ConstCdl);
                if (!Directory.Exists(cdlFilesPath))
                {
                    Directory.CreateDirectory(cdlFilesPath);
                }

                string workFilesPath = string.Format("{0}\\{1}\\{2}\\{3}", _localRootPath, _proEnName, ConstBackUp, ConstWork);
                if (!Directory.Exists(workFilesPath))
                {
                    Directory.CreateDirectory(workFilesPath);
                }

                string complaintFilesPath=string.Format("{0}\\{1}\\{2}\\{3}",_localRootPath,_proEnName,ConstBackUp,ConstComplaint);
                if (!Directory.Exists(complaintFilesPath))
                {
                    Directory.CreateDirectory(complaintFilesPath);
                }

                string paraFilesPath = string.Format("{0}\\{1}\\{2}\\{3}", _localRootPath, _proEnName,ConstBackUp,ConstPara);
                if (!Directory.Exists(paraFilesPath))
                {
                    Directory.CreateDirectory(paraFilesPath);
                }                

                string worktestFilesPath = string.Format("{0}\\{1}\\{2}\\{3}", _localRootPath, _proEnName,ConstBackUp,ConstWorkTest);
                if (!Directory.Exists(worktestFilesPath))
                {
                    Directory.CreateDirectory(worktestFilesPath);
                }

                string vergesiteFilesPath = string.Format("{0}\\{1}\\{2}\\{3}", _localRootPath, _proEnName, ConstBackUp, ConstVergeSite);
                if (!Directory.Exists(vergesiteFilesPath))
                {
                    Directory.CreateDirectory(vergesiteFilesPath);
                }

            }
            catch(Exception ex)
            {
                AddErr("��������Ŀ¼ʧ��", ex.Message);
            }
        }

        //ɾ�����ݵ��ļ�
        void DeleteBackFiles()
        {            
            try
            {
                DirectoryInfo diConf=new DirectoryInfo(string.Format("{0}\\{1}\\{2}\\{3}",_localRootPath,_proEnName,ConstBackUp,ConstConf));
                FileSystemInfo[] fsi=diConf.GetFileSystemInfos();                                
                if(fsi.Length>0)
                {
                    foreach(FileSystemInfo fs in fsi)
                    {
                        string strDateFormat = "yyyyMMdd";
                        string filename = fs.FullName;
                        int pos = filename.LastIndexOf('_');
                        string temp = filename.Substring(pos + 1);
                        DateTime filedate = new DateTime();
                        if (temp.Length == 5)
                        {                            
                            string tempdate = filename.Substring(pos - 8, 8).ToString();
                            filedate = DateTime.ParseExact(tempdate, strDateFormat, new System.Globalization.CultureInfo("zh-CN"));                                                       
                        }
                        else
                        {
                            string tempdate = filename.Substring(pos + 1, 8).ToString();
                            filedate = DateTime.ParseExact(tempdate, strDateFormat, new System.Globalization.CultureInfo("zh-CN"));                            
                        }                                                
                        if (filedate.AddDays(14) < DateTime.Now)
                        {
                            File.Delete(filename);
                        }
                    }                    
                }
            }
            catch(Exception ex)
            {
                AddErr("ɾ�����ݵ������ļ�����", ex.Message);
            }

            try
            {
                DirectoryInfo diPerf = new DirectoryInfo(string.Format("{0}\\{1}\\{2}\\{3}", _localRootPath, _proEnName, ConstBackUp, ConstPerf));
                FileSystemInfo[] fsi = diPerf.GetFileSystemInfos();
                if(fsi.Length>0)
                {
                    foreach (FileSystemInfo fs in fsi)
                    {
                        string strDateFormat = "yyyyMMdd";
                        string filename = fs.FullName;
                        int pos = filename.LastIndexOf('_');
                        string temp = filename.Substring(pos + 1);
                        DateTime filedate = new DateTime();
                        if (temp.Length == 5)
                        {
                            string tempdate = filename.Substring(pos - 8, 8).ToString();
                            filedate = DateTime.ParseExact(tempdate, strDateFormat, new System.Globalization.CultureInfo("zh-CN"));
                        }
                        else
                        {
                            string tempdate = filename.Substring(pos + 1, 8).ToString();
                            filedate = DateTime.ParseExact(tempdate, strDateFormat, new System.Globalization.CultureInfo("zh-CN"));
                        }
                        if (filedate.AddDays(14) < DateTime.Now)
                        {
                            File.Delete(filename);
                        }
                    }                    
                }
            }
            catch(Exception ex) 
            {
                AddErr("ɾ�����ݵ������ļ�����", ex.Message);
            }

            try
            {
                DirectoryInfo diCdl = new DirectoryInfo(string.Format("{0}\\{1}\\{2}\\{3}", _localRootPath, _proEnName, ConstBackUp, ConstCdl));
                FileSystemInfo[] fsi = diCdl.GetFileSystemInfos();                
                if(fsi.Length>0)
                {
                    foreach (FileSystemInfo fs in fsi)
                    {
                        string strDateFormat = "yyyyMMdd";
                        string filename = fs.FullName;
                        int pos = filename.LastIndexOf('_');
                        string temp = filename.Substring(pos + 1);
                        DateTime filedate = new DateTime();
                        if (temp.Length == 8)
                        {
                            string tempdate = filename.Substring(pos - 10, 8).ToString();
                            filedate = DateTime.ParseExact(tempdate, strDateFormat, new System.Globalization.CultureInfo("zh-CN"));
                        }
                        else
                        {
                            string tempdate = filename.Substring(pos + 1, 8).ToString();
                            filedate = DateTime.ParseExact(tempdate, strDateFormat, new System.Globalization.CultureInfo("zh-CN"));
                        }
                        if (filedate.AddDays(14) < DateTime.Now)
                        {
                            File.Delete(filename);
                        }
                    }                    
                }
            }
            catch(Exception ex) 
            {
                AddErr("ɾ�����ݵĻ����ļ�����", ex.Message);
            }

            //ɾ��14��ǰ������
            try
            {
                string time = DateTime.Now.AddDays(-14).ToString("yyyy-MM-dd");
                _bizLayer.DeleteBackData(time);
            }
            catch(Exception ex)
            {
                AddErr("ɾ��14��ǰ�����ݳ���", ex.Message);
            }

        }

        private void HandleIndexMsc1X(DataTable dt,Dictionary<string,string> dicValid,Dictionary<string,string> dicID,Dictionary<string,string> dicResValid,Dictionary<string,string> dicResID)
        {
            try
            {
                if (dt != null && dt.Rows.Count > 0)
                {
                    string rate1x = _bizLayer.GetRateIndex(1);
                    string[] rate = null;
                    ArrayList rateArray = new ArrayList();
                    if (!string.IsNullOrEmpty(rate1x))
                    {
                        rate = rate1x.Split(',');
                        foreach (string s in rate)
                        {
                            rateArray.Add("ID" + s);
                        }
                    }                    

                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        for (int j = 0; j < dt.Columns.Count; j++)
                        {                            
                            if (dt.Rows[i][j] == DBNull.Value)//�ж��Ƿ�Ϊ��,Ϊ�ղŴ���
                            {                               
                                try
                                {
                                    DataTable dtAvg = _bizLayer.GetAvg5DataMSC(Convert.ToDateTime(dt.Rows[i]["START_TIME"].ToString()), 1, 1, dt.Rows[i]["MSC"].ToString());
                                    for (int x = 5; x < dt.Columns.Count; x++)//����һ�е�����ÿһ�ж���ǰ5���ƽ�������滻
                                    {
                                        object obj = dtAvg.Compute(string.Format("avg({0})", dt.Columns[x].ColumnName), "");
                                        if (obj != DBNull.Value)
                                        {
                                            if (rateArray.Contains(dt.Columns[x].ColumnName))
                                            {
                                                obj = Math.Round(Convert.ToDouble(obj), 2);
                                            }
                                            else
                                            {
                                                obj = Math.Round(Convert.ToDouble(obj), 0);
                                            }
                                        }
                                        dt.Rows[i][x] = obj;
                                    }
                                    break;
                                }
                                catch(Exception ex)
                                {
                                    AddErr("MSC����1Xָ��ȡƽ��ֵ����", ex.Message);
                                }                                      
                             }                                
                        }
                    }
                }                
            }
            catch (Exception ex)
            {
                AddErr("MSC����1Xָ�괦�����", ex.Message);
            }
        }

        private void HandleIndexMscDo(DataTable dt, Dictionary<string, string> dicValid, Dictionary<string, string> dicID, Dictionary<string, string> dicResValid, Dictionary<string, string> dicResID)
        {
            try
            {
                if (dt != null && dt.Rows.Count > 0)
                {

                    string rateDo = _bizLayer.GetRateIndex(2);
                    string[] rate = null;
                    ArrayList rateArray = new ArrayList();
                    if (!string.IsNullOrEmpty(rateDo))
                    {
                        rate = rateDo.Split(',');
                        foreach (string s in rate)
                        {
                            rateArray.Add("ID" + s);
                        }
                    }                    

                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        for (int j = 0; j < dt.Columns.Count; j++)
                        {
                            if (dt.Rows[i][j] == DBNull.Value)//�ж��Ƿ�Ϊ��,Ϊ�ղŴ���
                            {                                
                                try
                                {
                                    DataTable dtAvg = _bizLayer.GetAvg5DataMSC(Convert.ToDateTime(dt.Rows[i]["START_TIME"].ToString()), 2, 1, dt.Rows[i]["MSC"].ToString());
                                    for (int x = 5; x < dt.Columns.Count; x++)//����һ�е�����ÿһ�ж���ǰ5���ƽ�������滻
                                    {
                                        object obj = dtAvg.Compute(string.Format("avg({0})", dt.Columns[x].ColumnName), "");
                                        if (obj != DBNull.Value)
                                        {
                                            if (rateArray.Contains(dt.Columns[x].ColumnName))
                                            {
                                                obj = Math.Round(Convert.ToDouble(obj), 2);
                                            }
                                            else
                                            {
                                                obj = Math.Round(Convert.ToDouble(obj), 0);
                                            }
                                        }
                                        dt.Rows[i][x] = obj;
                                    }
                                    break;                                    
                                }
                                catch(Exception ex)
                                {
                                    AddErr("MSC����DOָ��ȡƽ��ֵ����", ex.Message);
                                }                                                                   
                            }
                        }
                    }
                }
            }
            catch(Exception ex)
            {
                AddErr("MSC����DOָ�괦�����", ex.Message);
            }
        }

        private void HandleIndexCity1X(DataTable dt, Dictionary<string, string> dicValid, Dictionary<string, string> dicID, Dictionary<string, string> dicResValid, Dictionary<string, string> dicResID)
        {
            try
            {
                if (dt != null && dt.Rows.Count > 0)
                {

                    string rate1x = _bizLayer.GetRateIndex(1);
                    string[] rate = null;
                    ArrayList rateArray = new ArrayList();
                    if (!string.IsNullOrEmpty(rate1x))
                    {
                        rate = rate1x.Split(',');
                        foreach (string s in rate)
                        {
                            rateArray.Add("ID" + s);
                        }
                    }                                     
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        for (int j = 0; j < dt.Columns.Count; j++)
                        {
                            if (dt.Rows[i][j] == DBNull.Value)//�ж��Ƿ�Ϊ��,Ϊ�ղŴ���
                            {                                                                         
                                try
                                {
                                    DataTable dtAvg = _bizLayer.GetAvg5DataCity(Convert.ToDateTime(dt.Rows[i]["START_TIME"].ToString()), 1, 2, dt.Rows[i]["B2"].ToString());
                                    for (int x = 5; x < dt.Columns.Count; x++)//����һ�е�����ÿһ�ж���ǰ5���ƽ�������滻
                                    {
                                        object obj = dtAvg.Compute(string.Format("avg({0})", dt.Columns[x].ColumnName), "");
                                        if (obj != DBNull.Value)
                                        {
                                            if (rateArray.Contains(dt.Columns[x].ColumnName))
                                            {
                                                obj = Math.Round(Convert.ToDouble(obj), 2);
                                            }
                                            else
                                            {
                                                obj = Math.Round(Convert.ToDouble(obj), 0);
                                            }
                                        }
                                        dt.Rows[i][x] = obj;
                                    }                                                
                                    break;
                                }
                                catch(Exception ex)
                                {
                                    AddErr("CITY����1Xָ��ȡƽ��ֵ����", ex.Message);
                                }                                                                                                                                   
                            }
                        }                        
                    }
                }
            }
            catch(Exception ex)
            {
                AddErr("CITY����1Xָ�괦�����", ex.Message);
            }
        }

        private void HandleIndexCityDo(DataTable dt, Dictionary<string, string> dicValid, Dictionary<string, string> dicID, Dictionary<string, string> dicResValid, Dictionary<string, string> dicResID)
        {
            try
            {
                if (dt != null && dt.Rows.Count > 0)
                {

                    string rateDo = _bizLayer.GetRateIndex(2);
                    string[] rate = null;
                    ArrayList rateArray = new ArrayList();
                    if (!string.IsNullOrEmpty(rateDo))
                    {
                        rate = rateDo.Split(',');
                        foreach (string s in rate)
                        {
                            rateArray.Add("ID" + s);
                        }
                    }                    
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        for (int j = 0; j < dt.Columns.Count; j++)
                        {
                            if (dt.Rows[i][j] == DBNull.Value)//�ж��Ƿ�Ϊ��,Ϊ�ղŴ���
                            {                                
                                try
                                {                                    
                                    DataTable dtAvg = _bizLayer.GetAvg5DataCity(Convert.ToDateTime(dt.Rows[i]["START_TIME"].ToString()), 2, 2, dt.Rows[i]["B2"].ToString());
                                    for (int x = 5; x < dt.Columns.Count; x++)//����һ�е�����ÿһ�ж���ǰ5���ƽ�������滻
                                    {                                        
                                        object obj = dtAvg.Compute(string.Format("avg({0})", dt.Columns[x].ColumnName), "");
                                        if (obj != DBNull.Value)
                                        {
                                            if (rateArray.Contains(dt.Columns[x].ColumnName))
                                            {
                                                obj = Math.Round(Convert.ToDouble(obj), 2);
                                            }
                                            else
                                            {
                                                obj = Math.Round(Convert.ToDouble(obj), 0);
                                            }
                                        }
                                        dt.Rows[i][x] = obj;
                                    }
                                    break;
                                }
                                catch(Exception ex)
                                {
                                    AddErr("CITY����DOָ��ȡƽ��ֵ����", ex.Message);
                                }                                
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                AddErr("CITY����DOָ�괦�����", ex.Message);
            }
        }

        #region �ж��ϱ�ָ��׼ȷ��,����в�׼ȷ����дlog

        //�ж�MSC����1Xָ��׼ȷ��
        private void CheckIndexMsc1X()
        {
            try
            {
                if (dtMsc1X != null && dtMsc1X.Rows.Count > 0)
                {
                    //����Դ��
                    Dictionary<string, string> dicRelation = new Dictionary<string, string>();
                    //����Դ�๫ʽ�Ƿ���Ч
                    //Dictionary<string, string> dicRelationValid = new Dictionary<string, string>();

                    //��Դ��
                    Dictionary<string, string> dicResRelation = new Dictionary<string, string>();
                    //��Դ�๫ʽ�Ƿ���Ч
                    //Dictionary<string, string> dicResRelationValid = new Dictionary<string, string>();

                    //��֤��������
                    Dictionary<string, DataRow> dicData = new Dictionary<string, DataRow>();

                    _bizLayer.GetCheckColumn(1, "ZY0808", out dicRelation);
                    //_bizLayer.GetCheckColumnValid(1, out dicRelationValid);
                    _bizLayer.GetResCheckColumn(1, "ZY0808", out dicResRelation);
                    //_bizLayer.GetResCheckColumnValid(1, out dicResRelationValid);
                    _bizLayer.GetCheckConfigData(1, 1, 1, out dicData);

                    if (dicData.Count > 0)//����ȷ�Ե����ò��ж�ָ�����ȷ��
                    {
                        foreach (DataRow dr in dtMsc1X.Rows)//ѭ���ϱ������
                        {
                            foreach (string key in dicData.Keys)//ѭ��ָ������(���ֵ����Сֵ)
                            {
                                if (dicData[key]["MAX_VALUE"] == DBNull.Value || dicData[key]["MIN_VALUE"] == DBNull.Value)
                                    continue;
                                double maxvalue = double.Parse(dicData[key]["MAX_VALUE"].ToString());
                                double minvalue = double.Parse(dicData[key]["MIN_VALUE"].ToString());
                                if (dicRelation.ContainsKey(key))
                                {

                                    //����null���߲��ڲο�ֵ��Χ�ھ����
                                    if (dr[dicData[key]["REF_COL"].ToString()] == DBNull.Value || !(Convert.ToDouble(dr[dicData[key]["REF_COL"].ToString()]) >= minvalue && Convert.ToDouble(dr[dicData[key]["REF_COL"].ToString()]) <= maxvalue))
                                    {
                                        _bizLayer.InsertAbnormalData(dr["START_TIME"].ToString(), dicData[key]["EN_NAME"].ToString(),
                                            dicData[key]["CHN_NAME"].ToString(), "MSC", dr["MSC"].ToString(), dr[dicData[key]["REF_COL"].ToString()].ToString(),
                                            minvalue.ToString() + "-" + maxvalue.ToString());
                                    }

                                }
                                if (dicResRelation.ContainsKey(key))
                                {
                                    ////����null���߲��ڲο�ֵ��Χ�ھ����
                                    if (dr[dicData[key]["REF_COL"].ToString()] == DBNull.Value || !(Convert.ToDouble(dr[dicData[key]["REF_COL"].ToString()]) >= minvalue && Convert.ToDouble(dr[dicData[key]["REF_COL"].ToString()]) <= maxvalue))
                                    {
                                        _bizLayer.InsertAbnormalData(dr["START_TIME"].ToString(), dicData[key]["EN_NAME"].ToString(),
                                            dicData[key]["CHN_NAME"].ToString(), "MSC", dr["MSC"].ToString(), dr[dicData[key]["REF_COL"].ToString()].ToString(),
                                            minvalue.ToString() + "-" + maxvalue.ToString());
                                    }
                                }
                            }
                        }
                    }                    
                }
            }
            catch(Exception ex)
            {
                AddErr("MSC����1Xָ��׼ȷ�Լ�����", ex.Message);
            }
        }

        //�ж�MSC����Doָ��׼ȷ��
        private void CheckIndexMscDo()
        {
            try
            {
                if (dtMscDo != null && dtMscDo.Rows.Count > 0)
                {
                    //����Դ��
                    Dictionary<string, string> dicRelation = new Dictionary<string, string>();

                    //��Դ��
                    Dictionary<string, string> dicResRelation = new Dictionary<string, string>();

                    //��֤��������
                    Dictionary<string, DataRow> dicData = new Dictionary<string, DataRow>();

                    _bizLayer.GetCheckColumn(2, "ZY0808", out dicRelation);
                    _bizLayer.GetResCheckColumn(2, "ZY0808", out dicResRelation);
                    _bizLayer.GetCheckConfigData(2, 1, 1, out dicData);
                    if (dicData.Count > 0)//����ȷ�Ե����ò��ж�ָ�����ȷ��
                    {
                        foreach (DataRow dr in dtMscDo.Rows)//ѭ���ϱ������
                        {
                            foreach (string key in dicData.Keys)//ѭ��ָ������(���ֵ����Сֵ)
                            {
                                double maxvalue = double.Parse(dicData[key]["MAX_VALUE"].ToString());
                                double minvalue = double.Parse(dicData[key]["MIN_VALUE"].ToString());
                                if (dicRelation.ContainsKey(key))
                                {
                                    ////����null���߲��ڲο�ֵ��Χ�ھ����
                                    if (dr[dicData[key]["REF_COL"].ToString()] == DBNull.Value || !(Convert.ToDouble(dr[dicData[key]["REF_COL"].ToString()]) >= minvalue && Convert.ToDouble(dr[dicData[key]["REF_COL"].ToString()]) <= maxvalue))
                                    {
                                        _bizLayer.InsertAbnormalData(dr["START_TIME"].ToString(), dicData[key]["EN_NAME"].ToString(),
                                            dicData[key]["CHN_NAME"].ToString(), "MSC", dr["MSC"].ToString(), dr[dicData[key]["REF_COL"].ToString()].ToString(),
                                            minvalue.ToString() + "-" + maxvalue.ToString());
                                    }

                                }
                                if (dicResRelation.ContainsKey(key))
                                {
                                    ////����null���߲��ڲο�ֵ��Χ�ھ����
                                    if (dr[dicData[key]["REF_COL"].ToString()] == DBNull.Value || !(Convert.ToDouble(dr[dicData[key]["REF_COL"].ToString()]) >= minvalue && Convert.ToDouble(dr[dicData[key]["REF_COL"].ToString()]) <= maxvalue))
                                    {
                                        _bizLayer.InsertAbnormalData(dr["START_TIME"].ToString(), dicData[key]["EN_NAME"].ToString(),
                                            dicData[key]["CHN_NAME"].ToString(), "MSC", dr["MSC"].ToString(), dr[dicData[key]["REF_COL"].ToString()].ToString(),
                                            minvalue.ToString() + "-" + maxvalue.ToString());
                                    }
                                }
                            }
                        }
                    }
                }
            }
            catch(Exception ex)
            {
                AddErr("MSC����DOָ��׼ȷ�Լ�����", ex.Message);
            }
        }

        //�ж�City����1Xָ��׼ȷ��
        private void CheckIndexCity1X()
        {
            try
            {
                if (dtCity1X != null && dtCity1X.Rows.Count > 0)
                {
                    //����Դ��
                    Dictionary<string, string> dicRelation = new Dictionary<string, string>();

                    //��Դ��
                    Dictionary<string, string> dicResRelation = new Dictionary<string, string>();

                    //��֤��������
                    Dictionary<string, DataRow> dicData = new Dictionary<string, DataRow>();

                    _bizLayer.GetCheckColumn(1, "ZY0808", out dicRelation);
                    _bizLayer.GetResCheckColumn(1, "ZY0808", out dicResRelation);
                    _bizLayer.GetCheckConfigData(1, 1, 1, out dicData);
                    if (dicData.Count > 0)//����ȷ�Ե����ò��ж�ָ�����ȷ��
                    {
                        foreach (DataRow dr in dtCity1X.Rows)//ѭ���ϱ������
                        {
                            foreach (string key in dicData.Keys)//ѭ��ָ������(���ֵ����Сֵ)
                            {
                                double maxvalue = double.Parse(dicData[key]["MAX_VALUE"].ToString());
                                double minvalue = double.Parse(dicData[key]["MIN_VALUE"].ToString());
                                if (dicRelation.ContainsKey(key))
                                {
                                    //����null���߲��ڲο�ֵ��Χ�ھ����
                                    if (dr[dicData[key]["REF_COL"].ToString()] == DBNull.Value || !(Convert.ToDouble(dr[dicData[key]["REF_COL"].ToString()]) >= minvalue && Convert.ToDouble(dr[dicData[key]["REF_COL"].ToString()]) <= maxvalue))
                                    {
                                        _bizLayer.InsertAbnormalData(dr["START_TIME"].ToString(), dicData[key]["EN_NAME"].ToString(),
                                            dicData[key]["CHN_NAME"].ToString(), "City", dr["B2"].ToString(), dr[dicData[key]["REF_COL"].ToString()].ToString(),
                                            minvalue.ToString() + "-" + maxvalue.ToString());
                                    }

                                }
                                if (dicResRelation.ContainsKey(key))
                                {
                                    //����null���߲��ڲο�ֵ��Χ�ھ����
                                    if (dr[dicData[key]["REF_COL"].ToString()] == DBNull.Value || !(Convert.ToDouble(dr[dicData[key]["REF_COL"].ToString()]) >= minvalue && Convert.ToDouble(dr[dicData[key]["REF_COL"].ToString()]) <= maxvalue))
                                    {
                                        _bizLayer.InsertAbnormalData(dr["START_TIME"].ToString(), dicData[key]["EN_NAME"].ToString(),
                                            dicData[key]["CHN_NAME"].ToString(), "City", dr["B2"].ToString(), dr[dicData[key]["REF_COL"].ToString()].ToString(),
                                            minvalue.ToString() + "-" + maxvalue.ToString());
                                    }
                                }
                            }
                        }
                    }
                }
            }
            catch(Exception ex)
            {
                AddErr("City����1Xָ��׼ȷ�Լ�����", ex.Message);
            }
        }

        //�ж�City����Doָ��׼ȷ��
        private void CheckIndexCityDo()
        {
            try
            {
                if (dtCityDo != null && dtCityDo.Rows.Count > 0)
                {
                    //����Դ��
                    Dictionary<string, string> dicRelation = new Dictionary<string, string>();

                    //��Դ��
                    Dictionary<string, string> dicResRelation = new Dictionary<string, string>();

                    //��֤��������
                    Dictionary<string, DataRow> dicData = new Dictionary<string, DataRow>();

                    _bizLayer.GetCheckColumn(2, "ZY0808", out dicRelation);
                    _bizLayer.GetResCheckColumn(2, "ZY0808", out dicResRelation);
                    _bizLayer.GetCheckConfigData(2, 1, 1, out dicData);
                    if (dicData.Count > 0)//����ȷ�Ե����ò��ж�ָ�����ȷ��
                    {
                        foreach (DataRow dr in dtCityDo.Rows)//ѭ���ϱ������
                        {
                            foreach (string key in dicData.Keys)//ѭ��ָ������(���ֵ����Сֵ)
                            {
                                double maxvalue = double.Parse(dicData[key]["MAX_VALUE"].ToString());
                                double minvalue = double.Parse(dicData[key]["MIN_VALUE"].ToString());
                                if (dicRelation.ContainsKey(key))
                                {
                                    //����null���߲��ڲο�ֵ��Χ�ھ����
                                    if (dr[dicData[key]["REF_COL"].ToString()] == DBNull.Value || !(Convert.ToDouble(dr[dicData[key]["REF_COL"].ToString()]) >= minvalue && Convert.ToDouble(dr[dicData[key]["REF_COL"].ToString()]) <= maxvalue))
                                    {
                                        _bizLayer.InsertAbnormalData(dr["START_TIME"].ToString(), dicData[key]["EN_NAME"].ToString(),
                                            dicData[key]["CHN_NAME"].ToString(), "City", dr["B2"].ToString(), dr[dicData[key]["REF_COL"].ToString()].ToString(),
                                            minvalue.ToString() + "-" + maxvalue.ToString());
                                    }

                                }
                                if (dicResRelation.ContainsKey(key))
                                {
                                    //����null���߲��ڲο�ֵ��Χ�ھ����
                                    if (dr[dicData[key]["REF_COL"].ToString()] == DBNull.Value || !(Convert.ToDouble(dr[dicData[key]["REF_COL"].ToString()]) >= minvalue && Convert.ToDouble(dr[dicData[key]["REF_COL"].ToString()]) <= maxvalue))
                                    {
                                        _bizLayer.InsertAbnormalData(dr["START_TIME"].ToString(), dicData[key]["EN_NAME"].ToString(),
                                            dicData[key]["CHN_NAME"].ToString(), "City", dr["B2"].ToString(), dr[dicData[key]["REF_COL"].ToString()].ToString(),
                                            minvalue.ToString() + "-" + maxvalue.ToString());
                                    }
                                }
                            }
                        }
                    }
                }
            }
            catch(Exception ex)
            {
                AddErr("City����DOָ��׼ȷ�Լ�����", ex.Message);
            }
        }
        #endregion

        #region ���������ϱ����ݰ�ť
        private void btnConfSector_Click(object sender, EventArgs e)
        {
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), false);
            ConfCollect(DataDate.DateTime, "SECTOR");            
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), true);
        }

        private void btnConfHot_Click(object sender, EventArgs e)
        {
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), false);
            ConfCollect(DataDate.DateTime, "WLANHP");
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), true);
        }

        private void btnConfBlind_Click(object sender, EventArgs e)
        {
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), false);
            ConfCollect(DataDate.DateTime, "BLINDPOINT");
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), true);
        }

        private void btnVipCdl101X_Click(object sender, EventArgs e)
        {
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), false);
            VipCdlCollect(DataDate.DateTime, "MORNING", "1X");            
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), true);
        }

        private void btnVipCdl10DO_Click(object sender, EventArgs e)
        {
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), false);
            VipCdlCollect(DataDate.DateTime, "MORNING", "DO");            
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), true);
        }

        private void btnVipCdl201X_Click(object sender, EventArgs e)
        {
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), false);
            VipCdlCollect(DataDate.DateTime, "EVENING", "1X");
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), true);
        }

        private void btnVipCdl20DO_Click(object sender, EventArgs e)
        {
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), false);
            VipCdlCollect(DataDate.DateTime, "EVENING", "DO");
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), true);
        }

        private void btnWorkTest_Click(object sender, EventArgs e)
        {
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), false);
            TestCollect(DataDate.DateTime, "CITYHP");
            TestCollect(DataDate.DateTime, "CITYROAD");
            TestCollect(DataDate.DateTime, "VILLAGE");
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), true);
        }
      
        private void btnComplaintDo_Click(object sender, EventArgs e)
        {
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), false);
            ComplaintCollect(DataDate.DateTime, "DO");            
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), true);
        }

        private void btnComplaint1X_Click(object sender, EventArgs e)
        {
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), false);
            ComplaintCollect(DataDate.DateTime, "1X");
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), true);
        }
        

        private void btnUseStat_Click(object sender, EventArgs e)
        {
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), false);
            UseCollect(DataDate.DateTime);            
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), true);
        }

        private void btnBorderPara_Click(object sender, EventArgs e)
        {
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), false);
            Para(DataDate.DateTime);                       
            BeginInvoke(new SetButtonStatusHandler(SetButtonStatus), true);
        }

        #endregion


        private void Para(DateTime updateTime)
        {
            try
            {
                foreach (DataRow dr in _dtVendor.Rows)
                {
                    if (dr["VENDOR"].ToString() == "ZY0808")//��Ϊ(��ΪĿǰ����Ƶ��Ƶ������,ֻ�ϱ�ͬƵ��Ƶ������)
                    {
                        //Ŀǰ��Ϊ�Ĳ�������ȫ����Ҫ����,���������ϱ���

                        ParaCollect(DataDate.DateTime, dr["VENDOR"].ToString(), "1X", "CARR", "SF");//��Ϊ1XͬƵ��Ƶ��
                        ParaCollect(DataDate.DateTime,dr["VENDOR"].ToString(),"1X","CARR","DF");//��Ϊ1X��Ƶ��Ƶ��
                        ParaCollect(DataDate.DateTime, dr["VENDOR"].ToString(), "DO", "CARR", "SF");//��ΪDOͬƵ��Ƶ��
                        ParaCollect(DataDate.DateTime,dr["VENDOR"].ToString(),"DO","CARR","DF");//��ΪDO��Ƶ��Ƶ��
                    }
                    else if (dr["VENDOR"].ToString() == "ZY0804")//����
                    {
                        ParaCollect(DataDate.DateTime, dr["VENDOR"].ToString(), "1X", "CELL", "");//����1X������(�ڽ�С��)
                        ParaCollect(DataDate.DateTime, dr["VENDOR"].ToString(), "1X", "CARR", "");//����1X��Ƶ��(ͬƵ&��Ƶ)

                        ParaCollect(DataDate.DateTime, dr["VENDOR"].ToString(), "DO", "CARR", "");//����DO��Ƶ��(ͬƵ&��Ƶ)

                    }
                    else//��Ѷ(��Ѷ����Ƶ������,ֻ�ϱ�����������)
                    {
                        ParaCollect(DataDate.DateTime, dr["VENDOR"].ToString(), "1X", "CELL", "SF");//����1X������(ͬƵ) ����1X�������޲�������
                        //ParaCollect(DataDate.DateTime, dr["VENDOR"].ToString(), "1X", "CARR", "DF");//����1X��Ƶ��(��Ƶ) Ŀǰ���ʵ�����ֻ�ɵ�������,����Ƶ��
                        ParaCollect(DataDate.DateTime, dr["VENDOR"].ToString(), "DO", "CELL", "");//����DO��������
                    }
                }
            }
            catch (Exception ex)
            {
                AddErr("ѭ�������ϱ��߽������������ݳ���", ex.Message);
            }
        }

        //�㶫��ʱ�������ݣ��ӱ��ض�ȡ�ϱ��ļ�
        private void PerfMscReadAndWrite(DateTime updateTime, string bizType, out string filePath, out string filename,string ofilename)
        {
            filename = "";
            filePath = "";
            try
            {
                if (updateTime <= Convert.ToDateTime(string.Format("{0} 05:00:00", DateTime.Now.ToString("yyyy-MM-dd")))
                    &&
                    updateTime >= Convert.ToDateTime(string.Format("{0} 00:00:00", DateTime.Now.ToString("yyyy-MM-dd"))))
                {
                    // �ڵ����賿5��ǰ�ϱ������������ϱ���������
                    updateTime = updateTime.AddDays(-1);
                    //���ܵ��ļ�����������(GD_PERF_MSC_1X_20100325.csv)
                    filename = string.Format("{0}_PERF_MSC_{1}_{2}.csv", _proEnName, bizType.ToUpper(),
                                             updateTime.ToString("yyyyMMdd"));
                }
                else
                {
                    // �������ǲ����ϱ�����ʱ������
                    //���ܵ��ļ�����������(GD_PERF_MSC_1X_20100325_N.csv)
                    filename = string.Format("{0}_PERF_MSC_{1}_{2}_{3}.csv", _proEnName, bizType.ToUpper(),
                                             updateTime.ToString("yyyyMMdd"), 1);
                }



                filePath = string.Format("{0}\\{1}\\{2}", _localRootPath, _proEnName, ConstPerf);               
                string ofilePath = string.Format("{0}\\{1}", _localRootPath,ofilename);

                FileStream fs = new FileStream(string.Format("{0}\\{1}", filePath, filename), FileMode.Create);
                StreamWriter sw = new StreamWriter(fs,Encoding.Default);
                StringBuilder sb = new StringBuilder();

                
                using (System.IO.StreamReader reader = new StreamReader(ofilePath, System.Text.Encoding.GetEncoding("GB2312")))
                {
                    try
                    {
                        while (reader.Peek() > 0)
                        {
                            sb.Append(reader.ReadLine());
                            sb.Append("\n");
                        }

                        sw.Write(sb.ToString());
                        sw.Flush();
                        sw.Close();
                    }
                    catch (Exception ex)
                    {
                        AddErr("��ȡMSC����ʱ�ļ�����", ex.Message);
                    }
                    finally
                    {
                        fs.Close();
                    }
                }                                                                         
            }
            catch(Exception ex)
            {
                AddErr(ex.Message, "0");
            }
        }

        private void PerfCityReadAndWrite(DateTime updateTime, string bizType, out string filePath, out string filename,string ofileName)
        {
            filename = "";
            filePath = "";
            try
            {
                if (updateTime <= Convert.ToDateTime(string.Format("{0} 05:00:00", DateTime.Now.ToString("yyyy-MM-dd")))
                    &&
                    updateTime >= Convert.ToDateTime(string.Format("{0} 00:00:00", DateTime.Now.ToString("yyyy-MM-dd"))))
                {
                    // �ڵ����賿5��ǰ�ϱ������������ϱ���������
                    updateTime = updateTime.AddDays(-1);
                    //���ܵ��ļ�����������(GD_PERF_MSC_1X_20100325.csv)
                    filename = string.Format("{0}_PERF_CITY_{1}_{2}.csv", _proEnName, bizType.ToUpper(),
                                             updateTime.ToString("yyyyMMdd"));
                }
                else
                {
                    // �������ǲ����ϱ�����ʱ������
                    //���ܵ��ļ�����������(GD_PERF_MSC_1X_20100325_N.csv)
                    filename = string.Format("{0}_PERF_CITY_{1}_{2}_{3}.csv", _proEnName, bizType.ToUpper(),
                                             updateTime.ToString("yyyyMMdd"), 1);
                }




                filePath = string.Format("{0}\\{1}\\{2}", _localRootPath, _proEnName, ConstPerf);                 
                string ofilePath = string.Format("{0}\\{1}", _localRootPath, ofileName);

                FileStream fs = new FileStream(string.Format("{0}\\{1}", filePath, filename), FileMode.Create);
                StreamWriter sw = new StreamWriter(fs, Encoding.Default);                
                StringBuilder sb = new StringBuilder();               

                using (System.IO.StreamReader reader = new StreamReader(ofilePath, System.Text.Encoding.GetEncoding("GB2312")))
                {
                    try
                    {
                        while (reader.Peek() > 0)
                        {
                            sb.Append(reader.ReadLine());
                            sb.Append("\n");
                        }

                        sw.Write(sb.ToString());
                        sw.Flush();
                        sw.Close();
                    }
                    catch (Exception ex)
                    {
                        AddErr("��ȡCITY����ʱ�ļ�����", ex.Message);
                    }
                    finally
                    {
                        fs.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                AddErr(ex.Message, "0");
            }
        }

        #region �����¼ʱ�䳤
        /// <summary>
        /// ���������ĵ�¼ʱ�䲻����ļ�¼
        /// </summary>
        private Dictionary<DateTime, DateTime> dicSpanLoginTime = new Dictionary<DateTime, DateTime>();
        /// <summary>
        /// �����¼ʱ��Ƭ�Σ����õݹ顢������ð���㷨��һ���ʻ�ÿ��ĵ�¼ʱ��Ƭ�κϲ���û�н��棨���������ʱ��Ƭ�Ρ�
        /// ����N���Ͽ���ʱ��Ƭ�Ρ�
        /// </summary>
        /// <param name="timeTable"></param>
        /// <returns></returns>
        private Dictionary<DateTime, DateTime> CalcLoginTime(DataTable timeTable)
        {
            DateTime EXITTIME = DateTime.MinValue;
            DateTime ENTERTIME = DateTime.MinValue;
            DateTime MaxEXITTIME = DateTime.MinValue;
            DateTime MaxENTERTIME = DateTime.MinValue;

            DateTime lastEXITTIME = DateTime.MinValue;
            DateTime lastENTERTIME = DateTime.MinValue;
            DateTime tempEXITTIME = DateTime.MinValue;
            DateTime tempENTERTIME = DateTime.MinValue;

            //�Ƿ��н����¼
            bool bRecursion = false;

            #region �����жϱ���ļ�¼�Ƿ��н������
            //�����жϱ���ļ�¼�Ƿ��н������
            for (int i = 0; i < timeTable.Rows.Count - 1; i++)
            {
                if (bRecursion)
                {
                    break;
                }
                tempEXITTIME = DateTime.MinValue;
                tempENTERTIME = DateTime.MinValue;
                for (int y = i + 1; y < timeTable.Rows.Count; y++)
                {
                    DateTime.TryParse(timeTable.Rows[i]["ENTERTIME"].ToString(), out lastENTERTIME);
                    DateTime.TryParse(timeTable.Rows[i]["EXITTIME"].ToString(), out lastEXITTIME);
                    DateTime.TryParse(timeTable.Rows[y]["ENTERTIME"].ToString(), out tempENTERTIME);
                    DateTime.TryParse(timeTable.Rows[y]["EXITTIME"].ToString(), out tempEXITTIME);
                    if ((lastEXITTIME > tempENTERTIME && lastEXITTIME < tempEXITTIME && lastENTERTIME < tempENTERTIME && lastENTERTIME < tempEXITTIME)
                        || (lastEXITTIME > tempENTERTIME && lastEXITTIME < tempEXITTIME && lastENTERTIME > tempENTERTIME && lastENTERTIME < tempEXITTIME)
                        || (lastEXITTIME > tempENTERTIME && lastEXITTIME > tempEXITTIME && lastENTERTIME < tempENTERTIME && lastENTERTIME < tempEXITTIME)
                        || (lastEXITTIME > tempENTERTIME && lastEXITTIME > tempEXITTIME && lastENTERTIME > tempENTERTIME && lastENTERTIME < tempEXITTIME)
                        )
                    {
                        bRecursion = true;
                        break;
                    }
                }
            }
            #endregion


            if (bRecursion)
            {
                #region �ݹ�Ƚ�ʱ��Ƭ��
                //1.ȡ�õ�һ�е�ʱ���¼
                foreach (DataRow dr in timeTable.Rows)
                {
                    DateTime.TryParse(dr["EXITTIME"].ToString(), out MaxEXITTIME);
                    DateTime.TryParse(dr["ENTERTIME"].ToString(), out MaxENTERTIME);
                    dr.Delete();
                    break;
                }
                timeTable.AcceptChanges();

                //2.ȥ��ʱ������dicMaxLoginTime��ļ�¼
                DataTable tempdt = timeTable.Copy();
                foreach (DataRow dr in tempdt.Rows)
                {
                    DateTime.TryParse(dr["EXITTIME"].ToString(), out EXITTIME);
                    DateTime.TryParse(dr["ENTERTIME"].ToString(), out ENTERTIME);
                    if (ENTERTIME > MaxENTERTIME && ENTERTIME < MaxEXITTIME && EXITTIME > MaxENTERTIME && EXITTIME < MaxEXITTIME)
                    {
                        dr.Delete();
                    }
                }

                //3.ȥ������ʱ������dicMaxLoginTime��ļ�¼�����û�MaxENTERTIME
                tempdt.AcceptChanges();
                foreach (DataRow dr in tempdt.Rows)
                {
                    DateTime.TryParse(dr["EXITTIME"].ToString(), out EXITTIME);
                    DateTime.TryParse(dr["ENTERTIME"].ToString(), out ENTERTIME);
                    if (ENTERTIME < MaxENTERTIME && EXITTIME > MaxENTERTIME && EXITTIME < MaxEXITTIME)
                    {
                        MaxENTERTIME = ENTERTIME;
                        dr.Delete();
                    }
                }

                //4.ȥ����ʼʱ������dicMaxLoginTime��ļ�¼�����û�MaxEXITTIME
                tempdt.AcceptChanges();
                foreach (DataRow dr in tempdt.Rows)
                {
                    DateTime.TryParse(dr["EXITTIME"].ToString(), out EXITTIME);
                    DateTime.TryParse(dr["ENTERTIME"].ToString(), out ENTERTIME);
                    if (ENTERTIME > MaxENTERTIME && ENTERTIME < MaxEXITTIME && EXITTIME > MaxEXITTIME)
                    {
                        MaxEXITTIME = EXITTIME;
                        dr.Delete();
                    }
                }

                //���Ƚϳ�����ʱ��δ��뵽tempdt���У������Ƚϣ����ϲ��Ƚ�
                DataRow newdr = tempdt.NewRow();
                newdr["ENTERTIME"] = MaxENTERTIME;
                newdr["EXITTIME"] = MaxEXITTIME;
                tempdt.Rows.Add(newdr);
                tempdt.AcceptChanges();
                return CalcLoginTime(tempdt);
                #endregion
            }
            else
            {
                #region ����N���Ͽ���ʱ��Ƭ��
                foreach (DataRow dr in timeTable.Rows)
                {
                    tempEXITTIME = DateTime.MinValue;
                    tempENTERTIME = DateTime.MinValue;
                    DateTime.TryParse(dr["ENTERTIME"].ToString(), out tempENTERTIME);
                    DateTime.TryParse(dr["EXITTIME"].ToString(), out tempEXITTIME);

                    if (!dicSpanLoginTime.ContainsKey(tempENTERTIME))
                    {
                        dicSpanLoginTime.Add(tempENTERTIME, tempEXITTIME);
                    }
                }
                return dicSpanLoginTime;
                #endregion
            }
        }
        #endregion

        private Dictionary<string, string> GetCdlCheckResult(Dictionary<string, string> dicReal, Dictionary<string, string> dicCheck)
        {
            Dictionary<string, string> dicResult = new Dictionary<string, string>();
            foreach (string key in dicCheck.Keys)
            {
                try
                {
                    if (!dicReal.ContainsKey(key))
                    {
                        dicResult.Add(key, key);
                    }
                }
                catch { continue; }
            }

            return dicResult;
        }

       
    }
}