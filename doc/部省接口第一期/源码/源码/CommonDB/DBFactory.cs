using System.Data;
using System.Data.OracleClient;
using MySql.Data.MySqlClient;
using Sybase.Data.AseClient;
using System.Data.Common;

namespace NOAP.CommonDB
{
    /// <summary>
    /// 数据源类型
    /// </summary>
    public enum NOAPDBType
    {
        Oracle = 1,
        Sybase = 2,
        MySQL = 3,
        SQLServer = 4,
        Access = 5,
        XMLFileSystem = 6,
        Other = 0
    }

    public class DBFactory
    {
        public string ConnectString { get; set; }
        public NOAPDBType DabaseType { get; set; }
        public static DBFactory _instance;

        public static DBFactory Instance()
        {
            if (_instance == null)
                _instance = new DBFactory();


            return _instance;
        }

        public IDbConnection GetConnection()
        {
            return GetConnection(ConnectString, DabaseType);
        }

        public IDbConnection GetConnection(string sConStr, NOAPDBType dbtype)
        {
            if (dbtype <= 0 || string.IsNullOrEmpty(sConStr))
                return null;

            switch (dbtype)
            {
                case NOAPDBType.Oracle:
                    {
                        return new OracleConnection(sConStr);
                    }
                case NOAPDBType.Sybase:
                    {
                        return new AseConnection(sConStr);
                    }
                case NOAPDBType.MySQL:
                    {
                        return new MySqlConnection(sConStr);
                    }

            }

            return null;
        }

        public IDbDataParameter GetDbParameter(NOAPDBType dbtype)
        {
            if (dbtype <= 0)
                return null;

            switch (dbtype)
            {
                case NOAPDBType.Oracle:
                    {
                        return new OracleParameter();
                    }
                case NOAPDBType.Sybase:
                    {
                        return new AseParameter();
                    }
                case NOAPDBType.MySQL:
                    {
                        return new MySqlParameter();
                    }
            }

            return null;
        }

        public IDbCommand GetDBCommond(IDbConnection con, string sSQL)
        {
            return GetDBCommond(con, sSQL, DabaseType);
        }

        public IDbCommand GetDBCommond()
        {
            return GetDBCommond(DabaseType);
        }

        public IDbCommand GetDBCommond(NOAPDBType dbtype)
        {
            if (dbtype <= 0)
                return null;

            switch (dbtype)
            {
                case NOAPDBType.Oracle:
                    {
                        return new OracleCommand();
                    }
                case NOAPDBType.Sybase:
                    {
                        return new AseCommand();
                    }
                case NOAPDBType.MySQL:
                    {
                        return new MySqlCommand();
                    }
            }

            return null;
        }

        public IDbCommand GetDBCommond(IDbConnection con, string sSQL, NOAPDBType dbtype)
        {
            if (dbtype <= 0)
                return null;

            switch (dbtype)
            {
                case NOAPDBType.Oracle:
                    {
                        return new OracleCommand(sSQL, (OracleConnection)con);
                    }
                case NOAPDBType.Sybase:
                    {
                        return new AseCommand(sSQL, (AseConnection)con);
                    }
                case NOAPDBType.MySQL:
                    {
                        return new MySqlCommand(sSQL, (MySqlConnection)con);
                    }
            }

            return null;
        }

        public DbDataAdapter GetDBAdapter(IDbConnection con, string sSQL)
        {
            return GetDBAdapter(con, sSQL, DabaseType);
        }

        public DbDataAdapter GetDBAdapter()
        {
            NOAPDBType dbtype = DabaseType;
            if (dbtype <= 0)
                return null;

            switch (dbtype)
            {
                case NOAPDBType.Oracle:
                    {
                        return new OracleDataAdapter();
                    }

                case NOAPDBType.Sybase:
                    {
                        return new AseDataAdapter();
                    }
                case NOAPDBType.MySQL:
                    {
                        return new MySqlDataAdapter();
                    }
            }
            return null;
        }
        public DbDataAdapter GetDBAdapter(IDbCommand Command, NOAPDBType dbtype)
        {
            if (dbtype <= 0)
                return null;

            switch (dbtype)
            {
                case NOAPDBType.Oracle:
                    {
                        return new OracleDataAdapter((OracleCommand)Command);
                    }

                case NOAPDBType.Sybase:
                    {
                        return new AseDataAdapter((AseCommand)Command);
                    }
                case NOAPDBType.MySQL:
                    {
                        return new MySqlDataAdapter((MySqlCommand)Command);
                    }
            }

            return null;
        }

        public DbDataAdapter GetDBAdapter(IDbConnection con, string sSQL, NOAPDBType dbtype)
        {
            if (dbtype <= 0)
                return null;

            switch (dbtype)
            {
                case NOAPDBType.Oracle:
                    {
                        return new OracleDataAdapter(sSQL, (OracleConnection)con);
                    }

                case NOAPDBType.Sybase:
                    {
                        return new AseDataAdapter(sSQL, (AseConnection)con);
                    }
                case NOAPDBType.MySQL:
                    {
                        return new MySqlDataAdapter(sSQL, (MySqlConnection)con);
                    }
            }

            return null;
        }

        public IDbTransaction BeginDBTrans(IDbConnection con)
        {
            return BeginDBTrans(con, DabaseType);

        }

        public IDbTransaction BeginDBTrans(IDbConnection con, NOAPDBType dbtype)
        {
            if (dbtype <= 0)
                return null;

            switch (dbtype)
            {
                case NOAPDBType.Oracle:
                    {
                        return ((OracleConnection)con).BeginTransaction();
                    }
                case NOAPDBType.Sybase:
                    {
                        return ((AseConnection)con).BeginTransaction();
                    }
                case NOAPDBType.MySQL:
                    {
                        return ((MySqlConnection)con).BeginTransaction();
                    }
            }

            return null;
        }

        public IDbTransaction BeginDBTrans(IDbConnection con, IsolationLevel nLevel)
        {
            return BeginDBTrans(con, DabaseType, nLevel);

        }

        public IDbTransaction BeginDBTrans(IDbConnection con, NOAPDBType dbtype, IsolationLevel nLevel)
        {
            if (dbtype <= 0)
                return null;

            switch (dbtype)
            {
                case NOAPDBType.Oracle:
                    {
                        return ((OracleConnection)con).BeginTransaction(nLevel);
                    }
                case NOAPDBType.Sybase:
                    {
                        return ((AseConnection)con).BeginTransaction(nLevel);
                    }
                case NOAPDBType.MySQL:
                    {
                        return ((MySqlConnection)con).BeginTransaction(nLevel);
                    }
            }

            return null;
        }
    }
}