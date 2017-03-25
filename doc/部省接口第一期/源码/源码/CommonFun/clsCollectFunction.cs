using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using DataCollect.CommonFun;

namespace DataCollect.CommonFun
{
    /// <summary>
    /// 调配任务表(以此来确定程序的启动功能)
    /// </summary>
    public class clsCollectFunction
    {
        CommonTool cls=new CommonTool();
        string StrSQL = string.Empty;
        /// <summary>
        ///获取某个表的采集信息
        /// </summary>
        /// <param name="datatype"></param>
        /// <param name="classCode"></param>
        public clsEnity CollectTTime(clsEnum.DATATYPE datatype, int classCode, string objectid)
        {
            DataTable dt = new DataTable();
            clsEnity clsTable = new clsEnity();
            int BigType=(int)(datatype); //取的大的类别结构;
            try
            {
                StrSQL = string.Format(@"select tt.*,ta.*,to_char( sysdate,'yyyy-mm-dd') as datatime_now from collect_user tt,collect_table ta where 
                                    tt.tablelist=ta.objectid and ta.objectid={0}",objectid);              //表信息和表详细信息表
                dt = NOAP.CommonDB.DBAcess.Instance().GetDataTable(StrSQL);                               //获取采集的数据表
                foreach (DataRow dr in dt.Rows)
                {
                    if(dr["objectID"]!=null || dr["objectID"].ToString()!="")
                        clsTable.ObjectID = Convert.ToInt32(dr["objectID"].ToString());
                    clsTable.PassWord = Convert.ToString(dr["PassWord"]);
                    clsTable.TableList = Convert.ToString(dr["TableList"]);
                    clsTable.Tel=Convert.ToString(Convert.ToString(dr["TEL"]));
                    clsTable.LoginPath=Convert.ToString(dr["LoginPath"]);
                    if (dr["DATATYPE"] != null || dr["DATATYPE"].ToString() != "")
                    clsTable.DataType=Convert.ToInt32(dr["DATATYPE"]);
                    clsTable.ColInterval = Convert.ToString(dr["ColInterval"]);
                    if (dr["ClassCode"] != null || dr["ClassCode"].ToString() != "")
                    clsTable.ClassCode = Convert.ToInt32(dr["ClassCode"]);
                    //if (dr["City_id"] != null || dr["City_id"].ToString() != "")
                    //clsTable.City_id = Convert.ToInt32(dr["City_id"]);
                    
                    clsTable.Addstart_time = Convert.ToString(dr["Addstart_time"]);
                    clsTable.Start_time = Convert.ToDateTime(dr["start_time"].ToString());
                    clsTable.End_time = Convert.ToDateTime(dr["end_time"].ToString());
                    clsTable.Filename = Convert.ToString(dr["filename"]);
                    clsTable.FilePath = Convert.ToString(dr["filepath"]);
                    clsTable.Collect_time = (Convert.ToDateTime(dr["datatime_now"].ToString() + " " + (Convert.ToDateTime(dr["collect_time"].ToString())).ToString("HH:mm:dd"))).AddDays(-1);
                }
                return clsTable;
                //CollectData(datatype,clsTable);
            }
            catch(Exception ex)
            { 
                cls.WriteLog("动态采集出集出错",ex.Message+ex.StackTrace);
                return null;
            }
        }
        /// <summary>
        /// 具体的采集数据(如果不用时间控件)
        /// </summary>
        private void CollectData(clsEnum.DATATYPE datatype,clsEnity Entity) 
        {
            if (datatype ==clsEnum.DATATYPE.BASICDATA) //基础数据的功能输出
            { 
                //定点采集程序
            }
        }
    }
}
