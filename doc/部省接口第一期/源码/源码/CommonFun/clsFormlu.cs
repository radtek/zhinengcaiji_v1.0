using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using NOAP.CommonDB;
using System.Data;

namespace DataCollect.CommonFun
{
    public class clsFormlu
    {
        string strSQL = string.Empty;
        
        /// <summary>
        /// 得到数据文件的英文公式名和中文字段
        /// </summary>
        /// <param name="city_id"></param>
        /// <param name="data"></param>
        /// <param name="classCode"></param>
        /// <returns></returns>
        public string getBasicData(string city_id,clsEnum.DATATYPE data,int classCode,out ArrayList arrChinaName,string timePoint)
        {
            ArrayList arr = new ArrayList();
            arrChinaName = new ArrayList();
            string FieldName = string.Empty;
            int Index=0;
            if (data == clsEnum.DATATYPE.BASICDATA)
            {
                //strSQL = string.Format(@"select * from cfg_provice_perf where DATATYPE={0} and classCode={1}",(int)(clsEnum.DATATYPE.BASICDATA),classCode);

                strSQL = string.Format(@"select * from cfg_provice_perf where DATATYPE={0} and classCode={1} order by ID", (int)(clsEnum.DATATYPE.BASICDATA), classCode);

                //得到模板数据表结构
                DataTable dt = NOAP.CommonDB.DBAcess.Instance().GetDataTable(strSQL);
                if (dt != null && dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        if (dr["CHIAN_NAME"] == null || dr["isuser"] == null) continue;
                        string chinaName = string.Empty;
                        chinaName = dr["CHIAN_NAME"].ToString();
                        arrChinaName.Add(chinaName);
                        string EN_NAME = Convert.ToString(dr["En_Name"]);
                        //if (!EN_NAME.Contains("AS MSC标识"))
                        //EN_NAME = EN_NAME + " as a" + Index;
                        //Index = Index + 1;
                        if (Convert.ToString(dr["isuser"]) == "1") //  表示在SQL语句能够找的得
                        {
                            if (FieldName.Length > 0)
                            {
                                if (chinaName.Trim() == "时间戳")
                                    FieldName = FieldName + ",'" + timePoint+"'";
                                else
                                    FieldName = FieldName + "," + Convert.ToString(dr["En_Name"]);
                            }
                            else
                            {
                                if (chinaName.Trim() == "时间戳")
                                    FieldName = "'"+timePoint+"'";
                                else
                                    FieldName = dr["En_Name"].ToString();
                            }
                        }
                        else
                        {

                            if (FieldName.Length > 0)
                            {
                                FieldName = FieldName + "," + "''";
                            }
                            else
                            {
                                FieldName = "''";
                            }
                        }
                    }
                }
            }
            return FieldName;
        }
        /// <summary>
        /// 获取数据库里字段
        /// </summary>
        /// <param name="city_id"></param>
        /// <param name="data"></param>
        /// <param name="classCode"></param>
        /// <returns></returns>
        public DataTable GetData(string city_id, clsEnum.DATATYPE data, int classCode,string FieldName)
        {
            try
            {
                DataTable dt = new DataTable();

                if (data == clsEnum.DATATYPE.BASICDATA && classCode == 1)  //代表是MSC的数据
                {
                   strSQL = string.Format(@"select {1}
                   from cfg_bsc_map_city bb,cfg_city tt
                   where bb.rowid = any
                  (select max(rowid) from cfg_bsc_map_city group by mscname)
                  and bb.city_id={0} and tt.city_id=bb.city_id", city_id,FieldName);
                  dt = NOAP.CommonDB.DBAcess.Instance().GetDataTable(strSQL);
                }

                if (data == clsEnum.DATATYPE.BASICDATA && classCode==2) //代表是BSC基础数据
                {

                    string strWhere = string.Empty;
                    strWhere = string.Format(@"from NE_BSC_C T1, CFG_VENDORINFO T2, CFG_BSC_MAP_CITY OMC,cfg_ver ver,CFG_CITY CITY
                                             where T1.VENDOR = T2.VENDOR
                                             AND OMC.NE_BSC_ID = T1.NE_SYS_ID
                                             AND T1.CITY_ID=CITY.CITY_ID
                                             AND T1.CITY_ID={0}
                                             order by BSC_ID",city_id);

                    strSQL = string.Format(@"select {0} {1}", FieldName, strWhere);  

                    
                   
//                    strSQL = string.Format(@" SELECT bsc.*,omc.china_name, c.city_name,(select count(*) bts_num from ne_bts_c d where d.related_bsc=bsc.                                          ne_sys_id) bts_num
//                                        from ne_bsc_c bsc, ne_omc_c omc, cfg_city c
//                                        where bsc.related_omc = omc.ne_sys_id
//                                        and bsc.city_id = c.city_id
//                                        and c.city_id={0}", city_id);
                    
                    dt = NOAP.CommonDB.DBAcess.Instance().GetDataTable(strSQL);
                }
                if (data == clsEnum.DATATYPE.BASICDATA && classCode == 3) //代表是BTS的基础数据 
                {

                    string strWhere=string.Empty;
                    strWhere = string.Format(@"  FROM NE_BTS_C         BTS,
                                                   NE_BSC_C         BSC,
                                                   CFG_BSC_MAP_CITY MSC,
                                                   --NE_CELL_C        CELL,
                                                   CFG_VENDORINFO   VED,
                                                   CFG_CITY         CITY,
                                                   CFG_COUNTY       ADM,
                                                   cfg_ver          ver       
                                                     WHERE BTS.RELATED_BSC = BSC.NE_SYS_ID
                                                       AND BSC.NE_SYS_ID = MSC.NE_BSC_ID
                                                       AND BTS.CITY_ID = CITY.CITY_ID
                                                       AND BTS.CITY_ID = BSC.CITY_ID
                                                       --AND BTS.NE_SYS_ID=CELL.RELATED_BTS
                                                       AND ADM.COUNTY_ID(+) = BTS.ADM_AREA
                                                       AND BTS.VENDOR = VED.VENDOR
                                                       AND BTS.CITY_ID={0}",city_id);

                    strSQL = string.Format(@"select {0} {1}", FieldName, strWhere);
                    dt = NOAP.CommonDB.DBAcess.Instance().GetDataTable(strSQL);
                }
                return dt;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 导出DataTable
        /// </summary>
        /// <param name="gView"></param>
        /// <param name="fileName"></param>
        public void ExportCsv(DataTable dt, string fileName, string DirPath, ArrayList dtCaption)
        {
            System.IO.FileStream fileStream = null;
            System.IO.StreamWriter sw = null;
            ArrayList arrColumn = new ArrayList();
            int k = 0;
            try
            {
                if (!System.IO.Directory.Exists(DirPath))
                    System.IO.Directory.CreateDirectory(DirPath);

                fileName = DirPath + "\\" + fileName;
                if (System.IO.File.Exists(fileName))
                    System.IO.File.Delete(fileName);

                fileStream = new System.IO.FileStream(fileName, System.IO.FileMode.Create);//创建一个文件            
                sw = new System.IO.StreamWriter(fileStream, Encoding.Default);//数据流
                StringBuilder sb = new StringBuilder();//写入的文本
                //写入列名
                for (k = 0; k < dtCaption.Count; k++)
                {
                    arrColumn.Add(dtCaption[k].ToString());
                }
                for (int i = 0; i < arrColumn.Count; i++)
                {
                    string caption = arrColumn[i].ToString();
                    sb.Append(caption.Replace("\n", ""));
                    sb.Append(',');
                }
                if (sb.Length > 1) sb = sb.Remove(sb.Length - 1, 1);  //去掉最后一个逗号
                sb.Append("\n");
                //写入内容
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    for (int j = 0; j < dt.Columns.Count; j++)
                    {
                        string columnRes = dt.Rows[i][dt.Columns[j].ColumnName].ToString();
                        columnRes=columnRes.Replace(",", "");
                        columnRes=columnRes.Replace("\r\n", "");
                        columnRes=columnRes.Replace("\r", "");
                        columnRes=columnRes.Replace("\n", "");
                        sb.Append(columnRes);
                        //sb.Append(dt.Rows[i][dt.Columns[j].ColumnName].ToString());
                        sb.Append(',');
                    }
                    if (sb.Length > 1) sb = sb.Remove(sb.Length - 1, 1);  //去掉最后一个逗号
                    sb.Append("\n");
                }
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
        public DataTable GetCitydt()
        {
            //strSQL = "select * from cfg_city where city_id is not null and city_id in(20)";
            //755,757,760,769,752,759,662,668,762,768,663,753,754,660,751//,766,758,756)";
            strSQL = "select city_id,enname from cfg_city where city_id is not null ";
            DataTable dt = NOAP.CommonDB.DBAcess.Instance().GetDataTable(strSQL);
            return dt;    
        }

        public DataTable newGetCitydt()
        {
            //strSQL = "select * from cfg_city where city_id is not null and city_id in(20)";
            //755,757,760,769,752,759,662,668,762,768,663,753,754,660,751//,766,758,756)";
            strSQL = "select city_id,enname from cfg_city where city_id=20";
            DataTable dt = NOAP.CommonDB.DBAcess.Instance().GetDataTable(strSQL);
            return dt;
        }

    }
}
