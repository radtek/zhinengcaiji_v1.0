using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using System.IO;
using System.Data;
using System.Data.OracleClient;
using NOAP.CommonDB;

namespace DataCollect.CommonFun
{   
    /// <summary>
    /// 输出性能数据的类
    /// </summary>
    public class clsPerf
    {
        private string _startPath = string.Empty;
        public string startPath
        {
            get { return _startPath; }
            set { _startPath = value; }
        }

        public void GetCheckColumnValid(int classCode,out Dictionary<string, string> dicRelationValid)
        {
            dicRelationValid = new Dictionary<string, string>();
            try
            {
                /*
                 * 防止首次执行时报以下错误
                 * ORA-03113: 通信通道的文件结束进程 ID: 0会话 ID: 1578 序列号: 1066
                 */
                DBAcess.Instance().GetDataTable("select * from dual ");
            }
            catch { }

            try
            {
                DataTable dt =
                    DBAcess.Instance().GetDataTable(
                        string.Format(
                            " select * from cfg_provice_perf t where t.datatype={0} and classCode={1} order by id",
                            2, classCode)); //取的公式表对应的位置关系
                //int index = 0;
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr["ID"] == DBNull.Value || dr["CHIAN_NAME"] == DBNull.Value ||
                        dicRelationValid.ContainsKey(dr["logicexpress"].ToString()))
                        continue;
                    //index++;
                    dicRelationValid.Add(dr["logicexpress"].ToString(), dr["isuser"].ToString());
                }
            }
            catch
            {
                throw new Exception("ORAERROR");
            }
        }

        public void GetResCheckColumnValid(int classCode, out Dictionary<string, string> dicResRelationValid)
        {
            dicResRelationValid = new Dictionary<string, string>();

            try
            {
                /*
                 * 防止首次执行时报以下错误
                 * ORA-03113: 通信通道的文件结束进程 ID: 0会话 ID: 1578 序列号: 1066
                 */
                DBAcess.Instance().GetDataTable("select * from dual ");
            }
            catch { }

            try
            {
                DataTable dt =
                    DBAcess.Instance().GetDataTable(
                        string.Format(
                            " select * from cfg_provice_perf t where classCode={0} and vendor='ZY0808' order by id",
                           classCode)); //取的公式表对应的位置关系
                //int index = 0;
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr["ID"] == DBNull.Value || dr["CHIAN_NAME"] == DBNull.Value ||
                        dicResRelationValid.ContainsKey(dr["logicexpress"].ToString()))
                        continue;
                    //index++;
                    dicResRelationValid.Add(dr["logicexpress"].ToString(), dr["isuser"].ToString());
                }
            }
            catch
            {
                throw new Exception("ORAERROR");
            }
        }


        /// <summary>
        /// 获取正确性检查时非资源类指标的logicexpress和ID列对应关系
        /// </summary>
        /// <param name="classCode">业务类型 1:1x 2:do</param>
        /// <param name="vendor">厂家 固定为ZY0808</param>
        /// <param name="dicRelation">logicexpress和ID列对应关系字典</param>
        /// <param name="dicDetail">logicexpress和datarow对应关系字典</param>
        public void GetCheckColumn(int classCode, string vendor, out Dictionary<string, string> dicRelation)
        {           
            dicRelation = new Dictionary<string, string>();
            try
            {
                /*
                 * 防止首次执行时报以下错误
                 * ORA-03113: 通信通道的文件结束进程 ID: 0会话 ID: 1578 序列号: 1066
                 */
                DBAcess.Instance().GetDataTable("select * from dual ");
            }
            catch { }

            try
            {
                DataTable dt =
                    DBAcess.Instance().GetDataTable(
                        string.Format(
                            " select * from cfg_province_res t where t.isuser=1 and t.datatype={0} and classCode={1} and vendor='{2}' order by id",
                            2, classCode, vendor)); //取的公式表对应的位置关系
                int index = 0;
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr["ID"] == DBNull.Value || dr["CHIAN_NAME"] == DBNull.Value ||
                        dicRelation.ContainsKey(dr["logicexpress"].ToString()))
                        continue;
                    index++;
                    dicRelation.Add(dr["logicexpress"].ToString(), string.Format("ID{0}", index));                                   
                }
            }
            catch
            {
                throw new Exception("ORAERROR");
            }
        }

        /// <summary>
        /// 获取正确性检查时资源类指标的logicexpress和ID列对应关系
        /// </summary>
        /// <param name="classCode">业务类型 1:1x 2:do</param>
        /// <param name="vendor">厂家 固定为ZY0808</param>
        /// <param name="dicRelation">logicexpress和ID列对应关系字典</param>
        /// <param name="dicDetail">logicexpress和datarow对应关系字典</param>
        public void GetResCheckColumn(int classCode, string vendor, out Dictionary<string, string> dicRelation)
        {
            dicRelation = new Dictionary<string, string>();            
            try
            {
                /*
                 * 防止首次执行时报以下错误
                 * ORA-03113: 通信通道的文件结束进程 ID: 0会话 ID: 1578 序列号: 1066
                 */
                DBAcess.Instance().GetDataTable("select * from dual ");
            }
            catch { }

            try
            {
                DataTable dt =
                    DBAcess.Instance().GetDataTable(
                        string.Format(
                            " select * from cfg_province_res t where t.isuser=1 and classCode={0} and vendor='{1}' order by id",
                            classCode, vendor)); //取的公式表对应的位置关系
                int index = 0;
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr["ID"] == DBNull.Value || dr["CHIAN_NAME"] == DBNull.Value ||
                        dicRelation.ContainsKey(dr["logicexpress"].ToString()))
                        continue;
                    index++;
                    dicRelation.Add(dr["logicexpress"].ToString(),string.Format("ID{0}", dr["REMARK"].ToString()));                    
                }                
            }
            catch
            {
                throw new Exception("ORAERROR");
            }
        }


        public string GetRateIndex(int classCode)
        {
            string result = string.Empty;
            try
            {
                /*
                 * 防止首次执行时报以下错误
                 * ORA-03113: 通信通道的文件结束进程 ID: 0会话 ID: 1578 序列号: 1066
                 */
                DBAcess.Instance().GetDataTable("select * from dual ");
            }
            catch { }

            try
            {
                DataTable dt =
                    DBAcess.Instance().GetDataTable(
                        string.Format(
                            " select * from cfg_provice_perf t where  classCode={0} and datatype=12 order by id",
                            classCode)); //取的公式表对应的位置关系                
                result = dt.Rows[0]["en_name"].ToString();
                return result;
            }
            catch
            {
                throw new Exception("ORAERROR");
                return null;
            }
        }

        /// <summary>
        /// 获取验证的配置数据
        /// </summary>
        /// <param name="classCode">业务类型 1:1x 2:do</param>
        /// <param name="dataType">数据类型 1:性能数据 2:配置数据</param>
        /// <param name="valueType">值类型 1:数值型 2:枚举类型</param>
        /// <param name="dicCheck">结果集字典 key=logicexpress</param>
        public void GetCheckConfigData(int classCode, int dataType, int valueType, out Dictionary<string, DataRow> dicCheck)
        {
            dicCheck = new Dictionary<string, DataRow>();
            try
            {
                /*
                 * 防止首次执行时报以下错误
                 * ORA-03113: 通信通道的文件结束进程 ID: 0会话 ID: 1578 序列号: 1066
                 */
                DBAcess.Instance().GetDataTable("select * from dual ");
            }
            catch { }

            try
            {
                DataTable dt =
                    DBAcess.Instance().GetDataTable(
                        string.Format(
                            " select * from cfg_province_check t where  classCode={0} and data_type='{1}' and value_type='{2}' order by id",
                            classCode,dataType,valueType)); //取的公式表对应的位置关系                
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr["ID"] == DBNull.Value || dr["CHN_NAME"] == DBNull.Value ||
                        dicCheck.ContainsKey(dr["logicexpress"].ToString()))
                        continue;                    
                    dicCheck.Add(dr["logicexpress"].ToString(),dr);                    
                }
            }
            catch
            {
                throw new Exception("ORAERROR");
            }
        }

        /// <summary>
        /// 获取性能公式列
        /// </summary>
        /// <param name="lstId"></param>
        /// <param name="lstLogicExpress"></param>
        /// <param name="lstChName">输出的英文字段的值</param>
        /// <param name="lstFormula">输出的英文字段的值</param>
        /// <param name="classCode">代表是1X还是DO</param>
        /// <param name="vendor">厂家</param>
        public void GetPerfColumn(out ArrayList lstId, out ArrayList lstLogicExpress, out ArrayList lstChName, out ArrayList lstFormula, int classCode, string vendor,out Dictionary<string,string> dicValid,out Dictionary<string,string> dicID)
        {
            lstId = new ArrayList();
            lstLogicExpress = new ArrayList();
            lstChName = new ArrayList();
            lstFormula = new ArrayList();
            dicValid = new Dictionary<string, string>();
            dicID = new Dictionary<string, string>();

            try
            {
                /*
                 * 防止首次执行时报以下错误
                 * ORA-03113: 通信通道的文件结束进程 ID: 0会话 ID: 1578 序列号: 10668
                 */
                DBAcess.Instance().GetDataTable("select * from dual ");
            }
            catch { }

            try
            {
                DataTable dt =
                    DBAcess.Instance().GetDataTable(
                        string.Format(
                            " select * from cfg_provice_perf t where t.datatype={0} and classCode={1} and vendor='{2}' order by id",
                            2, classCode, vendor)); //取的公式表对应的位置关系
                int index = 0;
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr["ID"] == DBNull.Value || dr["CHIAN_NAME"] == DBNull.Value ||
                        lstChName.Contains(dr["CHIAN_NAME"].ToString()))
                        continue;
                    index++;
                    lstId.Add(dr["ID"]);
                    lstLogicExpress.Add(dr["logicexpress"]);
                    lstChName.Add(dr["CHIAN_NAME"].ToString());
                    if (dr["isuser"] != DBNull.Value && dr["isuser"].ToString() == "1")
                    {
                        lstFormula.Add(string.Format("{0} as ID{1}", dr["EN_NAME"], index));
                    }
                    else
                    {
                        lstFormula.Add(string.Format("null as ID{0}", index));
                    }
                    if (!dicValid.ContainsKey(dr["logicexpress"].ToString()))
                    {
                        dicValid.Add(dr["logicexpress"].ToString(), dr["isuser"].ToString());
                    }
                    if (!dicID.ContainsKey(dr["logicexpress"].ToString()))
                    {
                        dicID.Add(string.Format("ID{0}", index), dr["logicexpress"].ToString());
                    }
                }
            }
            catch
            {
                throw new Exception("ORAERROR");
            }
        }

        public void GetResColumn(int classcode, string vendor, out Dictionary<string, string> dic,out ArrayList lstFormula,out Dictionary<string,string> dicResValid,out Dictionary<string,string> dicResID)
        {
            dic = new Dictionary<string, string>();
            lstFormula = new ArrayList();
            dicResValid = new Dictionary<string, string>();
            dicResID = new Dictionary<string, string>();
            try
            {
                /*
                 * 防止首次执行时报以下错误
                 * ORA-03113: 通信通道的文件结束进程 ID: 0会话 ID: 1578 序列号: 10668
                 */
                DBAcess.Instance().GetDataTable("select * from dual ");
            }
            catch { }          

            try
            {
                DataTable dt =
                    DBAcess.Instance().GetDataTable(
                        string.Format(
                            " select * from cfg_province_res t where t.isuser=1 and classCode={0} and vendor='{1}' order by id",
                              classcode, vendor)); //取的资源类公式表对应的位置关系
                int index = 0;
                foreach (DataRow dr in dt.Rows)
                {                   
                    index++;

                    lstFormula.Add(string.Format("{0} as ID{1}", dr["EN_NAME"], index));
                    if (!dic.ContainsKey(dr["REMARK"].ToString()))
                    { 
                        dic.Add(string.Format("ID{0}",dr["REMARK"].ToString()),string.Format("ID{0}", index));
                    }
                    if (!dicResValid.ContainsKey(dr["logicexpress"].ToString()))
                    {
                        dicResValid.Add(dr["logicexpress"].ToString(), dr["isuser"].ToString());
                    }
                    if (!dicResID.ContainsKey(dr["logicexpress"].ToString()))
                    {
                        dicResID.Add("ID"+dr["REMARK"].ToString(),dr["logicexpress"].ToString());
                    }
                }
            }
            catch
            {
                throw new Exception("ORAERROR");
            }
        }

        /// <summary>
        /// 获取省份指标统计方法
        /// </summary>
        /// <param name="classCode"></param>
        /// <returns>idn ,/分割的值 或者 0</returns>
        public Dictionary<string, string> GetPerfProviceColumn(int classCode)
        {
            try
            {
                Dictionary<string, string> logicExpressEnName = new Dictionary<string, string>();
                DataTable dt =
                    DBAcess.Instance().GetDataTable(
                        string.Format(
                            " select * from cfg_provice_perf t where t.datatype= 2 and classCode={0} and vendor='ZY0000' order by id",
                            classCode)); //取的公式表对应的位置关系
                int index = 0;
                foreach (DataRow dr in dt.Rows)
                {
                    index++;
                    if (dr["isuser"] != DBNull.Value && dr["isuser"].ToString() == "1")
                    {
                        if (dr["EN_NAME"] == DBNull.Value || dr["EN_NAME"].ToString().IndexOf('/') < 0)
                            logicExpressEnName.Add(string.Format("ID{0}", index), "0");
                        else
                            logicExpressEnName.Add(string.Format("ID{0}", index), dr["EN_NAME"].ToString().Trim());
                    }
                }

                return logicExpressEnName;
            }
            catch
            {
                throw new Exception("ORAERROR");
            }
           
        }

        public DataTable GetAvg5DataMSC(DateTime starttime,int biztype,int filetype,string levelname)        
        {
            DataTable dt = new DataTable();
            try
            {
                string strSql = string.Format(@"select * from mod_province_bak 
                                                      where biztype={0} 
                                                        and filetype={1}
                                                        and B1='{2}'
                                                        and (start_time=to_date('{3}','yyyy-MM-dd hh24:mi:ss')
                                                         or start_time=to_date('{4}','yyyy-MM-dd hh24:mi:ss')
                                                         or start_time=to_date('{5}','yyyy-MM-dd hh24:mi:ss')
                                                         or start_time=to_date('{6}','yyyy-MM-dd hh24:mi:ss')
                                                         or start_time=to_date('{7}','yyyy-MM-dd hh24:mi:ss'))",
                                                         biztype, filetype, levelname, starttime.AddDays(-1).ToString(),
                                                                                               starttime.AddDays(-2).ToString(),
                                                                                               starttime.AddDays(-3).ToString(),
                                                                                               starttime.AddDays(-4).ToString(),
                                                                                               starttime.AddDays(-5).ToString());

                dt = DBAcess.Instance().GetDataTable(strSql);                
                return dt;
            }
            catch
            {
                return null;
                throw new Exception("ORAERROR");
            }
        }

        public DataTable GetAvg5DataCity(DateTime starttime, int biztype, int filetype, string levelname)
        {
            DataTable dt = new DataTable();
            try
            {
                string strSql = string.Format(@"select * from mod_province_bak 
                                                      where biztype={0} 
                                                        and filetype={1}
                                                        and B2='{2}'
                                                        and (start_time=to_date('{3}','yyyy-MM-dd hh24:mi:ss')
                                                         or start_time=to_date('{4}','yyyy-MM-dd hh24:mi:ss')
                                                         or start_time=to_date('{5}','yyyy-MM-dd hh24:mi:ss')
                                                         or start_time=to_date('{6}','yyyy-MM-dd hh24:mi:ss')
                                                         or start_time=to_date('{7}','yyyy-MM-dd hh24:mi:ss'))",
                                                         biztype, filetype, levelname, starttime.AddDays(-1).ToString(),
                                                                                               starttime.AddDays(-2).ToString(),
                                                                                               starttime.AddDays(-3).ToString(),
                                                                                               starttime.AddDays(-4).ToString(),
                                                                                               starttime.AddDays(-5).ToString());

                dt = DBAcess.Instance().GetDataTable(strSql);
                return dt;
            }
            catch
            {
                return null;
                throw new Exception("ORAERROR");
            }
        }


        public DataTable GetResMscData(ArrayList lstFormula,DateTime dateTime)
        {
            DataTable dt = new DataTable();
            try
            {
                string fieldName = lstFormula.Cast<object>().Aggregate(string.Empty,
                                                                      (current, t) =>
                                                                          string.IsNullOrEmpty(current) ? t.ToString() : string.Format("{0},{1}", current, t));

                string strSql = string.Format(@"select b.mscname as MSC,
                                                     start_time,
                                                     b.mscname,
                                                     {0}
                                                     from perf_bsc_resource c,cfg_bsc_map_city b                                                     
                                                     where c.ne_sys_id = b.ne_bsc_id
                                                     and start_time >= to_date('{1} 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
                                                     and start_time <= to_date('{1} 23:59:59', 'YYYY-MM-DD HH24:MI:SS')                                                                                                                                                            
                                                     and c.CITY_ID=b.city_id    
                                                     group by b.mscname,start_time                                                 
                                                     order by b.mscname, start_time", fieldName, dateTime.ToShortDateString());

                dt = DBAcess.Instance().GetDataTable(strSql);

                return dt;
            }
            catch
            {
                return null;
                throw new Exception("ORAERROR");
            }
        }

        public DataTable GetPerfMscData(ArrayList lstFormula,DateTime dateTime)
        {
            DataTable dt = new DataTable();
            try
            {
                string fieldName = lstFormula.Cast<object>().Aggregate(string.Empty,
                                                                      (current, t) =>
                                                                          string.IsNullOrEmpty(current) ? t.ToString() : string.Format("{0},{1}", current, t));
                string strSql = string.Format(@"select b.mscname as MSC,
                                                     to_char(start_time,'yyyy-MM-dd hh24:mi:ss') as start_time,
                                                     b.mscname,
                                                     {0}
                                                     from perf_stat_bsc c,cfg_bsc_map_city b                                                     
                                                     where c.ne_sys_id = b.ne_bsc_id
                                                     and start_time >= to_date('{1} 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
                                                     and start_time <= to_date('{1} 23:59:59', 'YYYY-MM-DD HH24:MI:SS')                                                                                                          
                                                     and c.CITY_ID=b.city_id  
                                                     group by b.mscname,start_time                                                  
                                                     order by b.mscname, start_time", fieldName, dateTime.ToShortDateString());

                dt = DBAcess.Instance().GetDataTable(strSql);

                return dt;
            }
            catch
            {
                return null;
                throw new Exception("ORAERROR");
            }
        }


        /// <summary>
        /// 获取MSC1X性能数据
        /// </summary>
        /// <param name="lstFormula">公式</param>
        /// <param name="vendor">厂家</param>
        /// <param name="proChName">省份中文名</param>
        /// <param name="dateTime">查询日期</param>
        /// <param name="lstExtraName">附加的列</param>
        /// <returns></returns>
        public DataTable GetPerfMsc1XData(ArrayList lstFormula, string vendor, string proChName, DateTime dateTime, out ArrayList lstExtraName, Dictionary<string, string> _mscCitys)
        {
            lstExtraName = new ArrayList();
            DataTable dt = new DataTable();
            try
            {
                string fieldName = lstFormula.Cast<object>().Aggregate(string.Empty,
                                                                       (current, t) =>
                                                                       string.IsNullOrEmpty(current)
                                                                           ? t.ToString()
                                                                           : string.Format("{0},{1}", current, t));
                //组装数据库的字段

                // 按照MSC级别来汇总性能数据中1X数据
                lstExtraName.Add("MSC标志");
                lstExtraName.Add("数据时间点");
                lstExtraName.Add("MSC名称");
                lstExtraName.Add("省份");
                lstExtraName.Add("城市");
                //增加城市的ID来确定唯一值
                string strSql =
                    string.Format(
                        @"select  b.mscname as MSC,
                                          to_char(start_time, 'YYYY-MM-DD HH24:mi:ss') as start_time,
                                          b.mscname,
                                          '{2}',
                                          '' as city_name,  
                                          {0} 
                                          from perf_bsc_c c, cfg_bsc_map_city b
                                          where c.ne_sys_id = b.ne_bsc_id
                                          and start_time >= to_date('{3} 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
                                          and start_time <= to_date('{3} 23:59:59', 'YYYY-MM-DD HH24:MI:SS') 
                                          and c.vendor ='{1}'
                                          and c.CITY_ID=b.city_id
                                          group by b.mscname, start_time
                                          order by b.mscname, start_time",
                        fieldName, vendor, proChName, dateTime.ToString("yyyy-MM-dd"));

                dt = DBAcess.Instance().GetDataTable(strSql);


                /*
                #region 坏小区相关统计

                // 过滤结果，修正从Cell级别汇总的数据
                if (dt != null && dt.Rows.Count > 0)
                {
                    //dateTime = Convert.ToDateTime(20100202); //测试功能
                    // 坏小区个数SQL
                    string badCellSql =
                        string.Format(
                            @"select b.mscname as MSC,
       to_char(start_time, 'YYYY-MM-DD HH24:mi:ss') as start_time,
       COUNT(*) as total
  from perf_cell_c c, cfg_bsc_map_city b
 where isbadcell = 1
   and c.RELATED_BSC = b.ne_bsc_id
   and start_time >= to_date('{1} 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
   and start_time <= to_date('{1} 23:59:59', 'YYYY-MM-DD HH24:MI:SS')
   and c.vendor = '{0}'
   and c.CITY_ID = b.city_id
 group by b.mscname, start_time
 order by b.mscname, start_time",
                             vendor, dateTime.ToString("yyyy-MM-dd"));

                    // 小区总数SQL 
                    string cellSql =
                        string.Format(
                            @"select b.mscname as MSC,
       to_char(start_time, 'YYYY-MM-DD HH24:mi:ss') as start_time,
       COUNT(*) as total
  from perf_cell_c c, cfg_bsc_map_city b
 where  c.RELATED_BSC = b.ne_bsc_id
   and start_time >= to_date('{1} 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
   and start_time <= to_date('{1} 23:59:59', 'YYYY-MM-DD HH24:MI:SS')
   and c.vendor = '{0}'
   and c.CITY_ID = b.city_id
 group by b.mscname, start_time
 order by b.mscname, start_time",
                             vendor, dateTime.ToString("yyyy-MM-dd"));

                    DataTable dtBadCell = new DataTable();
                    DataTable dtCell = new DataTable();
                    try
                    {
                        dtBadCell = DBAcess.Instance().GetDataTable(badCellSql);
                    }
                    catch
                    {
                    }
                    try
                    {
                        dtCell = DBAcess.Instance().GetDataTable(cellSql);
                    }
                    catch
                    {
                    }

                    try
                    {
                        int dtRowsCount = dt.Rows.Count;
                        for (int i = 0; i < dtRowsCount; i++)
                        {
                            // 坏小区比例 176 坏小区个数 189
                            int pCountBadCell = GetPcountFromCellHub(dtBadCell, "MSC",
                                                                  dt.Rows[i]["MSC"].ToString(), 
                                                                  dt.Rows[i]["start_time"].ToString());

                            int pCountCell = GetPcountFromCellHub(dtCell, "MSC",
                                                               dt.Rows[i]["MSC"].ToString(), 
                                                               dt.Rows[i]["start_time"].ToString());

                            if (pCountCell != 0)
                            {
                                dt.Rows[i][181] = Math.Round(((double)pCountBadCell / (double)pCountCell) * 100, 4); // A 176
                                dt.Rows[i][194] = pCountBadCell; // 189
                                dt.Rows[i][159] = pCountCell; // 154
                            }

                            // 修改CITY_NAME的值
                            dt.Rows[i]["city_name"] = _mscCitys[dt.Rows[i]["MSC"].ToString().Trim()];
                        }
                    }
                    catch
                    {
                    }

                }

                #endregion
                 */

                try
                {
                    int dtRowsCount = dt.Rows.Count;
                    for (int i = 0; i < dtRowsCount; i++)
                    {
                        // 修改CITY_NAME的值
                        dt.Rows[i]["city_name"] = _mscCitys[dt.Rows[i]["MSC"].ToString().Trim()];
                    }
                }
                catch
                {
                }


                return dt;
            }
            catch
            {
                return null;
                throw new Exception("ORAERROR");
            }
        }

        /// <summary>
        /// 获取MSCDO性能数据
        /// </summary>
        /// <param name="lstFormula">公式</param>
        /// <param name="vendor">厂家</param>
        /// <param name="proChName">省份中文名</param>
        /// <param name="dateTime">查询日期</param>
        /// <param name="lstExtraName">附加的列</param>
        /// <returns></returns>
        public DataTable GetPerfMscDoData(ArrayList lstFormula, string vendor, string proChName, DateTime dateTime, out ArrayList lstExtraName, Dictionary<string, string> _mscCitys)
        {
            lstExtraName = new ArrayList();
            DataTable dt = new DataTable();
            try
            {
                string fieldName = lstFormula.Cast<object>().Aggregate(string.Empty,
                                                                       (current, t) =>
                                                                       string.IsNullOrEmpty(current)
                                                                           ? t.ToString()
                                                                           : string.Format("{0},{1}", current, t));
                //组装数据库的字段

                // 按照MSC级别来汇总性能数据中Do数据
                lstExtraName.Add("MSC标志");
                lstExtraName.Add("数据时间点");
                lstExtraName.Add("MSC名称");
                lstExtraName.Add("省份");
                lstExtraName.Add("城市");

                string strSql =
                    string.Format(
                        @"select b.mscname AS MSC,
                                          to_char(start_time, 'YYYY-MM-DD HH24:mi:ss') as start_time,
                                          b.mscname,
                                          '{2}',
                                          '' as CITY_NAME,  
                                          {0} 
                                          from perf_bsc_c c, cfg_bsc_map_city b
                                          where c.ne_sys_id = b.ne_bsc_id
                                          and start_time >= to_date('{3} 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
                                          and start_time <= to_date('{3} 23:59:59', 'YYYY-MM-DD HH24:MI:SS') 
                                          and c.vendor ='{1}'
                                          and c.CITY_ID=b.city_id
                                          group by b.mscname, start_time
                                          order by b.mscname, start_time",
                        fieldName, vendor, proChName, dateTime.ToString("yyyy-MM-dd"));

                dt = DBAcess.Instance().GetDataTable(strSql);

                try
                {
                    int dtRowsCount = dt.Rows.Count;
                    for (int i = 0; i < dtRowsCount; i++)
                    {
                        // 修改CITY_NAME的值
                        dt.Rows[i]["city_name"] = _mscCitys[dt.Rows[i]["MSC"].ToString().Trim()];
                    }
                }
                catch
                {
                }

                return dt;
            }
            catch
            {
                return null;
                throw new Exception("ORAERROR");
            }
        }

        public DataTable GetResCityData(ArrayList lstFormula, string proChName, DateTime dateTime)
        {
            DataTable dt = new DataTable();
            try
            {
                string fieldName = lstFormula.Cast<object>().Aggregate(string.Empty,
                                                                           (current, t) =>
                                                                           string.IsNullOrEmpty(current)
                                                                               ? t.ToString()
                                                                               : string.Format("{0},{1}", current, t));

                string strSql = string.Empty;
                if (proChName == "湖北")
                {
                    strSql = string.Format(@"select '城市' as b1,start_time,
                                                    c.CITY_NAME as b2,  
                                                    {0} 
                                               from perf_bsc_resource c,cfg_bsc_map_city b,cfg_city d
                                              where c.ne_sys_id = b.ne_bsc_id
                                                and start_time >= to_date('{1} 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
                                                and start_time <= to_date('{1} 23:59:59', 'YYYY-MM-DD HH24:MI:SS')                                                     
                                                and d.city_id <> 728
                                                and b.city_id=d.city_id
                                                and c.CITY_ID=d.city_id    
                                                group by start_time,c.CITY_NAME                               
                                                union all 
                                                select '城市' as b1,start_time,
                                                case  when c.CITY_NAME = '江汉' then
                                                          case replace(ADM.COUNTY_NAME,'区','') when '天门' then '天门'
                                                            when '潜江' then '潜江' 
                                                              when '仙桃' then '仙桃' end
                                                         else
                                                          c.CITY_NAME
                                                       end as b2,                                                
                                                {0} 
                                                from perf_bsc_resource c, cfg_bsc_map_city b,cfg_city d,CFG_COUNTY ADM
                                                where c.ne_sys_id = b.ne_bsc_id
                                                and start_time >= to_date('{1} 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
                                                and start_time <= to_date('{1} 23:59:59', 'YYYY-MM-DD HH24:MI:SS')                                                                                                     
                                                and d.city_id= 728
                                                and b.city_id=d.city_id
                                                and c.CITY_ID=d.city_id
                                                and adm.city_id  = d.city_id
                                                group by start_time,c.CITY_NAME,case
                                                             when c.CITY_NAME = '江汉' then
                                                              case replace(ADM.COUNTY_NAME,'区','') when '天门' then '天门'
                                                                when '潜江' then '潜江' 
                                                                  when '仙桃' then '仙桃' end
                                                             else
                                                              c.CITY_NAME
                                                           end", fieldName, dateTime.ToShortDateString());
                }
                else
                {
                    strSql=string.Format(@"select '城市' as b1,start_time,
                                                  c.CITY_NAME as b2,  
                                                  {0} 
                                            from perf_bsc_resource c, cfg_bsc_map_city b,cfg_city d
                                            where c.ne_sys_id = b.ne_bsc_id
                                            and start_time >= to_date('{1} 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
                                            and start_time <= to_date('{1} 23:59:59', 'YYYY-MM-DD HH24:MI:SS')                                              
                                            and b.city_id=d.city_id
                                            and c.CITY_ID=d.city_id
                                            group by start_time,c.CITY_NAME", fieldName,dateTime.ToShortDateString());
                }

                dt=DBAcess.Instance().GetDataTable(strSql);
                return dt;
            }
            catch
            {
                return null;
                throw new Exception("ORAERROR");
            }
        }

        public DataTable GetPerfCityData(ArrayList lstFormula, string proChName, DateTime dateTime)
        {
            DataTable dt = new DataTable();
            try
            {
                string fieldName = lstFormula.Cast<object>().Aggregate(string.Empty,
                                                                           (current, t) =>
                                                                           string.IsNullOrEmpty(current)
                                                                               ? t.ToString()
                                                                               : string.Format("{0},{1}", current, t));

                string strSql = string.Empty;
                if (proChName == "湖北")
                {
                    strSql = string.Format(@"select '城市' as b1,to_char(start_time,'yyyy-MM-dd hh:24:mi:ss') as start_time,
                                                    c.CITY_NAME as b2,  
                                                    {0} 
                                               from perf_stat_bsc c,cfg_bsc_map_city b,cfg_city d
                                              where c.ne_sys_id = b.ne_bsc_id
                                                and start_time >= to_date('{1} 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
                                                and start_time <= to_date('{1} 23:59:59', 'YYYY-MM-DD HH24:MI:SS')                                                   
                                                and d.city_id <> 728
                                                and b.city_id=d.city_id
                                                and c.CITY_ID=d.city_id     
                                                group by start_time,c.CITY_NAME                                           
                                                union all 
                                                select '城市' as b1,to_char(start_time,'yyyy-MM-dd hh24:mi:ss') as start_time,
                                                case  when c.CITY_NAME = '江汉' then
                                                          case replace(ADM.COUNTY_NAME,'区','') when '天门' then '天门'
                                                            when '潜江' then '潜江' 
                                                              when '仙桃' then '仙桃' end
                                                         else
                                                          c.CITY_NAME
                                                       end as b2,                                                
                                                {0} 
                                                from perf_stat_bsc c, cfg_bsc_map_city b,cfg_city d,CFG_COUNTY ADM
                                                where c.ne_sys_id = b.ne_bsc_id
                                                and start_time >= to_date('{1} 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
                                                and start_time <= to_date('{1} 23:59:59', 'YYYY-MM-DD HH24:MI:SS')                                                                                                      
                                                and d.city_id= 728
                                                and b.city_id=d.city_id
                                                and c.CITY_ID=d.city_id
                                                and adm.city_id  = d.city_id
                                                group by start_time,c.CITY_NAME,case
                                                                 when c.CITY_NAME = '江汉' then
                                                                  case replace(ADM.COUNTY_NAME,'区','') when '天门' then '天门'
                                                                    when '潜江' then '潜江' 
                                                                      when '仙桃' then '仙桃' end
                                                                 else
                                                                  c.CITY_NAME
                                                               end", fieldName, dateTime.ToShortDateString());
                }
                else
                {
                    strSql=string.Format(@"select '城市' as b1,to_char(start_time,'yyyy-MM-dd hh24:mi:ss') as start_time,
                                                  c.CITY_NAME as b2,  
                                                  {0} 
                                            from perf_stat_bsc c, cfg_bsc_map_city b,cfg_city d
                                            where c.ne_sys_id = b.ne_bsc_id
                                            and start_time >= to_date('{1} 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
                                            and start_time <= to_date('{1} 23:59:59', 'YYYY-MM-DD HH24:MI:SS')                                             
                                            and b.city_id=d.city_id
                                            and c.CITY_ID=d.city_id
                                            group by start_time,c.CITY_NAME",fieldName,dateTime.ToShortDateString());
                }

                dt=DBAcess.Instance().GetDataTable(strSql);
                return dt;
            }
            catch
            {
                return null;
                throw new Exception("ORAERROR");
            }
        }


        /// <summary>
        /// 获取CITY1X性能数据
        /// </summary>
        /// <param name="vendorFormula"></param>
        /// <param name="proChName"></param>
        /// <param name="dateTime"></param>
        /// <param name="lstExtraName"></param>
        /// <returns></returns>
        public DataTable GetCity1XData(Dictionary<string, ArrayList> vendorFormula, string proChName, DateTime dateTime, out ArrayList lstExtraName)
        {
            lstExtraName = new ArrayList();
            DataTable dt = new DataTable();
            try
            {
                #region citySql
                string citySql = string.Empty;
                if (proChName == "湖北")
                {
                    citySql = string.Format(
                        @"
select '城市' as b1,to_char(start_time, 'YYYY-MM-DD HH24:mi:ss') as start_time,
c.CITY_NAME as b2,'{1}' as b3,c.CITY_NAME as b4,  
{0} 
from perf_bsc_c c, cfg_bsc_map_city b,cfg_city d
where c.ne_sys_id = b.ne_bsc_id
and start_time >= to_date('{3} 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
       and start_time <= to_date('{3} 23:59:59', 'YYYY-MM-DD HH24:MI:SS') 
and c.vendor = '{2}'
and d.city_id <> 728
and b.city_id=d.city_id
and c.CITY_ID=d.city_id
group by start_time,c.CITY_NAME
union all 
select '城市' as b1,to_char(start_time, 'YYYY-MM-DD HH24:mi:ss') as start_time,
case  when c.CITY_NAME = '江汉' then
          case replace(ADM.COUNTY_NAME,'区','') when '天门' then '天门'
            when '潜江' then '潜江' 
              when '仙桃' then '仙桃' end
         else
          c.CITY_NAME
       end as b2,'{1}' as b3,
case  when c.CITY_NAME = '江汉' then
          case replace(ADM.COUNTY_NAME,'区','') when '天门' then '天门'
            when '潜江' then '潜江' 
              when '仙桃' then '仙桃' end
         else
          c.CITY_NAME
       end as b4,  
{0} 
from perf_bsc_c c, cfg_bsc_map_city b,cfg_city d, CFG_COUNTY ADM
where c.ne_sys_id = b.ne_bsc_id
and start_time >= to_date('{3} 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
       and start_time <= to_date('{3} 23:59:59', 'YYYY-MM-DD HH24:MI:SS') 
and c.vendor = '{2}'
and d.city_id= 728
and b.city_id=d.city_id
and c.CITY_ID=d.city_id
   and adm.city_id  = d.city_id
group by start_time,c.CITY_NAME,case
         when c.CITY_NAME = '江汉' then
          case replace(ADM.COUNTY_NAME,'区','') when '天门' then '天门'
            when '潜江' then '潜江' 
              when '仙桃' then '仙桃' end
         else
          c.CITY_NAME
       end",
                        "{0}", proChName, "{1}", dateTime.ToString("yyyy-MM-dd"));
                }
                else if (proChName == "重庆")
                {
                    citySql = string.Format(
                        @"select '城市' as b1,to_char(start_time, 'YYYY-MM-DD HH24:mi:ss') as start_time,
c.CITY_NAME as b2,'{1}' as b3,c.CITY_NAME as b4,  
{0} 
from perf_bsc_c c, cfg_bsc_map_city b,cfg_city d
where c.ne_sys_id = b.ne_bsc_id
and start_time >= to_date('{2} 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
       and start_time <= to_date('{2} 23:59:59', 'YYYY-MM-DD HH24:MI:SS') 
and c.vendor in('ZY0808','ZY0804')
and b.city_id=d.city_id
and c.CITY_ID=d.city_id
group by start_time,c.CITY_NAME",
                        "{0}", proChName,dateTime.ToString("yyyy-MM-dd"));
                }
                else
                {
                    citySql = string.Format(
                        @"select '城市' as b1,to_char(start_time, 'YYYY-MM-DD HH24:mi:ss') as start_time,
c.CITY_NAME as b2,'{1}' as b3,c.CITY_NAME as b4,  
{0} 
from perf_bsc_c c, cfg_bsc_map_city b,cfg_city d
where c.ne_sys_id = b.ne_bsc_id
and start_time >= to_date('{3} 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
       and start_time <= to_date('{3} 23:59:59', 'YYYY-MM-DD HH24:MI:SS') 
and c.vendor = '{2}'
and b.city_id=d.city_id
and c.CITY_ID=d.city_id
group by start_time,c.CITY_NAME",
                        "{0}", proChName, "{1}", dateTime.ToString("yyyy-MM-dd"));
                }

                #endregion

                lstExtraName.Add("对象级别");
                lstExtraName.Add("数据时间点");
                lstExtraName.Add("对象名称");
                lstExtraName.Add("省份");
                lstExtraName.Add("城市");
                string sqlPerVendor = string.Empty;
                foreach (KeyValuePair<string, ArrayList> keyValuePair in vendorFormula)
                {
                    string mSql = keyValuePair.Value.Cast<object>().Aggregate(string.Empty, (current, t) => string.IsNullOrEmpty(current) ? t.ToString() : string.Format("{0},{1}", current, t.ToString()));
                    string tmpSql = citySql;
                    sqlPerVendor = string.IsNullOrEmpty(sqlPerVendor)
                                       ? string.Format(tmpSql, mSql, keyValuePair.Key)
                                       : string.Format("{0} union all {1}", sqlPerVendor,
                                                       string.Format(tmpSql, mSql, keyValuePair.Key));
                }

                // 全省指标是特殊化判断。
                string vendorSqlString = vendorFormula.Keys.Aggregate(string.Empty, (current, s) => string.IsNullOrEmpty(current) ? string.Format("'{0}'", s) : string.Format("{0},'{1}'", current, s));
                string proColumnSql = string.Empty;
                foreach (KeyValuePair<string, ArrayList> keyValuePair in vendorFormula)
                {
                    proColumnSql = keyValuePair.Value.Cast<object>().Aggregate(string.Empty, (current, t) => string.IsNullOrEmpty(current) ? t.ToString() : string.Format("{0},{1}", current, t.ToString()));
                    if (keyValuePair.Key == "ZY0808")
                        break;
                    if (keyValuePair.Key == "ZY0810")
                        break;
                }

                #region provinceSql
                string proSql = string.Empty;
                if (proChName == "重庆")
                {
                    proSql = string.Format(
                    @"select '省' as b1,to_char(start_time, 'YYYY-MM-DD HH24:mi:ss') as start_time,
'{1}' as b2,'{1}' as b3,'{1}' as b4,  
{0} 
from perf_bsc_c c, cfg_bsc_map_city b,cfg_city d
where c.ne_sys_id = b.ne_bsc_id
and start_time >= to_date('{2} 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
and start_time <= to_date('{2} 23:59:59', 'YYYY-MM-DD HH24:MI:SS') 
and c.vendor in ('ZY0808','ZY0804')
and b.city_id=d.city_id
and c.CITY_ID=d.city_id
group by start_time",
                    proColumnSql, proChName,dateTime.ToString("yyyy-MM-dd"));
                }
                else
                {
                    proSql = string.Format(
                                       @"select '省' as b1,to_char(start_time, 'YYYY-MM-DD HH24:mi:ss') as start_time,
'{1}' as b2,'{1}' as b3,'{1}' as b4,  
{0} 
from perf_bsc_c c, cfg_bsc_map_city b,cfg_city d
where c.ne_sys_id = b.ne_bsc_id
and start_time >= to_date('{3} 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
and start_time <= to_date('{3} 23:59:59', 'YYYY-MM-DD HH24:MI:SS') 
and c.vendor in ({2})
and b.city_id=d.city_id
and c.CITY_ID=d.city_id
group by start_time",
                                       proColumnSql, proChName, vendorSqlString, dateTime.ToString("yyyy-MM-dd"));
                }

                
                #endregion

                string sql = string.Format(@"SELECT *  FROM ({0} union all {1}) where b2 is not null ORDER BY START_TIME, B1", sqlPerVendor,
                                           proSql);

                dt = DBAcess.Instance().GetDataTable(sql);


                /*
                #region 坏小区相关统计
                if (dt != null && dt.Rows.Count > 0)
                {
                    //startTime = "2010-2-2 0:00:00";//测试功能
                    //EndTime = "2010-2-2 23:00:00";
                    // 坏小区数SQL 
                    string badCellSql =
                        string.Format(
                            @" select a.CITY_NAME,to_char(start_time, 'YYYY-MM-DD HH24:mi:ss') as start_time ,count(1) as total from perf_cell_c c,cfg_city a  where ISBADCELL = 1
and start_time >= to_date('{2} 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
and start_time <= to_date('{2} 23:59:59', 'YYYY-MM-DD HH24:MI:SS') 
and c.vendor in ({1}) and c.city_id = a.city_id and c.vendor= a.vendor group by start_time,a.CITY_NAME
union all
select '{0}' as CITY_NAME ,to_char(start_time, 'YYYY-MM-DD HH24:mi:ss') as start_time,count(1) as total from perf_cell_c c  
 where ISBADCELL = 1 
and start_time >= to_date('{2} 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
and start_time <= to_date('{2} 23:59:59', 'YYYY-MM-DD HH24:MI:SS') 
and vendor in ({1}) group by start_time order by start_time ",
                            proChName, vendorSqlString, dateTime.ToString("yyyy-MM-dd"));
                    // 小区总数SQL 
                    string cellSql = string.Format(@" select a.CITY_NAME,to_char(start_time, 'YYYY-MM-DD HH24:mi:ss') as start_time ,count(1) as total from perf_cell_c c  ,cfg_city a
where start_time >= to_date('{2} 00:00:0', 'YYYY-MM-DD HH24:MI:SS')
and start_time <= to_date('{2} 23:59:59', 'YYYY-MM-DD HH24:MI:SS') 
and c.vendor in ({1}) and c.city_id = a.city_id and c.vendor= a.vendor  group by start_time,a.CITY_NAME 
union all
 select '{0}' as CITY_NAME ,to_char(start_time, 'YYYY-MM-DD HH24:mi:ss') as start_time,count(1)  as total  
from perf_cell_c c  where start_time >= to_date('{2} 00:00:0', 'YYYY-MM-DD HH24:MI:SS')
and start_time <= to_date('{2} 23:59:59', 'YYYY-MM-DD HH24:MI:SS') 
and vendor in ({1}) 
group by start_time 
  order by start_time ", proChName, vendorSqlString, dateTime.ToString("yyyy-MM-dd"));

                    DataTable dtBadCell = new DataTable();
                    DataTable dtCell = new DataTable();
                    try
                    {
                        dtBadCell = DBAcess.Instance().GetDataTable(badCellSql);
                    }
                    catch { }
                    try
                    {
                        dtCell = DBAcess.Instance().GetDataTable(cellSql);
                    }
                    catch { }


                    try
                    {
                        int dtRowsCount = dt.Rows.Count;
                        for (int i = 0; i < dtRowsCount; i++)
                        {
                            // 坏小区比例 176 坏小区个数 189
                            int pCountBadCell = 0;
                            int pCountCell = 0;

                            if (proChName == "湖北")
                            {
                                pCountBadCell = GetPcountFromCellHub(dtBadCell, "CITY_NAME", dt.Rows[i]["b2"].ToString(),
                                                                  dt.Rows[i]["start_time"].ToString());
                                pCountCell = GetPcountFromCellHub(dtCell, "CITY_NAME", dt.Rows[i]["b2"].ToString(),
                                                               dt.Rows[i]["start_time"].ToString());
                            }
                            else
                            {
                                pCountBadCell = GetPcountFromCell(dtBadCell, "CITY_NAME", dt.Rows[i]["b2"].ToString(),
                                                                  dt.Rows[i]["start_time"].ToString());
                                pCountCell = GetPcountFromCell(dtCell, "CITY_NAME", dt.Rows[i]["b2"].ToString(),
                                                               dt.Rows[i]["start_time"].ToString());

                            }


                            if (pCountCell == 0)
                            {
                                dt.Rows[i][181] = 0;
                                dt.Rows[i][194] = 0;
                                dt.Rows[i][159] = 0;
                            }
                            else
                            {
                                dt.Rows[i][181] = Math.Round(((double)pCountBadCell / (double)pCountCell) * 100, 4);
                                dt.Rows[i][194] = pCountBadCell;
                                dt.Rows[i][159] = pCountCell;
                            }
                        }
                    }
                    catch { }
                }
                #endregion
                 */ 
                return dt;
            }
            catch
            {
                return null;
            }
        }

        /// <summary>
        /// 获取CITYDO性能数据
        /// </summary>
        /// <param name="vendorFormula"></param>
        /// <param name="proChName"></param>
        /// <param name="dateTime"></param>
        /// <param name="lstExtraName"></param>
        /// <returns></returns>
        public DataTable GetCityDoData(Dictionary<string, ArrayList> vendorFormula, string proChName, DateTime dateTime, out ArrayList lstExtraName)
        {
            lstExtraName = new ArrayList();
            DataTable dt = new DataTable();
            try
            {
                #region citySql

                string citySql = string.Empty;
                if (proChName == "湖北")
                {
                    citySql = string.Format(
                        @"
select '城市' as b1,to_char(start_time, 'YYYY-MM-DD HH24:mi:ss') as start_time,
c.CITY_NAME as b2,'{1}' as b3,c.CITY_NAME as b4,  
{0} 
from perf_bsc_c c, cfg_bsc_map_city b,cfg_city d
where c.ne_sys_id = b.ne_bsc_id
and start_time >= to_date('{3} 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
       and start_time <= to_date('{3} 23:59:59', 'YYYY-MM-DD HH24:MI:SS') 
and c.vendor = '{2}'
and d.city_id <>728
and b.city_id=d.city_id
and c.CITY_ID=d.city_id
group by start_time,c.CITY_NAME
UNION ALL
select '城市' as b1,to_char(start_time, 'YYYY-MM-DD HH24:mi:ss') as start_time,
case  when c.CITY_NAME = '江汉' then
          case replace(ADM.COUNTY_NAME,'区','') when '天门' then '天门'
            when '潜江' then '潜江' 
              when '仙桃' then '仙桃' end
         else
          c.CITY_NAME
       end as b2,'{1}' as b3,case  when c.CITY_NAME = '江汉' then
          case replace(ADM.COUNTY_NAME,'区','') when '天门' then '天门'
            when '潜江' then '潜江' 
              when '仙桃' then '仙桃' end
         else
          c.CITY_NAME
       end as b4,  
{0} 
from perf_bsc_c c, cfg_bsc_map_city b,cfg_city d, CFG_COUNTY ADM
where c.ne_sys_id = b.ne_bsc_id
and start_time >= to_date('{3} 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
       and start_time <= to_date('{3} 23:59:59', 'YYYY-MM-DD HH24:MI:SS') 
and c.vendor = '{2}'
and d.city_id =728
and b.city_id=d.city_id
and c.CITY_ID=d.city_id
   and adm.city_id  = d.city_id
group by start_time,c.CITY_NAME ,case
         when c.CITY_NAME = '江汉' then
          case replace(ADM.COUNTY_NAME,'区','') when '天门' then '天门'
            when '潜江' then '潜江' 
              when '仙桃' then '仙桃' end
         else
          c.CITY_NAME
       end",
                        "{0}", proChName, "{1}", dateTime.ToString("yyyy-MM-dd"));
                }
                else if (proChName == "重庆")
                {
                    citySql = string.Format(
                        @"select '城市' as b1,to_char(start_time, 'YYYY-MM-DD HH24:mi:ss') as start_time,
c.CITY_NAME as b2,'{1}' as b3,c.CITY_NAME as b4,  
{0} 
from perf_bsc_c c, cfg_bsc_map_city b,cfg_city d
where c.ne_sys_id = b.ne_bsc_id
and start_time >= to_date('{2} 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
       and start_time <= to_date('{2} 23:59:59', 'YYYY-MM-DD HH24:MI:SS') 
and c.vendor in ('ZY0808','ZY0804')
and b.city_id=d.city_id
and c.CITY_ID=d.city_id
group by start_time,c.CITY_NAME",
                        "{0}", proChName,dateTime.ToString("yyyy-MM-dd"));
                }
                else
                {
                    citySql = string.Format(
                        @"select '城市' as b1,to_char(start_time, 'YYYY-MM-DD HH24:mi:ss') as start_time,
c.CITY_NAME as b2,'{1}' as b3,c.CITY_NAME as b4,  
{0} 
from perf_bsc_c c, cfg_bsc_map_city b,cfg_city d
where c.ne_sys_id = b.ne_bsc_id
and start_time >= to_date('{3} 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
       and start_time <= to_date('{3} 23:59:59', 'YYYY-MM-DD HH24:MI:SS') 
and c.vendor = '{2}'
and b.city_id=d.city_id
and c.CITY_ID=d.city_id
group by start_time,c.CITY_NAME",
                        "{0}", proChName, "{1}", dateTime.ToString("yyyy-MM-dd"));
                }

                #endregion

                lstExtraName.Add("对象级别");
                lstExtraName.Add("数据时间点");
                lstExtraName.Add("对象名称");
                lstExtraName.Add("省份");
                lstExtraName.Add("城市");
                string sqlPerVendor = string.Empty;
                foreach (KeyValuePair<string, ArrayList> keyValuePair in vendorFormula)
                {
                    string mSql = keyValuePair.Value.Cast<object>().Aggregate(string.Empty, (current, t) => string.IsNullOrEmpty(current) ? t.ToString() : string.Format("{0},{1}", current, t.ToString()));
                    string tmpSql = citySql;
                    sqlPerVendor = string.IsNullOrEmpty(sqlPerVendor)
                                       ? string.Format(tmpSql, mSql, keyValuePair.Key)
                                       : string.Format("{0} union all {1}", sqlPerVendor,
                                                       string.Format(tmpSql, mSql, keyValuePair.Key));
                }

                // 全省指标是特殊化判断。
                string vendorSqlString = vendorFormula.Keys.Aggregate(string.Empty, (current, s) => string.IsNullOrEmpty(current) ? string.Format("'{0}'", s) : string.Format("{0},'{1}'", current, s));
                string proColumnSql = string.Empty;
                foreach (KeyValuePair<string, ArrayList> keyValuePair in vendorFormula)
                {
                    proColumnSql = keyValuePair.Value.Cast<object>().Aggregate(string.Empty, (current, t) => string.IsNullOrEmpty(current) ? t.ToString() : string.Format("{0},{1}", current, t.ToString()));
                    if (keyValuePair.Key == "ZY0808")
                        break;
                    if (keyValuePair.Key == "ZY0810")
                        break;
                }

                #region provinceSql
                string proSql = string.Empty;
                if (proChName == "重庆")
                {
                    proSql = string.Format(
                        @"select '省' as b1,to_char(start_time, 'YYYY-MM-DD HH24:mi:ss') as start_time,
'{1}' as b2,'{1}' as b3,'{1}' as b4,  
{0} 
from perf_bsc_c c, cfg_bsc_map_city b,cfg_city d
where c.ne_sys_id = b.ne_bsc_id
and start_time >= to_date('{2} 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
and start_time <= to_date('{2} 23:59:59', 'YYYY-MM-DD HH24:MI:SS') 
and c.vendor in ('ZY0808','ZY0804')
and b.city_id=d.city_id
and c.CITY_ID=d.city_id
group by start_time",
                        proColumnSql, proChName,dateTime.ToString("yyyy-MM-dd"));
                }
                else
                {
                    proSql = string.Format(
                        @"select '省' as b1,to_char(start_time, 'YYYY-MM-DD HH24:mi:ss') as start_time,
'{1}' as b2,'{1}' as b3,'{1}' as b4,  
{0} 
from perf_bsc_c c, cfg_bsc_map_city b,cfg_city d
where c.ne_sys_id = b.ne_bsc_id
and start_time >= to_date('{3} 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
and start_time <= to_date('{3} 23:59:59', 'YYYY-MM-DD HH24:MI:SS') 
and c.vendor in ({2})
and b.city_id=d.city_id
and c.CITY_ID=d.city_id
group by start_time",
                        proColumnSql, proChName, vendorSqlString, dateTime.ToString("yyyy-MM-dd"));
                }
                #endregion

                string sql = string.Format(@"SELECT *  FROM ({0} union all {1})  where b2 is not null ORDER BY START_TIME, B1", sqlPerVendor,
                                           proSql);

                dt = DBAcess.Instance().GetDataTable(sql);
                return dt;
            }
            catch
            {
                return null;
            }
        }

        /// <summary>
        /// 删除MOD_PROVINCE_BAK表中备份的数据
        /// </summary>
        /// <param name="starttime">时间点</param>
        public void DeleteBackData(string starttime)
        {
            try
            {
                /*
                 * 防止首次执行时报以下错误
                 * ORA-03113: 通信通道的文件结束进程 ID: 0会话 ID: 1519 序列号: 47194
                 */
                DBAcess.Instance().GetDataTable("select * from dual ");
            }
            catch { }

            try
            {
                string strSql = string.Format(@"delete from mod_province_bak where start_time<to_date('{0}','yyyy-MM-dd')", starttime);
                DBAcess.Instance().ExecNonQuery(strSql);
            }
            catch { }
        }

        /// <summary>
        /// 获得客户投诉统计数据列
        /// </summary>
        /// <param name="lstChName">中文名</param>
        /// <param name="lstFormula">公式</param>
        /// <param name="classCode">1 1X;2 DO</param>
        public void GetComplaintColumn(out ArrayList lstChName, out ArrayList lstFormula)
        {
            lstChName = new ArrayList();
            lstFormula = new ArrayList();
            try
            {
                /*
                 * 防止首次执行时报以下错误
                 * ORA-03113: 通信通道的文件结束进程 ID: 0会话 ID: 1519 序列号: 47194
                 */
                DBAcess.Instance().GetDataTable("select * from dual ");
            }
            catch { }

            try
            {
                DataTable dt =
                    DBAcess.Instance().GetDataTable(
                        string.Format(
                            "select * from cfg_provice_perf t where t.datatype= 11 order by id"));
                //取的公式表对应的位置关系

                foreach (DataRow dr in dt.Rows)
                {
                    if (dr["ID"] == DBNull.Value || dr["CHIAN_NAME"] == DBNull.Value ||
                        lstChName.Contains(dr["CHIAN_NAME"].ToString()))
                        continue;

                    lstChName.Add(dr["CHIAN_NAME"].ToString());
                    if (dr["isuser"] != DBNull.Value && dr["isuser"].ToString() == "1")
                    {
                        lstFormula.Add(string.Format("{0} as ID{1}", dr["EN_NAME"], dr["ID"]));
                    }
                    else
                    {
                        lstFormula.Add(string.Format(" '' as ID{0}", dr["ID"]));
                    }
                }
            }
            catch
            {
                throw new Exception("ORAERROR");
            }
        }

        /// <summary>
        /// 获取边界扇区参数数据列
        /// </summary>
        /// <param name="lstChName"></param>
        /// <param name="lstFormula"></param>
        /// <param name="vendor"></param>
        /// <param name="datatype"></param>
        /// <param name="classcode"></param>
        public void GetParaColumn(out ArrayList lstLogicExpress,out ArrayList lstChName, out ArrayList lstFormula, string vendor, int datatype, int classcode,string isSameFreq)
        {
            lstChName = new ArrayList();
            lstFormula = new ArrayList();
            lstLogicExpress = new ArrayList();

            //同频和异频的条件
            string addSql = "and 1=1";
            if (!string.IsNullOrEmpty(isSameFreq))
            {
                addSql += " and classname='" + isSameFreq+"'";
            }
            try
            {
                /*
                                * 防止首次执行时报以下错误
                                * ORA-03113: 通信通道的文件结束进程 ID: 0会话 ID: 1519 序列号: 47194
                                */
                DBAcess.Instance().GetDataTable("select * from dual ");
            }
            catch { }

            try
            {
                DataTable dt =
                    DBAcess.Instance().GetDataTable(
                        string.Format(
                            "select * from cfg_provice_perf t where t.datatype= {0} and vendor='{1}' and classCode={2} {3}  order by id",datatype,vendor, classcode,addSql));
                //取的公式表对应的位置关系

                foreach (DataRow dr in dt.Rows)
                {
                    if (dr["ID"] == DBNull.Value || dr["CHIAN_NAME"] == DBNull.Value)                        
                        continue;

                    lstChName.Add(dr["CHIAN_NAME"].ToString());
                    lstLogicExpress.Add(dr["LOGICEXPRESS"].ToString());
                    if (dr["isuser"] != DBNull.Value && dr["isuser"].ToString() == "1")
                    {
                        lstFormula.Add(string.Format("{0} as ID{1}", dr["EN_NAME"], dr["ID"]));
                    }
                    else
                    {
                        lstFormula.Add(string.Format(" '' as ID{0}", dr["ID"]));
                    }
                }
            }
            catch
            {
                throw new Exception("ORAERROR");
            }
        }


        /// <summary>
        /// 获取测评信息数据列
        /// </summary>
        /// <param name="lstChName">中文名</param>
        /// <param name="lstFormula">公式</param>
        /// <param name="classCode">1 CITYHP;2 CITYROAD;3 VILLAGE</param>
        public void GetTestColumn(out ArrayList lstChName, out ArrayList lstFormula, int classCode)
        {
            lstChName = new ArrayList();
            lstFormula = new ArrayList();
            try
            {
                /*
                 * 防止首次执行时报以下错误
                 * ORA-03113: 通信通道的文件结束进程 ID: 0会话 ID: 1519 序列号: 47194
                 */
                DBAcess.Instance().GetDataTable("select * from dual ");
            }
            catch { }

            try
            {
                DataTable dt =
                    DBAcess.Instance().GetDataTable(
                        string.Format(
                            "select * from cfg_provice_perf t where t.datatype= 10 and classCode={0}  order by id", classCode));
                //取的公式表对应的位置关系

                foreach (DataRow dr in dt.Rows)
                {
                    if (dr["ID"] == DBNull.Value || dr["CHIAN_NAME"] == DBNull.Value ||
                        lstChName.Contains(dr["CHIAN_NAME"].ToString()))
                        continue;

                    lstChName.Add(dr["CHIAN_NAME"].ToString());
                    if (dr["isuser"] != DBNull.Value && dr["isuser"].ToString() == "1")
                    {
                        lstFormula.Add(string.Format("{0} as ID{1}", dr["EN_NAME"], dr["ID"]));
                    }
                    else
                    {
                        lstFormula.Add(string.Format(" '' as ID{0}", dr["ID"]));
                    }
                }
            }
            catch
            {
                throw new Exception("ORAERROR");
            }
        }

        /// <summary>
        /// 获取配置数据列
        /// </summary>
        /// <param name="lstChName">中文名</param>
        /// <param name="lstFormula">公式</param>
        /// <param name="classCode"> 1 MSC ,2 BSC,3 BTS,4 SECTOR，5 热点信息，6 盲点信息</param>
        public void GetConfColumn(out ArrayList lstChName, out ArrayList lstFormula, int classCode)
        {
            lstChName = new ArrayList();
            lstFormula = new ArrayList();
            try
            {
                /*
                 * 防止首次执行时报以下错误
                 * ORA-03113: 通信通道的文件结束进程 ID: 0会话 ID: 1519 序列号: 47194
                 */
                DBAcess.Instance().GetDataTable("select * from dual ");
            }catch{}

            try
            {
                DataTable dt =
                    DBAcess.Instance().GetDataTable(
                        string.Format(
                            "select * from cfg_provice_perf t where t.datatype= 1 and classCode={0}  order by id", classCode));
                //取的公式表对应的位置关系

                foreach (DataRow dr in dt.Rows)
                {
                    if (dr["ID"] == DBNull.Value || dr["CHIAN_NAME"] == DBNull.Value ||
                        lstChName.Contains(dr["CHIAN_NAME"].ToString()))
                        continue;

                    lstChName.Add(dr["CHIAN_NAME"].ToString());
                    if (dr["isuser"] != DBNull.Value && dr["isuser"].ToString() == "1")
                    {
                        lstFormula.Add(string.Format("{0} as ID{1}", dr["EN_NAME"], dr["ID"]));
                    }
                    else
                    {
                        lstFormula.Add(string.Format(" '' as ID{0}", dr["ID"]));
                    }
                }
            }
            catch
            {
                throw new Exception("ORAERROR");
            }
        }

        public DataTable GetComplaintData(ArrayList lstFormula, string proChName, DateTime updateTime,string bizType)
        {
            try
            {
                string fieldName = lstFormula.Cast<object>().Aggregate(string.Empty,
                                                                       (current, t) =>
                                                                       string.IsNullOrEmpty(current)
                                                                           ? t.ToString()
                                                                           : string.Format("{0},{1}", current, t));
                string sql = string.Empty;
                if (bizType == "DO")
                {
                    sql = string.Format(string.Format(@"select {0} from ne_uway_complaintdata com,cfg_city city
                                                        where com.businesstype='DO' and com.city_id=city.city_id and to_char(accepttime,'yyyy-MM-dd')='{1}'", fieldName,updateTime.ToString("yyyy-MM-dd")), proChName);                    
                }
                else
                {
                    sql = string.Format(string.Format(@"select {0} from ne_uway_complaintdata com,cfg_city city
                                                        where com.businesstype<>'DO' and com.city_id=city.city_id and to_char(accepttime,'yyyy-MM-dd')='{1}'", fieldName, updateTime.ToString("yyyy-MM-dd")), proChName);                   
                }
                return DBAcess.Instance().GetDataTable(sql);
            }
            catch
            {
                throw new Exception("ORAERROR");
            }
        }

        public DataTable GetModuleData(DateTime updateTime,string proChName)
        {
            try
            {
                try
                {
                    /*
                     * 防止首次执行时报以下错误
                     * ORA-03113: 通信通道的文件结束进程 ID: 0会话 ID: 1519 序列号: 47194
                     */
                    DBAcess.Instance().GetDataTable("select * from dual ");
                }
                catch { }
                //TODO:TEST
//                string sql = string.Format(@"select *
//                                              from (select b.modulename, count(a.id) as count
//                                                      from sec_operatelog a, cfg_module b
//                                                     where a.modleid = b.id                                                 
//                                                     group by b.modulename
//                                                     order by count desc)
//                                             where rownum <= 10");

                string sql = string.Format(@"select '{1}' as pro,'{0}' as uptime,modulename,count
                                              from (select b.modulename, count(a.id) as count
                                                      from sec_operatelog a, cfg_module b
                                                     where a.modleid = b.id
                                                       and a.operatetime>=to_date('{0} 00:00:00','yyyy-MM-dd hh24:mi:ss')
                                                       and a.operatetime<=to_date('{0} 23:59:59','yyyy-MM-dd hh24:mi:ss')                                                       
                                                     group by b.modulename
                                                     order by count desc)
                                             where rownum <= 10", updateTime.ToShortDateString(),proChName);
                return DBAcess.Instance().GetDataTable(sql);
            }
            catch (Exception ex)
            {
                throw new Exception("ORAERROR");
            }
        }

        /// <summary>
        /// 获取一级模块明细
        /// </summary>
        /// <returns></returns>
//        public DataTable GetFirstModuleData()
//        {
//            try
//            {
//                string sql = string.Format(@"select *
//                                              from (select b.modulename, count(a.id) as count
//                                                      from sec_operatelog a, cfg_module b
//                                                     where a.modleid = b.id
//                                                     group by b.modulename
//                                                     order by count desc)
//                                             where rownum <= 10");
//                return DBAcess.Instance().GetDataTable(sql);
//            }
//            catch (Exception ex)
//            {
//                throw new Exception("ORAERROR");
//            }

//        }

        /// <summary>
        /// 获取一级模块下二级模块的使用次数
        /// </summary>
        /// <param name="moduleID"></param>
        /// <param name="updateTime"></param>
        /// <returns></returns>
//        public object GetSecondModuleData(int moduleID, DateTime updateTime)
//        {
//            try
//            {
//                string sql = string.Format(@"select count(*) as count 
//                                               from sec_operatelog 
//                                              where modleid in(select id from cfg_module where parentid={0} and operatetime>=to_date('{1} 00:00:00','yyyy-MM-dd hh24:mi:ss')
//                                                                                                            and close_time<=to_date('{1} 23:59:59','yyyy-MM-dd hh24:mi:ss'))", moduleID,updateTime.ToShortDateString());
//                return DBAcess.Instance().ExecScalar(sql);
//            }
//            catch (Exception ex)
//            {
//                throw new Exception("ORAERROR");
//            }
//        }                

        /// <summary>
        /// 获取单个用户的数据
        /// </summary>
        /// <param name="updateTime"></param>
        /// <param name="username"></param>
        /// <returns></returns>
        public DataTable GetSingleUser(DateTime updateTime, string username)
        {
            try
            {
                try
                {
                    /*
                     * 防止首次执行时报以下错误
                     * ORA-03113: 通信通道的文件结束进程 ID: 0会话 ID: 1519 序列号: 47194
                     */
                    DBAcess.Instance().GetDataTable("select * from dual ");
                }
                catch { }

                string sql = string.Format(@"select a.loginname,b.username,a.entertime,a.exittime 
                                             from sec_userinfo b,sec_loginlog a
                                            where a.loginname=b.loginname 
                                                  and a.entertime>=to_date('{0} 00:00:00','YYYY-MM-DD HH24:MI:SS') 
                                                  and a.entertime<=to_date('{0} 23:59:59','YYYY-MM-DD HH24:MI:SS') and b.username ='{1}'", updateTime.ToShortDateString(), username);
                return DBAcess.Instance().GetDataTable(sql);
            }
            catch
            {
                throw new Exception("ORAERROR");
            }
        }

        /// <summary>
        /// 获取所有用户
        /// </summary>
        /// <param name="updateTime"></param>
        /// <param name="proChName"></param>
        /// <returns></returns>
        public DataTable GetUser(DateTime updateTime, string proChName)
        {
            try
            {
                try
                {
                    /*
                     * 防止首次执行时报以下错误
                     * ORA-03113: 通信通道的文件结束进程 ID: 0会话 ID: 1519 序列号: 47194
                     */
                    DBAcess.Instance().GetDataTable("select * from dual ");
                }
                catch { }

                string sql = string.Format(@"select distinct '{1}' as pro,
                                                    '{0}' as uptime,
                                                    a.username as username,
                                                    null as count,
                                                    null as sumtime
                                               from sec_userinfo a, sec_dept b, cfg_city c
                                              where a.deptid = b.id
                                                and a.city_id = c.city_id", updateTime.ToShortDateString(), proChName);
                return DBAcess.Instance().GetDataTable(sql);
            }
            catch
            {
                throw new Exception("ORAERROR");
            }
        }

        /// <summary>
        /// 获取用户登录时长及登陆次数
        /// </summary>
        /// <param name="updateTime"></param>
        /// <returns></returns>
        public DataTable GetUserData(DateTime updateTime,string proChName)
        {
            try
            {
                try
                {
                    /*
                     * 防止首次执行时报以下错误
                     * ORA-03113: 通信通道的文件结束进程 ID: 0会话 ID: 1519 序列号: 47194
                     */
                    DBAcess.Instance().GetDataTable("select * from dual ");
                }
                catch { }
                //TODO:TEST
//                string sql = string.Format(@"select b.username as USERNAME,
//                                           sum(ROUND(TO_NUMBER(a.exittime - a.entertime) * 24,2)) as SUMTIME,
//                                           count(*) as count
//                                      from sec_loginlog a, sec_userinfo b
//                                     where b.loginname = a.loginname(+)                                                                              
//                                       and a.loginname is not null
//                                     group by b.username");

                string sql = string.Format(@"select '{1}' as pro,'{0}' as uptime,b.username as USERNAME,
                                           count(*) as count,
                                           sum(ROUND(TO_NUMBER(a.exittime - a.entertime) * 24,2)) as SUMTIME                                           
                                      from sec_loginlog a, sec_userinfo b
                                     where b.loginname = a.loginname(+)
                                       and a.entertime >= to_date('{0} 00:00:00','yyyy-MM-dd hh24:mi:ss')
                                       and a.exittime <= to_date('{0} 23:59:59','yyyy-MM-dd hh24:mi:ss')
                                       and a.loginname is not null
                                     group by b.username", updateTime.ToShortDateString(),proChName);
                return DBAcess.Instance().GetDataTable(sql);
            }
            catch
            {
                throw new Exception("ORAERROR");
            }
        }

        /// <summary>
        /// 获取边界扇区/载频参数数据
        /// </summary>
        /// <param name="lstFormula">公式</param>
        /// <param name="proChName">省份</param>
        /// <param name="updateTime">时间</param>
        /// <param name="vendor">厂家</param>
        /// <param name="level">级别(扇区/载频)</param>
        /// <param name="bizType">业务类型(1x/DO)</param>
        /// <returns></returns>
        public DataTable GetParaData(ArrayList lstFormula, string proChName, DateTime updateTime, string vendor, string level,string bizType,string isSameFreq)
        {
            try
            {
                string biztype = bizType.ToUpper() == "1X" ? "否" : "是";

                #region 华为
                if (vendor=="ZY0808")//华为载频级(华为无扇区级)
                {
                    string fieldName = lstFormula.Cast<object>().Aggregate(string.Empty,
                                                                       (current, t) =>
                                                                       string.IsNullOrEmpty(current)
                                                                           ? t.ToString()
                                                                           : string.Format("{0},{1}", current, t));
                    string sql = string.Empty;
                    if (isSameFreq == "SF")//同频
                    {
                        if (bizType.ToUpper() == "1X")//同频1X
                        {
                            sql = string.Format(@"select {0} from ne_carrier_c     carr,
                                                                                           ne_cell_c        sector,
                                                                                           ne_bts_c         bts,
                                                                                           ne_bsc_c         bsc,
                                                                                           cfg_bsc_map_city msc,
                                                                                           cfg_city         city,
                                                                                           ne_taizhang_cell tzcell,
                                                                                           --ne_taizhang_carrier tzcarr,
                                                                                           --para_adj         para,
                                                                                           ne_carrier_c     neicarr,
                                                                                           ne_cell_c        neisector,
                                                                                           ne_bts_c         neibts,
                                                                                           ne_bsc_c         neibsc,
                                                                                           cfg_bsc_map_city neimsc,
                                                                                           cfg_city         neicity,
                                                                                           cfg_county       neiadm,
                                                                                           ne_taizhang_cell neitzcell,
                                                                                           --ne_taizhang_carrier neitzcarr,
                                                                                           CLT_CM_ODTMOC_SFNBRCH_HW SFNBRCH,
                                                                                           CLT_CM_ODTMOC_SFNBRCH_SP_HW SFNBRCH_SFNBRPARA
                                                                                           --(select p.ne_sys_id,ROW_NUMBER() OVER(PARTITION BY p.ne_sys_id ORDER BY p.nbrseq) - 1 as sortnum
                                                                                               --from para_adj p, ne_carrier_c c
                                                                                              --where p.ne_sys_id = c.ne_sys_id
                                                                                                --and p.vendor = '{2}') para_sort
                                                                                 where sector.bsc_id = tzcell.bsc_id
                                                                                       and sector.local_cell_id = tzcell.local_cell_id
                                                                                       and sector.sector_id = tzcell.sector_id --关联台账
                                                                                       --and tzcell.bsc_id=tzcarr.bsc_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       --and tzcell.local_cell_id=tzcarr.local_cell_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       --and tzcell.sector_id=tzcarr.sector_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       and tzcell.border_type in ('省际边界', '同为省内省际边界')--边界类型
                                                                                       and tzcell.isdo='{1}'--业务类型
                                                                                       --and tzcarr.carrier_type='{3}'--业务类型
                                                                                       and carr.bustype='{3}'--业务类型
                                                                                       and carr.vendor='{2}'--厂家
                                                                                       and carr.related_cell=sector.ne_sys_id--基础数据carr-cell
                                                                                       and sector.related_bts = bts.ne_sys_id--基础数据cell-bts
                                                                                       and bts.Related_Bsc = bsc.ne_sys_id--基础数据bts-bsc
                                                                                       and bsc.ne_sys_id = msc.ne_bsc_id--基础数据bsc-msc
                                                                                       and carr.city_id=city.city_id
                                                                                       and carr.city_id = sector.city_id
                                                                                       and sector.city_id = bts.city_id
                                                                                       and sector.city_id = bsc.city_id
                                                                                       and sector.city_id = msc.city_id
                                                                                       --and carr.ne_sys_id = para.ne_sys_id(+)
                                                                                       --and para.nei_ne_sys_id = neicarr.ne_sys_id
                                                                                       and neicarr.related_cell=neisector.ne_sys_id
                                                                                       and neisector.bsc_id = neitzcell.bsc_id
                                                                                       and neisector.local_cell_id = neitzcell.local_cell_id
                                                                                       and neisector.sector_id = neitzcell.sector_id --关联台账
                                                                                       --and neitzcell.bsc_id=neitzcarr.bsc_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       --and neitzcell.local_cell_id=neitzcarr.local_cell_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       --and neitzcell.sector_id=neitzcarr.sector_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       and neisector.related_bts = neibts.ne_sys_id
                                                                                       and neibts.related_bsc = neibsc.ne_sys_id
                                                                                       and neibsc.ne_sys_id = neimsc.ne_bsc_id
                                                                                       and neicarr.city_id=city.city_id
                                                                                       and neicarr.city_id = neisector.city_id
                                                                                       and neisector.city_id = neibts.city_id
                                                                                       and neisector.city_id = neibsc.city_id
                                                                                       and neisector.city_id = neimsc.city_id
                                                                                       and neiadm.county_id(+) = neisector.adm_area
                                                                                       --and para_sort.ne_sys_id=para.ne_sys_id
                                                                                       and substr(SFNBRCH.omcid,length(SFNBRCH.omcid))=neicarr.bsc_id --bsc_id
                                                                                       and SUBSTR(SFNBRCH.NBRCDMACH,1,INSTR(SFNBRCH.NBRCDMACH,'-',1,1)-1)=neicarr.bts_id--bts_id
                                                                                       and SUBSTR(SFNBRCH.NBRCDMACH,INSTR(SFNBRCH.NBRCDMACH,'-',1,1) + 1,INSTR(SFNBRCH.NBRCDMACH,'-',1,2)-(INSTR(SFNBRCH.NBRCDMACH,'-',1,1) + 1))=neicarr.local_cell_id--local_cell_id
                                                                                       and SUBSTR(SFNBRCH.NBRCDMACH,INSTR(SFNBRCH.NBRCDMACH,'-',1,2) + 1,INSTR(SFNBRCH.NBRCDMACH,'-',1,3)-(INSTR(SFNBRCH.NBRCDMACH,'-',1,2) + 1))=neicarr.sector_id--sector_id
                                                                                       and SUBSTR(SFNBRCH.NBRCDMACH,INSTR(SFNBRCH.NBRCDMACH,'-',1,3) + 1,INSTR(SFNBRCH.NBRCDMACH,'-',1,4)-(INSTR(SFNBRCH.NBRCDMACH,'-',1,3) + 1))=neicarr.carrier_id--carrier_id
                                                                                       and substr(SFNBRCH_SFNBRPARA.omcid,length(SFNBRCH_SFNBRPARA.omcid))=neicarr.bsc_id --bsc_id
                                                                                       and SUBSTR(SFNBRCH_SFNBRPARA.NBRCDMACH,1,INSTR(SFNBRCH_SFNBRPARA.NBRCDMACH,'-',1,1)-1)=neicarr.bts_id--bts_id
                                                                                       and SUBSTR(SFNBRCH_SFNBRPARA.NBRCDMACH,INSTR(SFNBRCH_SFNBRPARA.NBRCDMACH,'-',1,1) + 1,INSTR(SFNBRCH_SFNBRPARA.NBRCDMACH,'-',1,2)-(INSTR(SFNBRCH_SFNBRPARA.NBRCDMACH,'-',1,1) + 1))=neicarr.local_cell_id--local_cell_id
                                                                                       and SUBSTR(SFNBRCH_SFNBRPARA.NBRCDMACH,INSTR(SFNBRCH_SFNBRPARA.NBRCDMACH,'-',1,2) + 1,INSTR(SFNBRCH_SFNBRPARA.NBRCDMACH,'-',1,3)-(INSTR(SFNBRCH_SFNBRPARA.NBRCDMACH,'-',1,2) + 1))=neicarr.sector_id--sector_id
                                                                                       and SUBSTR(SFNBRCH_SFNBRPARA.NBRCDMACH,INSTR(SFNBRCH_SFNBRPARA.NBRCDMACH,'-',1,3) + 1,INSTR(SFNBRCH_SFNBRPARA.NBRCDMACH,'-',1,4)-(INSTR(SFNBRCH_SFNBRPARA.NBRCDMACH,'-',1,3) + 1))=neicarr.carrier_id--carrier_id
                                                                                       and SFNBRCH.CTYP='CDMA1X'
                                                                                       and SFNBRCH.stamptime=trunc(sysdate-2)
                                                                                       and SFNBRCH_SFNBRPARA.stamptime=trunc(sysdate-2)
                                                                                       ",
                                                                                        string.Format(fieldName, updateTime.ToShortDateString(), proChName), biztype, vendor, bizType);                            
                        }
                        else//同频do
                        {
                            sql = string.Format(@"select {0} from ne_carrier_c     carr,
                                                                                           ne_cell_c        sector,
                                                                                           ne_bts_c         bts,
                                                                                           ne_bsc_c         bsc,
                                                                                           cfg_bsc_map_city msc,
                                                                                           cfg_city         city,
                                                                                           ne_taizhang_cell tzcell,
                                                                                           --ne_taizhang_carrier tzcarr,
                                                                                           --para_adj         para,
                                                                                           ne_carrier_c     neicarr,
                                                                                           ne_cell_c        neisector,
                                                                                           ne_bts_c         neibts,
                                                                                           ne_bsc_c         neibsc,
                                                                                           cfg_bsc_map_city neimsc,
                                                                                           cfg_city         neicity,
                                                                                           cfg_county       neiadm,
                                                                                           ne_taizhang_cell neitzcell,
                                                                                           --ne_taizhang_carrier neitzcarr,
                                                                                           CLT_CM_ODTMOC_SFNBRCH_HW SFNBRCH,
                                                                                           --CLT_CM_ODTMOC_SFNBRCH_SP_HW SFNBRCH_SFNBRPARA,此表中无EVDO数据,此表中的参数不上报
                                                                                           CLT_CM_ODTMOC_SFNBRCH_OD_HW SFNBRCH_ODOSFNBRPARA
                                                                                           --(select p.ne_sys_id,ROW_NUMBER() OVER(PARTITION BY p.ne_sys_id ORDER BY p.nbrseq) - 1 as sortnum
                                                                                               --from para_adj p, ne_carrier_c c
                                                                                              --where p.ne_sys_id = c.ne_sys_id
                                                                                                --and p.vendor = '{2}') para_sort
                                                                                 where sector.bsc_id = tzcell.bsc_id
                                                                                       and sector.local_cell_id = tzcell.local_cell_id
                                                                                       and sector.sector_id = tzcell.sector_id --关联台账
                                                                                       --and tzcell.bsc_id=tzcarr.bsc_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       --and tzcell.local_cell_id=tzcarr.local_cell_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       --and tzcell.sector_id=tzcarr.sector_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       and tzcell.border_type in ('省际边界', '同为省内省际边界')--边界类型
                                                                                       and tzcell.isdo='{1}'--业务类型
                                                                                       --and tzcarr.carrier_type='{3}'--业务类型
                                                                                       and carr.bustype='{3}'--业务类型
                                                                                       and carr.vendor='{2}'--厂家
                                                                                       and carr.related_cell=sector.ne_sys_id--基础数据carr-cell
                                                                                       and sector.related_bts = bts.ne_sys_id--基础数据cell-bts
                                                                                       and bts.Related_Bsc = bsc.ne_sys_id--基础数据bts-bsc
                                                                                       and bsc.ne_sys_id = msc.ne_bsc_id--基础数据bsc-msc
                                                                                       and carr.city_id=city.city_id
                                                                                       and carr.city_id = sector.city_id
                                                                                       and sector.city_id = bts.city_id
                                                                                       and sector.city_id = bsc.city_id
                                                                                       and sector.city_id = msc.city_id
                                                                                       --and carr.ne_sys_id = para.ne_sys_id(+)
                                                                                       --and para.nei_ne_sys_id = neicarr.ne_sys_id
                                                                                       and neicarr.related_cell=neisector.ne_sys_id
                                                                                       and neisector.bsc_id = neitzcell.bsc_id
                                                                                       and neisector.local_cell_id = neitzcell.local_cell_id
                                                                                       and neisector.sector_id = neitzcell.sector_id --关联台账
                                                                                       --and neitzcell.bsc_id=neitzcarr.bsc_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       --and neitzcell.local_cell_id=neitzcarr.local_cell_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       --and neitzcell.sector_id=neitzcarr.sector_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       and neisector.related_bts = neibts.ne_sys_id
                                                                                       and neibts.related_bsc = neibsc.ne_sys_id
                                                                                       and neibsc.ne_sys_id = neimsc.ne_bsc_id
                                                                                       and neicarr.city_id=city.city_id
                                                                                       and neicarr.city_id = neisector.city_id
                                                                                       and neisector.city_id = neibts.city_id
                                                                                       and neisector.city_id = neibsc.city_id
                                                                                       and neisector.city_id = neimsc.city_id
                                                                                       and neiadm.county_id(+) = neisector.adm_area
                                                                                       --and para_sort.ne_sys_id=para.ne_sys_id
                                                                                       and substr(SFNBRCH.omcid,length(SFNBRCH.omcid))=neicarr.bsc_id --bsc_id
                                                                                       and SUBSTR(SFNBRCH.NBRCDMACH,1,INSTR(SFNBRCH.NBRCDMACH,'-',1,1)-1)=neicarr.bts_id--bts_id
                                                                                       and SUBSTR(SFNBRCH.NBRCDMACH,INSTR(SFNBRCH.NBRCDMACH,'-',1,1) + 1,INSTR(SFNBRCH.NBRCDMACH,'-',1,2)-(INSTR(SFNBRCH.NBRCDMACH,'-',1,1) + 1))=neicarr.local_cell_id--local_cell_id
                                                                                       and SUBSTR(SFNBRCH.NBRCDMACH,INSTR(SFNBRCH.NBRCDMACH,'-',1,2) + 1,INSTR(SFNBRCH.NBRCDMACH,'-',1,3)-(INSTR(SFNBRCH.NBRCDMACH,'-',1,2) + 1))=neicarr.sector_id--sector_id
                                                                                       and SUBSTR(SFNBRCH.NBRCDMACH,INSTR(SFNBRCH.NBRCDMACH,'-',1,3) + 1,INSTR(SFNBRCH.NBRCDMACH,'-',1,4)-(INSTR(SFNBRCH.NBRCDMACH,'-',1,3) + 1))=neicarr.carrier_id--carrier_id
                                                                                       --and substr(SFNBRCH_SFNBRPARA.omcid,length(SFNBRCH_SFNBRPARA.omcid))=neicarr.bsc_id --bsc_id
                                                                                       --and SUBSTR(SFNBRCH_SFNBRPARA.NBRCDMACH,1,INSTR(SFNBRCH_SFNBRPARA.NBRCDMACH,'-',1,1)-1)=neicarr.bts_id--bts_id
                                                                                       --and SUBSTR(SFNBRCH_SFNBRPARA.NBRCDMACH,INSTR(SFNBRCH_SFNBRPARA.NBRCDMACH,'-',1,1) + 1,INSTR(SFNBRCH_SFNBRPARA.NBRCDMACH,'-',1,2)-(INSTR(SFNBRCH_SFNBRPARA.NBRCDMACH,'-',1,1) + 1))=neicarr.local_cell_id--local_cell_id
                                                                                       --and SUBSTR(SFNBRCH_SFNBRPARA.NBRCDMACH,INSTR(SFNBRCH_SFNBRPARA.NBRCDMACH,'-',1,2) + 1,INSTR(SFNBRCH_SFNBRPARA.NBRCDMACH,'-',1,3)-(INSTR(SFNBRCH_SFNBRPARA.NBRCDMACH,'-',1,2) + 1))=neicarr.sector_id--sector_id
                                                                                       --and SUBSTR(SFNBRCH_SFNBRPARA.NBRCDMACH,INSTR(SFNBRCH_SFNBRPARA.NBRCDMACH,'-',1,3) + 1,INSTR(SFNBRCH_SFNBRPARA.NBRCDMACH,'-',1,4)-(INSTR(SFNBRCH_SFNBRPARA.NBRCDMACH,'-',1,3) + 1))=neicarr.carrier_id--carrier_id
                                                                                       and substr(SFNBRCH_ODOSFNBRPARA.omcid,length(SFNBRCH_ODOSFNBRPARA.omcid))=neicarr.bsc_id --bsc_id
                                                                                       and SUBSTR(SFNBRCH_ODOSFNBRPARA.NBRCDMACH,1,INSTR(SFNBRCH_ODOSFNBRPARA.NBRCDMACH,'-',1,1)-1)=neicarr.bts_id--bts_id
                                                                                       and SUBSTR(SFNBRCH_ODOSFNBRPARA.NBRCDMACH,INSTR(SFNBRCH_ODOSFNBRPARA.NBRCDMACH,'-',1,1) + 1,INSTR(SFNBRCH_ODOSFNBRPARA.NBRCDMACH,'-',1,2)-(INSTR(SFNBRCH_ODOSFNBRPARA.NBRCDMACH,'-',1,1) + 1))=neicarr.local_cell_id--local_cell_id
                                                                                       and SUBSTR(SFNBRCH_ODOSFNBRPARA.NBRCDMACH,INSTR(SFNBRCH_ODOSFNBRPARA.NBRCDMACH,'-',1,2) + 1,INSTR(SFNBRCH_ODOSFNBRPARA.NBRCDMACH,'-',1,3)-(INSTR(SFNBRCH_ODOSFNBRPARA.NBRCDMACH,'-',1,2) + 1))=neicarr.sector_id--sector_id
                                                                                       and SUBSTR(SFNBRCH_ODOSFNBRPARA.NBRCDMACH,INSTR(SFNBRCH_ODOSFNBRPARA.NBRCDMACH,'-',1,3) + 1,INSTR(SFNBRCH_ODOSFNBRPARA.NBRCDMACH,'-',1,4)-(INSTR(SFNBRCH_ODOSFNBRPARA.NBRCDMACH,'-',1,3) + 1))=neicarr.carrier_id--carrier_id
                                                                                       and SFNBRCH.CTYP='EVDO'
                                                                                       and SFNBRCH.stamptime=trunc(sysdate-2)
                                                                                       --and SFNBRCH_SFNBRPARA.stamptime=trunc(sysdate-2)
                                                                                       and SFNBRCH_ODOSFNBRPARA.stamptime=trunc(sysdate-2)",
                                                                                        string.Format(fieldName, updateTime.ToShortDateString(), proChName), biztype, vendor, bizType); 
                        }
                    }
                    else//异频
                    {
                        if (bizType.ToUpper() == "1X")//异频1x
                        {
                            sql = string.Format(@"select {0} from ne_carrier_c     carr,
                                                                                           ne_cell_c        sector,
                                                                                           ne_bts_c         bts,
                                                                                           ne_bsc_c         bsc,
                                                                                           cfg_bsc_map_city msc,
                                                                                           cfg_city         city,
                                                                                           ne_taizhang_cell tzcell,
                                                                                           --ne_taizhang_carrier tzcarr,
                                                                                           --para_adj         para,
                                                                                           ne_carrier_c     neicarr,
                                                                                           ne_cell_c        neisector,
                                                                                           ne_bts_c         neibts,
                                                                                           ne_bsc_c         neibsc,
                                                                                           cfg_bsc_map_city neimsc,
                                                                                           cfg_city         neicity,
                                                                                           cfg_county       neiadm,
                                                                                           ne_taizhang_cell neitzcell,
                                                                                           --ne_taizhang_carrier neitzcarr,
                                                                                           CLT_CM_ODTMOC_DFNBRCH_HW DFNBRCH,
                                                                                           CLT_CM_ODTMOC_DFNBRCH_P_HW DFNBRCH_DFNBRPARA
                                                                                           --(select p.ne_sys_id,ROW_NUMBER() OVER(PARTITION BY p.ne_sys_id ORDER BY p.nbrseq) - 1 as sortnum
                                                                                               --from para_adj p, ne_carrier_c c
                                                                                              --where p.ne_sys_id = c.ne_sys_id
                                                                                                --and p.vendor = '{2}') para_sort
                                                                                 where sector.bsc_id = tzcell.bsc_id
                                                                                       and sector.local_cell_id = tzcell.local_cell_id
                                                                                       and sector.sector_id = tzcell.sector_id --关联台账
                                                                                       --and tzcell.bsc_id=tzcarr.bsc_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       --and tzcell.local_cell_id=tzcarr.local_cell_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       --and tzcell.sector_id=tzcarr.sector_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       and tzcell.border_type in ('省际边界', '同为省内省际边界')--边界类型
                                                                                       and tzcell.isdo='{1}'--业务类型
                                                                                       --and tzcarr.carrier_type='{3}'--业务类型
                                                                                       and carr.bustype='{3}'--业务类型
                                                                                       and carr.vendor='{2}'--厂家
                                                                                       and carr.related_cell=sector.ne_sys_id--基础数据carr-cell
                                                                                       and sector.related_bts = bts.ne_sys_id--基础数据cell-bts
                                                                                       and bts.Related_Bsc = bsc.ne_sys_id--基础数据bts-bsc
                                                                                       and bsc.ne_sys_id = msc.ne_bsc_id--基础数据bsc-msc
                                                                                       and carr.city_id=city.city_id
                                                                                       and carr.city_id = sector.city_id
                                                                                       and sector.city_id = bts.city_id
                                                                                       and sector.city_id = bsc.city_id
                                                                                       and sector.city_id = msc.city_id
                                                                                       --and carr.ne_sys_id = para.ne_sys_id(+)
                                                                                       --and para.nei_ne_sys_id = neicarr.ne_sys_id
                                                                                       and neicarr.related_cell=neisector.ne_sys_id
                                                                                       and neisector.bsc_id = neitzcell.bsc_id
                                                                                       and neisector.local_cell_id = neitzcell.local_cell_id
                                                                                       and neisector.sector_id = neitzcell.sector_id --关联台账
                                                                                       --and neitzcell.bsc_id=neitzcarr.bsc_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       --and neitzcell.local_cell_id=neitzcarr.local_cell_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       --and neitzcell.sector_id=neitzcarr.sector_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       and neisector.related_bts = neibts.ne_sys_id
                                                                                       and neibts.related_bsc = neibsc.ne_sys_id
                                                                                       and neibsc.ne_sys_id = neimsc.ne_bsc_id
                                                                                       and neicarr.city_id=city.city_id
                                                                                       and neicarr.city_id = neisector.city_id
                                                                                       and neisector.city_id = neibts.city_id
                                                                                       and neisector.city_id = neibsc.city_id
                                                                                       and neisector.city_id = neimsc.city_id
                                                                                       and neiadm.county_id(+) = neisector.adm_area
                                                                                       --and para_sort.ne_sys_id=para.ne_sys_id
                                                                                       and substr(DFNBRCH.omcid,length(DFNBRCH.omcid))=neicarr.bsc_id --bsc_id
                                                                                       and SUBSTR(DFNBRCH.NBRCDMACH,1,INSTR(DFNBRCH.NBRCDMACH,'-',1,1)-1)=neicarr.bts_id--bts_id
                                                                                       and SUBSTR(DFNBRCH.NBRCDMACH,INSTR(DFNBRCH.NBRCDMACH,'-',1,1) + 1,INSTR(DFNBRCH.NBRCDMACH,'-',1,2)-(INSTR(DFNBRCH.NBRCDMACH,'-',1,1) + 1))=neicarr.local_cell_id--local_cell_id
                                                                                       and SUBSTR(DFNBRCH.NBRCDMACH,INSTR(DFNBRCH.NBRCDMACH,'-',1,2) + 1,INSTR(DFNBRCH.NBRCDMACH,'-',1,3)-(INSTR(DFNBRCH.NBRCDMACH,'-',1,2) + 1))=neicarr.sector_id--sector_id
                                                                                       and SUBSTR(DFNBRCH.NBRCDMACH,INSTR(DFNBRCH.NBRCDMACH,'-',1,3) + 1,INSTR(DFNBRCH.NBRCDMACH,'-',1,4)-(INSTR(DFNBRCH.NBRCDMACH,'-',1,3) + 1))=neicarr.carrier_id--carrier_id
                                                                                       and substr(DFNBRCH_DFNBRPARA.omcid,length(DFNBRCH_DFNBRPARA.omcid))=neicarr.bsc_id --bsc_id
                                                                                       and SUBSTR(DFNBRCH_DFNBRPARA.NBRCDMACH,1,INSTR(DFNBRCH_DFNBRPARA.NBRCDMACH,'-',1,1)-1)=neicarr.bts_id--bts_id
                                                                                       and SUBSTR(DFNBRCH_DFNBRPARA.NBRCDMACH,INSTR(DFNBRCH_DFNBRPARA.NBRCDMACH,'-',1,1) + 1,INSTR(DFNBRCH_DFNBRPARA.NBRCDMACH,'-',1,2)-(INSTR(DFNBRCH_DFNBRPARA.NBRCDMACH,'-',1,1) + 1))=neicarr.local_cell_id--local_cell_id
                                                                                       and SUBSTR(DFNBRCH_DFNBRPARA.NBRCDMACH,INSTR(DFNBRCH_DFNBRPARA.NBRCDMACH,'-',1,2) + 1,INSTR(DFNBRCH_DFNBRPARA.NBRCDMACH,'-',1,3)-(INSTR(DFNBRCH_DFNBRPARA.NBRCDMACH,'-',1,2) + 1))=neicarr.sector_id--sector_id
                                                                                       and SUBSTR(DFNBRCH_DFNBRPARA.NBRCDMACH,INSTR(DFNBRCH_DFNBRPARA.NBRCDMACH,'-',1,3) + 1,INSTR(DFNBRCH_DFNBRPARA.NBRCDMACH,'-',1,4)-(INSTR(DFNBRCH_DFNBRPARA.NBRCDMACH,'-',1,3) + 1))=neicarr.carrier_id--carrier_id
                                                                                       and DFNBRCH.CTYP='CDMA1X'
                                                                                       and DFNBRCH.stamptime=trunc(sysdate-2)
                                                                                       and DFNBRCH_DFNBRPARA.stamptime=trunc(sysdate-2)",
                                                                                        string.Format(fieldName, updateTime.ToShortDateString(), proChName), biztype, vendor, bizType); 
                        }
                        else//异频do
                        {
                            sql = string.Format(@"select {0} from ne_carrier_c     carr,
                                                                                           ne_cell_c        sector,
                                                                                           ne_bts_c         bts,
                                                                                           ne_bsc_c         bsc,
                                                                                           cfg_bsc_map_city msc,
                                                                                           cfg_city         city,
                                                                                           ne_taizhang_cell tzcell,
                                                                                           --ne_taizhang_carrier tzcarr,
                                                                                           --para_adj         para,
                                                                                           ne_carrier_c     neicarr,
                                                                                           ne_cell_c        neisector,
                                                                                           ne_bts_c         neibts,
                                                                                           ne_bsc_c         neibsc,
                                                                                           cfg_bsc_map_city neimsc,
                                                                                           cfg_city         neicity,
                                                                                           cfg_county       neiadm,
                                                                                           ne_taizhang_cell neitzcell,
                                                                                           --ne_taizhang_carrier neitzcarr,
                                                                                           CLT_CM_ODTMOC_DFNBRCH_HW DFNBRCH,
                                                                                           --CLT_CM_ODTMOC_DFNBRCH_P_HW DFNBRCH_DFNBRPARA,此表无do数据,此表中的参数不上报
                                                                                           CLT_CM_ODTMOC_DFNBRCH_OD_HW DFNBRCH_ODODFNBRPARA
                                                                                           --(select p.ne_sys_id,ROW_NUMBER() OVER(PARTITION BY p.ne_sys_id ORDER BY p.nbrseq) - 1 as sortnum
                                                                                               --from para_adj p, ne_carrier_c c
                                                                                              --where p.ne_sys_id = c.ne_sys_id
                                                                                                --and p.vendor = '{2}') para_sort
                                                                                 where sector.bsc_id = tzcell.bsc_id
                                                                                       and sector.local_cell_id = tzcell.local_cell_id
                                                                                       and sector.sector_id = tzcell.sector_id --关联台账
                                                                                       --and tzcell.bsc_id=tzcarr.bsc_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       --and tzcell.local_cell_id=tzcarr.local_cell_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       --and tzcell.sector_id=tzcarr.sector_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       and tzcell.border_type in ('省际边界', '同为省内省际边界')--边界类型
                                                                                       and tzcell.isdo='{1}'--业务类型
                                                                                       --and tzcarr.carrier_type='{3}'--业务类型
                                                                                       and carr.bustype='{3}'--业务类型
                                                                                       and carr.vendor='{2}'--厂家
                                                                                       and carr.related_cell=sector.ne_sys_id--基础数据carr-cell
                                                                                       and sector.related_bts = bts.ne_sys_id--基础数据cell-bts
                                                                                       and bts.Related_Bsc = bsc.ne_sys_id--基础数据bts-bsc
                                                                                       and bsc.ne_sys_id = msc.ne_bsc_id--基础数据bsc-msc
                                                                                       and carr.city_id=city.city_id
                                                                                       and carr.city_id = sector.city_id
                                                                                       and sector.city_id = bts.city_id
                                                                                       and sector.city_id = bsc.city_id
                                                                                       and sector.city_id = msc.city_id
                                                                                       --and carr.ne_sys_id = para.ne_sys_id(+)
                                                                                       --and para.nei_ne_sys_id = neicarr.ne_sys_id
                                                                                       and neicarr.related_cell=neisector.ne_sys_id
                                                                                       and neisector.bsc_id = neitzcell.bsc_id
                                                                                       and neisector.local_cell_id = neitzcell.local_cell_id
                                                                                       and neisector.sector_id = neitzcell.sector_id --关联台账
                                                                                       --and neitzcell.bsc_id=neitzcarr.bsc_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       --and neitzcell.local_cell_id=neitzcarr.local_cell_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       --and neitzcell.sector_id=neitzcarr.sector_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       and neisector.related_bts = neibts.ne_sys_id
                                                                                       and neibts.related_bsc = neibsc.ne_sys_id
                                                                                       and neibsc.ne_sys_id = neimsc.ne_bsc_id
                                                                                       and neicarr.city_id=city.city_id
                                                                                       and neicarr.city_id = neisector.city_id
                                                                                       and neisector.city_id = neibts.city_id
                                                                                       and neisector.city_id = neibsc.city_id
                                                                                       and neisector.city_id = neimsc.city_id
                                                                                       and neiadm.county_id(+) = neisector.adm_area
                                                                                       --and para_sort.ne_sys_id=para.ne_sys_id
                                                                                       and substr(DFNBRCH.omcid,length(DFNBRCH.omcid))=neicarr.bsc_id --bsc_id
                                                                                       and SUBSTR(DFNBRCH.NBRCDMACH,1,INSTR(DFNBRCH.NBRCDMACH,'-',1,1)-1)=neicarr.bts_id--bts_id
                                                                                       and SUBSTR(DFNBRCH.NBRCDMACH,INSTR(DFNBRCH.NBRCDMACH,'-',1,1) + 1,INSTR(DFNBRCH.NBRCDMACH,'-',1,2)-(INSTR(DFNBRCH.NBRCDMACH,'-',1,1) + 1))=neicarr.local_cell_id--local_cell_id
                                                                                       and SUBSTR(DFNBRCH.NBRCDMACH,INSTR(DFNBRCH.NBRCDMACH,'-',1,2) + 1,INSTR(DFNBRCH.NBRCDMACH,'-',1,3)-(INSTR(DFNBRCH.NBRCDMACH,'-',1,2) + 1))=neicarr.sector_id--sector_id
                                                                                       and SUBSTR(DFNBRCH.NBRCDMACH,INSTR(DFNBRCH.NBRCDMACH,'-',1,3) + 1,INSTR(DFNBRCH.NBRCDMACH,'-',1,4)-(INSTR(DFNBRCH.NBRCDMACH,'-',1,3) + 1))=neicarr.carrier_id--carrier_id
                                                                                       --and substr(DFNBRCH_DFNBRPARA.omcid,length(DFNBRCH_DFNBRPARA.omcid))=neicarr.bsc_id --bsc_id
                                                                                       --and SUBSTR(DFNBRCH_DFNBRPARA.NBRCDMACH,1,INSTR(DFNBRCH_DFNBRPARA.NBRCDMACH,'-',1,1)-1)=neicarr.bts_id--bts_id
                                                                                       --and SUBSTR(DFNBRCH_DFNBRPARA.NBRCDMACH,INSTR(DFNBRCH_DFNBRPARA.NBRCDMACH,'-',1,1) + 1,INSTR(DFNBRCH_DFNBRPARA.NBRCDMACH,'-',1,2)-(INSTR(DFNBRCH_DFNBRPARA.NBRCDMACH,'-',1,1) + 1))=neicarr.local_cell_id--local_cell_id
                                                                                       --and SUBSTR(DFNBRCH_DFNBRPARA.NBRCDMACH,INSTR(DFNBRCH_DFNBRPARA.NBRCDMACH,'-',1,2) + 1,INSTR(DFNBRCH_DFNBRPARA.NBRCDMACH,'-',1,3)-(INSTR(DFNBRCH_DFNBRPARA.NBRCDMACH,'-',1,2) + 1))=neicarr.sector_id--sector_id
                                                                                       --and SUBSTR(DFNBRCH_DFNBRPARA.NBRCDMACH,INSTR(DFNBRCH_DFNBRPARA.NBRCDMACH,'-',1,3) + 1,INSTR(DFNBRCH_DFNBRPARA.NBRCDMACH,'-',1,4)-(INSTR(DFNBRCH_DFNBRPARA.NBRCDMACH,'-',1,3) + 1))=neicarr.carrier_id--carrier_id
                                                                                       and substr(DFNBRCH_ODODFNBRPARA.omcid,length(DFNBRCH_ODODFNBRPARA.omcid))=neicarr.bsc_id --bsc_id
                                                                                       and SUBSTR(DFNBRCH_ODODFNBRPARA.NBRCDMACH,1,INSTR(DFNBRCH_ODODFNBRPARA.NBRCDMACH,'-',1,1)-1)=neicarr.bts_id--bts_id
                                                                                       and SUBSTR(DFNBRCH_ODODFNBRPARA.NBRCDMACH,INSTR(DFNBRCH_ODODFNBRPARA.NBRCDMACH,'-',1,1) + 1,INSTR(DFNBRCH_ODODFNBRPARA.NBRCDMACH,'-',1,2)-(INSTR(DFNBRCH_ODODFNBRPARA.NBRCDMACH,'-',1,1) + 1))=neicarr.local_cell_id--local_cell_id
                                                                                       and SUBSTR(DFNBRCH_ODODFNBRPARA.NBRCDMACH,INSTR(DFNBRCH_ODODFNBRPARA.NBRCDMACH,'-',1,2) + 1,INSTR(DFNBRCH_ODODFNBRPARA.NBRCDMACH,'-',1,3)-(INSTR(DFNBRCH_ODODFNBRPARA.NBRCDMACH,'-',1,2) + 1))=neicarr.sector_id--sector_id
                                                                                       and SUBSTR(DFNBRCH_ODODFNBRPARA.NBRCDMACH,INSTR(DFNBRCH_ODODFNBRPARA.NBRCDMACH,'-',1,3) + 1,INSTR(DFNBRCH_ODODFNBRPARA.NBRCDMACH,'-',1,4)-(INSTR(DFNBRCH_ODODFNBRPARA.NBRCDMACH,'-',1,3) + 1))=neicarr.carrier_id--carrier_id
                                                                                       and DFNBRCH.CTYP='EVDO'
                                                                                       and DFNBRCH.stamptime=trunc(sysdate-2)
                                                                                       --and DFNBRCH_DFNBRPARA.stamptime=trunc(sysdate-2)
                                                                                       and DFNBRCH_ODODFNBRPARA.stamptime=trunc(sysdate-2)",
                                                                                        string.Format(fieldName, updateTime.ToShortDateString(), proChName), biztype, vendor, bizType); 
                        }
                    }
                    return DBAcess.Instance().GetDataTable(sql);
                }
                #endregion

                #region 中兴
                else if(vendor=="ZY0804")
                {
                    if (level == "CELL")//中兴扇区级
                    {
                        string fieldName = lstFormula.Cast<object>().Aggregate(string.Empty,
                                                                       (current, t) =>
                                                                       string.IsNullOrEmpty(current)
                                                                           ? t.ToString()
                                                                           : string.Format("{0},{1}", current, t));
                        string sql = string.Empty;
                        if (bizType.ToUpper() == "1X")//中兴扇区级1x
                        {
                            sql = string.Format(@"select {0} from ne_cell_c        sector,
                                                                                           ne_bts_c         bts,
                                                                                           ne_bsc_c         bsc,
                                                                                           cfg_bsc_map_city msc,
                                                                                           cfg_city         city,
                                                                                           ne_taizhang_cell tzcell,
                                                                                           --para_adj         para,
                                                                                           ne_cell_c        neisector,
                                                                                           ne_bts_c         neibts,
                                                                                           ne_bsc_c         neibsc,
                                                                                           cfg_bsc_map_city neimsc,
                                                                                           cfg_city         neicity,
                                                                                           cfg_county       neiadm,
                                                                                           ne_taizhang_cell neitzcell,
                                                                                           Clt_Cm_r_3g_s_Linkcell_Zte linkcell
                                                                                           --(select p.ne_cell_id,ROW_NUMBER() OVER(PARTITION BY p.ne_cell_id ORDER BY p.nbrseq) - 1 as sortnum
                                                                                               --from para_adj p, ne_cell_c c
                                                                                              --where p.ne_cell_id = c.ne_sys_id
                                                                                                --and p.vendor = '{2}') para_sort
                                                                                 where sector.bsc_id = tzcell.bsc_id
                                                                                       and sector.bts_id = tzcell.bts_id
                                                                                       and sector.sector_id = tzcell.sector_id --关联台账
                                                                                       and tzcell.border_type in ('省际边界', '同为省内省际边界')
                                                                                       and tzcell.isdo='{1}'
                                                                                       and sector.vendor='{2}'
                                                                                       and sector.related_bts = bts.ne_sys_id
                                                                                       and bts.Related_Bsc = bsc.ne_sys_id
                                                                                       and bsc.ne_sys_id = msc.ne_bsc_id
                                                                                       and sector.city_id = city.city_id
                                                                                       and sector.city_id = bts.city_id
                                                                                       and sector.city_id = bsc.city_id
                                                                                       and sector.city_id = msc.city_id
                                                                                       --and sector.ne_sys_id = para.ne_cell_id(+)
                                                                                       --and para.nei_ne_cell_id = neisector.ne_sys_id
                                                                                       and neisector.bsc_id = neitzcell.bsc_id
                                                                                       and neisector.bts_id = neitzcell.bts_id
                                                                                       and neisector.sector_id = neitzcell.sector_id --关联台账
                                                                                       and neisector.related_bts = neibts.ne_sys_id
                                                                                       and neibts.related_bsc = neibsc.ne_sys_id
                                                                                       and neibsc.ne_sys_id = neimsc.ne_bsc_id
                                                                                       and neisector.city_id = neicity.city_id
                                                                                       and neisector.city_id = neibts.city_id
                                                                                       and neisector.city_id = neibsc.city_id
                                                                                       and neisector.city_id = neimsc.city_id
                                                                                       and neiadm.county_id(+) = neisector.adm_area
                                                                                       and substr(linkcell.omcid,length(linkcell.omcid))=neisector.bsc_id
                                                                                       and linkcell.system=neisector.bts_id
                                                                                       and linkcell.cellid=neisector.sector_id
                                                                                       --and para_sort.ne_cell_id=para.ne_cell_id
                                                                                       and linkcell.stamptime=trunc(sysdate-2)",
                                                                                       string.Format(fieldName, updateTime.ToShortDateString(), proChName), biztype, vendor);
                        }
                        else//中兴扇区级do
                        {
//                            sql = string.Format(@"select distinct {0} from ne_cell_c        sector,
//                                                                                           ne_bts_c         bts,
//                                                                                           ne_bsc_c         bsc,
//                                                                                           cfg_bsc_map_city msc,
//                                                                                           cfg_city         city,
//                                                                                           ne_taizhang_cell tzcell,
//                                                                                           para_adj         para,
//                                                                                           ne_cell_c        neisector,
//                                                                                           ne_bts_c         neibts,
//                                                                                           ne_bsc_c         neibsc,
//                                                                                           cfg_bsc_map_city neimsc,
//                                                                                           cfg_city         neicity,
//                                                                                           cfg_county       neiadm,
//                                                                                           ne_taizhang_cell neitzcell,
//                                                                                           (select p.ne_cell_id,ROW_NUMBER() OVER(PARTITION BY p.ne_cell_id ORDER BY p.nbrseq) - 1 as sortnum
//                                                                                               from para_adj p, ne_cell_c c
//                                                                                              where p.ne_cell_id = c.ne_sys_id
//                                                                                                and p.vendor = '{2}') para_sort
//                                                                                 where sector.bsc_id = tzcell.bsc_id
//                                                                                       and sector.bts_id = tzcell.bts_id
//                                                                                       and sector.sector_id = tzcell.sector_id --关联台账
//                                                                                       and tzcell.border_type in ('省际边界', '同为省内省际边界')
//                                                                                       and tzcell.isdo='{1}'
//                                                                                       and sector.vendor='{2}'
//                                                                                       and sector.related_bts = bts.ne_sys_id
//                                                                                       and bts.Related_Bsc = bsc.ne_sys_id
//                                                                                       and bsc.ne_sys_id = msc.ne_bsc_id
//                                                                                       and sector.city_id = city.city_id
//                                                                                       and sector.city_id = bts.city_id
//                                                                                       and sector.city_id = bsc.city_id
//                                                                                       and sector.city_id = msc.city_id
//                                                                                       and sector.ne_sys_id = para.ne_cell_id(+)
//                                                                                       and para.nei_ne_cell_id = neisector.ne_sys_id
//                                                                                       and neisector.bsc_id = neitzcell.bsc_id
//                                                                                       and neisector.bts_id = neitzcell.bts_id
//                                                                                       and neisector.sector_id = neitzcell.sector_id --关联台账
//                                                                                       and neisector.related_bts = neibts.ne_sys_id
//                                                                                       and neibts.related_bsc = neibsc.ne_sys_id
//                                                                                       and neibsc.ne_sys_id = neimsc.ne_bsc_id
//                                                                                       and neisector.city_id = neicity.city_id
//                                                                                       and neisector.city_id = neibts.city_id
//                                                                                       and neisector.city_id = neibsc.city_id
//                                                                                       and neisector.city_id = neimsc.city_id
//                                                                                       and neiadm.county_id(+) = neisector.adm_area
//                                                                                       and para_sort.ne_cell_id=para.ne_cell_id",
//                                                                                       string.Format(fieldName, updateTime.ToShortDateString(), proChName), biztype, vendor);
                        }
                        return DBAcess.Instance().GetDataTable(sql);
                    }
                    else//中兴载频级
                    {
                        string fieldName = lstFormula.Cast<object>().Aggregate(string.Empty,
                                                                       (current, t) =>
                                                                       string.IsNullOrEmpty(current)
                                                                           ? t.ToString()
                                                                           : string.Format("{0},{1}", current, t));
                        string sql = string.Empty;
                        if (bizType.ToUpper() == "1X")//中兴载频级1x
                        {
                            sql = string.Format(@"select {0} from ne_carrier_c     carr,
                                                                                           ne_cell_c        sector,
                                                                                           ne_bts_c         bts,
                                                                                           ne_bsc_c         bsc,
                                                                                           cfg_bsc_map_city msc,
                                                                                           cfg_city         city,
                                                                                           ne_taizhang_cell tzcell,
                                                                                           --ne_taizhang_carrier tzcarr,
                                                                                           --para_adj         para,
                                                                                           ne_carrier_c     neicarr,
                                                                                           ne_cell_c        neisector,
                                                                                           ne_bts_c         neibts,
                                                                                           ne_bsc_c         neibsc,
                                                                                           cfg_bsc_map_city neimsc,
                                                                                           cfg_city         neicity,
                                                                                           cfg_county       neiadm,
                                                                                           ne_taizhang_cell neitzcell,
                                                                                           --ne_taizhang_carrier neitzcarr,
                                                                                           Clt_Cm_r_3g_t_Nglistinfo_Zte zte
                                                                                           --(select p.ne_sys_id,ROW_NUMBER() OVER(PARTITION BY p.ne_sys_id ORDER BY p.nbrseq) - 1 as sortnum
                                                                                               --from para_adj p, ne_carrier_c c
                                                                                              --where p.ne_sys_id = c.ne_sys_id
                                                                                                --and p.vendor = '{2}') para_sort
                                                                                 where sector.bsc_id = tzcell.bsc_id
                                                                                       and sector.bts_id = tzcell.bts_id
                                                                                       and sector.sector_id = tzcell.sector_id --关联台账
                                                                                       --and tzcell.bsc_id=tzcarr.bsc_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       --and tzcell.bts_id=tzcarr.bts_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       --and tzcell.sector_id=tzcarr.sector_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       and tzcell.border_type in ('省际边界', '同为省内省际边界')--边界类型
                                                                                       and tzcell.isdo='{1}'--业务类型
                                                                                       --and tzcarr.carrier_type='{3}'--业务类型
                                                                                       and carr.bustype='{3}'--业务类型
                                                                                       and carr.vendor='{2}'--厂家
                                                                                       and carr.related_cell=sector.ne_sys_id--基础数据carr-cell
                                                                                       and sector.related_bts = bts.ne_sys_id--基础数据cell-bts
                                                                                       and bts.Related_Bsc = bsc.ne_sys_id--基础数据bts-bsc
                                                                                       and bsc.ne_sys_id = msc.ne_bsc_id--基础数据bsc-msc
                                                                                       and carr.city_id=city.city_id
                                                                                       and carr.city_id = sector.city_id
                                                                                       and sector.city_id = bts.city_id
                                                                                       and sector.city_id = bsc.city_id
                                                                                       and sector.city_id = msc.city_id
                                                                                       --and carr.ne_sys_id = para.ne_sys_id(+)
                                                                                       --and para.nei_ne_sys_id = neicarr.ne_sys_id
                                                                                       and neicarr.related_cell=neisector.ne_sys_id
                                                                                       and neisector.bsc_id = neitzcell.bsc_id
                                                                                       and neisector.bts_id = neitzcell.bts_id
                                                                                       and neisector.sector_id = neitzcell.sector_id --关联台账
                                                                                       --and neitzcell.bsc_id=neitzcarr.bsc_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       --and neitzcell.bts_id=neitzcarr.bts_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       --and neitzcell.sector_id=neitzcarr.sector_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       and neisector.related_bts = neibts.ne_sys_id
                                                                                       and neibts.related_bsc = neibsc.ne_sys_id
                                                                                       and neibsc.ne_sys_id = neimsc.ne_bsc_id
                                                                                       and neicarr.city_id=city.city_id
                                                                                       and neicarr.city_id = neisector.city_id
                                                                                       and neisector.city_id = neibts.city_id
                                                                                       and neisector.city_id = neibsc.city_id
                                                                                       and neisector.city_id = neimsc.city_id
                                                                                       and neiadm.county_id(+) = neisector.adm_area
                                                                                       and substr(zte.omcid,length(zte.omcid))=neicarr.bsc_id
                                                                                       and zte.system=neicarr.bts_id
                                                                                       and zte.cellid=neicarr.sector_id
                                                                                       and zte.carrierid=neicarr.carr_seq                          
                                                                                       --and para_sort.ne_sys_id=para.ne_sys_id
                                                                                       and zte.stamptime=trunc(sysdate-2)",
                                                                                        string.Format(fieldName, updateTime.ToShortDateString(), proChName), biztype, vendor, bizType);
                        }
                        else//中兴载频级do
                        {
                            sql = string.Format(@"select {0} from ne_carrier_c     carr,
                                                                                           ne_cell_c        sector,
                                                                                           ne_bts_c         bts,
                                                                                           ne_bsc_c         bsc,
                                                                                           cfg_bsc_map_city msc,
                                                                                           cfg_city         city,
                                                                                           ne_taizhang_cell tzcell,
                                                                                           --ne_taizhang_carrier tzcarr,
                                                                                           --para_adj         para,
                                                                                           ne_carrier_c     neicarr,
                                                                                           ne_cell_c        neisector,
                                                                                           ne_bts_c         neibts,
                                                                                           ne_bsc_c         neibsc,
                                                                                           cfg_bsc_map_city neimsc,
                                                                                           cfg_city         neicity,
                                                                                           cfg_county       neiadm,
                                                                                           ne_taizhang_cell neitzcell,
                                                                                           --ne_taizhang_carrier neitzcarr,
                                                                                           CLT_CM_R_NB_CARRIER_INFO_ZTE zte
                                                                                           --(select p.ne_sys_id,ROW_NUMBER() OVER(PARTITION BY p.ne_sys_id ORDER BY p.nbrseq) - 1 as sortnum
                                                                                               --from para_adj p, ne_carrier_c c
                                                                                              --where p.ne_sys_id = c.ne_sys_id
                                                                                                --and p.vendor = '{2}') para_sort
                                                                                 where sector.bsc_id = tzcell.bsc_id
                                                                                       and sector.bts_id = tzcell.bts_id
                                                                                       and sector.sector_id = tzcell.sector_id --关联台账
                                                                                       --and tzcell.bsc_id=tzcarr.bsc_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       --and tzcell.bts_id=tzcarr.bts_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       --and tzcell.sector_id=tzcarr.sector_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       and tzcell.border_type in ('省际边界', '同为省内省际边界')--边界类型
                                                                                       and tzcell.isdo='{1}'--业务类型
                                                                                       --and tzcarr.carrier_type='{3}'--业务类型
                                                                                       and carr.bustype='{3}'--业务类型
                                                                                       and carr.vendor='{2}'--厂家
                                                                                       and carr.related_cell=sector.ne_sys_id--基础数据carr-cell
                                                                                       and sector.related_bts = bts.ne_sys_id--基础数据cell-bts
                                                                                       and bts.Related_Bsc = bsc.ne_sys_id--基础数据bts-bsc
                                                                                       and bsc.ne_sys_id = msc.ne_bsc_id--基础数据bsc-msc
                                                                                       and carr.city_id=city.city_id
                                                                                       and carr.city_id = sector.city_id
                                                                                       and sector.city_id = bts.city_id
                                                                                       and sector.city_id = bsc.city_id
                                                                                       and sector.city_id = msc.city_id
                                                                                       --and carr.ne_sys_id = para.ne_sys_id(+)
                                                                                       --and para.nei_ne_sys_id = neicarr.ne_sys_id
                                                                                       and neicarr.related_cell=neisector.ne_sys_id
                                                                                       and neisector.bsc_id = neitzcell.bsc_id
                                                                                       and neisector.bts_id = neitzcell.bts_id
                                                                                       and neisector.sector_id = neitzcell.sector_id --关联台账
                                                                                       --and neitzcell.bsc_id=neitzcarr.bsc_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       --and neitzcell.bts_id=neitzcarr.bts_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       --and neitzcell.sector_id=neitzcarr.sector_id--台账ne_taizhang_carr与ne_taizhang_cell关联
                                                                                       and neisector.related_bts = neibts.ne_sys_id
                                                                                       and neibts.related_bsc = neibsc.ne_sys_id
                                                                                       and neibsc.ne_sys_id = neimsc.ne_bsc_id
                                                                                       and neicarr.city_id=city.city_id
                                                                                       and neicarr.city_id = neisector.city_id
                                                                                       and neisector.city_id = neibts.city_id
                                                                                       and neisector.city_id = neibsc.city_id
                                                                                       and neisector.city_id = neimsc.city_id
                                                                                       and neiadm.county_id(+) = neisector.adm_area
                                                                                       and substr(zte.omcid,length(zte.omcid))=neicarr.bsc_id
                                                                                       and zte.system=neicarr.bts_id
                                                                                       and zte.cellid=neicarr.sector_id
                                                                                       and zte.carrierid=neicarr.carr_seq
                                                                                       --and para_sort.ne_sys_id=para.ne_sys_id
                                                                                       and zte.stamptime=trunc(sysdate-2)",
                                                                                        string.Format(fieldName, updateTime.ToShortDateString(), proChName), biztype, vendor, bizType);
                        }
                        return DBAcess.Instance().GetDataTable(sql);
                    }
                }
                #endregion

                #region 朗讯(载频级无数据)
                else
                {
                    if (level == "CELL")//朗讯扇区级
                    {
                        string fieldName = lstFormula.Cast<object>().Aggregate(string.Empty,
                                                                       (current, t) =>
                                                                       string.IsNullOrEmpty(current)
                                                                           ? t.ToString()
                                                                           : string.Format("{0},{1}", current, t));
                        string sql = string.Empty;
                        if (bizType.ToUpper() == "1X")//朗讯1X扇区参数 暂时无数据需汇总
                        {
                            sql = string.Format(@"select {0} from ne_cell_c        sector,
                                                                                           ne_bts_c         bts,
                                                                                           ne_bsc_c         bsc,
                                                                                           cfg_bsc_map_city msc,
                                                                                           cfg_city         city,
                                                                                           ne_taizhang_cell tzcell,
                                                                                           --para_adj_luc     para,
                                                                                           ne_cell_c        neisector,
                                                                                           ne_bts_c         neibts,
                                                                                           ne_bsc_c         neibsc,
                                                                                           cfg_bsc_map_city neimsc,
                                                                                           cfg_city         neicity,
                                                                                           cfg_county       neiadm,
                                                                                           ne_taizhang_cell neitzcell,    
                                                                                           (select OMCID,
                                                                                                   NEI_BTS,
                                                                                                   NEI_SECTOR,
                                                                                                   NEI_LIST1_NCS_C1 as ncs_c,
                                                                                                   NEI_LIST1_NGHBRANTF1 as nghbrantf,
                                                                                                   NEI_PN1 as pilot_pn,
                                                                                                   NEI1_ALT1_PGN_C1 as pgn_c,
                                                                                                   NEI_LIST1_NGHB_CONF1 as nghb_conf,
                                                                                                   NEI1_ALT1_HDHANDOFF1 as hdhandoff,
                                                                                                   NEI1_ALT1_DCS_C1 as dcs_c,
                                                                                                   NEI1_ALT1_ECP_C1 as ecp_c,
                                                                                                   NEI1_ALT1_SID_C1 as sid_c,
                                                                                                   1 as sn from clt_cm_fci_luc where stamptime=trunc(sysdate-2)
                                                                                                   union all 
                                                                                            select OMCID,
                                                                                                   NEI_BTS,
                                                                                                   NEI_SECTOR,
                                                                                                   NEI_LIST1_NCS_C2 as ncs_c,
                                                                                                   NEI_LIST1_NGHBRANTF2 as nghbrantf,
                                                                                                   NEI_PN2 as pilot_pn,
                                                                                                   NEI1_ALT1_PGN_C2 as pgn_c,
                                                                                                   NEI_LIST1_NGHB_CONF2 as nghb_conf,
                                                                                                   NEI1_ALT1_HDHANDOFF2 as hdhandoff,
                                                                                                   NEI1_ALT1_DCS_C2 as dcs_c,
                                                                                                   NEI1_ALT1_ECP_C2 as ecp_c,
                                                                                                   NEI1_ALT1_SID_C2 as sid_c,
                                                                                                   2 as sn from clt_cm_fci_luc where stamptime=trunc(sysdate-2) 
                                                                                                   union all 
                                                                                            select OMCID,
                                                                                                   NEI_BTS,
                                                                                                   NEI_SECTOR,
                                                                                                   NEI_LIST1_NCS_C3 as ncs_c,
                                                                                                   NEI_LIST1_NGHBRANTF3 as nghbrantf,
                                                                                                   NEI_PN3 as pilot_pn,
                                                                                                   NEI1_ALT1_PGN_C3 as pgn_c,
                                                                                                   NEI_LIST1_NGHB_CONF3 as nghb_conf,
                                                                                                   NEI1_ALT1_HDHANDOFF3 as hdhandoff,
                                                                                                   NEI1_ALT1_DCS_C3 as dcs_c,
                                                                                                   NEI1_ALT1_ECP_C3 as ecp_c,
                                                                                                   NEI1_ALT1_SID_C3 as sid_c,
                                                                                                   3 as sn from clt_cm_fci_luc where stamptime=trunc(sysdate-2) 
                                                                                                   union all 
                                                                                            select OMCID,
                                                                                                   NEI_BTS,
                                                                                                   NEI_SECTOR,
                                                                                                   NEI_LIST1_NCS_C4 as ncs_c,
                                                                                                   NEI_LIST1_NGHBRANTF4 as nghbrantf,
                                                                                                   NEI_PN4 as pilot_pn,
                                                                                                   NEI1_ALT1_PGN_C4 as pgn_c,
                                                                                                   NEI_LIST1_NGHB_CONF4 as nghb_conf,
                                                                                                   NEI1_ALT1_HDHANDOFF4 as hdhandoff,
                                                                                                   NEI1_ALT1_DCS_C4 as dcs_c,
                                                                                                   NEI1_ALT1_ECP_C4 as ecp_c,
                                                                                                   NEI1_ALT1_SID_C4 as sid_c,
                                                                                                   4 as sn from clt_cm_fci_luc where stamptime=trunc(sysdate-2) 
                                                                                                   union all 
                                                                                            select OMCID,
                                                                                                   NEI_BTS,
                                                                                                   NEI_SECTOR,
                                                                                                   NEI_LIST1_NCS_C5 as ncs_c,
                                                                                                   NEI_LIST1_NGHBRANTF5 as nghbrantf,
                                                                                                   NEI_PN5 as pilot_pn,
                                                                                                   NEI1_ALT1_PGN_C5 as pgn_c,
                                                                                                   NEI_LIST1_NGHB_CONF5 as nghb_conf,
                                                                                                   NEI1_ALT1_HDHANDOFF5 as hdhandoff,
                                                                                                   NEI1_ALT1_DCS_C5 as dcs_c,
                                                                                                   NEI1_ALT1_ECP_C5 as ecp_c,
                                                                                                   NEI1_ALT1_SID_C5 as sid_c,
                                                                                                   5 as sn from clt_cm_fci_luc where stamptime=trunc(sysdate-2)
                                                                                                   union all 
                                                                                            select OMCID,
                                                                                                   NEI_BTS,
                                                                                                   NEI_SECTOR,
                                                                                                   NEI_LIST1_NCS_C6 as ncs_c,
                                                                                                   NEI_LIST1_NGHBRANTF6 as nghbrantf,
                                                                                                   NEI_PN6 as pilot_pn,
                                                                                                   NEI1_ALT1_PGN_C6 as pgn_c,
                                                                                                   NEI_LIST1_NGHB_CONF6 as nghb_conf,
                                                                                                   NEI1_ALT1_HDHANDOFF6 as hdhandoff,
                                                                                                   NEI1_ALT1_DCS_C6 as dcs_c,
                                                                                                   NEI1_ALT1_ECP_C6 as ecp_c,
                                                                                                   NEI1_ALT1_SID_C6 as sid_c,
                                                                                                   6 as sn from clt_cm_fci_luc where stamptime=trunc(sysdate-2)
                                                                                                   union all 
                                                                                            select OMCID,
                                                                                                   NEI_BTS,
                                                                                                   NEI_SECTOR,
                                                                                                   NEI_LIST1_NCS_C7 as ncs_c,
                                                                                                   NEI_LIST1_NGHBRANTF7 as nghbrantf,
                                                                                                   NEI_PN7 as pilot_pn,
                                                                                                   NEI1_ALT1_PGN_C7 as pgn_c,
                                                                                                   NEI_LIST1_NGHB_CONF7 as nghb_conf,
                                                                                                   NEI1_ALT1_HDHANDOFF7 as hdhandoff,
                                                                                                   NEI1_ALT1_DCS_C7 as dcs_c,
                                                                                                   NEI1_ALT1_ECP_C7 as ecp_c,
                                                                                                   NEI1_ALT1_SID_C7 as sid_c,
                                                                                                   7 as sn from clt_cm_fci_luc where stamptime=trunc(sysdate-2)
                                                                                                   union all 
                                                                                            select OMCID,
                                                                                                   NEI_BTS,
                                                                                                   NEI_SECTOR,
                                                                                                   NEI_LIST1_NCS_C8 as ncs_c,
                                                                                                   NEI_LIST1_NGHBRANTF8 as nghbrantf,
                                                                                                   NEI_PN8 as pilot_pn,
                                                                                                   NEI1_ALT1_PGN_C8 as pgn_c,
                                                                                                   NEI_LIST1_NGHB_CONF8 as nghb_conf,
                                                                                                   NEI1_ALT1_HDHANDOFF8 as hdhandoff,
                                                                                                   NEI1_ALT1_DCS_C8 as dcs_c,
                                                                                                   NEI1_ALT1_ECP_C8 as ecp_c,
                                                                                                   NEI1_ALT1_SID_C8 as sid_c,
                                                                                                   8 as sn from clt_cm_fci_luc where stamptime=trunc(sysdate-2)
                                                                                                   union all 
                                                                                            select OMCID,
                                                                                                   NEI_BTS,
                                                                                                   NEI_SECTOR,
                                                                                                   NEI_LIST1_NCS_C9 as ncs_c,
                                                                                                   NEI_LIST1_NGHBRANTF9 as nghbrantf,
                                                                                                   NEI_PN9 as pilot_pn,
                                                                                                   NEI1_ALT1_PGN_C9 as pgn_c,
                                                                                                   NEI_LIST1_NGHB_CONF9 as nghb_conf,
                                                                                                   NEI1_ALT1_HDHANDOFF9 as hdhandoff,
                                                                                                   NEI1_ALT1_DCS_C9 as dcs_c,
                                                                                                   NEI1_ALT1_ECP_C9 as ecp_c,
                                                                                                   NEI1_ALT1_SID_C9 as sid_c,
                                                                                                   9 as sn from clt_cm_fci_luc where stamptime=trunc(sysdate-2)
                                                                                                   union all 
                                                                                            select OMCID,
                                                                                                   NEI_BTS,
                                                                                                   NEI_SECTOR,
                                                                                                   NEI_LIST1_NCS_C10 as ncs_c,
                                                                                                   NEI_LIST1_NGHBRANTF10 as nghbrantf,
                                                                                                   NEI_PN10 as pilot_pn,
                                                                                                   NEI1_ALT1_PGN_C10 as pgn_c,
                                                                                                   NEI_LIST1_NGHB_CONF10 as nghb_conf,
                                                                                                   NEI1_ALT1_HDHANDOFF10 as hdhandoff,
                                                                                                   NEI1_ALT1_DCS_C10 as dcs_c,
                                                                                                   NEI1_ALT1_ECP_C10 as ecp_c,
                                                                                                   NEI1_ALT1_SID_C10 as sid_c,
                                                                                                   10 as sn from clt_cm_fci_luc where stamptime=trunc(sysdate-2)
                                                                                                   union all 
                                                                                            select OMCID,
                                                                                                   NEI_BTS,
                                                                                                   NEI_SECTOR,
                                                                                                   NEI_LIST1_NCS_C11 as ncs_c,
                                                                                                   NEI_LIST1_NGHBRANTF11 as nghbrantf,
                                                                                                   NEI_PN11 as pilot_pn,
                                                                                                   NEI1_ALT1_PGN_C11 as pgn_c,
                                                                                                   NEI_LIST1_NGHB_CONF11 as nghb_conf,
                                                                                                   NEI1_ALT1_HDHANDOFF11 as hdhandoff,
                                                                                                   NEI1_ALT1_DCS_C11 as dcs_c,
                                                                                                   NEI1_ALT1_ECP_C11 as ecp_c,
                                                                                                   NEI1_ALT1_SID_C11 as sid_c,
                                                                                                   11 as sn from clt_cm_fci_luc where stamptime=trunc(sysdate-2)
                                                                                                   union all 
                                                                                            select OMCID,
                                                                                                   NEI_BTS,
                                                                                                   NEI_SECTOR,
                                                                                                   NEI_LIST1_NCS_C12 as ncs_c,
                                                                                                   NEI_LIST1_NGHBRANTF12 as nghbrantf,
                                                                                                   NEI_PN12 as pilot_pn,
                                                                                                   NEI1_ALT1_PGN_C12 as pgn_c,
                                                                                                   NEI_LIST1_NGHB_CONF12 as nghb_conf,
                                                                                                   NEI1_ALT1_HDHANDOFF12 as hdhandoff,
                                                                                                   NEI1_ALT1_DCS_C12 as dcs_c,
                                                                                                   NEI1_ALT1_ECP_C12 as ecp_c,
                                                                                                   NEI1_ALT1_SID_C12 as sid_c,
                                                                                                   12 as sn from clt_cm_fci_luc where stamptime=trunc(sysdate-2)
                                                                                                   union all 
                                                                                            select OMCID,
                                                                                                   NEI_BTS,
                                                                                                   NEI_SECTOR,
                                                                                                   NEI_LIST2_NCS_C1 as ncs_c,
                                                                                                   NEI_LIST2_NGHBRANTF1 as nghbrantf,
                                                                                                   NEI_PN13 as pilot_pn,
                                                                                                   NEI1_ALT2_PGN_C1 as pgn_c,
                                                                                                   NEI_LIST2_NGHB_CONF1 as nghb_conf,
                                                                                                   NEI1_ALT2_HDHANDOFF1 as hdhandoff,
                                                                                                   NEI1_ALT2_DCS_C1 as dcs_c,
                                                                                                   NEI1_ALT2_ECP_C1 as ecp_c,
                                                                                                   NEI1_ALT2_SID_C1 as sid_c,
                                                                                                   13 as sn from clt_cm_fci_luc where stamptime=trunc(sysdate-2)
                                                                                                   union all 
                                                                                            select OMCID,
                                                                                                   NEI_BTS,
                                                                                                   NEI_SECTOR,
                                                                                                   NEI_LIST2_NCS_C2 as ncs_c,
                                                                                                   NEI_LIST2_NGHBRANTF2 as nghbrantf,
                                                                                                   NEI_PN14 as pilot_pn,
                                                                                                   NEI1_ALT2_PGN_C2 as pgn_c,
                                                                                                   NEI_LIST2_NGHB_CONF2 as nghb_conf,
                                                                                                   NEI1_ALT2_HDHANDOFF2 as hdhandoff,
                                                                                                   NEI1_ALT2_DCS_C2 as dcs_c,
                                                                                                   NEI1_ALT2_ECP_C2 as ecp_c,
                                                                                                   NEI1_ALT2_SID_C2 as sid_c,
                                                                                                   14 as sn from clt_cm_fci_luc where stamptime=trunc(sysdate-2)
                                                                                                   union all 
                                                                                            select OMCID,
                                                                                                   NEI_BTS,
                                                                                                   NEI_SECTOR,
                                                                                                   NEI_LIST2_NCS_C3 as ncs_c,
                                                                                                   NEI_LIST2_NGHBRANTF3 as nghbrantf,
                                                                                                   NEI_PN15 as pilot_pn,
                                                                                                   NEI1_ALT2_PGN_C3 as pgn_c,
                                                                                                   NEI_LIST2_NGHB_CONF3 as nghb_conf,
                                                                                                   NEI1_ALT2_HDHANDOFF3 as hdhandoff,
                                                                                                   NEI1_ALT2_DCS_C3 as dcs_c,
                                                                                                   NEI1_ALT2_ECP_C3 as ecp_c,
                                                                                                   NEI1_ALT2_SID_C3 as sid_c,
                                                                                                   15 as sn from clt_cm_fci_luc where stamptime=trunc(sysdate-2)
                                                                                                   union all 
                                                                                            select OMCID,
                                                                                                   NEI_BTS,
                                                                                                   NEI_SECTOR,
                                                                                                   NEI_LIST2_NCS_C4 as ncs_c,
                                                                                                   NEI_LIST2_NGHBRANTF4 as nghbrantf,
                                                                                                   NEI_PN16 as pilot_pn,
                                                                                                   NEI1_ALT2_PGN_C4 as pgn_c,
                                                                                                   NEI_LIST2_NGHB_CONF4 as nghb_conf,
                                                                                                   NEI1_ALT2_HDHANDOFF4 as hdhandoff,
                                                                                                   NEI1_ALT2_DCS_C4 as dcs_c,
                                                                                                   NEI1_ALT2_ECP_C4 as ecp_c,
                                                                                                   NEI1_ALT2_SID_C4 as sid_c,
                                                                                                   16 as sn from clt_cm_fci_luc where stamptime=trunc(sysdate-2)
                                                                                                   union all 
                                                                                            select OMCID,
                                                                                                   NEI_BTS,
                                                                                                   NEI_SECTOR,
                                                                                                   NEI_LIST2_NCS_C5 as ncs_c,
                                                                                                   NEI_LIST2_NGHBRANTF5 as nghbrantf,
                                                                                                   NEI_PN17 as pilot_pn,
                                                                                                   NEI1_ALT2_PGN_C5 as pgn_c,
                                                                                                   NEI_LIST2_NGHB_CONF5 as nghb_conf,
                                                                                                   NEI1_ALT2_HDHANDOFF5 as hdhandoff,
                                                                                                   NEI1_ALT2_DCS_C5 as dcs_c,
                                                                                                   NEI1_ALT2_ECP_C5 as ecp_c,
                                                                                                   NEI1_ALT2_SID_C5 as sid_c,
                                                                                                   17 as sn from clt_cm_fci_luc where stamptime=trunc(sysdate-2)
                                                                                                   union all 
                                                                                            select OMCID,
                                                                                                   NEI_BTS,
                                                                                                   NEI_SECTOR,
                                                                                                   NEI_LIST2_NCS_C6 as ncs_c,
                                                                                                   NEI_LIST2_NGHBRANTF6 as nghbrantf,
                                                                                                   NEI_PN18 as pilot_pn,
                                                                                                   NEI1_ALT2_PGN_C6 as pgn_c,
                                                                                                   NEI_LIST2_NGHB_CONF6 as nghb_conf,
                                                                                                   NEI1_ALT2_HDHANDOFF6 as hdhandoff,
                                                                                                   NEI1_ALT2_DCS_C6 as dcs_c,
                                                                                                   NEI1_ALT2_ECP_C6 as ecp_c,
                                                                                                   NEI1_ALT2_SID_C6 as sid_c,
                                                                                                   18 as sn from clt_cm_fci_luc where stamptime=trunc(sysdate-2)
                                                                                                   union all 
                                                                                            select OMCID,
                                                                                                   NEI_BTS,
                                                                                                   NEI_SECTOR,
                                                                                                   NEI_LIST2_NCS_C7 as ncs_c,
                                                                                                   NEI_LIST2_NGHBRANTF7 as nghbrantf,
                                                                                                   NEI_PN19 as pilot_pn,
                                                                                                   NEI1_ALT2_PGN_C7 as pgn_c,
                                                                                                   NEI_LIST2_NGHB_CONF7 as nghb_conf,
                                                                                                   NEI1_ALT2_HDHANDOFF7 as hdhandoff,
                                                                                                   NEI1_ALT2_DCS_C7 as dcs_c,
                                                                                                   NEI1_ALT2_ECP_C7 as ecp_c,
                                                                                                   NEI1_ALT2_SID_C7 as sid_c,
                                                                                                   19 as sn from clt_cm_fci_luc where stamptime=trunc(sysdate-2)
                                                                                                   union all 
                                                                                            select OMCID,
                                                                                                   NEI_BTS,
                                                                                                   NEI_SECTOR,
                                                                                                   NEI_LIST2_NCS_C8 as ncs_c,
                                                                                                   NEI_LIST2_NGHBRANTF8 as nghbrantf,
                                                                                                   NEI_PN20 as pilot_pn,
                                                                                                   NEI1_ALT2_PGN_C8 as pgn_c,
                                                                                                   NEI_LIST2_NGHB_CONF8 as nghb_conf,
                                                                                                   NEI1_ALT2_HDHANDOFF8 as hdhandoff,
                                                                                                   NEI1_ALT2_DCS_C8 as dcs_c,
                                                                                                   NEI1_ALT2_ECP_C8 as ecp_c,
                                                                                                   NEI1_ALT2_SID_C8 as sid_c,
                                                                                                   20 as sn from clt_cm_fci_luc where stamptime=trunc(sysdate-2)) luc
                                                                                           --(select p.ne_cell_id,ROW_NUMBER() OVER(PARTITION BY p.ne_cell_id ORDER BY p.nbrseq) - 1 as sortnum
                                                                                               --from para_adj_luc p, ne_cell_c c
                                                                                              --where p.ne_cell_id = c.ne_sys_id
                                                                                                --and p.vendor = '{2}') para_sort
                                                                                 where sector.bsc_id = tzcell.bsc_id
                                                                                   and sector.bts_id = tzcell.bts_id
                                                                                   and sector.sector_id = tzcell.sector_id --关联台账
                                                                                   and tzcell.border_type in ('省际边界', '同为省内省际边界')
                                                                                   and tzcell.isdo='{1}'
                                                                                   and sector.vendor='{2}'
                                                                                   and sector.related_bts = bts.ne_sys_id
                                                                                   and bts.Related_Bsc = bsc.ne_sys_id
                                                                                   and bsc.ne_sys_id = msc.ne_bsc_id
                                                                                   and sector.city_id = city.city_id
                                                                                   and sector.city_id = bts.city_id
                                                                                   and sector.city_id = bsc.city_id
                                                                                   and sector.city_id = msc.city_id
                                                                                   --and sector.ne_sys_id = para.ne_cell_id(+)
                                                                                   --and para.nei_ne_cell_id = neisector.ne_sys_id
                                                                                   and neisector.bsc_id = neitzcell.bsc_id
                                                                                   and neisector.bts_id = neitzcell.bts_id
                                                                                   and neisector.sector_id = neitzcell.sector_id --关联台账
                                                                                   and neisector.related_bts = neibts.ne_sys_id
                                                                                   and neibts.related_bsc = neibsc.ne_sys_id
                                                                                   and neibsc.ne_sys_id = neimsc.ne_bsc_id
                                                                                   and neisector.city_id = neicity.city_id
                                                                                   and neisector.city_id = neibts.city_id
                                                                                   and neisector.city_id = neibsc.city_id
                                                                                   and neisector.city_id = neimsc.city_id
                                                                                   and neiadm.county_id(+) = neisector.adm_area    
                                                                                   and substr(luc.omcid,length(luc.omcid))=neisector.bsc_id
                                                                                   and luc.nei_bts=neisector.bts_id
                                                                                   and luc.nei_sector=neisector.sector_id                                                                   
                                                                                   --and para_sort.ne_cell_id=para.ne_cell_id",
                                                                                        string.Format(fieldName, updateTime.ToShortDateString(), proChName), biztype, vendor);
                        }
                        else
                        {
                            sql = string.Format(@"select {0} from ne_cell_c        sector,
                                                                                           ne_bts_c         bts,
                                                                                           ne_bsc_c         bsc,
                                                                                           cfg_bsc_map_city msc,
                                                                                           cfg_city         city,
                                                                                           ne_taizhang_cell tzcell,
                                                                                           --para_adj_luc     para,
                                                                                           ne_cell_c        neisector,
                                                                                           ne_bts_c         neibts,
                                                                                           ne_bsc_c         neibsc,
                                                                                           cfg_bsc_map_city neimsc,
                                                                                           cfg_city         neicity,
                                                                                           cfg_county       neiadm,
                                                                                           ne_taizhang_cell neitzcell,
                                                                                           CLT_CM_LUC_DO_NEIGHBORSECTOR luc
                                                                                           --(select p.ne_cell_id,ROW_NUMBER() OVER(PARTITION BY p.ne_cell_id ORDER BY p.nbrseq) - 1 as sortnum
                                                                                               --from para_adj_luc p, ne_cell_c c
                                                                                              --where p.ne_cell_id = c.ne_sys_id
                                                                                                --and p.vendor = '{2}') para_sort
                                                                                 where sector.bsc_id = tzcell.bsc_id
                                                                                   and sector.bts_id = tzcell.bts_id
                                                                                   and sector.sector_id = tzcell.sector_id --关联台账
                                                                                   and tzcell.border_type in ('省际边界', '同为省内省际边界')
                                                                                   and tzcell.isdo='{1}'
                                                                                   and sector.vendor='{2}'
                                                                                   and sector.related_bts = bts.ne_sys_id
                                                                                   and bts.Related_Bsc = bsc.ne_sys_id
                                                                                   and bsc.ne_sys_id = msc.ne_bsc_id
                                                                                   and sector.city_id = city.city_id
                                                                                   and sector.city_id = bts.city_id
                                                                                   and sector.city_id = bsc.city_id
                                                                                   and sector.city_id = msc.city_id
                                                                                   --and sector.ne_sys_id = para.ne_cell_id(+)
                                                                                   --and para.nei_ne_cell_id = neisector.ne_sys_id
                                                                                   and neisector.bsc_id = neitzcell.bsc_id
                                                                                   and neisector.bts_id = neitzcell.bts_id
                                                                                   and neisector.sector_id = neitzcell.sector_id --关联台账
                                                                                   and neisector.related_bts = neibts.ne_sys_id
                                                                                   and neibts.related_bsc = neibsc.ne_sys_id
                                                                                   and neibsc.ne_sys_id = neimsc.ne_bsc_id
                                                                                   and neisector.city_id = neicity.city_id
                                                                                   and neisector.city_id = neibts.city_id
                                                                                   and neisector.city_id = neibsc.city_id
                                                                                   and neisector.city_id = neimsc.city_id
                                                                                   and neiadm.county_id(+) = neisector.adm_area
                                                                                   and substr(luc.omcid,length(luc.omcid))=neisector.bsc_id
                                                                                   and luc.cellsiteid=neisector.bts_id
                                                                                   and luc.sectorid=neisector.sector_id
                                                                                   --and para_sort.ne_cell_id=para.ne_cell_id
                                                                                   and luc.stamptime=trunc(sysdate-2)",
                                                                                        string.Format(fieldName, updateTime.ToShortDateString(), proChName), biztype, vendor);
                        }
                        return DBAcess.Instance().GetDataTable(sql);
                    }
                    else//朗讯载频级(朗讯载频级无数据)
                    {
                        return null;                       
                    }
                }
                #endregion
            }
            catch
            {
                throw new Exception("ORAERROR");
            }
        }

        /// <summary>
        /// 获取测评信息CITYHP数据
        /// </summary>
        /// <param name="lstFormula">公式</param>
        /// <param name="proChName">省中文名</param>
        /// <param name="updateTime">上报数据时间</param>
        /// <returns></returns>
        public DataTable GetTestCityHPData(ArrayList lstFormula, string proChName, DateTime updateTime)
        {
            try
            {
                string fieldName = lstFormula.Cast<object>().Aggregate(string.Empty,
                                                                       (current, t) =>
                                                                       string.IsNullOrEmpty(current)
                                                                           ? t.ToString()
                                                                           : string.Format("{0},{1}", current, t));                
                string sql = string.Format(string.Format(@"select {0} from ne_uway_hotinfor hot",fieldName),updateTime.ToShortDateString(),proChName);
                return DBAcess.Instance().GetDataTable(sql);
            }
            catch
            {
                throw new Exception("ORAERROR");
            }
        }

        /// <summary>
        /// 获取测评信息CITYROAD数据
        /// </summary>
        /// <param name="lstFormula">公式</param>
        /// <param name="proChName">省中文名</param>
        /// <param name="updateTime">上报数据时间</param>
        /// <returns></returns>
        public DataTable GetTestCityRoadData(ArrayList lstFormula, string proChName, DateTime updateTime)
        {
            try
            {
                string fieldName = lstFormula.Cast<object>().Aggregate(string.Empty,
                                                                       (current, t) =>
                                                                       string.IsNullOrEmpty(current)
                                                                           ? t.ToString()
                                                                           : string.Format("{0},{1}", current, t));
                string sql = string.Format(string.Format(@"select {0} from ne_uway_roadinfor road", fieldName), updateTime.ToShortDateString(), proChName);                        
                return DBAcess.Instance().GetDataTable(sql);
            }
            catch
            {
                throw new Exception("ORAERROR");
            }
        }

        /// <summary>
        /// 获取测评信息VILLAGE数据
        /// </summary>
        /// <param name="lstFormula">公式</param>
        /// <param name="proChName">省中文名</param>
        /// <param name="updateTime">上报数据时间</param>
        /// <returns></returns>
        public DataTable GetTestVillageData(ArrayList lstFormula, string proChName, DateTime updateTime)
        {
            try
            {
                string fieldName = lstFormula.Cast<object>().Aggregate(string.Empty,
                                                                       (current, t) =>
                                                                       string.IsNullOrEmpty(current)
                                                                           ? t.ToString()
                                                                           : string.Format("{0},{1}", current, t));
                string sql = string.Format(string.Format(@"select {0} from ne_uway_towninfor town",fieldName),updateTime.ToShortDateString(),proChName);                                                
                return DBAcess.Instance().GetDataTable(sql);
            }
            catch
            {
                throw new Exception("ORAERROR");
            }
        }

        /// <summary>
        /// 获取MSC配置数据
        /// </summary>
        /// <param name="lstFormula">公式</param>
        /// <param name="proChName">省中文名</param>
        /// <param name="updateTime">上报数据时间</param>
        /// <returns></returns>
        public DataTable GetConfMscData(ArrayList lstFormula, string proChName, DateTime updateTime)
        {
            try
            {
                string fieldName = lstFormula.Cast<object>().Aggregate(string.Empty,
                                                                       (current, t) =>
                                                                       string.IsNullOrEmpty(current)
                                                                           ? t.ToString()
                                                                           : string.Format("{0},{1}", current, t));

//                string sql =
//                    string.Format(
//                        @"select {0} from cfg_bsc_map_city bb,cfg_city tt
//                   where bb.rowid = any (select max(rowid) from cfg_bsc_map_city group by mscname)
//                  and tt.city_id=bb.city_id order by bb.city_id,bb.mscname",
//                        string.Format(fieldName, updateTime.ToString("yyyy-MM-dd"), proChName));

                string sql=string.Format(@"select {0} from cfg_bsc_map_city bb
                   where bb.rowid=any (select max(rowid) from cfg_bsc_map_city group by mscname) order by bb.mscname",
                        string.Format(fieldName,updateTime.ToString("yyyy-MM-dd"),proChName));

                return DBAcess.Instance().GetDataTable(sql);
            }
            catch
            {
                throw new Exception("ORAERROR");
            }
        }

        /// <summary>
        /// 获取BSC配置数据
        /// </summary>
        /// <param name="lstFormula">公式</param>
        /// <param name="proChName">省中文名</param>
        /// <param name="updateTime">上报数据时间</param>
        /// <returns></returns>
        public DataTable GetConfBscData(ArrayList lstFormula, string proChName, DateTime updateTime)
        {
            try
            {
                string fieldName = lstFormula.Cast<object>().Aggregate(string.Empty,
                                                                       (current, t) =>
                                                                       string.IsNullOrEmpty(current)
                                                                           ? t.ToString()
                                                                           : string.Format("{0},{1}", current, t));

                string sql =
                    string.Format(
                        @"select {0} from NE_BSC_C T1, CFG_BSC_MAP_CITY OMC,CFG_CITY CITY where  OMC.NE_BSC_ID = T1.NE_SYS_ID AND T1.CITY_ID=CITY.CITY_ID order by T1.city_id,ne_sys_id",
                        string.Format(fieldName, updateTime.ToString("yyyy-MM-dd"), proChName));

                return DBAcess.Instance().GetDataTable(sql);
            }
            catch
            {
                throw new Exception("ORAERROR");
            }
        }

        /// <summary>
        /// 获取BTS配置数据
        /// </summary>
        /// <param name="lstFormula">公式</param>
        /// <param name="proChName">省中文名</param>
        /// <param name="updateTime">上报数据时间</param>
        /// <returns></returns>
        public DataTable GetConfBtsData(ArrayList lstFormula, string proChName, DateTime updateTime)
        {
            string fieldName = lstFormula.Cast<object>().Aggregate(string.Empty,
                                                                   (current, t) =>
                                                                   string.IsNullOrEmpty(current)
                                                                       ? t.ToString()
                                                                       : string.Format("{0},{1}", current, t));

            string sql =
                string.Format(
                    @"select {0} FROM
NE_BTS_C         BTS,
NE_BSC_C         BSC,
CFG_BSC_MAP_CITY MSC,
CFG_CITY         CITY,
CFG_COUNTY       ADM ,
(select related_bts ,sum(BUS_1X) as BUS_1X ,sum(BUS_DO) as BUS_DO from (
select related_bts, 1 BUS_1X,0 BUS_DO from ne_carrier_c carrier where BUSTYPE = '1X' or bustype ='0' or bustype is null  group by related_bts 
UNION ALL 
select related_bts, 0 BUS_1X,1 BUS_DO from ne_carrier_c carrier where BUSTYPE = 'DO'  or bustype ='0' or bustype is null  group by related_bts 
) group by related_bts
)  carr   
WHERE  longitude is not null and latitude is not null  and longitude > 74 and latitude >3 and longitude <135 and latitude < 53 
 AND BTS.RELATED_BSC = BSC.NE_SYS_ID and BSC.NE_SYS_ID = MSC.NE_BSC_ID
 AND BTS.CITY_ID = CITY.CITY_ID
 AND BTS.CITY_ID = BSC.CITY_ID
AND BTS.CITY_ID = MSC.CITY_ID
and bts.ne_sys_id = carr.related_bts
 AND ADM.COUNTY_ID(+) = BTS.ADM_AREA order by city.city_id,bsc.ne_sys_id, bts.bts_id",
                    string.Format(fieldName, updateTime.ToString("yyyy-MM-dd"), proChName));

            return DBAcess.Instance().GetDataTable(sql);
        }

        /// <summary>
        /// 获取sector数据
        /// </summary>
        /// <param name="lstFormula">公式</param>
        /// <param name="proChName">省中文名</param>
        /// <param name="updateTime">上报时间</param>
        /// <returns></returns>
        public DataTable GetConfSectorData(ArrayList lstFormula, string proChName, DateTime updateTime)
        {
            string fieldName = lstFormula.Cast<object>().Aggregate(string.Empty,
                                                                   (current, t) =>
                                                                   string.IsNullOrEmpty(current)
                                                                       ? t.ToString()
                                                                       : string.Format("{0},{1}", current, t));
            string sql = string.Format(@"select {0} from ne_cell_c sector,
  ne_bts_c bts,
  ne_bsc_c         bsc,
  cfg_bsc_map_city msc,
  cfg_city city,
  cfg_county adm
where sector.related_bts=bts.ne_sys_id and  BTS.RELATED_BSC = BSC.NE_SYS_ID and BSC.NE_SYS_ID = MSC.NE_BSC_ID
and sector.city_id=city.city_id
and sector.city_id=bts.city_id
and sector.city_id=bsc.city_id
and sector.city_id=msc.city_id
and adm.COUNTY_ID(+) = sector.ADM_AREA order by city.city_id,bsc.ne_sys_id, bts.bts_id,sector.sector_id", string.Format(fieldName, updateTime.ToString("yyyy-MM-dd"), proChName));
//            string sql =
//                string.Format(
//                    @"select {0} FROM
//NE_BTS_C         BTS,
//NE_BSC_C         BSC,
//CFG_BSC_MAP_CITY MSC,
//CFG_CITY         CITY,
//CFG_COUNTY       ADM ,
//(select related_bts ,sum(BUS_1X) as BUS_1X ,sum(BUS_DO) as BUS_DO from (
//select related_bts, 1 BUS_1X,0 BUS_DO from ne_carrier_c carrier where BUSTYPE = '1X' or bustype ='0' or bustype is null  group by related_bts 
//UNION ALL 
//select related_bts, 0 BUS_1X,1 BUS_DO from ne_carrier_c carrier where BUSTYPE = 'DO'  or bustype ='0' or bustype is null  group by related_bts 
//) group by related_bts
//)  carr   
//WHERE  longitude is not null and latitude is not null  and longitude > 74 and latitude >3 and longitude <135 and latitude < 53 
// AND BTS.RELATED_BSC = BSC.NE_SYS_ID and BSC.NE_SYS_ID = MSC.NE_BSC_ID
// AND BTS.CITY_ID = CITY.CITY_ID
// AND BTS.CITY_ID = BSC.CITY_ID
//AND BTS.CITY_ID = MSC.CITY_ID
//and bts.ne_sys_id = carr.related_bts
// AND ADM.COUNTY_ID(+) = BTS.ADM_AREA order by city.city_id,bsc.ne_sys_id, bts.bts_id",
//                    string.Format(fieldName, updateTime.ToString("yyyy-MM-dd"), proChName));

            return DBAcess.Instance().GetDataTable(sql);
        }

        /// <summary>
        /// 获取map表中的基础数据
        /// </summary>
        /// <returns></returns>
        public DataTable GetMapData()
        {
            string sql = string.Format(@" select case a.vendor
          when 'ZY0808' then
           b.enname||'_'||a.omc_name||'.'||a.bsc_name||'.'||a.bts||'.'||a.cell
          when 'ZY0804' then
           a.bsc_name||'.'||a.bts||'.'||a.cell
          when 'ZY0810' then
           b.enname||'_'||a.omc_name||'.'||a.bsc_name||'.'||a.bts||'.'||a.cell
        end as fullname,
        a.ne_cell_id
   from cfg_map_dev_to_ne a, cfg_city b
  where a.city_id = b.city_id");
            return DBAcess.Instance().GetDataTable(sql);
        }

        /// <summary>
        /// 获取热点数据
        /// </summary>
        /// <param name="lstFormula">公式</param>
        /// <param name="proChName">省中文名</param>
        /// <param name="updateTime">上报时间</param>
        /// <returns></returns>
        public DataTable GetConfHPData(ArrayList lstFormula, string proChName, DateTime updateTime)
        {
            string fieldName = lstFormula.Cast<object>().Aggregate(string.Empty,
                                                                   (current, t) =>
                                                                   string.IsNullOrEmpty(current)
                                                                       ? t.ToString()
                                                                       : string.Format("{0},{1}", current, t));
            string sql = string.Format(string.Format(@"select {0} from ne_uway_hotdatacollect hot,cfg_city city where hot.city_id=city.city_id", fieldName), updateTime.ToShortDateString(), proChName);
            //            string sql =
            //                string.Format(
            //                    @"select {0} FROM
            //NE_BTS_C         BTS,
            //NE_BSC_C         BSC,
            //CFG_BSC_MAP_CITY MSC,
            //CFG_CITY         CITY,
            //CFG_COUNTY       ADM ,
            //(select related_bts ,sum(BUS_1X) as BUS_1X ,sum(BUS_DO) as BUS_DO from (
            //select related_bts, 1 BUS_1X,0 BUS_DO from ne_carrier_c carrier where BUSTYPE = '1X' or bustype ='0' or bustype is null  group by related_bts 
            //UNION ALL 
            //select related_bts, 0 BUS_1X,1 BUS_DO from ne_carrier_c carrier where BUSTYPE = 'DO'  or bustype ='0' or bustype is null  group by related_bts 
            //) group by related_bts
            //)  carr   
            //WHERE  longitude is not null and latitude is not null  and longitude > 74 and latitude >3 and longitude <135 and latitude < 53 
            // AND BTS.RELATED_BSC = BSC.NE_SYS_ID and BSC.NE_SYS_ID = MSC.NE_BSC_ID
            // AND BTS.CITY_ID = CITY.CITY_ID
            // AND BTS.CITY_ID = BSC.CITY_ID
            //AND BTS.CITY_ID = MSC.CITY_ID
            //and bts.ne_sys_id = carr.related_bts
            // AND ADM.COUNTY_ID(+) = BTS.ADM_AREA order by city.city_id,bsc.ne_sys_id, bts.bts_id",
            //                    string.Format(fieldName, updateTime.ToString("yyyy-MM-dd"), proChName));

            return DBAcess.Instance().GetDataTable(sql);
        }

        /// <summary>
        /// 获取盲点数据
        /// </summary>
        /// <param name="lstFormula">公式</param>
        /// <param name="proChName">省中文名</param>
        /// <param name="updateTime">上报时间</param>
        /// <returns></returns>
        public DataTable GetConfBlindData(ArrayList lstFormula, string proChName, DateTime updateTime)
        {
            string fieldName = lstFormula.Cast<object>().Aggregate(string.Empty,
                                                                   (current, t) =>
                                                                   string.IsNullOrEmpty(current)
                                                                       ? t.ToString()
                                                                       : string.Format("{0},{1}", current, t));
            string sql = string.Format(string.Format(@"select {0} from ne_uway_blindinfor blind,cfg_city city where blind.city_id=city.city_id", fieldName), updateTime.ToShortDateString(), proChName);
            //string sql = string.Empty;
            //            string sql =
            //                string.Format(
            //                    @"select {0} FROM
            //NE_BTS_C         BTS,
            //NE_BSC_C         BSC,
            //CFG_BSC_MAP_CITY MSC,
            //CFG_CITY         CITY,
            //CFG_COUNTY       ADM ,
            //(select related_bts ,sum(BUS_1X) as BUS_1X ,sum(BUS_DO) as BUS_DO from (
            //select related_bts, 1 BUS_1X,0 BUS_DO from ne_carrier_c carrier where BUSTYPE = '1X' or bustype ='0' or bustype is null  group by related_bts 
            //UNION ALL 
            //select related_bts, 0 BUS_1X,1 BUS_DO from ne_carrier_c carrier where BUSTYPE = 'DO'  or bustype ='0' or bustype is null  group by related_bts 
            //) group by related_bts
            //)  carr   
            //WHERE  longitude is not null and latitude is not null  and longitude > 74 and latitude >3 and longitude <135 and latitude < 53 
            // AND BTS.RELATED_BSC = BSC.NE_SYS_ID and BSC.NE_SYS_ID = MSC.NE_BSC_ID
            // AND BTS.CITY_ID = CITY.CITY_ID
            // AND BTS.CITY_ID = BSC.CITY_ID
            //AND BTS.CITY_ID = MSC.CITY_ID
            //and bts.ne_sys_id = carr.related_bts
            // AND ADM.COUNTY_ID(+) = BTS.ADM_AREA order by city.city_id,bsc.ne_sys_id, bts.bts_id",
            //                    string.Format(fieldName, updateTime.ToString("yyyy-MM-dd"), proChName));

            return DBAcess.Instance().GetDataTable(sql);
        }
        

        /// <summary>
        /// 得到城市的大格子
        /// </summary>
        /// <param name="city_id"></param>
        /// <param name="Initlongitude"></param>
        /// <param name="Initlatitude"></param>
        /// <param name="xLength"></param>
        /// <param name="yLength"></param>
        /// <param name="cityInfo"></param>
        /// <returns></returns>
        public List<clsPoi> Bigarray(string city_id, out double Initlongitude, out double Initlatitude, out int xLength, out int yLength, CityInfo cityInfo)
        {
            List<clsPoi> bigPoiList = new List<clsPoi>();
            Initlongitude = 0; //经度
            Initlatitude = 0; //纬度
            xLength = 0;
            yLength = 0;

            int longitude_lb = -1;
            int latitude_lb = -1;

            clsPoi Poi = new clsPoi();

            //113.9772	24.59921	116.6004	27.0461		
            //取的城市的左上角，右下角
            Poi.longitude_lb = cityInfo.LongitudeL; //经度 左上角
            Poi.latitude_lb = cityInfo.LatitudeL;//纬度

            Poi.longitude_rb = cityInfo.LongitudeR;
            Poi.latitude_rb = cityInfo.LatitudeR;

            Initlongitude = Poi.longitude_lb;
            Initlatitude = Poi.latitude_rb;

            double stepLongitude = 0.01;
            double stepLatitude = 0.01;
            stepLongitude = Math.Round((cityInfo.LongitudeR - cityInfo.LongitudeL)/Math.Ceiling(cityInfo.Width), 4);
            stepLatitude = Math.Round((cityInfo.LatitudeR - cityInfo.LatitudeL) / Math.Ceiling(cityInfo.Height), 4);

            //获取经续度的值结构图
            double lb_longitude = Convert.ToDouble(Math.Round(Poi.longitude_lb, 2));
            double rb_latitude = Convert.ToDouble(Math.Round(Poi.latitude_rb, 2));

            for (double u = lb_longitude; u < Poi.longitude_rb; u += stepLongitude) //经度
            {
                longitude_lb = longitude_lb + 1;
                for (double v = rb_latitude; v > Poi.latitude_lb; v -= stepLatitude) //纬度
                {
                    latitude_lb = latitude_lb + 1;
                    clsPoi BigPoi = new clsPoi();
                    BigPoi.longitude_lb = Convert.ToDouble(Math.Round(u, 2));
                    BigPoi.latitude_lb = Convert.ToDouble(Math.Round(v, 2));

                    BigPoi.longitude_rb = Convert.ToDouble(Math.Round(Convert.ToDouble(u + stepLongitude), 2));
                    BigPoi.latitude_rb = Convert.ToDouble(Math.Round(Convert.ToDouble(v - stepLatitude), 2));

                    BigPoi.Row = latitude_lb;
                    BigPoi.Column = longitude_lb;

                    BigPoi.longitudeandlatitude = Convert.ToString(BigPoi.longitude_lb * 100) +
                                                  Convert.ToString(BigPoi.latitude_lb * 100);

                    bigPoiList.Add(BigPoi);
                }

                if (yLength == 0)
                    yLength = latitude_lb;

                latitude_lb = -1;
            }

            xLength = longitude_lb;

            return bigPoiList;
        }


        public Hashtable viphtdt(string CITY_ID, string strTime, double Initlongitude)
        {
            if (CITY_ID == "7281" || CITY_ID == "7282" || CITY_ID == "7283")
                CITY_ID = "728";
            Hashtable ht = new Hashtable();
            try
            {
                try
                {
                    /*
                     * 防止首次执行时报以下错误
                     * ORA-03113: 通信通道的文件结束进程 ID: 0会话 ID: 1578 序列号: 10668
                     */
                    DBAcess.Instance().GetDataTable("select * from dual ");
                }
                catch(Exception ex) 
                {
                    WriteToFile(this._startPath, ex.Message, "获取VIP1X栅格数据出错,执行正式查询之前");
                }

                DataTable dt = new DataTable();
                int range = 1000;

                //if (Initlongitude < 100)
                //    range = 10000;

                string strSql = string.Format(
 @"select key,
sum(nvl(voice_call_num,0)) as voice_call_num,
sum(nvl(data_call_num,0))  as data_call_num,
sum(nvl(sms_call_num,0))   as sms_call_num,
sum(nvl(voice_drop_num,0)) as voice_drop_num,
sum(nvl(data_drop_num,0))  as data_drop_num,
sum(nvl(sms_drop_num,0))   as sms_drop_num,
sum(nvl(accesspnstravg,0)) as accesspnstravg
from (select longitude * 100 || latitude * 100 key,
voice_call_num,
voice_drop_num,
data_call_num,
data_drop_num,
sms_call_num,
sms_drop_num,
accesspnstravg
from (select trunc(to_number(substr(GRID_ID, length(GRID_ID) - 4, 5)) / 1000,
             2.1) as latitude,
       trunc(to_number(substr(grid_id, 0, length(grid_id) - 5)) / {2},
             2.1) as longitude,
       t.voice_call_num,
       t.voice_drop_num,
       t.data_call_num,
       t.data_drop_num,
       t.sms_call_num,
       t.sms_drop_num,
       t.accesspnstravg
  from mod_cdl_grid_vip t
 where city_id={0} and start_time = to_date('{1}:00:00', 'YYYY-MM-DD HH24:MI:SS')
 order by longitude))
group by key", CITY_ID, strTime, range);
                dt = DBAcess.Instance().GetDataTable(strSql);
                foreach (DataRow dr in dt.Rows)
                {
                    clsData cls = new clsData();
                    if (dr["data_call_num"] != null && dr["data_call_num"].ToString() != "")
                        cls.Data_call_num = Convert.ToSingle(dr["data_call_num"]);
                    else
                        cls.Data_call_num = 0;


                    if (dr["data_drop_num"] != null && dr["data_drop_num"].ToString() != "")
                        cls.Data_drop_num = Convert.ToSingle(dr["data_drop_num"]);
                    else
                        cls.Data_drop_num = 0;

                    if (dr["voice_call_num"] != null && dr["voice_call_num"].ToString() != "")
                        cls.Voice_call_num = Convert.ToSingle(dr["voice_call_num"]);
                    else
                        cls.Voice_call_num = 0;

                    if (dr["voice_drop_num"] != null && dr["voice_drop_num"].ToString() != "")
                        cls.Voice_drop_num = Convert.ToSingle(dr["voice_drop_num"]);
                    else
                        cls.Voice_drop_num = 0;

                    if (dr["sms_call_num"] != null && dr["sms_call_num"].ToString() != "")
                        cls.Sms_call_num = Convert.ToSingle(dr["sms_call_num"]);
                    else
                        cls.Sms_call_num = 0;

                    if (dr["sms_drop_num"] != null && dr["sms_drop_num"].ToString() != "")
                        cls.Sms_drop_num = Convert.ToSingle(dr["sms_drop_num"]);
                    else
                        cls.Sms_drop_num=0;

                    string strkey = dr["key"].ToString().Trim();

                    if (!ht.ContainsKey(strkey))
                        ht.Add(strkey, cls);
                }
                return ht;
            }

            catch(Exception ex)
            {
                WriteToFile(this._startPath, ex.Message, "获取VIP1X栅格数据出错,执行正式查询时");
                return ht;
            }
        }

        /// <summary>
        ///得到经纬度的DataTabel
        /// </summary>
        /// <param name="CITY_ID"></param>
        /// <param name="strTime"></param>
        /// <returns></returns>
        public Hashtable htdt(string CITY_ID, string strTime, double Initlongitude)
        {
            if (CITY_ID == "7281" || CITY_ID == "7282" || CITY_ID == "7283")
                CITY_ID = "728";
            Hashtable ht = new Hashtable();
            try
            {
                try
                {
                    /*
                     * 防止首次执行时报以下错误
                     * ORA-03113: 通信通道的文件结束进程 ID: 0会话 ID: 1578 序列号: 10668
                     */
                    DBAcess.Instance().GetDataTable("select * from dual ");
                }
                catch (Exception ex)
                {
                    WriteToFile(this._startPath, ex.Message, "获取1X栅格数据出错,执行正式查询之前");
                }


                DataTable dt = new DataTable();
                int range = 1000;

                //if (Initlongitude < 100)
                //    range = 10000;

                string strSql = string.Format(
 @"select key,
sum(nvl(voice_call_num,0)) as voice_call_num,
sum(nvl(data_call_num,0))  as data_call_num,
sum(nvl(sms_call_num,0))   as sms_call_num,
sum(nvl(voice_drop_num,0)) as voice_drop_num,
sum(nvl(data_drop_num,0))  as data_drop_num,
sum(nvl(sms_drop_num,0))   as sms_drop_num,
sum(nvl(accesspnstravg,0)) as accesspnstravg,
sum(nvl(callnum,0))
from (select longitude * 100 || latitude * 100 key,
voice_call_num,
voice_drop_num,
data_call_num,
data_drop_num,
sms_call_num,
sms_drop_num,
accesspnstravg,
callnum
from (select trunc(to_number(substr(GRID_ID, length(GRID_ID) - 4, 5)) / 1000,
             2.1) as latitude,
       trunc(to_number(substr(grid_id, 0, length(grid_id) - 5)) / {2},
             2.1) as longitude,
       t.voice_call_num,
       t.voice_drop_num,
       t.data_call_num,
       t.data_drop_num,
       t.sms_call_num,
       t.sms_drop_num,
       t.accesspnstravg,
       t.callnum
  from mod_cdl_grid t
 where city_id={0} and start_time = to_date('{1}:00:00', 'YYYY-MM-DD HH24:MI:SS')
 order by longitude))
group by key", CITY_ID, strTime, range);
                dt = DBAcess.Instance().GetDataTable(strSql);
                foreach (DataRow dr in dt.Rows)
                {
                    clsData cls = new clsData();
                    if (dr["data_call_num"] != null && dr["data_call_num"].ToString() != "")
                        cls.Data_call_num = Convert.ToSingle(dr["data_call_num"]);
                    else
                        cls.Data_call_num = 0;


                    if (dr["data_drop_num"] != null && dr["data_drop_num"].ToString() != "")
                        cls.Data_drop_num = Convert.ToSingle(dr["data_drop_num"]);
                    else
                        cls.Data_drop_num = 0;

                    if (dr["voice_call_num"] != null && dr["voice_call_num"].ToString() != "")
                        cls.Voice_call_num = Convert.ToSingle(dr["voice_call_num"]);
                    else
                        cls.Voice_call_num = 0;

                    if (dr["voice_drop_num"] != null && dr["voice_drop_num"].ToString() != "")
                        cls.Voice_drop_num = Convert.ToSingle(dr["voice_drop_num"]);
                    else
                        cls.Voice_drop_num = 0;

                    if (dr["sms_call_num"] != null && dr["sms_call_num"].ToString() != "")
                        cls.Sms_call_num = Convert.ToSingle(dr["sms_call_num"]);
                    else
                        cls.Sms_call_num = 0;

                    if (dr["sms_drop_num"] != null && dr["sms_drop_num"] != "")
                        cls.Sms_drop_num = Convert.ToSingle(dr["sms_drop_num"]);
                    else
                        cls.Sms_drop_num = 0;

                    if (dr["accesspnstravg"] != null && dr["accesspnstravg"] != "")
                        cls.Accesspnstravg = Convert.ToSingle(dr["accesspnstravg"]);
                    else
                        cls.Accesspnstravg = 0;

                    string strkey = dr["key"].ToString().Trim();

                    if (!ht.ContainsKey(strkey))
                        ht.Add(strkey, cls);
                }
                return ht;
            }

            catch(Exception ex)
            {
                WriteToFile(this._startPath, ex.Message, "获取1X栅格数据出错,执行正式查询时");
                return ht;
            }
        }

        public Hashtable viphtdtDo(string CITY_ID, string strTime, double Initlongitude)
        {
            if (CITY_ID == "7281" || CITY_ID == "7282" || CITY_ID == "7283")
                CITY_ID = "728";
            Hashtable ht = new Hashtable();
            try
            {
                try
                {
                    /*
                     * 防止首次执行时报以下错误
                     * ORA-03113: 通信通道的文件结束进程 ID: 0会话 ID: 1578 序列号: 10668
                     */
                    DBAcess.Instance().GetDataTable("select * from dual ");
                }
                catch(Exception ex) 
                {
                    WriteToFile(this._startPath, ex.Message, "获取VIPDO栅格数据出错,执行正式查询之前");
                }

                DataTable dt = new DataTable();
                int range = 1000;

                //if (Initlongitude < 100)
                //    range = 10000;
                string strSql = string.Format(
                    @"select key,
sum(nvl(dodata_call_num,0)) as dodata_call_num
from (select longitude * 100 || latitude * 100 key,
dodata_call_num
from (select trunc(to_number(substr(GRID_ID, length(GRID_ID) - 4, 5)) / 1000,
             2.1) as latitude,
       trunc(to_number(substr(grid_id, 0, length(grid_id) - 5)) / {2},
             2.1) as longitude,
       t.dodata_call_num
  from mod_cdl_grid_do_vip t
 where city_id={0} and start_time = to_date('{1}:00:00', 'YYYY-MM-DD HH24:MI:SS')
 order by longitude))
group by key",
                    CITY_ID, strTime, range);
                dt = DBAcess.Instance().GetDataTable(strSql);
                foreach (DataRow dr in dt.Rows)
                {
                    clsData cls = new clsData();
                    if (dr["dodata_call_num"] != null && dr["dodata_call_num"].ToString() != "")
                        cls.DODATA_CALL_NUM = Convert.ToSingle(dr["dodata_call_num"]);
                    else
                        cls.DODATA_CALL_NUM = 0;

                    string strkey = dr["key"].ToString().Trim();
                    if (!ht.ContainsKey(strkey))
                        ht.Add(strkey, cls);
                }
                return ht;
            }
            catch(Exception ex)
            {
                WriteToFile(this._startPath, ex.Message, "获取VIPDO栅格数据出错,执行正式查询时");
                return ht;
            }
        }

        /// <summary>
        ///得到经纬度的DataTabel
        /// </summary>
        /// <param name="CITY_ID"></param>
        /// <param name="strTime"></param>
        /// <returns></returns>
        public Hashtable htdtDo(string CITY_ID, string strTime, double Initlongitude)
        {
            if (CITY_ID == "7281" || CITY_ID == "7282" || CITY_ID == "7283")
                CITY_ID = "728";
            Hashtable ht = new Hashtable();
            try
            {
                try
                {
                    /*
                     * 防止首次执行时报以下错误
                     * ORA-03113: 通信通道的文件结束进程 ID: 0会话 ID: 1578 序列号: 10668
                     */
                    DBAcess.Instance().GetDataTable("select * from dual ");
                }
                catch(Exception ex) 
                {
                    WriteToFile(this._startPath, ex.Message, "获取DO栅格数据出错,执行正式查询之前");
                }

                DataTable dt = new DataTable();
                int range = 1000;

                //if (Initlongitude < 100)
                //    range = 10000;
                string strSql = string.Format(
                    @"select key,
sum(nvl(dodata_call_num,0)) as dodata_call_num
from (select longitude * 100 || latitude * 100 key,
dodata_call_num
from (select trunc(to_number(substr(GRID_ID, length(GRID_ID) - 4, 5)) / 1000,
             2.1) as latitude,
       trunc(to_number(substr(grid_id, 0, length(grid_id) - 5)) / {2},
             2.1) as longitude,
       t.dodata_call_num
  from mod_cdl_do_grid t
 where city_id={0} and start_time = to_date('{1}:00:00', 'YYYY-MM-DD HH24:MI:SS')
 order by longitude))
group by key",
                    CITY_ID, strTime, range);
                dt = DBAcess.Instance().GetDataTable(strSql);
                foreach (DataRow dr in dt.Rows)
                {
                    clsData cls = new clsData();
                    if (dr["dodata_call_num"] != null && dr["dodata_call_num"].ToString() != "")
                        cls.DODATA_CALL_NUM = Convert.ToSingle(dr["dodata_call_num"]);
                    else
                        cls.DODATA_CALL_NUM = 0;

                    string strkey = dr["key"].ToString().Trim();
                    if (!ht.ContainsKey(strkey))
                        ht.Add(strkey, cls);
                }
                return ht;
            }
            catch(Exception ex)
            {
                WriteToFile(this._startPath, ex.Message, "获取DO栅格数据出错,执行正式查询时");
                return ht;
            }
        }

        /// <summary>
        /// 有多少个小格存在于大格中
        /// </summary>
        /// <returns></returns>
        public DataTable htgetsmallExistBig(Hashtable ht, List<clsPoi> clsPoi)
        {
            try
            {
                DataTable dt1 = new DataTable();

                dt1.Columns.Add(new DataColumn("col",typeof(int)));
                dt1.Columns.Add(new DataColumn("row",typeof(int)));
                dt1.Columns.Add(new DataColumn("voice_call_num"));
                dt1.Columns.Add(new DataColumn("data_call_num"));
                dt1.Columns.Add(new DataColumn("sms_call_num"));
                dt1.Columns.Add(new DataColumn("voice_drop_num"));
                dt1.Columns.Add(new DataColumn("data_drop_num"));                
                dt1.Columns.Add(new DataColumn("sms_drop_num"));
                dt1.Columns.Add(new DataColumn("accesspnstravg"));

                foreach (clsPoi t in clsPoi)
                {
                    //遍历查找功能函数。确定有多少格子在这个大格子中(callnum;dropnum)
                    clsResult cls = new clsResult();
                    cls.LsData = new List<clsData>();
                    clsPoi clsP = t as clsPoi;
                    if (ht.ContainsKey(clsP.longitudeandlatitude))
                    {
                        clsData newcls = ht[clsP.longitudeandlatitude] as clsData;
                        if (newcls == null)
                            continue;

                        DataRow dr = dt1.NewRow();
                        dr["col"] = clsP.Column;
                        dr["row"] = clsP.Row;

                        dr["voice_call_num"] = newcls.Voice_call_num;
                        dr["data_call_num"] = newcls.Data_call_num;
                        dr["sms_call_num"] = newcls.Sms_call_num;
                        dr["voice_drop_num"] = newcls.Voice_drop_num;
                        dr["data_drop_num"] = newcls.Data_drop_num;
                        dr["sms_drop_num"] = newcls.Sms_drop_num;
                        dr["accesspnstravg"] = newcls.Accesspnstravg;
                        dt1.Rows.Add(dr);
                    }
                }
                return dt1;
            }
            catch
            {
                return null;
            }
        }

        /// <summary>
        /// 有多少个小格存在于大格中
        /// </summary>
        /// <returns></returns>
        public DataTable htgetsmallExistBigDo(Hashtable ht, List<clsPoi> clsPoi)
        {
            try
            {
                DataTable dt1 = new DataTable();

                dt1.Columns.Add(new DataColumn("col",typeof(int)));
                dt1.Columns.Add(new DataColumn("row",typeof(int)));
                dt1.Columns.Add(new DataColumn("DODATA_CALL_NUM"));

                foreach (clsPoi t in clsPoi)
                {
                    //遍历查找功能函数。确定有多少格子在这个大格子中(callnum;dropnum)
                    clsResult cls = new clsResult();
                    cls.LsData = new List<clsData>();
                    clsPoi clsP = t as clsPoi;

                    if (ht.ContainsKey(clsP.longitudeandlatitude))
                    {
                        clsData newcls = ht[clsP.longitudeandlatitude] as clsData;
                        if (newcls == null)
                            continue;

                        DataRow dr = dt1.NewRow();
                        dr["col"] = clsP.Column;
                        dr["row"] = clsP.Row;

                        dr["DODATA_CALL_NUM"] = newcls.DODATA_CALL_NUM;
                        dt1.Rows.Add(dr);
                    }
                }
                return dt1;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public void InsertAbnormalData(string startTime, string enName, string chnName, string dataLevel, string dataType, string repValue, string refValue)
        {
            try
            {
                int id = 0;
                object obj = DBAcess.Instance().ExecScalar("select max(id) as id from mod_province_check");
                if (obj == null || obj == DBNull.Value)
                {
                    id = 1;
                }
                else
                {
                    id = Convert.ToInt32(obj) + 1;
                }

                string insertsql=string.Format(@"insert into mod_province_check(id,start_time,en_name,chn_name,data_level,data_type,report_value,ref_value)
                                                                         values({0},to_date('{1}','yyyy-MM-dd hh24:mi:ss'),'{2}','{3}','{4}','{5}','{6}','{7}')",
                                                                         id,startTime,enName,chnName,dataLevel,dataType,repValue,refValue);
                DBAcess.Instance().ExecNonQuery(insertsql);

            }
            catch
            {
 
            }
        }

        //log入库
        public void InsertLog(DataTable dt)
        {
            try
            {
                string insertSql = string.Empty;
                string msc_count = "";
                string bsc_count = "";
                string bts_count = "";

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    if (i == 0)
                    {
                        msc_count = dt.Rows[i]["MSC_COUNT"].ToString();
                        bsc_count = dt.Rows[i]["BSC_COUNT"].ToString();
                        bts_count = dt.Rows[i]["BTS_COUNT"].ToString();
                    }
                    else
                    {
                        string start_time=dt.Rows[i]["STAT_DATE"].ToString();
                        string start_prov=dt.Rows[i]["STAT_PROV"].ToString();
                        string city_count=dt.Rows[i]["CITY_COUNT"].ToString();                       
                        string perf_prov_1x=dt.Rows[i]["1X_PERF_PROV"].ToString();
                        string perf_city_1x = dt.Rows[i]["1X_PERF_CITY"].ToString();
                        string perf_msc_1x=dt.Rows[i]["1X_PERF_MSC"].ToString();
                        string perf_prov_do=dt.Rows[i]["DO_PERF_PROV"].ToString();
                        string perf_city_do=dt.Rows[i]["DO_PERF_CITY"].ToString();
                        string perf_msc_do=dt.Rows[i]["DO_PERF_MSC"].ToString();
                        string cdl_city_1x=dt.Rows[i]["1X_CDL_CITY"].ToString();
                        string cdl_city_do=dt.Rows[i]["DO_CDL_CITY"].ToString();
                                                

                        int id = 0;
                        object obj = DBAcess.Instance().ExecScalar("select max(id) as id from mod_province_log");
                        if (obj == null||obj==DBNull.Value)
                        {
                            id = 1;
                        }
                        else
                        {
                            id = Convert.ToInt32(obj) + 1;
                        }
                        
                        insertSql = string.Format(@"insert into mod_province_log(id,start_time,start_prov,city_count,
                                                                       msc_count,bsc_count,bts_count,
                                                                       perf_prov_1x,perf_city_1x,perf_msc_1x,
                                                                       perf_prov_do,perf_city_do,perf_msc_do,
                                                                       cdl_city_1x,cdl_city_do,update_time)
                                               values({0},to_date('{1}','yyyy-MM-dd'),'{2}','{3}','{4}','{5}','{6}','{7}','','','{8}','','','','',sysdate)", 
                                                      id,start_time,start_prov,city_count,msc_count,bsc_count,bts_count,perf_prov_1x,perf_prov_do);

                        DBAcess.Instance().ExecNonQuery(insertSql);

                        int updateid = Convert.ToInt32(DBAcess.Instance().ExecScalar("select max(id) as id from mod_province_log"));

                        string updateStr = string.Format(@"update mod_province_log 
                                                           set perf_city_1x = :perf_city_1x,
                                                               perf_msc_1x=:perf_msc_1x,
                                                               perf_city_do=:perf_city_do,
                                                               perf_msc_do=:perf_msc_do,
                                                               cdl_city_1x=:cdl_city_1x,
                                                               cdl_city_do=:cdl_city_do                                                                                                                    
                                                    where id = {0}",updateid);

                        if (string.IsNullOrEmpty(perf_city_1x))
                        {
                            perf_city_1x = " ";
                        }
                        OracleParameter para_perf_city_1x = new OracleParameter("perf_city_1x", OracleType.Clob, perf_city_1x.Length);
                        para_perf_city_1x.Value = perf_city_1x;

                        if (string.IsNullOrEmpty(perf_msc_1x))
                        {
                            perf_msc_1x = " ";
                        }
                        OracleParameter para_perf_msc_1x = new OracleParameter("perf_msc_1x", OracleType.Clob, perf_msc_1x.Length);
                        para_perf_msc_1x.Value = perf_msc_1x;

                        if (string.IsNullOrEmpty(perf_city_do))
                        {
                            perf_city_do = " ";
                        }
                        OracleParameter para_perf_city_do = new OracleParameter("perf_city_do", OracleType.Clob, perf_city_do.Length);
                        para_perf_city_do.Value = perf_city_do;

                        if (string.IsNullOrEmpty(perf_msc_do))
                        {
                            perf_msc_do = " ";
                        }
                        OracleParameter para_perf_msc_do = new OracleParameter("perf_msc_do", OracleType.Clob, perf_msc_do.Length);
                        para_perf_msc_do.Value = perf_msc_do;

                        if (string.IsNullOrEmpty(cdl_city_1x))
                        {
                            cdl_city_1x = " ";
                        }
                        OracleParameter para_cdl_city_1x = new OracleParameter("cdl_city_1x", OracleType.Clob, cdl_city_1x.Length);
                        para_cdl_city_1x.Value = cdl_city_1x;

                        if (string.IsNullOrEmpty(cdl_city_do))
                        {
                            cdl_city_do = " ";
                        }
                        OracleParameter para_cel_city_do = new OracleParameter("cdl_city_do", OracleType.Clob, cdl_city_do.Length);
                        para_cel_city_do.Value = cdl_city_do;

                        DBAcess.Instance().ExecNonQuery(updateStr, new OracleParameter[] { para_perf_city_1x, para_perf_msc_1x, para_perf_city_do,
                                                                                           para_perf_msc_do,para_cdl_city_1x,para_cel_city_do});                                                                                              
                        
                     
                    }                    
                }
            }
            catch { }
        }

        public void InsertPerf(DataTable dt,int bizType,int FileType)
        {
            try
            {
                string insertSql = string.Empty;

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string column = string.Empty;
                    string value = string.Empty;
                    for (int j = 0; j < dt.Columns.Count; j++)
                    {                        
                        if (j > 4)
                        {
                            column += dt.Columns[j].ColumnName.ToString() + ",";
                        }
                        if (j < 5)
                        {
                            if (j == 1)
                            {
                                value += "to_date('" + dt.Rows[i][j] + "','yyyy-MM-dd hh24:mi:ss'),";
                            }
                            else
                            {
                                value += "'" + dt.Rows[i][j] + "',";
                            }
                        }
                        else
                        {
                            if (string.IsNullOrEmpty(dt.Rows[i][j].ToString()))
                            {
                                value += "'',";
                            }
                            else
                            {
                                value += dt.Rows[i][j] + ",";
                            }
                        }                        
                    }                    
                    column = column.Substring(0, column.Length - 1);                    
                    value = value.Substring(0, value.Length - 1);

                    insertSql = string.Format("insert into mod_province_bak(biztype,filetype,b1,start_time,b2,b3,b4,{0}) values({1},{2},{3})", column, bizType, FileType, value);
                    DBAcess.Instance().ExecNonQuery(insertSql);
                }
            }
            catch { }
        }

        public DataTable GetMscSupplyData(string msc, string starttime, int fileType, int bizType)
        {
            DataTable dt = null;
            try
            {
                string strSql = string.Format(@"select to_char(start_time,'yyyy-MM-dd hh24:mi:ss') as af_start_time,aa.* from mod_province_bak aa
                                           where aa.b1='{0}'
                                                 and aa.start_time>=to_date('{1}','yyyy-MM-dd hh24:mi:ss')
                                                 and aa.filetype={2}
                                                 and aa.biztype={3} order by aa.start_time ", msc, starttime, fileType, bizType);
                dt = DBAcess.Instance().GetDataTable(strSql);
                return dt;
            }
            catch
            {
                return null;
            }
        }

        public DataTable GetSupplyData(string city, string starttime, int fileType, int bizType)
        {
            DataTable dt = null;            
            try
            {
                string strSql = string.Format(@"select to_char(start_time,'yyyy-MM-dd hh24:mi:ss') as af_start_time,aa.* from mod_province_bak aa
                                           where aa.b4='{0}'
                                                 and aa.b1='城市'
                                                 and aa.start_time>=to_date('{1}','yyyy-MM-dd hh24:mi:ss')
                                                 and aa.filetype={2}
                                                 and aa.biztype={3} order by aa.start_time ",city, starttime, fileType, bizType);
                dt = DBAcess.Instance().GetDataTable(strSql);
                return dt;
            }
            catch
            {
                dt = null;
                return dt;
            }
        }

        public DataTable GetKeyIndex(int bizType)
        {
            DataTable dt = null;
            try
            {
                string strSql = string.Format("select en_name from cfg_provice_perf where datatype=7 and classcode={0}", bizType);
                dt = DBAcess.Instance().GetDataTable(strSql);
                return dt;
            }
            catch
            {
                dt = null;
                return dt;
            }
        }

        public object GetCheckValue(DateTime starttime, string columnname, int bizType, int FileType,string cityname)
        {
            object obj = null;
            string strTimeWhere=string.Empty;
            for(int i=1;i<15;i++)
            {
                strTimeWhere+="to_date('"+starttime.AddDays(-i).ToString()+"','yyyy-MM-dd hh24:mi:ss'),";
            }
            strTimeWhere=strTimeWhere.Substring(0,strTimeWhere.Length-1);

            try
            {
                string strSql = string.Format(@"select sum({0}) from mod_province_bak 
                                              where biztype={1} and filetype={2} and b4='{4}' and start_time in({3})", columnname, bizType, FileType, strTimeWhere,cityname);
                DataTable dt = DBAcess.Instance().GetDataTable(strSql);
                if (!string.IsNullOrEmpty(dt.Rows[0][0].ToString()))
                {
                    obj = dt.Rows[0][0];
                }
                return obj;
            }
            catch
            {
                return obj;
            }
        }

        public DataTable GetCheckValue(DateTime starttime, int bizType, int FileType,string cityname)
        {
            string strTimeWhere = string.Empty;
            strTimeWhere = "to_date('" + starttime.AddDays(-14).ToString() + "','yyyy-MM-dd hh24:mi:ss')";

            try
            {
                string strSql = string.Format(@"select * from mod_province_bak
                                              where biztype={0} and filetype={1} and b4='{2}' and start_time>={3}", bizType, FileType,cityname,strTimeWhere);
                DataTable dt = DBAcess.Instance().GetDataTable(strSql);

                return dt;
            }
            catch
            {
                return null;
            }
        }

        public DataTable GetReplaceValue(DateTime starttime, string columnname, int bizType, int FileType,string cityname)
        {
            DataTable dt = null;
            string strTimeWhere = string.Empty;
            for (int i = 1; i < 15; i++)
            {
                strTimeWhere += "to_date('" + starttime.AddDays(-i).ToString() + "','yyyy-MM-dd hh24:mi:ss'),";
            }
            strTimeWhere = strTimeWhere.Substring(0, strTimeWhere.Length - 1);

            try
            {
                string strSql = string.Format(@"select {0} from mod_province_bak 
                                              where biztype={1} and filetype={2} 
                                                    and start_time in({3})
                                                    and b4='{4}'
                                                    and {0} is not null and {0}<>0", columnname, bizType, FileType, strTimeWhere,cityname);
                dt = DBAcess.Instance().GetDataTable(strSql);
                return dt;
            }
            catch
            {
                return dt;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="dt"></param>
        /// <param name="columnName"></param>
        /// <param name="columnValue"></param>
        /// <param name="start_time"></param>
        /// <returns></returns>
        private int GetPcountFromCell(DataTable dt, string columnName, string columnValue, string start_time)
        {
            try
            {
                if (dt != null && dt.Rows.Count > 0)
                {
                    return (from DataRow dr in dt.Rows
                            where dr[columnName].ToString().Trim() == columnValue.Trim() && dr["start_time"].ToString().Trim() == start_time.Trim()
                            select Convert.ToInt32(dr["total"])).FirstOrDefault();
                }

                return 0;
            }
            catch { return 0; }
        }
        private int GetPcountFromCellHub(DataTable dt, string columnName, string columnValue, string start_time)
        {
            try
            {
                if (dt != null && dt.Rows.Count > 0)
                {
                    return (from DataRow dr in dt.Rows
                            where (dr[columnName].ToString().Trim() == columnValue.Trim() || (dr[columnName].ToString().Trim() == "江汉" && (columnValue.Trim() == "天门" || columnValue.Trim() == "仙桃" || columnValue.Trim() == "潜江"))) && dr["start_time"].ToString().Trim() == start_time.Trim()
                            select Convert.ToInt32(dr["total"])).FirstOrDefault();
                }

                return 0;
            }
            catch { return 0; }
        }

        private int GetPcountFromCellForMsc(DataTable dt, string columnName, string columnValue, string columnName2, string columnValue2, string start_time)
        {
            try
            {
                if (dt != null && dt.Rows.Count > 0)
                {
                    return (from DataRow dr in dt.Rows
                            where dr[columnName].ToString().Trim() == columnValue.Trim() && dr[columnName2].ToString().Trim() == columnValue2.Trim() && dr["start_time"].ToString().Trim() == start_time.Trim()
                            select Convert.ToInt32(dr["total"])).FirstOrDefault();
                }

                return 0;
            }
            catch { return 0; }
        }

        /// <summary>
        /// 移除列
        /// </summary>
        /// <param name="dtIn"></param>
        /// <param name="columnName"></param>
        /// <returns></returns>
        private DataTable RemoveColumn(DataTable dtIn, string columnName)
        {
            try
            {
                DataTable dtOut = new DataTable();
                if (dtIn == null || dtIn.Columns.Count == 0)
                {
                    return dtIn;
                }
                else
                {
                    foreach (DataColumn dc in
                        dtIn.Columns.Cast<DataColumn>().Where(dc => dc.Caption.ToUpper().Trim() != columnName.ToUpper().Trim()))
                    {
                        dtOut.Columns.Add(new DataColumn(dc.Caption, dc.DataType));
                    }

                    foreach (DataRow dr in dtIn.Rows)
                    {
                        DataRow drr = dtOut.NewRow();
                        foreach (DataColumn dc in
                            dtIn.Columns.Cast<DataColumn>().Where(dc => dc.Caption.ToUpper().Trim() != columnName.ToUpper().Trim()))
                        {
                            drr[dc.Caption] = dr[dc.Caption];
                        }
                        dtOut.Rows.Add(drr);
                    }

                    return dtOut;
                }
            }
            catch
            {
                return dtIn;
            }
        }

        public void ExportDoubleCsv(DataTable dt1,DataTable dt2, string fileName, string DirPath,string labelname1,string labelname2,ArrayList firstlstChName,ArrayList secondlstChName)
        {
            FileStream fileStream = null;
            StreamWriter sw = null;
            try
            {
                if (!Directory.Exists(DirPath))
                {
                    Directory.CreateDirectory(DirPath);
                }
                fileName = DirPath + "\\" + fileName;
                
                fileStream = new FileStream(fileName, FileMode.Create);//创建一个文件                 
                sw = new StreamWriter(fileStream, Encoding.Default); //数据流
                StringBuilder sb = new StringBuilder(); //写入的文本
                int columnCount1 = dt1.Columns.Count;
                int columnCount2 = dt2.Columns.Count;

                //模块点击类
                sb.Append(labelname1);
                sb.Append("\n");

                for (int x = 0; x < columnCount1; x++)
                {
                    string fhead = "";
                    try
                    {
                        fhead = firstlstChName[x].ToString().Trim().Replace("\n", "");
                    }
                    catch
                    {

                    }
                    sb.Append(fhead);
                    sb.Append(",");
                }

                sb = sb.Remove(sb.Length - 1, 1);
                sb.Append("\n");

                #region 写入内容
                for (int x = 0; x < dt1.Rows.Count; x++)
                {
                    for (int xx = 0; xx < dt1.Columns.Count; xx++)
                    {
                        sb.Append(dt1.Rows[x][dt1.Columns[xx].ColumnName].ToString().Replace("\n", ""));
                        sb.Append(',');
                    }
                    if (sb.Length > 1) sb = sb.Remove(sb.Length - 1, 1); //去掉最后一个逗号
                    sb.Append("\n");
                }
                #endregion

                //sw.Write(sb.ToString());


                //活动用户类
                sb.Append("\r\n");//如果是第二次写入空一行
                sb.Append(labelname2);
                sb.Append("\n");

                for (int x = 0; x < columnCount2; x++)
                {
                    string shead = "";
                    try
                    {
                        shead = secondlstChName[x].ToString().Trim().Replace("\n", "");
                    }
                    catch
                    {

                    }
                    sb.Append(shead);
                    sb.Append(',');
                }

                sb = sb.Remove(sb.Length - 1, 1);
                sb.Append("\n");

                #region 写入内容
                for (int x = 0; x < dt2.Rows.Count; x++)
                {
                    for (int xx = 0; xx < dt2.Columns.Count; xx++)
                    {
                        sb.Append(dt2.Rows[x][dt2.Columns[xx].ColumnName].ToString().Replace("\n", ""));
                        sb.Append(',');
                    }
                    if (sb.Length > 1) sb = sb.Remove(sb.Length - 1, 1); //去掉最后一个逗号
                    sb.Append("\n");
                }
                #endregion

                sw.Write(sb.ToString());
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                sw.Close();
                fileStream.Close();
            }

        }

        public void ExportParaCsv(DataTable dt, string fileName, string DirPath, ArrayList lstChName, ArrayList lstLogicExpress)
        {
            FileStream fileStream = null;
            StreamWriter sw = null;

            try
            {
                if (!Directory.Exists(DirPath))
                    Directory.CreateDirectory(DirPath);

                fileName = DirPath + "\\" + fileName;
                if (File.Exists(fileName))
                    File.Delete(fileName);

                fileStream = new FileStream(fileName, FileMode.Create); //创建一个文件            
                sw = new StreamWriter(fileStream, Encoding.Default); //数据流
                StringBuilder sb = new StringBuilder(); //写入的文本
                int columnCount = dt.Columns.Count;
                //int lcstart = 0;
                //if (level == "CELL")
                //{
                //    lcstart = 27;
                //}
                //else
                //{
                //    lcstart = 33;
                //}

                #region 性能写第一行 MC1.1 ,MC1.2等

                if (lstLogicExpress.Count > 0)
                {

                    //边界扇区参数写第一行 MP1.7.1.1.1 MP1.7.1.1.2等
                    for (int x = 0; x < columnCount; x++)
                    {
                        //if (x < lcstart)
                        //    sb.Append(',');
                        //else
                        //{
                            string mc = "";
                            try
                            {
                                mc = lstLogicExpress[x].ToString().Trim().Replace("\n", "");
                            }
                            catch
                            {
                            }
                            sb.Append(mc);
                            sb.Append(',');
                        //}
                    }


                    sb = sb.Remove(sb.Length - 1, 1); //去掉最后一个逗号
                    sb.Append("\n"); // 换行
                }

                #endregion

                #region 边界扇区参数写第二行中文名

                for (int x = 0; x < columnCount; x++)
                {
                    string mc = "";
                    try
                    {
                        mc = lstChName[x].ToString().Trim().Replace("\n", "");
                    }
                    catch
                    {
                    }
                    sb.Append(mc);
                    sb.Append(',');
                }

                sb = sb.Remove(sb.Length - 1, 1); //去掉最后一个逗号
                sb.Append("\n"); // 换行

                #endregion

                #region 写入内容
                for (int x = 0; x < dt.Rows.Count; x++)
                {
                    for (int xx = 0; xx < dt.Columns.Count; xx++)
                    {
                        sb.Append(dt.Rows[x][dt.Columns[xx].ColumnName].ToString().Replace("\n", ""));
                        sb.Append(',');
                    }
                    if (sb.Length > 1) sb = sb.Remove(sb.Length - 1, 1); //去掉最后一个逗号
                    sb.Append("\n");
                }
                #endregion

                sw.Write(sb.ToString());
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                sw.Close();
                fileStream.Close();
            }
        }

        //public void ExportParaCsv(DataTable dt, string fileName, string DirPath, ArrayList lstChName, ArrayList lstLogicExpress,string level)
        //{
        //    FileStream fileStream = null;
        //    StreamWriter sw = null;

        //    try
        //    {
        //        if (!Directory.Exists(DirPath))
        //            Directory.CreateDirectory(DirPath);

        //        fileName = DirPath + "\\" + fileName;
        //        if (File.Exists(fileName))
        //            File.Delete(fileName);

        //        fileStream = new FileStream(fileName, FileMode.Create); //创建一个文件            
        //        sw = new StreamWriter(fileStream, Encoding.Default); //数据流
        //        StringBuilder sb = new StringBuilder(); //写入的文本
        //        int columnCount = dt.Columns.Count;
        //        int lcstart = 0;
        //        if (level == "CELL")
        //        {
        //            lcstart = 27;
        //        }
        //        else
        //        {
        //            lcstart = 33;
        //        }

        //        #region 性能写第一行 MC1.1 ,MC1.2等

        //        if (lstLogicExpress.Count > 0)
        //        {

        //            //边界扇区参数写第一行 MP1.7.1.1.1 MP1.7.1.1.2等
        //                for (int x = 0; x < columnCount; x++)
        //                {
        //                    if (x < lcstart)
        //                        sb.Append(',');
        //                    else
        //                    {
        //                        string mc = "";
        //                        try
        //                        {
        //                            mc = lstLogicExpress[x - lcstart].ToString().Trim().Replace("\n", "");
        //                        }
        //                        catch
        //                        {
        //                        }
        //                        sb.Append(mc);
        //                        sb.Append(',');
        //                    }
        //                }
                    

        //            sb = sb.Remove(sb.Length - 1, 1); //去掉最后一个逗号
        //            sb.Append("\n"); // 换行
        //        }

        //        #endregion

        //        #region 边界扇区参数写第二行中文名

        //        for (int x = 0; x < columnCount; x++)
        //        {                    
        //            string mc = "";
        //            try
        //            {
        //                mc = lstChName[x].ToString().Trim().Replace("\n", "");
        //            }
        //            catch
        //            {
        //            }
        //            sb.Append(mc);
        //            sb.Append(',');                    
        //        }

        //        sb = sb.Remove(sb.Length - 1, 1); //去掉最后一个逗号
        //        sb.Append("\n"); // 换行

        //        #endregion

        //        #region 写入内容
        //        for (int x = 0; x < dt.Rows.Count; x++)
        //        {
        //            for (int xx = 0; xx < dt.Columns.Count; xx++)
        //            {
        //                sb.Append(dt.Rows[x][dt.Columns[xx].ColumnName].ToString().Replace("\n", ""));
        //                sb.Append(',');
        //            }
        //            if (sb.Length > 1) sb = sb.Remove(sb.Length - 1, 1); //去掉最后一个逗号
        //            sb.Append("\n");
        //        }
        //        #endregion

        //        sw.Write(sb.ToString());
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    finally
        //    {
        //        sw.Close();
        //        fileStream.Close();
        //    }
        //}

        /// <summary>
        /// 导出DataTable
        /// </summary>
        /// <param name="dt"></param>
        /// <param name="fileName"></param>
        /// <param name="DirPath"></param>
        /// <param name="lstChName">chName</param>
        /// <param name="lstExtraName">extraName</param>
        /// <param name="lstLogicExpress">LogicExpress</param>
        public void ExportCsv(DataTable dt, string fileName, string DirPath, ArrayList lstChName, ArrayList lstExtraName, ArrayList lstLogicExpress)
        {
            FileStream fileStream = null;
            StreamWriter sw = null;
            try
            {
                if (!Directory.Exists(DirPath))
                    Directory.CreateDirectory(DirPath);

                fileName = DirPath + "\\" + fileName;
                if (File.Exists(fileName))
                    File.Delete(fileName);

                fileStream = new FileStream(fileName, FileMode.Create); //创建一个文件            
                sw = new StreamWriter(fileStream, Encoding.Default); //数据流
                StringBuilder sb = new StringBuilder(); //写入的文本
                int columnCount = dt.Columns.Count;
                int extraCount = lstExtraName.Count;

                #region 性能写第一行 MC1.1 ,MC1.2等

                if (lstLogicExpress.Count > 0)
                {
                    if (lstLogicExpress.Count > columnCount)
                    {
                        // 性能写第一行 MC1.1 MC1.2等
                        foreach (object t in lstLogicExpress)
                        {
                            sb.Append(t.ToString().Trim().Replace("\n", ""));
                            sb.Append(',');
                        }
                    }
                    else
                    {
                        // 性能写第一行 MC1.1 MC1.2等
                        for (int x = 0; x < columnCount; x++)
                        {
                            if (x < extraCount)
                                sb.Append(',');
                            else
                            {
                                string mc = "";
                                try
                                {
                                    mc = lstLogicExpress[x - extraCount].ToString().Trim().Replace("\n", "");
                                }
                                catch
                                {
                                }
                                sb.Append(mc);
                                sb.Append(',');
                            }
                        }
                    }

                    sb = sb.Remove(sb.Length - 1, 1); //去掉最后一个逗号
                    sb.Append("\n"); // 换行
                }

                #endregion

                #region 性能写第二行 MSC标识 数据时间 MSC名称 省份 等

                for (int x = 0; x < columnCount; x++)
                {
                    if (x < extraCount)
                    {
                        sb.Append(lstExtraName[x].ToString().Trim().Replace("\n", ""));
                        sb.Append(',');
                    }
                    else
                    {
                        string mc = "";
                        try
                        {
                            mc = lstChName[x - extraCount].ToString().Trim().Replace("\n", "");
                        }
                        catch
                        {
                        }
                        sb.Append(mc);
                        sb.Append(',');
                    }
                }

                sb = sb.Remove(sb.Length - 1, 1); //去掉最后一个逗号
                sb.Append("\n"); // 换行

                #endregion

                #region 写入内容
                for (int x = 0; x < dt.Rows.Count; x++)
                {
                    for (int xx = 0; xx < dt.Columns.Count; xx++)
                    {
                        sb.Append(dt.Rows[x][dt.Columns[xx].ColumnName].ToString().Replace("\n", ""));
                        sb.Append(',');
                    }
                    if (sb.Length > 1) sb = sb.Remove(sb.Length - 1, 1); //去掉最后一个逗号
                    sb.Append("\n");
                }
                #endregion

                sw.Write(sb.ToString());
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                sw.Close();
                fileStream.Close();
            }
        }

        /// <summary>
        /// 将dtIn数据追加到dtOut中去,是追加的方式，并非COPY的方式
        /// </summary>
        /// <param name="dtOut"></param>
        /// <param name="dtIn"></param>
        public void BuildDataTable(ref DataTable dtOut, DataTable dtIn)
        {
            try
            {
                if (dtOut == null || dtOut.Columns.Count == 0)
                {
                    if (dtIn != null)
                    {
                        dtOut = new DataTable();
                        foreach (DataColumn dc in dtIn.Columns)
                        {
                            dtOut.Columns.Add(new DataColumn(dc.Caption, dc.DataType));
                        }
                    }
                }
                if (dtIn != null)
                {
                    DataRow drr;
                    foreach (DataRow dr in dtIn.Rows)
                    {
                        drr = dtOut.NewRow();
                        foreach (DataColumn dc in dtIn.Columns)
                        {
                            drr[dc.Caption] = dr[dc.Caption];
                        }
                        dtOut.Rows.Add(drr);
                    }
                }
            }
            catch
            {
            }
        }

        /// <summary>
        ///去除重复的行数据
        /// </summary>
        /// <param name="dtOut"></param>
        /// <param name="dtIn"></param>
        public void FilDatable(ref DataTable dtOut, DataTable dtIn, string strColumn)
        {
            ArrayList array = new ArrayList();
            try
            {
                dtOut = dtIn.Clone();
                if (dtIn != null)
                {
                    DataRow drr;
                    foreach (DataRow dr in dtIn.Rows)
                    {
                        if (dr[strColumn] != null)
                        {
                            if (!array.Contains(dr[strColumn].ToString()))
                            {
                                array.Add(dr[strColumn].ToString());
                                drr = dtOut.NewRow();
                                foreach (DataColumn dc in dtIn.Columns)
                                {
                                    drr[dc.Caption] = dr[dc.Caption];
                                }
                                dtOut.Rows.Add(drr);
                            }
                            else
                                continue;
                        }
                    }
                }
            }
            catch
            {
            }
        }

        /// <summary>
        /// 写日志
        /// </summary>
        /// <param name="startupPath"></param>
        /// <param name="msg"></param>
        public void WriteToFile(string startupPath, string msg, string stackTrace)
        {
            try
            {
                string sPath = startupPath + "\\OperateLog\\";
                if (!Directory.Exists(sPath))
                    Directory.CreateDirectory(sPath);

                string strFilePath = sPath + DateTime.Now.ToString("yyyyMMdd") + ".log";
                StreamWriter mStreamWriter;
                if (File.Exists(strFilePath))
                {
                    mStreamWriter = File.AppendText(strFilePath);
                }
                else
                {
                    FileStream fs = File.Create(strFilePath);
                    mStreamWriter = new StreamWriter(fs);
                }

                mStreamWriter.WriteLine(string.Format("[{0}] 内容：{1} ", DateTime.Now.ToString("HH:mm:ss"), msg));
                if (!string.IsNullOrEmpty(stackTrace))
                    mStreamWriter.WriteLine(string.Format("错误信息：{0}", stackTrace));
                //关闭此文件
                mStreamWriter.Flush();
                mStreamWriter.Close();
            }
            catch { }
        }

        #region 计算两个经纬度间的距离
        private static double rad(double d)
        {
            return d * Math.PI / 180.0;
        }
        /// <summary>
        /// 计算两个经纬度间的距离
        /// </summary>
        /// <param name="lat1"></param>
        /// <param name="lng1"></param>
        /// <param name="lat2"></param>
        /// <param name="lng2"></param>
        /// <returns></returns>
        public double GetDistance(double lat1, double lng1, double lat2, double lng2)
        {
            double EARTH_RADIUS = 6378.137;
            double radLat1 = rad(lat1);
            double radLat2 = rad(lat2);
            double a = radLat1 - radLat2;
            double b = rad(lng1) - rad(lng2);
            double s = 2 * Math.Asin(Math.Sqrt(Math.Pow(Math.Sin(a / 2), 2) +
             Math.Cos(radLat1) * Math.Cos(radLat2) * Math.Pow(Math.Sin(b / 2), 2)));
            s = s * EARTH_RADIUS;
            s = Math.Round(s * 10000) / 10000;
            return s;
        }
        #endregion

        public void InsertCount(string proName, DateTime updateTime, string cityId, string cityName, int dataLevel, int bizType, int count, string remark)
        {
            try
            {
                try
                {
                    /*
                     * 防止首次执行时报以下错误
                     * ORA-03113: 通信通道的文件结束进程 ID: 0会话 ID: 1519 序列号: 47194
                     */
                    DBAcess.Instance().GetDataTable("select * from dual ");
                }
                catch { }

                string sql = string.Format(@"insert into mod_province_result(pro,start_time,city_id,city_name,data_level,biz_type,result,remark)
                                                                    values('{0}',to_date('{1}','yyyy-MM-dd'),{2},'{3}',{4},{5},{6},{7})",
                                                                    proName, updateTime.ToShortDateString(), cityId, cityName, dataLevel, bizType, count, remark);
                DBAcess.Instance().ExecNonQuery(sql);
            }
            catch
            {
                throw new Exception("ORAERROR");
            }
        }
    }
}
