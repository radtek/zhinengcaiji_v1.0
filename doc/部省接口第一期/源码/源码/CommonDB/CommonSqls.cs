using System;
using System.Data;
using System.Linq;

namespace NOAP.CommonDB
{
    public class CommonSql : IHadID
    {
        private static int _instanceID = 1;
        
        public int ID {get; set;}
        [ConfigColumn("MODULEID")]
        public int ModuleID { get; set; }
        [ConfigColumn("FUNCTIONNAME")]
        public string SubID { get; set; }
        [ConfigColumn("FULLNAME")]
        public string FullName { get; set; }
        [ConfigColumn("FUNCTIONID")]
        public int FunctionID { get; set; }
        [ConfigColumn("DBTYPE")]
        public string DBType { get; set; }
        [ConfigColumn("SQLLIST")]
        public string SqlList { get; set; }
        [ConfigColumn("DESCPTION")]
        public string Desc { get; set; }
        [ConfigColumn("PARAMSQL")]
        public string ParamSql { get; set; }
        [ConfigColumn("TIMEOUT")]
        public int TimeOut { get; set; }
        //private List<string> Sqls = null;

        public CommonSql()
        {
            ID = _instanceID++;
        }
    }

    public class CommonSqls : CommonConfigList<CommonSql> 
    {
        private static CommonSqls _instance;
        public static CommonSqls Instance()
        {
            if (_instance == null)
                _instance = new CommonSqls();

            return _instance;
        }

        protected override DataTable GetDataTable()
        {
            return DBAcess.Instance().GetDataTable("select * from cfg_modulesql s where s.DBTYPE = " + (int)DBAcess.Instance().DataType);
        }

        public string GetSql(int nModueID, string sSubID, params object[] arguments)
        {
            CommonSql cmsql =
                Objects.Values.FirstOrDefault(sqlobj => sqlobj.ModuleID == nModueID && sqlobj.SubID == sSubID);

            //子模块功能没有 找他爹
            if (cmsql == null && nModueID > 10000)
                cmsql = Objects.Values.FirstOrDefault(sqlobj => (sqlobj.ModuleID / 1000) == nModueID && sqlobj.SubID == sSubID);

            if (cmsql == null)
                return "";

            string sSql = cmsql.SqlList;

            if (arguments != null && arguments.Length > 0)
                sSql = string.Format(cmsql.SqlList, arguments);

            string[] sArgs = Environment.GetCommandLineArgs();
            if (sArgs != null && sArgs.Length > 0 && sArgs.FirstOrDefault(s => string.Compare(s, "-ssql") == 0) != null)
                LogFile.WriteToFile(cmsql.ModuleID + "_" + cmsql.SubID + "_" + sSql, "Querry Geting Sql", 0);

            return sSql;
        }

        public string GetSql(object obj, int nFunctionID, params object[] arguments)
        {
            return GetSql(obj.GetType().FullName, nFunctionID, arguments);
            
        }

        public string GetSql(string sFullName, int nFunctionID, params object[] arguments)
        {
            CommonSql cmsql =
                Objects.Values.FirstOrDefault(sqlobj => sqlobj.FullName == sFullName && sqlobj.FunctionID == nFunctionID);

            if (cmsql == null)
                return "";

            string sSql = cmsql.SqlList;

            if (arguments != null && arguments.Length > 0)
                sSql = string.Format(cmsql.SqlList, arguments);

            string[] sArgs = Environment.GetCommandLineArgs();
            if (sArgs != null && sArgs.Length > 0 && sArgs.FirstOrDefault(s => string.Compare(s, "-ssql") == 0) != null)
                LogFile.WriteToFile(cmsql.FullName + "_" + cmsql.FunctionID + "_" + sSql, "Querry Geting Sql", 0);

            return sSql;
        }
    }
}