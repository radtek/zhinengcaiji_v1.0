using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using Microsoft.Practices.Composite.App;
using System.Collections;
using System.Data.OleDb;
using System.Threading;
namespace NOAP.CommonDB
{

    public class DBAcess
    {
        protected string ConnectionString = "";
        public string DBProviderName = "";
        protected IDbConnection DbConn;
        protected IDbTransaction DbTrans;
        protected bool IsInitlize;
        private bool NeedTrans;

        //public IDbConnection CurrentDBConnection { get { return DbConn; } }

        public NOAPDBType DataType { get; private set; }

        //private bool NeedTrans;
        private DBFactory m_dbFactory;
        private static DBAcess _instance;

        public DBAcess()
        {
        }

        public DBAcess(string connectString, NOAPDBType dataType)
        {
            ConnectionString = connectString;
            DataType = dataType;
        }

        public void Initialize(string sCon, NOAPDBType dataType)
        {
            DataType = dataType;
            ConnectionString = sCon;
            m_dbFactory = new DBFactory();
            m_dbFactory.DabaseType = dataType;
            m_dbFactory.ConnectString = ConnectionString;

            //DbConn = m_dbFactory.GetConnection(sCon, DataType);

            return;
        }

        public void Unitialize()
        {
            return;
        }

        public static DBAcess Instance()
        {
            if (_instance == null)
                _instance = new DBAcess();

            return _instance;
        }

        public IDbDataParameter GetDbParameter()
        {
            IDbCommand cmd = m_dbFactory.GetDBCommond();
            if (cmd != null)
                return cmd.CreateParameter();

            return m_dbFactory.GetDbParameter(DataType);
        }

        #region 异步执行

        public IDbConnection GetNewConnection()
        {
            DBFactory factory = new DBFactory();

            return factory.GetConnection(m_dbFactory.ConnectString, m_dbFactory.DabaseType);
        }

        public string ExecNonQuerySyn(int nModuleID, string sSubID, DbParameter[] Params, int nLevel, params object[] arguments)
        {
            CommonExecQueryParams objs = new CommonExecQueryParams(GetNewConnection(), nModuleID, sSubID, Params, nLevel, arguments);

            return TaskController.AddTask(new CommonExecQueryTask
            {
                Callback = null,
                nonQuerySyn = NonQuerySyn,
                Parameters = objs,
                CurrentConnection = objs.Connection
            });
        }

        public string ExecNonQuerySyn(int nModuleID, string sSubID, DbParameter[] Params, params object[] arguments)
        {
            return ExecNonQuerySyn(nModuleID, sSubID, Params, -1, arguments);
        }

        public string ExecNonQuerySyn(int nModuleID, string sSubID, int nLevel, params object[] arguments)
        {
            return ExecNonQuerySyn(nModuleID, sSubID, null, nLevel, arguments);
        }

        public string ExecNonQuerySyn(int nModuleID, string sSubID, params object[] arguments)
        {
            return ExecNonQuerySyn(nModuleID, sSubID, null, -1, arguments);
        }

        public string ExecNonQuerySyn(int nModuleID, string sSubID, int nLevel)
        {
            return ExecNonQuerySyn(nModuleID, sSubID, null, nLevel, null);
        }

        public string ExecNonQuerySyn(int nModuleID, string sSubID)
        {
            return ExecNonQuerySyn(nModuleID, sSubID, null, -1, null);
        }

        public string ExecNonQuerySyn(int nModuleID, int nFunctionID, string sFullName, DbParameter[] Params, int nLevel, params object[] arguments)
        {
            CommonExecQueryParams objs = new CommonExecQueryParams(GetNewConnection(), nModuleID, nFunctionID, sFullName, Params, nLevel, arguments);

            return TaskController.AddTask(new CommonExecQueryTask
            {
                Callback = null,
                nonQuerySyn = NonQuerySyn,
                Parameters = objs,
                CurrentConnection = objs.Connection
            });
        }

        public string ExecNonQuerySyn(int nModuleID, int nFunctionID, string sFullName, DbParameter[] Params, params object[] arguments)
        {
            return ExecNonQuerySyn(nModuleID, nFunctionID, sFullName, Params, -1, arguments);
        }

        public string ExecNonQuerySyn(int nModuleID, int nFunctionID, string sFullName, int nLevel, params object[] arguments)
        {
            return ExecNonQuerySyn(nModuleID, nFunctionID, sFullName, null, nLevel, arguments);
        }

        public string ExecNonQuerySyn(int nModuleID, int nFunctionID, string sFullName, params object[] arguments)
        {
            return ExecNonQuerySyn(nModuleID, nFunctionID, sFullName, null, -1, arguments);
        }

        public string ExecNonQuerySyn(int nModuleID, int nFunctionID, string sFullName, int nLevel)
        {
            return ExecNonQuerySyn(nModuleID, nFunctionID, sFullName, null, nLevel, null);
        }

        public string ExecNonQuerySyn(int nModuleID, int nFunctionID, string sFullName)
        {
            return ExecNonQuerySyn(nModuleID, nFunctionID, sFullName, null, -1, null);
        }

        // params object[] arguments 未实现
        /// <summary>
        /// ExecNonQuery 异步执行实体
        /// </summary>
        /// <param name="objs"></param>
        /// <returns></returns>
        private void NonQuerySyn(object objs)
        {
            CommonExecQueryParams par = (CommonExecQueryParams)objs;
            string sSql = par.bIsUseID ? CommonSqls.Instance().GetSql(par.nModuleID, par.sSubID) :
                CommonSqls.Instance().GetSql(par.sFullName, par.nFunctionID);
            CommonSqls.Instance().GetSql(par.sFullName, par.nFunctionID);
            if (String.IsNullOrEmpty(sSql))
                return;

            if (par.arguments != null && par.arguments.Length > 0)
                sSql = string.Format(sSql, par.arguments);

            int bRet = ExecNonQuerySyn(sSql, par.Params, par.Connection);
            var param = new EventParam_CommonDB_GetData(EMDataReType.Int, par.nModuleID, par.sSubID, par.sFullName, par.nFunctionID) { Data = bRet };

            EventManage.Instance().GetEventAggregator(par.nModuleID.ToString()).GetEvent<Event_CommonDB_GetData>().Publish(param);
        }

        /// <summary>
        /// ExecScalar 异步执行实体
        /// </summary>
        /// <param name="objs"></param>
        private void NonExecScalar(object objs)
        {
            CommonExecQueryParams par = (CommonExecQueryParams)objs;
            string sSql = par.bIsUseID ? CommonSqls.Instance().GetSql(par.nModuleID, par.sSubID) :
                CommonSqls.Instance().GetSql(par.sFullName, par.nFunctionID);
            if (String.IsNullOrEmpty(sSql))
                return;

            Object bRet = ExecScalarSyn(sSql, par.Params, par.Connection);
            var param = new EventParam_CommonDB_GetData(EMDataReType.Object, par.nModuleID, par.sSubID, par.sFullName, par.nFunctionID) { Data = bRet };

            EventManage.Instance().GetEventAggregator(par.nModuleID.ToString()).GetEvent<Event_CommonDB_GetData>().Publish(param);
        }

        public string ExecScalarSyn(int nModuleID, string sSubID, params object[] arguments)
        {
            return ExecScalarSyn(nModuleID, sSubID, null, arguments);
        }

        public string ExecScalarSyn(int nModuleID, string sSubID, DbParameter[] Params, params object[] arguments)
        {
            CommonExecQueryParams objs = new CommonExecQueryParams(GetNewConnection(), nModuleID, sSubID, Params, -1, arguments);
            return TaskController.AddTask(new CommonExecQueryTask
            {
                Callback = null,
                nonQuerySyn = NonExecScalar,
                Parameters = objs,
                CurrentConnection = objs.Connection
            });
        }

        public string ExecScalarSyn(int nModuleID, int nFunctionID, string sFullName, params object[] arguments)
        {
            return ExecScalarSyn(nModuleID, nFunctionID, sFullName, null, arguments);
        }

        public string ExecScalarSyn(int nModuleID, int nFunctionID, string sFullName, DbParameter[] Params, params object[] arguments)
        {
            CommonExecQueryParams objs = new CommonExecQueryParams(GetNewConnection(), nModuleID, nFunctionID, sFullName, Params, -1, arguments);

            return TaskController.AddTask(new CommonExecQueryTask
            {
                Callback = null,
                nonQuerySyn = NonExecScalar,
                Parameters = objs,
                CurrentConnection = objs.Connection
            });
        }

        // params object[] arguments 未实现
        /// <summary>
        /// ExecReader 异步执行实体
        /// </summary>
        /// <param name="objs"></param>
        private void NonExecReaderSyn(object objs)
        {
            CommonExecQueryParams par = (CommonExecQueryParams)objs;
            string sSql = par.bIsUseID ? CommonSqls.Instance().GetSql(par.nModuleID, par.sSubID) :
                CommonSqls.Instance().GetSql(par.sFullName, par.nFunctionID);
            if (String.IsNullOrEmpty(sSql))
                return;

            if (par.arguments != null && par.arguments.Length > 0)
                sSql = string.Format(sSql, par.arguments);

            DbDataReader bRet = ExecReaderSyn(sSql, par.Params, par.Connection);
            var param = new EventParam_CommonDB_GetData(EMDataReType.DbDataReader, par.nModuleID, par.sSubID, par.sFullName, par.nFunctionID) { Data = bRet };
            EventManage.Instance().GetEventAggregator(par.nModuleID.ToString()).GetEvent<Event_CommonDB_GetData>().Publish(param);
        }

        public string ExecReaderSyn(int nModuleID, string sSubID)
        {
            return ExecReaderSyn(nModuleID, sSubID, null, null);
        }

        public string ExecReaderSyn(int nModuleID, string sSubID, params object[] arguments)
        {
            return ExecReaderSyn(nModuleID, sSubID, null, arguments);
        }

        public string ExecReaderSyn(int nModuleID, string sSubID, DbParameter[] Params, params object[] arguments)
        {
            CommonExecQueryParams objs = new CommonExecQueryParams(GetNewConnection(), nModuleID, sSubID, Params, -1, arguments);

            return TaskController.AddTask(new CommonExecQueryTask
            {
                Callback = null,
                nonQuerySyn = NonExecReaderSyn,
                Parameters = objs,
                CurrentConnection = objs.Connection
            });
        }

        public string ExecReaderSyn(int nModuleID, int nFunctionID, string sFullName)
        {
            return ExecReaderSyn(nModuleID, nFunctionID, sFullName, null, null);
        }

        public string ExecReaderSyn(int nModuleID, int nFunctionID, string sFullName, params object[] arguments)
        {
            return ExecReaderSyn(nModuleID, nFunctionID, sFullName, null, arguments);
        }

        public string ExecReaderSyn(int nModuleID, int nFunctionID, string sFullName, DbParameter[] Params, params object[] arguments)
        {
            CommonExecQueryParams objs = new CommonExecQueryParams(GetNewConnection(), nModuleID, nFunctionID, sFullName, Params, -1, arguments);

            return TaskController.AddTask(new CommonExecQueryTask
            {
                Callback = null,
                nonQuerySyn = NonExecReaderSyn,
                Parameters = objs,
                CurrentConnection = objs.Connection
            });
        }

        // params object[] arguments 未实现
        /// <summary>
        /// GetDataTable 异步执行实体
        /// </summary>
        /// <param name="objs"></param>
        private void NonGetDataTable(object objs)
        {
            CommonExecQueryParams par = (CommonExecQueryParams)objs;
            string sSql = par.bIsUseID ? CommonSqls.Instance().GetSql(par.nModuleID, par.sSubID) :
                CommonSqls.Instance().GetSql(par.sFullName, par.nFunctionID);
            if (String.IsNullOrEmpty(sSql))
                return;

            if (par.arguments != null && par.arguments.Length > 0)
                sSql = string.Format(sSql, par.arguments);

            DataTable bRet = GetDataTableSyn(sSql, par.Params, par.Connection);
            var param = new EventParam_CommonDB_GetData(EMDataReType.DataTable, par.nModuleID, par.sSubID, par.sFullName, par.nFunctionID) { Data = bRet };
            EventManage.Instance().GetEventAggregator(par.nModuleID.ToString()).GetEvent<Event_CommonDB_GetData>().Publish(param);
        }

        public string GetDataTableSyn(int nModuleID, string sSubID)
        {
            return GetDataTableSyn(nModuleID, sSubID, null, null);
        }

        public string GetDataTableSyn(int nModuleID, string sSubID, params object[] arguments)
        {
            return GetDataTableSyn(nModuleID, sSubID, null, arguments);
        }

        public string GetDataTableSyn(int nModuleID, string sSubID, DbParameter[] Params, params object[] arguments)
        {
            CommonExecQueryParams objs = new CommonExecQueryParams(GetNewConnection(), nModuleID, sSubID, Params, -1, arguments);
            return TaskController.AddTask(new CommonExecQueryTask
            {
                Callback = null,
                nonQuerySyn = NonGetDataTable,
                Parameters = objs,
                CurrentConnection = objs.Connection
            });
        }

        public string GetDataTableSyn(int nModuleID, int nFunctionID, string sFullName)
        {
            return GetDataTableSyn(nModuleID, nFunctionID, sFullName, null, null);
        }

        public string GetDataTableSyn(int nModuleID, int nFunctionID, string sFullName, params object[] arguments)
        {
            return GetDataTableSyn(nModuleID, nFunctionID, sFullName, null, arguments);
        }

        public string GetDataTableSyn(int nModuleID, int nFunctionID, string sFullName, DbParameter[] Params, params object[] arguments)
        {
            CommonExecQueryParams objs = new CommonExecQueryParams(GetNewConnection(), nModuleID, nFunctionID, sFullName, Params, -1, arguments);
            return TaskController.AddTask(new CommonExecQueryTask
            {
                Callback = null,
                nonQuerySyn = NonGetDataTable,
                Parameters = objs,
                CurrentConnection = objs.Connection
            });
        }

        // params object[] arguments 未实现
        /// <summary>
        /// GetDataSet 异步执行实体
        /// </summary>
        /// <param name="objs"></param>
        private void NonGetDataSetSyn(object objs)
        {
            CommonExecQueryParams par = (CommonExecQueryParams)objs;
            string sSql = par.bIsUseID ? CommonSqls.Instance().GetSql(par.nModuleID, par.sSubID) :
                CommonSqls.Instance().GetSql(par.sFullName, par.nFunctionID);
            if (String.IsNullOrEmpty(sSql))
                return;

            if (par.arguments != null && par.arguments.Length > 0)
                sSql = string.Format(sSql, par.arguments);

            DataSet bRet = GetDataSetSyn(sSql, par.Params, par.Connection);
            var param = new EventParam_CommonDB_GetData(EMDataReType.DataSet, par.nModuleID, par.sSubID, par.sFullName, par.nFunctionID) { Data = bRet };
            EventManage.Instance().GetEventAggregator(par.nModuleID.ToString()).GetEvent<Event_CommonDB_GetData>().Publish(param);
        }

        public string GetDataSetSyn(int nModuleID, string sSubID)
        {
            return GetDataSetSyn(nModuleID, sSubID, null, null);
        }

        public string GetDataSetSyn(int nModuleID, string sSubID, params object[] arguments)
        {
            return GetDataSetSyn(nModuleID, sSubID, null, arguments);
        }

        public string GetDataSetSyn(int nModuleID, string sSubID, DbParameter[] Params, params object[] arguments)
        {
            CommonExecQueryParams objs = new CommonExecQueryParams(GetNewConnection(), nModuleID, sSubID, Params, -1, arguments);

            return TaskController.AddTask(new CommonExecQueryTask
            {
                Callback = null,
                nonQuerySyn = NonGetDataSetSyn,
                Parameters = objs,
                CurrentConnection = objs.Connection
            });
        }

        public string GetDataSetSyn(int nModuleID, int nFunctionID, string sFullName)
        {
            return GetDataSetSyn(nModuleID, nFunctionID, sFullName, null, null);
        }

        public string GetDataSetSyn(int nModuleID, int nFunctionID, string sFullName, params object[] arguments)
        {
            return GetDataSetSyn(nModuleID, nFunctionID, sFullName, null, arguments);
        }

        public string GetDataSetSyn(int nModuleID, int nFunctionID, string sFullName, DbParameter[] Params, params object[] arguments)
        {
            CommonExecQueryParams objs = new CommonExecQueryParams(GetNewConnection(), nModuleID, nFunctionID, sFullName, Params, -1, arguments);

            return TaskController.AddTask(new CommonExecQueryTask
            {
                Callback = null,
                nonQuerySyn = NonGetDataSetSyn,
                Parameters = objs,
                CurrentConnection = objs.Connection
            });
        }

        public string GetDataSetSyn(string[] sSubIDs, string[] sTableNames, DbParameter[][] Params)
        {

            object[] objs = { sSubIDs, sTableNames, Params };
            CommonExecQueryParams ob = new CommonExecQueryParams(GetNewConnection(), 0, null, null, -1, objs);
            return TaskController.AddTask(new CommonExecQueryTask
            {
                Callback = null,
                nonQuerySyn = NonGetDataSetMSyn,
                Parameters = ob,
                CurrentConnection = ob.Connection
            });
        }


        public string GetDataSetSyn(int nModuleID, string[] sSubIDs, string[] sTableNames, DbParameter[][] Params)
        {

            object[] objs = { sSubIDs, sTableNames, Params };
            CommonExecQueryParams ob = new CommonExecQueryParams(GetNewConnection(), nModuleID, null, null, -1, objs);
            return TaskController.AddTask(new CommonExecQueryTask
            {
                Callback = null,
                nonQuerySyn = NonGetDataSetMSyn,
                Parameters = ob,
                CurrentConnection = ob.Connection
            });
        }

        // params object[] arguments 未实现
        /// <summary>
        /// GetMaxRecordID 异步执行实体
        /// </summary>
        /// <param name="objs"></param>
        private void NonGetMaxRecordIDSyn(object objs)
        {
            CommonExecQueryParams par = (CommonExecQueryParams)objs;
            string sSql = par.bIsUseID ? CommonSqls.Instance().GetSql(par.nModuleID, par.sSubID) :
                CommonSqls.Instance().GetSql(par.sFullName, par.nFunctionID);
            if (String.IsNullOrEmpty(sSql))
                return;

            if (par.arguments != null && par.arguments.Length > 0)
                sSql = string.Format(sSql, par.arguments);
            int bRet = GetMaxRecordIDSyn(sSql, par.Params, par.Connection);
            var param = new EventParam_CommonDB_GetData(EMDataReType.Int, par.nModuleID, par.sSubID, par.sFullName, par.nFunctionID) { Data = bRet };
            EventManage.Instance().GetEventAggregator(par.nModuleID.ToString()).GetEvent<Event_CommonDB_GetData>().Publish(param);
        }

        public string GetMaxRecordIDSyn(int nModuleID, string sSubID)
        {
            return GetMaxRecordIDSyn(nModuleID, sSubID, null, null);
        }

        public string GetMaxRecordIDSyn(int nModuleID, string sSubID, params object[] arguments)
        {
            return GetMaxRecordIDSyn(nModuleID, sSubID, null, arguments);
        }

        public string GetMaxRecordIDSyn(int nModuleID, string sSubID, DbParameter[] Params, params object[] arguments)
        {
            CommonExecQueryParams objs = new CommonExecQueryParams(GetNewConnection(), nModuleID, sSubID, Params, -1, arguments);
            return TaskController.AddTask(new CommonExecQueryTask
            {
                Callback = null,
                nonQuerySyn = NonGetMaxRecordIDSyn,
                Parameters = objs,
                CurrentConnection = objs.Connection
            });
        }

        public string GetMaxRecordIDSyn(int nModuleID, int nFunctionID, string sFullName)
        {
            return GetMaxRecordIDSyn(nModuleID, nFunctionID, sFullName, null, null);
        }

        public string GetMaxRecordIDSyn(int nModuleID, int nFunctionID, string sFullName, params object[] arguments)
        {
            return GetMaxRecordIDSyn(nModuleID, nFunctionID, sFullName, null, arguments);
        }

        public string GetMaxRecordIDSyn(int nModuleID, int nFunctionID, string sFullName, DbParameter[] Params, params object[] arguments)
        {
            CommonExecQueryParams objs = new CommonExecQueryParams(GetNewConnection(), nModuleID, nFunctionID, sFullName, Params, -1, arguments);

            return TaskController.AddTask(new CommonExecQueryTask
            {
                Callback = null,
                nonQuerySyn = NonGetMaxRecordIDSyn,
                Parameters = objs,
                CurrentConnection = objs.Connection
            });
        }

        #region

        public int GetMaxRecordIDSyn(string strSQL, IDbDataParameter[] Params, IDbConnection connection)
        {
            object objMaxID = ExecScalarSyn(strSQL, Params, connection);
            if (objMaxID != null && objMaxID.ToString().Trim() != "")
                return Convert.ToInt32(objMaxID) + 1;
            return 1;
        }

        // params object[] arguments 未实现
        /// <summary>
        /// GetDataSet 异步执行实体
        /// </summary>
        /// <param name="objs"></param>
        private void NonGetDataSetMSyn(object objs)
        {
            CommonExecQueryParams par = (CommonExecQueryParams)objs;

            string[] sSubIDs = (string[])par.arguments[0];
            string[] sTableNames = (string[])par.arguments[1];
            DbParameter[][] Params = (DbParameter[][])par.arguments[2];
            // object[][] arguments =()par.arguments[3];

            string[] sSQLs = new string[sSubIDs.Length];
            int i = 0;
            foreach (string sSubID in sSubIDs)
                sSQLs[i++] = CommonSqls.Instance().GetSql(par.nModuleID, sSubID);

            DataSet bRet = GetDataSetMSyn(sSQLs, sTableNames, null, par.Connection);

            foreach (string sSubID in sSubIDs)
            {
                var param = new EventParam_CommonDB_GetData(EMDataReType.DataSet, par.nModuleID, sSubID, par.sFullName, par.nFunctionID) { Data = bRet };

                EventManage.Instance().GetEventAggregator(par.nModuleID.ToString()).GetEvent<Event_CommonDB_GetData>().
                    Publish(param);
            }

            return;
        }

        /// <summary>
        /// 执行 SQL 语句，返回表
        /// </summary>
        /// <param name="strSQL"></param>
        /// <param name="TableName"></param>
        /// <param name="Params"></param>
        /// <returns></returns>
        public DataSet GetDataSetMSyn(string[] strSQL, string[] TableName, IDbDataParameter[][] Params, IDbConnection connection)
        {
            DataSet needDS = new DataSet();

            IDbConnection DbConn = null;
            IDbCommand command = null;
            try
            {
                command = PrepareCommand(out DbConn, CommandType.Text, "", null);

                DbDataAdapter adpter = m_dbFactory.GetDBAdapter();
                ((IDbDataAdapter)adpter).SelectCommand = command;

                for (int i = 0; i < strSQL.Length; i++)
                {
                    command.CommandText = strSQL[i];
                    if (Params != null && Params.Length > i && Params[i] != null && Params[i].Length > 0)
                    {
                        foreach (IDbDataParameter par in Params[i])
                        {
                            command.Parameters.Add(par);
                        }
                    }
                    adpter.Fill(needDS, TableName[i]);
                }
            }
            catch (Exception Err)
            {
                string strMessage = string.Format("数据库访问错误：{0}", Err.Message);

                for (int i = 0; i < strSQL.Length; i++)
                    LogFile.WriteToFile(strSQL[i], Err.Message, 2);

                throw new Exception(strMessage);
            }
            finally
            {
                if (HashDbConnPool.ContainsKey(DbConn))
                    HashDbConnPool[DbConn] = false;
            }
            return needDS;
        }

        /// <summary>
        /// 执行 SQL 语句，返回表
        /// </summary>
        /// <param name="strSQL"></param>
        /// <param name="Params"></param>
        /// <returns></returns>
        public DataSet GetDataSetSyn(string strSQL, IDbDataParameter[] Params, IDbConnection connection)
        {
            DataSet needDS = new DataSet();

            IDbConnection DbConn = null;
            IDbCommand command = null;
            try
            {
                command = PrepareCommand(out DbConn, CommandType.Text, strSQL, Params);

                if (Params != null && Params.Length > 0)
                {
                    foreach (IDbDataParameter par in Params)
                    {
                        command.Parameters.Add(par);
                    }
                }

               // LogFile.WriteToFile(strSQL, "查询前语句生成SQL", 0);

                DbDataAdapter adpter = m_dbFactory.GetDBAdapter();
                ((IDbDataAdapter)adpter).SelectCommand = command;

                DateTime start = DateTime.Now;
                adpter.Fill(needDS);

                TimeSpan span = DateTime.Now - start;
              //  if (span.TotalMilliseconds >= 100)
                    LogFile.WriteToFile(strSQL, string.Format("耗时:{0}毫秒", span.TotalMilliseconds), 0);

            }
            catch (Exception Err)
            {
                string strMessage = string.Format("数据库访问错误：{0}", Err.Message);
                LogFile.WriteToFile(strSQL, Err.Message, 2);
                throw new Exception(strMessage);
            }
            finally
            {
                if (HashDbConnPool.ContainsKey(DbConn))
                    HashDbConnPool[DbConn] = false;
            }
            return needDS;
        }

        public DataTable GetDataTableSyn(string strSQL, IDbDataParameter[] Params, IDbConnection connection)
        {
            DataTable needDT = new DataTable();

            IDbConnection DbConn = null;
            IDbCommand command = null;
            try
            {
                command = PrepareCommand(out DbConn, CommandType.Text, strSQL, Params);

                if (Params != null && Params.Length > 0)
                {
                    foreach (IDbDataParameter par in Params)
                    {
                        command.Parameters.Add(par);
                    }
                }
             //   LogFile.WriteToFile(strSQL, "查询前语句生成SQL", 0);
                DbDataAdapter adpter = m_dbFactory.GetDBAdapter();

                ((IDbDataAdapter)adpter).SelectCommand = command;
                string[] sArgs = Environment.GetCommandLineArgs();
                if (sArgs != null && sArgs.Length > 0 && sArgs.FirstOrDefault(s => string.Compare(s, "-sql") == 0) != null)
                    LogFile.WriteToFile(strSQL, "Querry Sql", 0);

                DateTime start = DateTime.Now;
                adpter.Fill(needDT);
                TimeSpan span = DateTime.Now - start;

             //   if (span.TotalMilliseconds >= 100)
                    LogFile.WriteToFile(strSQL, string.Format("耗时:{0}毫秒", span.TotalMilliseconds), 0);
            }
            catch (Exception Err)
            {
                string strMessage = string.Format("数据库访问错误：{0}", Err.Message);
                LogFile.WriteToFile(strSQL, Err.Message, 2);

                throw new Exception(strMessage);
            }
            finally
            {
                if (HashDbConnPool.ContainsKey(DbConn))
                    HashDbConnPool[DbConn] = false;
            }
            return needDT;
        }

        public DbDataReader ExecReaderSyn(string strSQL, IDbDataParameter[] Params, IDbConnection DbConn)
        {
            DbDataReader reader;
            IDbCommand command = null;
            try
            {
                command = PrepareCommand(out DbConn, CommandType.Text, strSQL, Params);

                LogFile.WriteToFile(strSQL, "读取数据", 0);

                reader = (DbDataReader)command.ExecuteReader();
            }
            catch (Exception Err)
            {
                string strMessage = string.Format("数据库访问错误：{0}", Err.Message);
                LogFile.WriteToFile(strSQL, Err.Message, 2);
                throw new Exception(strMessage);
            }
            finally
            {
                if (HashDbConnPool.ContainsKey(DbConn))
                    HashDbConnPool[DbConn] = false;
            }
            return reader;
        }

        public object ExecScalarSyn(string strSQL, IDbDataParameter[] Params, IDbConnection connection)
        {
            object objResult;

            IDbConnection DbConn = null;
            IDbCommand command = null;
            try
            {
                command = PrepareCommand(out DbConn, CommandType.Text, strSQL, Params);
                LogFile.WriteToFile(strSQL, "读取数据", 0);
                objResult = command.ExecuteScalar();
            }
            catch (Exception Err)
            {
                string strMessage = string.Format("数据库访问错误：{0}", Err.Message);
                LogFile.WriteToFile(strSQL, Err.Message, 2);
                throw new Exception(strMessage);
            }
            finally
            {
                if (HashDbConnPool.ContainsKey(DbConn))
                    HashDbConnPool[DbConn] = false;
            }
            return objResult;
        }

        public int ExecNonQuerySyn(string strSQL, IDbDataParameter[] Params, IDbConnection connection)
        {
            int nAffectResult;


            IDbCommand command = null;
            try
            {
                command = PrepareCommand(out connection, CommandType.Text, strSQL, Params);
                nAffectResult = command.ExecuteNonQuery();
            }
            catch (Exception Err)
            {
                string strMessage = string.Format("数据库访问错误：{0}", Err.Message);
                LogFile.WriteToFile(strSQL, Err.Message, 2);

                throw new Exception(strMessage);

            }
            finally
            {
                if (HashDbConnPool.ContainsKey(DbConn))
                    HashDbConnPool[DbConn] = false;
            }
            return nAffectResult;
        }
        #endregion

        #endregion

        #region 同步执行

        /// <summary>
        /// ExecNonQuery动作实体
        /// </summary>
        /// <param name="strSQLs"></param>
        /// <returns></returns>
        public int ExecNonQuery(IEnumerable<string> strSQLs)
        {
            string sErrorSql = "";
            int nAffectResult = 0;
            IDbConnection DbConn = null;
            IDbCommand command = null;
            try
            {
                command = PrepareCommand(out DbConn, CommandType.Text, "", null);
                foreach (string sSql in strSQLs)
                {
                    sErrorSql = sSql;
                    command.CommandText = sSql;
                    nAffectResult += command.ExecuteNonQuery();
                }
            }
            catch (Exception Err)
            {
                string strMessage = string.Format("数据库执行语句错误，执行语句{1}，错误：{0}。", Err.Message, sErrorSql);
                LogFile.WriteToFile(sErrorSql, Err.Message, 2);
                throw new Exception(strMessage);
            }
            finally
            {
                if (HashDbConnPool.ContainsKey(DbConn))
                    HashDbConnPool[DbConn] = false;
            }
            return nAffectResult;
        }


        /// <summary>
        /// ExecNonQuery动作实体
        /// </summary>
        /// <param name="strSQL"></param>
        /// <param name="Params"></param>
        /// <returns></returns>
        public int ExecNonQuery(string strSQL, IDbDataParameter[] Params)
        {
            int nAffectResult;

            IDbConnection DbConn = null;
            IDbCommand command = null;
            try
            {
                command = PrepareCommand(out DbConn, CommandType.Text, strSQL, Params);
                nAffectResult = command.ExecuteNonQuery();
            }
            catch (Exception Err)
            {
                string strMessage = string.Format("数据库访问错误：{0}", Err.Message);
                LogFile.WriteToFile(strSQL, Err.Message, 2);
                throw new Exception(strMessage);

            }
            finally
            {
                if (HashDbConnPool.ContainsKey(DbConn))
                    HashDbConnPool[DbConn] = false;
            }
            return nAffectResult;
        }

        public int ExecNonQuery(string sSql)
        {
            return ExecNonQuery(sSql, null);
        }

        public int ExecNonQuery(int nModuleID, string sSubID, IDbDataParameter[] Params, params object[] arguments)
        {
            string sSql = CommonSqls.Instance().GetSql(nModuleID, sSubID);

            if (String.IsNullOrEmpty(sSql))
                return 0;
            if (arguments != null && arguments.Length > 0)
                sSql = string.Format(sSql, arguments);
            return ExecNonQuery(sSql, Params);
        }

        public int ExecNonQuery(int nModuleID, string sSubID, params object[] arguments)
        {
            return ExecNonQuery(nModuleID, sSubID, null, arguments);
        }

        public int ExecNonQuery(int nModuleID, string sSubID)
        {
            return ExecNonQuery(nModuleID, sSubID, null, null);
        }

        public int ExecNonQuery(string sFullName, int nFunctionID, IDbDataParameter[] Params, params object[] arguments)
        {
            string sSql = CommonSqls.Instance().GetSql(sFullName, nFunctionID);

            if (String.IsNullOrEmpty(sSql))
                return 0;
            if (arguments != null && arguments.Length > 0)
                sSql = string.Format(sSql, arguments);
            return ExecNonQuery(sSql, Params);
        }

        public int ExecNonQuery(string sFullName, int nFunctionID, params object[] arguments)
        {
            return ExecNonQuery(sFullName, nFunctionID, null, arguments);
        }

        public int ExecNonQuery(string sFullName, int nFunctionID)
        {
            return ExecNonQuery(sFullName, nFunctionID, null, null);
        }

        public int ExecNonQuery(object obj, int nFunctionID, IDbDataParameter[] Params, params object[] arguments)
        {
            string sSql = CommonSqls.Instance().GetSql(obj.GetType().FullName, nFunctionID);

            if (String.IsNullOrEmpty(sSql))
                return 0;
            if (arguments != null && arguments.Length > 0)
                sSql = string.Format(sSql, arguments);
            return ExecNonQuery(sSql, Params);
        }

        public int ExecNonQuery(object obj, int nFunctionID, params object[] arguments)
        {
            return ExecNonQuery(obj, nFunctionID, null, arguments);
        }

        public int ExecNonQuery(object obj, int nFunctionID)
        {
            return ExecNonQuery(obj, nFunctionID, null, null);
        }

        /// <summary>
        /// 执行 SQL 语句，只返回查询的第一行，第一列的值
        /// </summary>
        /// <param name="strSQL"></param>
        /// <returns></returns>
        public object ExecScalar(string strSQL)
        {
            return ExecScalar(strSQL, null);
        }
        public object ExecScalar(string strSQL, IDbDataParameter[] Params)
        {
            object objResult;

            IDbConnection DbConn = null;
            IDbCommand command = null;
            try
            {
                command = PrepareCommand(out DbConn, CommandType.Text, strSQL, Params);
                LogFile.WriteToFile(strSQL, "读取数据", 0);
                objResult = command.ExecuteScalar();
            }
            catch (Exception Err)
            {
                string strMessage = string.Format("数据库访问错误：{0}", Err.Message);
                LogFile.WriteToFile(strSQL, Err.Message, 2);
                throw new Exception(strMessage);
            }
            finally
            {
                if (HashDbConnPool.ContainsKey(DbConn))
                    HashDbConnPool[DbConn] = false;
            }
            return objResult;
        }

        public object ExecScalar(int nModuleID, string sSubID)
        {
            return ExecScalar(nModuleID, sSubID, null, null);
        }
        public object ExecScalar(int nModuleID, string sSubID, params object[] arguments)
        {
            return ExecScalar(nModuleID, sSubID, null, arguments);
        }
        public object ExecScalar(int nModuleID, string sSubID, IDbDataParameter[] Params, params object[] arguments)
        {
            string sSql = CommonSqls.Instance().GetSql(nModuleID, sSubID);
            if (String.IsNullOrEmpty(sSql))
                return 0;
            if (arguments != null && arguments.Length > 0)
                sSql = string.Format(sSql, arguments);
            return ExecScalar(sSql, Params);
        }

        public object ExecScalar(string sFullName, int nFunctionID)
        {
            return ExecScalar(sFullName, nFunctionID, null, null);
        }
        public object ExecScalar(string sFullName, int nFunctionID, params object[] arguments)
        {
            return ExecScalar(sFullName, nFunctionID, null, arguments);
        }
        public object ExecScalar(string sFullName, int nFunctionID, IDbDataParameter[] Params, params object[] arguments)
        {
            string sSql = CommonSqls.Instance().GetSql(sFullName, nFunctionID);
            if (String.IsNullOrEmpty(sSql))
                return 0;
            if (arguments != null && arguments.Length > 0)
                sSql = string.Format(sSql, arguments);
            return ExecScalar(sSql, Params);
        }

        public object ExecScalar(object obj, int nFunctionID)
        {
            return ExecScalar(obj.GetType().FullName, nFunctionID, null, null);
        }
        public object ExecScalar(object obj, int nFunctionID, params object[] arguments)
        {
            return ExecScalar(obj.GetType().FullName, nFunctionID, null, arguments);
        }
        public object ExecScalar(object obj, int nFunctionID, IDbDataParameter[] Params, params object[] arguments)
        {
            return ExecScalar(obj.GetType().FullName, nFunctionID, Params, arguments);
        }
        /// <summary>
        /// 执行 SQL 语句，返回查询某行的值
        /// </summary>
        /// <param name="strSQL"></param>
        /// <returns></returns>
        public DbDataReader ExecReader(string strSQL)
        {
            return ExecReader(strSQL, null);
        }
        public DbDataReader ExecReader(string strSQL, IDbDataParameter[] Params)
        {
            DbDataReader reader;
            IDbConnection DbConn = null;
            IDbCommand command = null;
            try
            {
                command = PrepareCommand(out DbConn, CommandType.Text, strSQL, Params);
                LogFile.WriteToFile(strSQL, "读取数据", 0);
                reader = (DbDataReader)command.ExecuteReader();
            }
            catch (Exception Err)
            {
                string strMessage = string.Format("数据库访问错误：{0}", Err.Message);
                LogFile.WriteToFile(strSQL, Err.Message, 2);
                throw new Exception(strMessage);
            }
            finally
            {
                if (HashDbConnPool.ContainsKey(DbConn))
                    HashDbConnPool[DbConn] = false;
            }
            return reader;
        }

        public DbDataReader ExecReader(int nModuleID, string sSubID, IDbDataParameter[] Params, params object[] arguments)
        {
            string sSql = CommonSqls.Instance().GetSql(nModuleID, sSubID);
            if (String.IsNullOrEmpty(sSql))
                return null;
            if (arguments != null && arguments.Length > 0)
                sSql = string.Format(sSql, arguments);
            return ExecReader(sSql, Params);
        }
        public DbDataReader ExecReader(int nModuleID, string sSubID, params object[] arguments)
        {
            return ExecReader(nModuleID, sSubID, null, arguments);
        }
        public DbDataReader ExecReader(int nModuleID, string sSubID)
        {
            return ExecReader(nModuleID, sSubID, null, null);
        }

        public DbDataReader ExecReader(string sFullName, int nFunctionID, IDbDataParameter[] Params, params object[] arguments)
        {
            string sSql = CommonSqls.Instance().GetSql(sFullName, nFunctionID);
            if (String.IsNullOrEmpty(sSql))
                return null;
            if (arguments != null && arguments.Length > 0)
                sSql = string.Format(sSql, arguments);
            return ExecReader(sSql, Params);
        }
        public DbDataReader ExecReader(string sFullName, int nFunctionID, params object[] arguments)
        {
            return ExecReader(sFullName, nFunctionID, null, arguments);
        }
        public DbDataReader ExecReader(string sFullName, int nFunctionID)
        {
            return ExecReader(sFullName, nFunctionID, null, null);
        }


        public DbDataReader ExecReader(object obj, int nFunctionID, IDbDataParameter[] Params, params object[] arguments)
        {
            return ExecReader(obj.GetType().FullName, nFunctionID, Params, arguments);
        }
        public DbDataReader ExecReader(object obj, int nFunctionID, params object[] arguments)
        {
            return ExecReader(obj.GetType().FullName, nFunctionID, arguments);
        }
        public DbDataReader ExecReader(object obj, int nFunctionID)
        {
            return ExecReader(obj.GetType().FullName, nFunctionID);
        }


        /// <summary>
        /// 执行 SQL 语句，返回表
        /// </summary>
        /// <param name="strSQL"></param>
        /// <returns></returns>
        public DataTable GetDataTable(string strSQL)
        {
            return GetDataTable(strSQL, null);
        }
        public static string LogLock = "";
        public DataTable GetDataTable(string strSQL, IDbDataParameter[] Params)
        {
            DataTable needDT = new DataTable();
            IDbConnection DbConn = null;
            IDbCommand command = null;
            try
            {
                command = PrepareCommand(out DbConn, CommandType.Text, strSQL, Params);

                //LogFile.WriteToFile(strSQL, "读取数据", 0);

                DbDataAdapter adpter = m_dbFactory.GetDBAdapter();

                ((IDbDataAdapter)adpter).SelectCommand = command;
                string[] sArgs = Environment.GetCommandLineArgs();
                if (sArgs != null && sArgs.Length > 0 && sArgs.FirstOrDefault(s => string.Compare(s, "-sql") == 0) != null)
                    LogFile.WriteToFile(strSQL, "Querry Sql", 0);

                DateTime start = DateTime.Now;
                adpter.Fill(needDT);
                TimeSpan span = DateTime.Now - start;

                //if (span.TotalMilliseconds >= 100)
                lock (LogLock)
                {
                    LogFile.WriteToFile(strSQL, string.Format("耗时:{0}毫秒", span.TotalMilliseconds), 0);
                }
            }
            catch (Exception Err)
            {
                string strMessage = string.Format("数据库访问错误：{0}", Err.Message);
                lock (LogLock)
                {
                    LogFile.WriteToFile(strSQL, Err.Message, 2);
                }
                throw new Exception(strMessage);
            }
            finally
            {
                if (HashDbConnPool.ContainsKey(DbConn))
                    HashDbConnPool[DbConn] = false;
            }
            return needDT;
        }

        public DataTable GetDataTable(int nModuleID, string sSubID)
        {
            return GetDataTable(nModuleID, sSubID, null, null);
        }
        public DataTable GetDataTable(int nModuleID, string sSubID, params object[] arguments)
        {
            return GetDataTable(nModuleID, sSubID, null, arguments);
        }
        public DataTable GetDataTable(int nModuleID, string sSubID, IDbDataParameter[] Params, params object[] arguments)
        {
            string sSql = CommonSqls.Instance().GetSql(nModuleID, sSubID);
            if (String.IsNullOrEmpty(sSql))
                return null;
            if (arguments != null && arguments.Length > 0)
                sSql = string.Format(sSql, arguments);
            return GetDataTable(sSql, Params);
        }

        public DataTable GetDataTable(string sFullName, int nFunctionID)
        {
            return GetDataTable(sFullName, nFunctionID, null, null);
        }
        public DataTable GetDataTable(object obj, int nFunctionID)
        {
            return GetDataTable(obj.GetType().FullName, nFunctionID, null, null);
        }
        public DataTable GetDataTable(string sFullName, int nFunctionID, params object[] arguments)
        {
            return GetDataTable(sFullName, nFunctionID, null, arguments);
        }
        public DataTable GetDataTable(object obj, int nFunctionID, params object[] arguments)
        {
            return GetDataTable(obj.GetType().FullName, nFunctionID, null, arguments);
        }
        public DataTable GetDataTable(string sFullName, int nFunctionID, IDbDataParameter[] Params, params object[] arguments)
        {
            string sSql = CommonSqls.Instance().GetSql(sFullName, nFunctionID);
            if (String.IsNullOrEmpty(sSql))
                return null;
            if (arguments != null && arguments.Length > 0)
                sSql = string.Format(sSql, arguments);
            return GetDataTable(sSql, Params);
        }
        public DataTable GetDataTable(object obj, int nFunctionID, IDbDataParameter[] Params, params object[] arguments)
        {
            string sSql = CommonSqls.Instance().GetSql(obj.GetType().FullName, nFunctionID);
            if (String.IsNullOrEmpty(sSql))
                return null;
            if (arguments != null && arguments.Length > 0)
                sSql = string.Format(sSql, arguments);
            return GetDataTable(sSql, Params);
        }

        /// <summary>
        /// 执行 SQL 语句，返回表
        /// </summary>
        /// <param name="strSQL"></param>
        /// <returns></returns>
        public DataSet GetDataSet(string strSQL)
        {
            return GetDataSet(strSQL, null);
        }
        /// <summary>
        /// 执行 SQL 语句，返回表
        /// </summary>
        /// <param name="strSQL"></param>
        /// <param name="TableName"></param>
        /// <returns></returns>
        public DataSet GetDataSet(string[] strSQL, string[] TableName)
        {
            return GetDataSet(strSQL, TableName, null);
        }

        /// <summary>
        /// 执行 SQL 语句，返回表
        /// </summary>
        /// <param name="strSQL"></param>
        /// <param name="Params"></param>
        /// <returns></returns>
        public DataSet GetDataSet(string strSQL, IDbDataParameter[] Params)
        {
            DataSet needDS = new DataSet();

            IDbConnection DbConn = null;
            IDbCommand command = null;
            try
            {
                command = PrepareCommand(out DbConn, CommandType.Text, strSQL, Params);

                // LogFile.WriteToFile(strSQL, "读取数据", 0);

                DbDataAdapter adpter = m_dbFactory.GetDBAdapter();
                ((IDbDataAdapter)adpter).SelectCommand = command;

                DateTime start = DateTime.Now;
                adpter.Fill(needDS);
                TimeSpan span = DateTime.Now - start;
                //  if (span.TotalMilliseconds >= 100)
                LogFile.WriteToFile(strSQL, string.Format("耗时:{0}毫秒", span.TotalMilliseconds), 0);
            }
            catch (Exception Err)
            {
                string strMessage = string.Format("数据库访问错误：{0}", Err.Message);
                LogFile.WriteToFile(strSQL, Err.Message, 2);
                throw new Exception(strMessage);
            }
            finally
            {
                if (HashDbConnPool.ContainsKey(DbConn))
                    HashDbConnPool[DbConn] = false;
            }
            return needDS;
        }

        /// <summary>
        /// 执行 SQL 语句，返回表
        /// </summary>
        /// <param name="strSQL"></param>
        /// <param name="TableName"></param>
        /// <param name="Params"></param>
        /// <returns></returns>
        public DataSet GetDataSetM(string[] strSQL, string[] TableName, IDbDataParameter[][] Params)
        {
            DataSet needDS = new DataSet();

            IDbConnection DbConn = null;
            IDbCommand command = null;
            try
            {
                command = PrepareCommand(out DbConn, CommandType.Text, "", null);

                DbDataAdapter adpter = m_dbFactory.GetDBAdapter();
                ((IDbDataAdapter)adpter).SelectCommand = command;

                for (int i = 0; i < strSQL.Length; i++)
                {
                    LogFile.WriteToFile(strSQL[i], "读取数据", 0);

                    command.CommandText = strSQL[i];
                    if (Params != null && Params.Length > i && Params[i] != null && Params[i].Length > 0)
                    {
                        foreach (IDbDataParameter par in Params[i])
                        {
                            command.Parameters.Add(par);
                        }
                    }
                    adpter.Fill(needDS, TableName[i]);
                }
            }
            catch (Exception Err)
            {
                string strMessage = string.Format("数据库访问错误：{0}", Err.Message);

                for (int i = 0; i < strSQL.Length; i++)
                    LogFile.WriteToFile(strSQL[i], Err.Message, 2);

                throw new Exception(strMessage);
            }
            finally
            {
                if (HashDbConnPool.ContainsKey(DbConn))
                    HashDbConnPool[DbConn] = false;
            }
            return needDS;
        }

        public DataSet GetDataSet(int nModuleID, string sSubID)
        {
            return GetDataSet(nModuleID, sSubID, null, null);
        }
        public DataSet GetDataSet(int nModuleID, string sSubID, params object[] arguments)
        {
            return GetDataSet(nModuleID, sSubID, null, arguments);
        }
        public DataSet GetDataSet(int nModuleID, string sSubID, IDbDataParameter[] Params, params object[] arguments)
        {
            string sSql = CommonSqls.Instance().GetSql(nModuleID, sSubID);
            if (String.IsNullOrEmpty(sSql))
                return null;
            if (arguments != null && arguments.Length > 0)
                sSql = string.Format(sSql, arguments);
            return GetDataSet(sSql);

        }

        public DataSet GetDataSet(string sFullName, int nFunctionID)
        {
            return GetDataSet(sFullName, nFunctionID, null, null);
        }
        public DataSet GetDataSet(string sFullName, int nFunctionID, params object[] arguments)
        {
            return GetDataSet(sFullName, nFunctionID, null, arguments);
        }
        public DataSet GetDataSet(string sFullName, int nFunctionID, IDbDataParameter[] Params, params object[] arguments)
        {
            string sSql = CommonSqls.Instance().GetSql(sFullName, nFunctionID);
            if (String.IsNullOrEmpty(sSql))
                return null;
            if (arguments != null && arguments.Length > 0)
                sSql = string.Format(sSql, arguments);
            return GetDataSet(sSql);

        }

        public DataSet GetDataSet(string[] sSubIDs, string[] sTableNames, IDbDataParameter[][] Params)
        {
            return GetDataSet(0, sSubIDs, sTableNames, Params);

        }
        public DataSet GetDataSet(int nModuleID, string[] sSubIDs, string[] sTableNames, IDbDataParameter[][] Params)
        {
            //TODO : 参数检查

            string[] sSQLs = new string[sSubIDs.Length];
            int i = 0;
            foreach (string sSubID in sSubIDs)
                sSQLs[i++] = CommonSqls.Instance().GetSql(nModuleID, sSubID);

            return GetDataSetM(sSQLs, sTableNames, Params);
        }


        public int GetMaxRecordID(string strSQL)
        {
            object objMaxID = ExecScalar(strSQL);
            if (objMaxID != null && objMaxID.ToString().Trim() != "")
                return Convert.ToInt32(objMaxID) + 1;
            return 1;
        }
        public int GetMaxRecordID(string strSQL, IDbDataParameter[] Params)
        {
            object objMaxID = ExecScalar(strSQL, Params);
            if (objMaxID != null && objMaxID.ToString().Trim() != "")
                return Convert.ToInt32(objMaxID) + 1;
            return 1;
        }
        public int GetMaxRecordID(string TableName, string FieldName)
        {
            object objMaxID = ExecScalar(string.Format(@"select max({0}) from {1}", FieldName, TableName));
            if (objMaxID != null && objMaxID.ToString().Trim() != "")
                return Convert.ToInt32(objMaxID) + 1;
            return 1;
        }
        public int GetMaxRecordID(string TableName, string FieldName, string strWhere)
        {
            object objMaxID = ExecScalar(string.Format(@"select max({0}) from {1} where {2}", FieldName, TableName, strWhere));
            if (objMaxID != null && objMaxID.ToString().Trim() != "")
                return Convert.ToInt32(objMaxID) + 1;
            return 1;
        }

        public int GetMaxRecordID(int nModuleID, string sSubID, params object[] arguments)
        {
            return GetMaxRecordID(nModuleID, sSubID, null, arguments);
        }
        public int GetMaxRecordID(int nModuleID, string sSubID, IDbDataParameter[] Params, params object[] arguments)
        {
            string sSql = CommonSqls.Instance().GetSql(nModuleID, sSubID);
            if (String.IsNullOrEmpty(sSql))
                return 0;
            if (arguments != null && arguments.Length > 0)
                sSql = string.Format(sSql, arguments);
            return GetMaxRecordID(sSql, Params);
        }

        public int GetMaxRecordID(string sFullName, int nFunctionID, params object[] arguments)
        {
            return GetMaxRecordID(sFullName, nFunctionID, null, arguments);
        }
        public int GetMaxRecordID(string sFullName, int nFunctionID, IDbDataParameter[] Params, params object[] arguments)
        {
            string sSql = CommonSqls.Instance().GetSql(sFullName, nFunctionID);
            if (String.IsNullOrEmpty(sSql))
                return 0;
            if (arguments != null && arguments.Length > 0)
                sSql = string.Format(sSql, arguments);
            return GetMaxRecordID(sSql, Params);
        }

        public int GetMaxRecordID(object obj, int nFunctionID, params object[] arguments)
        {
            return GetMaxRecordID(obj.GetType().FullName, nFunctionID, arguments);
        }
        public int GetMaxRecordID(object obj, int nFunctionID, IDbDataParameter[] Params, params object[] arguments)
        {
            return GetMaxRecordID(obj.GetType().FullName, nFunctionID, Params, arguments);
        }
        #endregion

        #region produce
        /// <summary>
        /// 执行SQL 语句，返回影响的行数
        /// </summary>

        /// <returns></returns>
        public void RunProduce(string ProduceName, DbParameter[] Params)
        {
            IDbConnection DbConn = null;
            IDbCommand command = null;
            try
            {
                command = PrepareCommand(out DbConn, CommandType.StoredProcedure, ProduceName, Params);
                command.ExecuteNonQuery();
            }
            catch (Exception Err)
            {
                string strMessage = string.Format("数据库访问错误：{0}", Err.Message);
                LogFile.WriteToFile("存储过程:" + ProduceName, Err.Message, 2);
                throw new Exception(strMessage);

            }
            finally
            {
                if (HashDbConnPool.ContainsKey(DbConn))
                    HashDbConnPool[DbConn] = false;
            }
        }
        #endregion


        #region 利用事务的方法
        /// <summary>
        /// 连接对象初始化,使用事务的时候使用
        /// </summary>
        /// <param name="conn"></param>
        /// <param name="trans"></param>
        /// <param name="cmdType"></param>
        /// <param name="cmdText"></param>
        /// <param name="commandParameters"></param>
        /// <returns></returns>
        private IDbCommand PrepareCommand(IDbConnection conn, IDbTransaction trans, CommandType cmdType, string cmdText, IDbDataParameter[] commandParameters)
        {
            if (conn.State != ConnectionState.Open)
                conn.Open();
            IDbCommand cmd = conn.CreateCommand();
            cmd.Connection = conn;
            cmd.CommandText = cmdText;
            cmd.CommandType = cmdType;

            if (HashDbConnPool.ContainsKey(conn))
                HashDbConnPool[conn] = true;

            if (trans != null)
                cmd.Transaction = trans;

            if (commandParameters != null)
            {
                foreach (IDbDataParameter parm in commandParameters)
                    cmd.Parameters.Add(parm);
            }
            return cmd;
        }
        /// <summary>
        /// 连接对象初始化,不用事务的时候使用
        /// </summary>
        /// <param name="conn"></param>
        /// <param name="cmdType"></param>
        /// <param name="cmdText"></param>
        /// <param name="commandParameters"></param>
        /// <returns></returns>
        private IDbCommand PrepareCommand(out IDbConnection conn, CommandType cmdType, string cmdText, IDbDataParameter[] commandParameters)
        {
            conn = GetIDbConnection();

            if (HashDbConnPool.ContainsKey(conn))
                HashDbConnPool[conn] = true;
            if (conn.State != ConnectionState.Open)
                conn.Open();

            IDbCommand cmd = conn.CreateCommand();
            cmd.Connection = conn;
            cmd.CommandText = cmdText;
            cmd.CommandType = cmdType;

            if (commandParameters != null)
            {
                foreach (IDbDataParameter parm in commandParameters)
                    cmd.Parameters.Add(parm);
            }
            return cmd;
        }

        /// <summary>
        /// ExecNonQuery动作实体
        /// </summary>
        /// <param name="strSQL"></param>
        /// <param name="Params"></param>
        /// <returns></returns>
        public int ExecNonQuery(IDbTransaction trans, string strSQL, IDbDataParameter[] Params)
        {
            int nAffectResult;

            IDbConnection DbConn = trans.Connection;
            IDbCommand command = null;
            try
            {
                command = PrepareCommand(trans.Connection, trans, CommandType.Text, strSQL, Params);
                nAffectResult = command.ExecuteNonQuery();
                command.Parameters.Clear();
            }
            catch (Exception Err)
            {
                if (command != null)
                    command.Parameters.Clear();
                string strMessage = string.Format("数据库访问错误：{0}", Err.Message);
                LogFile.WriteToFile(strSQL, Err.Message, 2);
                throw new Exception(strMessage);

            }
            return nAffectResult;
        }
        public int ExecNonQuery(IDbTransaction trans, string sSql)
        {
            return ExecNonQuery(trans, sSql, null);
        }
        public int ExecNonQuery(IDbTransaction trans, object obj, int nFunctionID, IDbDataParameter[] Params, params object[] arguments)
        {
            string sSql = CommonSqls.Instance().GetSql(obj.GetType().FullName, nFunctionID);

            if (String.IsNullOrEmpty(sSql))
                return 0;
            if (arguments != null && arguments.Length > 0)
                sSql = string.Format(sSql, arguments);
            return ExecNonQuery(trans, sSql, Params);
        }
        public int ExecNonQuery(IDbTransaction trans, object obj, int nFunctionID, params object[] arguments)
        {
            return ExecNonQuery(trans, obj, nFunctionID, null, arguments);
        }
        public object ExecScalar(IDbTransaction trans, string strSQL, IDbDataParameter[] Params)
        {
            object objResult;
            IDbConnection DbConn = trans.Connection;
            IDbCommand command = null;
            try
            {
                command = PrepareCommand(trans.Connection, trans, CommandType.Text, strSQL, Params);
                objResult = command.ExecuteScalar();
                command.Parameters.Clear();
            }
            catch (Exception Err)
            {
                if (command != null)
                    command.Parameters.Clear();

                string strMessage = string.Format("数据库访问错误：{0}", Err.Message);
                LogFile.WriteToFile(strSQL, Err.Message, 2);

                throw new Exception(strMessage);
            }
            return objResult;
        }
        /// <summary>
        /// 执行 SQL 语句，只返回查询的第一行，第一列的值
        /// </summary>
        /// <param name="strSQL"></param>
        /// <returns></returns>
        public object ExecScalar(IDbTransaction trans, string strSQL)
        {
            return ExecScalar(trans, strSQL, null);
        }
        public object ExecScalar(IDbTransaction trans, string sFullName, int nFunctionID, IDbDataParameter[] Params, params object[] arguments)
        {
            string sSql = CommonSqls.Instance().GetSql(sFullName, nFunctionID);
            if (String.IsNullOrEmpty(sSql))
                return 0;
            if (arguments != null && arguments.Length > 0)
                sSql = string.Format(sSql, arguments);
            return ExecScalar(trans, sSql, Params);
        }
        public object ExecScalar(IDbTransaction trans, object obj, int nFunctionID, params object[] arguments)
        {
            return ExecScalar(trans, obj.GetType().FullName, nFunctionID, null, arguments);
        }
        public object ExecScalar(IDbTransaction trans, object obj, int nFunctionID, IDbDataParameter[] Params, params object[] arguments)
        {
            return ExecScalar(trans, obj.GetType().FullName, nFunctionID, Params, arguments);
        }

        public IDataReader ExecReader(IDbTransaction trans, string strSQL, IDbDataParameter[] Params)
        {
            IDataReader reader;
            IDbConnection DbConn = trans.Connection;
            IDbCommand command = null;
            try
            {
                command = PrepareCommand(trans.Connection, trans, CommandType.Text, strSQL, Params);
                LogFile.WriteToFile(strSQL, "读取数据", 0);
                reader = (IDataReader)command.ExecuteReader();
                command.Parameters.Clear();
            }
            catch (Exception Err)
            {
                if (command != null)
                    command.Parameters.Clear();

                string strMessage = string.Format("数据库访问错误：{0}", Err.Message);
                LogFile.WriteToFile(strSQL, Err.Message, 2);

                throw new Exception(strMessage);
            }
            return reader;
        }
        public IDataReader ExecReader(IDbTransaction trans, string sFullName, int nFunctionID, IDbDataParameter[] Params, params object[] arguments)
        {
            string sSql = CommonSqls.Instance().GetSql(sFullName, nFunctionID);
            if (String.IsNullOrEmpty(sSql))
                return null;
            if (arguments != null && arguments.Length > 0)
                sSql = string.Format(sSql, arguments);
            return ExecReader(trans, sSql, Params);
        }

        public DataTable GetDataTable(IDbTransaction trans, string strSQL, IDbDataParameter[] Params)
        {
            DataTable needDT = new DataTable();

            IDbConnection DbConn = trans.Connection;
            IDbCommand command = null;
            try
            {
                command = PrepareCommand(trans.Connection, trans, CommandType.Text, strSQL, Params);

             //   LogFile.WriteToFile(strSQL, "读取数据", 0);

                DbDataAdapter adpter = m_dbFactory.GetDBAdapter();
                ((IDbDataAdapter)adpter).SelectCommand = command;

                DateTime start = DateTime.Now;
                adpter.Fill(needDT);
                TimeSpan span = DateTime.Now - start;

                command.Parameters.Clear();
            //    if (span.TotalMilliseconds >= 100)
                    LogFile.WriteToFile(strSQL, string.Format("耗时:{0}秒", span.TotalSeconds), 0);
            }
            catch (Exception Err)
            {
                if (command != null)
                    command.Parameters.Clear();

                string strMessage = string.Format("数据库访问错误：{0}", Err.Message);
                LogFile.WriteToFile(strSQL, Err.Message, 2);

                throw new Exception(strMessage);
            }
            return needDT;
        }

        public DataTable GetDataTable(IDbTransaction trans, object obj, int nFunctionID, IDbDataParameter[] Params, params object[] arguments)
        {
            string sSql = CommonSqls.Instance().GetSql(obj.GetType().FullName, nFunctionID);
            if (String.IsNullOrEmpty(sSql))
                return null;
            if (arguments != null && arguments.Length > 0)
                sSql = string.Format(sSql, arguments);
            return GetDataTable(trans, sSql, Params);
        }
        public DataTable GetDataTable(IDbTransaction trans, object obj, int nFunctionID, params object[] arguments)
        {
            return GetDataTable(trans, obj, nFunctionID, null, arguments);
        }

        public DataSet GetDataSet(IDbTransaction trans, string strSQL, IDbDataParameter[] Params)
        {
            DataSet needDS = new DataSet();
            IDbConnection DbConn = trans.Connection;
            IDbCommand command = null;
            try
            {
                command = PrepareCommand(trans.Connection, trans, CommandType.Text, strSQL, Params);

                LogFile.WriteToFile(strSQL, "读取数据", 0);

                DbDataAdapter adpter = m_dbFactory.GetDBAdapter();
                ((IDbDataAdapter)adpter).SelectCommand = command;


                DateTime start = DateTime.Now;
                adpter.Fill(needDS);
                command.Parameters.Clear();
                TimeSpan span = DateTime.Now - start;
            }
            catch (Exception Err)
            {
                if (command != null)
                    command.Parameters.Clear();

                string strMessage = string.Format("数据库访问错误：{0}", Err.Message);
                LogFile.WriteToFile(strSQL, Err.Message, 2);

                throw new Exception(strMessage);
            }
            return needDS;
        }

        /// <summary>
        /// 执行 SQL 语句，返回表
        /// </summary>
        /// <param name="strSQL"></param>
        /// <param name="TableName"></param>
        /// <param name="Params"></param>
        /// <returns></returns>
        public DataSet GetDataSetM(IDbTransaction trans, string[] strSQL, string[] TableName, IDbDataParameter[][] Params)
        {
            DataSet needDS = new DataSet();
            IDbConnection DbConn = trans.Connection;
            IDbCommand command = null;
            try
            {
                command = PrepareCommand(trans.Connection, trans, CommandType.Text, null, null);

                DbDataAdapter adpter = m_dbFactory.GetDBAdapter();
                ((IDbDataAdapter)adpter).SelectCommand = command;

                for (int i = 0; i < strSQL.Length; i++)
                {
                    LogFile.WriteToFile(strSQL[i], "读取数据", 0);
                    command.CommandText = strSQL[i];
                    if (Params != null && Params.Length > i && Params[i] != null && Params[i].Length > 0)
                    {
                        foreach (IDbDataParameter par in Params[i])
                        {
                            if (CommonDB.NOAPDBType.Sybase == m_dbFactory.DabaseType)
                                par.ParameterName = "@" + par.ParameterName;
                            command.Parameters.Add(par);
                        }
                    }
                    adpter.Fill(needDS, TableName[i]);
                    command.Parameters.Clear();
                }

            }
            catch (Exception Err)
            {
                if (command != null)
                    command.Parameters.Clear();

                string strMessage = string.Format("数据库访问错误：{0}", Err.Message);

                for (int i = 0; i < strSQL.Length; i++)
                    LogFile.WriteToFile(strSQL[i], Err.Message, 2);

                throw new Exception(strMessage);
            }
            return needDS;
        }

        public int GetMaxRecordID(IDbTransaction trans, string TableName, string FieldName)
        {
            object objMaxID = ExecScalar(trans, string.Format(@"select max({0}) from {1}", FieldName, TableName));
            if (objMaxID != null && objMaxID.ToString().Trim() != "")
                return Convert.ToInt32(objMaxID) + 1;
            return 1;
        }

        /// <summary>
        /// 执行SQL 语句，返回影响的行数
        /// </summary>

        /// <returns></returns>
        public void RunProduce(IDbTransaction trans, string ProduceName, IDbDataParameter[] Params)
        {
            IDbConnection DbConn = trans.Connection;
            try
            {
                IDbCommand command = PrepareCommand(trans.Connection, trans, CommandType.StoredProcedure, ProduceName, Params);
                command.ExecuteNonQuery();
            }
            catch (Exception Err)
            {
                string strMessage = string.Format("数据库访问错误：{0}", Err.Message);
                LogFile.WriteToFile("存储过程:" + ProduceName, Err.Message, 2);


                if (HashDbConnPool.ContainsKey(DbConn))
                    HashDbConnPool[DbConn] = false;
                throw new Exception(strMessage);

            }
        }
        /// <summary>
        /// 执行SQL 语句，返回影响的行数
        /// </summary>

        /// <returns></returns>
        public void RunProduce(string ProduceName, IDbDataParameter[] Params)
        {
            IDbConnection DbConn = null;
            try
            {
                IDbCommand command = PrepareCommand(out DbConn, CommandType.StoredProcedure, ProduceName, Params);
                command.ExecuteNonQuery();
            }
            catch (Exception Err)
            {
                string strMessage = string.Format("数据库访问错误：{0}", Err.Message);
                LogFile.WriteToFile("存储过程:" + ProduceName, Err.Message, 2);

                throw new Exception(strMessage);

            }
            finally
            {
                if (HashDbConnPool.ContainsKey(DbConn))
                    HashDbConnPool[DbConn] = false;
            }
        }
        #endregion


        #region  Getsql
        public string GetSql(object obj, int nFunctionID, params object[] arguments)
        {
            string sSql = CommonSqls.Instance().GetSql(obj.GetType().FullName, nFunctionID);
            if (arguments != null && arguments.Length > 0)
                sSql = string.Format(sSql, arguments);
            return sSql;
        }

        public string GetSql(string assembly, int nFunctionID, params object[] arguments)
        {
            string sSql = CommonSqls.Instance().GetSql(assembly, nFunctionID);
            if (arguments != null && arguments.Length > 0)
                sSql = string.Format(sSql, arguments);
            return sSql;
        }


        public string GetSql(object obj, int nFunctionID)
        {
            return CommonSqls.Instance().GetSql(obj.GetType().FullName, nFunctionID);
        }
        #endregion

        #region 将对象传递出去。在外面需要调用 DBAcess.Instance().CloseConnection(DbConn);方法
        /// <summary>
        /// 执行 SQL 语句，返回查询某行的值
        /// </summary>
        /// <param name="strSQL"></param>
        /// <returns></returns>
        public IDataReader ExecReader(string strSQL, ref IDbConnection DbConn)
        {
            return ExecReader(strSQL, null, ref DbConn);
        }

        public IDataReader ExecReader(string strSQL, IDbDataParameter[] Params, ref IDbConnection DbConn)
        {
            IDataReader reader;
            IDbCommand command = null;
            try
            {
                command = PrepareCommand(out DbConn, CommandType.Text, strSQL, Params);
                LogFile.WriteToFile(strSQL, "读取数据", 0);
                reader = (IDataReader)command.ExecuteReader();
                command.Parameters.Clear();
            }
            catch (Exception Err)
            {
                if (command != null)
                    command.Parameters.Clear();

                string strMessage = string.Format("数据库访问错误：{0}", Err.Message);
                LogFile.WriteToFile(strSQL, Err.Message, 2);

                throw new Exception(strMessage);
            }
            finally
            {
                if (HashDbConnPool.ContainsKey(DbConn))
                    HashDbConnPool[DbConn] = false;
            }
            return reader;
        }

        public IDataReader ExecReader(int nModuleID, string sSubID, ref IDbConnection DbConn, IDbDataParameter[] Params, params object[] arguments)
        {
            string sSql = CommonSqls.Instance().GetSql(nModuleID, sSubID);
            if (String.IsNullOrEmpty(sSql))
                return null;
            if (arguments != null && arguments.Length > 0)
                sSql = string.Format(sSql, arguments);
            return ExecReader(sSql, Params, ref DbConn);
        }
        public IDataReader ExecReader(int nModuleID, string sSubID, ref IDbConnection DbConn, params object[] arguments)
        {
            return ExecReader(nModuleID, sSubID, ref DbConn, null, arguments);
        }
        public IDataReader ExecReader(string sFullName, int nFunctionID, ref IDbConnection DbConn, IDbDataParameter[] Params, params object[] arguments)
        {
            string sSql = CommonSqls.Instance().GetSql(sFullName, nFunctionID);
            if (String.IsNullOrEmpty(sSql))
                return null;
            if (arguments != null && arguments.Length > 0)
                sSql = string.Format(sSql, arguments);
            return ExecReader(sSql, Params, ref DbConn);
        }

        public IDataReader ExecReader(object obj, int nFunctionID, ref IDbConnection DbConn, IDbDataParameter[] Params, params object[] arguments)
        {
            return ExecReader(obj.GetType().FullName, nFunctionID, ref DbConn, Params, arguments);
        }
        public IDataReader ExecReader(object obj, int nFunctionID, ref IDbConnection DbConn, params object[] arguments)
        {
            return ExecReader(obj.GetType().FullName, nFunctionID, ref DbConn, null, arguments);
        }
        public IDataReader ExecReader(object obj, int nFunctionID, ref IDbConnection DbConn)
        {
            return ExecReader(obj.GetType().FullName, nFunctionID, ref DbConn);
        }
        #endregion

        private void OpenConnection()
        {
            lock (this)
            {
                if (m_dbFactory == null)
                    m_dbFactory = new DBFactory();
                //  m_dbFactory = DbProviderFactories.GetFactory(DBProviderName);

                if (DbConn == null || DbConn.ConnectionString.Trim() == "")
                {
                    try
                    {
                        DbConn = m_dbFactory.GetConnection(ConnectionString, DataType);
                        //DbConn.ConnectionString = ;
                        DbConn.Open();
                    }
                    catch (Exception Err)
                    {
                        LogFile.WriteToFile("数据库连接不成功", Err.Message, 2);
                        throw new Exception("数据库连接不成功");
                    }

                }
                if (DbConn.State == ConnectionState.Closed)
                {
                    try
                    {
                        DbConn.Open();
                    }
                    catch
                    {
                        DbConn = m_dbFactory.GetConnection(ConnectionString, DataType);
                        DbConn.Open();
                    }
                }
            }
        }

        public DbConnection GetConnection()
        {
            return (DbConnection)GetIDbConnection();
        }

        public void CloseConnection(IDbConnection DbConn)
        {
            if (HashDbConnPool.ContainsKey(DbConn))
                HashDbConnPool[DbConn] = false;
        }
        private IDbConnection GetIDbConnection()
        {
            IDbConnection DbConn = null;
            lock (HashDbConnPool)
            {
                if (m_dbFactory == null)
                    m_dbFactory = new DBFactory();

                IDictionaryEnumerator dbEnum = HashDbConnPool.GetEnumerator();

                //判断是否存在空闲的连接
                bool bExist = false;
                while (dbEnum.MoveNext())
                {
                    DbConn = dbEnum.Key as IDbConnection;
                    if (!Convert.ToBoolean(dbEnum.Value) && (m_dbFactory.ConnectString.IndexOf(DbConn.ConnectionString) >= 0))
                    {
                        //存在闲置状态的连接，就使用该连接信息
                        try
                        {
                            // 数据库连接串必须相同，才获取
                            if (DbConn.State == ConnectionState.Closed)
                                DbConn.Open();
                            bExist = true;
                            break;
                        }
                        catch
                        {
                            LogFile.WriteToFile("数据库连接不成功", "", 1);
                            throw new Exception("数据库连接不成功");
                        }
                    }
                }

                if (!bExist)
                {
                    //不能超过10个连接
                    if (HashDbConnPool.Count < 10)
                    {
                        if (ConnectionString.Trim() != "")
                        {
                            try
                            {
                                DbConn = m_dbFactory.GetConnection(ConnectionString, DataType);
                                DbConn.Open();

                                HashDbConnPool.Add(DbConn, true);
                            }
                            catch (Exception Err)
                            {
                                LogFile.WriteToFile("数据库连接不成功", Err.Message, 2);
                                throw new Exception("数据库连接不成功");
                            }
                        }
                    }
                    else
                    {
                        LogFile.WriteToFile("已经达到最大的连接数,请稍等", "", 2);
                        throw new Exception("已经达到最大的连接数,请稍等");
                    }
                }
            }

            return DbConn;
        }
        #region 事务
        /// <summary>
        /// 开始进行事务处理
        /// </summary>
        /// <returns></returns>
        public IDbTransaction TransBegin()
        {
            IDbConnection DbConn = GetIDbConnection();
            IDbTransaction DbTrans = null;
            if (DbConn != null)
            {
                DbTrans = m_dbFactory.BeginDBTrans(DbConn);
                if (HashDbConnPool.ContainsKey(DbConn))
                    HashDbConnPool[DbConn] = 1;
            }

            return DbTrans;
        }

        /// <summary>
        /// 提交事务
        /// </summary>
        public void TransCommit(IDbTransaction DbTrans)
        {
            IDbConnection DbConn = DbTrans.Connection;
            if (HashDbConnPool.ContainsKey(DbTrans.Connection))
                HashDbConnPool[DbTrans.Connection] = false;
            if (DbTrans != null)
                DbTrans.Commit();
        }
        /// <summary>
        /// 事务回滚
        /// </summary>
        public void TransRollback(IDbTransaction DbTrans)
        {
            IDbConnection DbConn = DbTrans.Connection;
            if (HashDbConnPool.ContainsKey(DbTrans.Connection))
                HashDbConnPool[DbTrans.Connection] = false;
            if (DbTrans != null)
                DbTrans.Rollback();
        }
        /// <summary>
        /// 结束事务
        /// </summary>
        public void TransEnd(IDbTransaction DbTrans)
        {
            try
            {
                if (DbTrans != null)
                {
                    DbTrans.Dispose();
                }
            }
            catch
            {
            }
        }

        #endregion

        #region 异步
        /// <summary>
        /// 停止任务
        /// </summary>
        /// <param name="taskName"></param>
        public static void StopTask(string taskName)
        {
            TaskController.Stop(taskName);
        }
        #endregion

        #region 使用连接池,
        /// <summary>
        /// 连接池对象,Key存储连接对象，Value 存储使用状态  true 正在使用false 处于闲置状态
        /// </summary>
        private static Hashtable HashDbConnPool = new Hashtable();



        #endregion

        /// <summary>
        /// 执行 SQL 语句，返回连接命令
        /// </summary>
        /// <param name="strSQL"></param>
        /// <returns></returns>
        public IDbCommand GetCommand(IDbConnection con, string strSQL, int timeout, params object[] args)
        {
            try
            {
                IDbCommand command = con.CreateCommand();
                if (args != null && args.Length > 0)
                {
                    strSQL = String.Format(strSQL, args);
                }
                command.CommandText = strSQL;
                command.CommandTimeout = timeout;
                return command;
            }
            catch (Exception Err)
            {
                string strMessage = string.Format("命令创建失败：{0}", Err.Message);
                //TODO : LOG
                LogFile.WriteToFile(strSQL, Err.Message, 2);
                return null;
            }
        }

        /// <summary>
        /// 执行 SQL 语句，返回命令

        /// </summary>
        /// <param name="strSQL"></param>
        /// <returns></returns>
        public IDbCommand GetCommand(string strSQL, int timeout)
        {
            return GetCommand(DbConn, strSQL, timeout);
        }

        /// <summary>
        /// 执行 SQL 语句，返回适配器

        /// </summary>
        /// <param name="strSQL"></param>
        /// <returns></returns>
        public IDbDataAdapter GetDataAdapter(string strSQL)
        {
            return GetDataAdapter(strSQL, null);
        }
        /// <summary>
        /// 执行 SQL 语句，返回适配器

        /// </summary>
        /// <param name="strSQL"></param>
        /// <param name="Params"></param>
        /// <returns></returns>
        public IDbDataAdapter GetDataAdapter(string strSQL, IDbDataParameter[] Params)
        {
            IDbDataAdapter needDA = null;
            try
            {
                OpenConnection();

                IDbCommand command = DbConn.CreateCommand();
                command.CommandText = strSQL;
                if (Params != null && Params.Length > 0)
                {
                    foreach (IDbDataParameter par in Params)
                    {
                        command.Parameters.Add(par);
                    }
                }

                if (NeedTrans && DbTrans != null)
                {
                    command.Transaction = DbTrans;
                }



                needDA = m_dbFactory.GetDBAdapter();
                ((IDbDataAdapter)needDA).SelectCommand = command;
            }
            catch (Exception Err)
            {
                string strMessage = string.Format("数据库访问错误：{0}", Err.Message);
                //TODO : LOG
                LogFile.WriteToFile(strSQL, Err.Message, 2);
                throw new Exception(strMessage);
            }
            return needDA;
        }

        #region 数据EXCEL导入

        public IDataReader GetExcelReader(string filename, string version, string sSql, params object[] arguments)
        {
            IDataReader reader = null;
            if (String.IsNullOrEmpty(filename))
                return null;
            if (arguments != null && arguments.Length > 0)
                sSql = string.Format(sSql, arguments);
            try
            {
                String strConn = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + filename + " ;Extended Properties=Excel " + version + ";";
                OleDbConnection cnnOle = new OleDbConnection(strConn);
                OleDbCommand cmdOle = new OleDbCommand(sSql, cnnOle);
                cmdOle.CommandTimeout = 10;
                cnnOle.Open();
                reader = cmdOle.ExecuteReader();
            }
            catch (Exception Err)
            {
                string strMessage = string.Format("数据库访问错误：{0}", Err.Message);
                //TODO : LOG
                LogFile.WriteToFile(sSql, Err.Message, 2);
                //DbConn.Close();
                throw new Exception(strMessage);
            }
            return reader;
        }

        #endregion
    }

}