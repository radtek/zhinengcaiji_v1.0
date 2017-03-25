using System;

namespace DataCollect.CommonFun
{
    /// <summary>
    ///实体公式表
    /// </summary>
    public class clsEnity
    {
        private int _objectID;

        /// <summary>
        ///主健ID号
        /// </summary>
        public int ObjectID
        {
            get { return _objectID; }
            set { _objectID = value; }
        }

        private string _userName;
        /// <summary>
        ///用户名称
        /// </summary>
        public string UserName
        {
            get { return _userName; }
            set { _userName = value; }
        }

        private DateTime _start_time;

        /// <summary>
        ///采集时间
        /// </summary>
        public DateTime Start_time
        {
            get { return _start_time; }
            set { _start_time = value; }
        }


        private DateTime _end_time;
        /// <summary>
        /// 结束时间
        /// </summary>
        public DateTime End_time
        {
            get { return _end_time; }
            set { _end_time = value; }
        }

        private string _loginname;

        /// <summary>
        /// 登录名称
        /// </summary>
        public string Loginname
        {
            get { return _loginname; }
            set { _loginname = value; }
        }

        private string _passWord;

        /// <summary>
        /// 用户密码
        /// </summary>
        public string PassWord
        {
            get { return _passWord; }
            set { _passWord = value; }
        }

        private string _tel;
        /// <summary>
        /// 电话号码
        /// </summary>
        public string Tel
        {
            get { return _tel; }
            set { _tel = value; }
        }

        private string _filePath;

        /// <summary>
        /// 生成的文件目录
        /// </summary>
        public string FilePath
        {
            get { return _filePath; }
            set { _filePath = value; }
        }

        private string _tableList;

        /// <summary>
        /// 表ID号关联
        /// </summary>
        public string TableList
        {
            get { return _tableList; }
            set { _tableList = value; }
        }
        private string _addstart_time;

        /// <summary>
        /// 增加工工采集字段
        /// </summary>
        public string Addstart_time
        {
            get { return _addstart_time; }
            set { _addstart_time = value; }
        }

        private string _colInterval;
        /// <summary>
        /// 采集时间间隔
        /// </summary>
        public string ColInterval
        {
            get { return _colInterval; }
            set { _colInterval = value; }
        }
        private string _loginPath;
        /// <summary>
        ///日志目录
        /// </summary>
        public string LoginPath
        {
            get { return _loginPath; }
            set { _loginPath = value; }
        }

        private string _vendor;

        /// <summary>
        /// 厂家名称
        /// </summary>
        public string Vendor
        {
            get { return _vendor; }
            set { _vendor = value; }
        }

        private int _dataType;

        /// <summary>
        /// 数据类型
        /// </summary>
        public int DataType
        {
            get { return _dataType; }
            set { _dataType = value; }
        }

        private int _classCode;

        /// <summary>
        /// 小类的名称
        /// </summary>
        public int ClassCode
        {
            get { return _classCode; }
            set { _classCode = value; }
        }
        private int _city_id;

        /// <summary>
        /// 城市ID编号
        /// </summary>
        public int City_id
        {
            get { return _city_id; }
            set { _city_id = value; }
        }

        private string _Filename;

        /// <summary>
        /// 文件名称
        /// </summary>
        public string Filename
        {
            get { return _Filename; }
            set { _Filename = value; }
        }


        private DateTime _collect_time;

        /// <summary>
        /// 采集时间
        /// </summary>
        public DateTime Collect_time
        {
            get { return _collect_time; }
            set { _collect_time = value; }
        }
    }

    /// <summary>
    /// 城市信息
    /// </summary>
    public class CityInfo
    {
        public string CityId { get; set; }
        public double LongitudeL { get; set; }
        public double LatitudeL { get; set; }
        public double LongitudeR { get; set; }
        public double LatitudeR { get; set; }
        public double Width { get; set; }
        public double Height { get; set; }
        public string CityName { get; set; }
        public string EnName { get; set; }
        public string Vendor { get; set; }
    }



}
