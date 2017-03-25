using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NOAP.CommonDB;
using System.Data;
using System.Collections;
using System.IO;

using System.IO.IsolatedStorage;
using ICSharpCode.SharpZipLib.Checksums;
using ICSharpCode.SharpZipLib.Zip;

//通用类的生成功能(
namespace DataCollect.CommonFun
{
    public class CommonTool
    {
        string strSQL = string.Empty;
        /// <summary>
        /// 
        /// </summary>
        /// <param name="cityID"></param>
        /// <param name="DataType">业务类型  0:1x , 1:DO</param>
        /// <param name="Level">1 OMC,2.MSC,3BTS,4CELL,5CARRIER</param>
        /// <returns></returns>
        public ArrayList GetMapSQL(string cityID, int DataType, int Level, out ArrayList arrAdd,out ArrayList arrChinaName)
        {
            //BJ_PERF_MSC_1X_20091018.csv
            //ZJ_PERF_MSC_DO_20100118.csv
            //b)	地市、省级：
            //BJ_PERF_CITY_DO_20091018.csv
            //ZJ_PERF_CITY_1X_20100118.csv
            List<string> lstformlu = new List<string>(); //得到公式列表
            ArrayList arrResult = new ArrayList();
            arrAdd = new ArrayList();
            arrChinaName = new ArrayList();
            strSQL = string.Format(@"select * FROM cfg_perf_formula tt where FORMULA_TYPE=7 and ne_type={0} and tt.takeeffect=1 and tt.bustype={1}", DataType, Level);
            DataTable dtFormLu = NOAP.CommonDB.DBAcess.Instance().GetDataTable(strSQL);
            strSQL = "select * from cfg_mapping_perf"; //取的映射的字段名称(全部是华为的公式列表)
            DataTable dt = NOAP.CommonDB.DBAcess.Instance().GetDataTable(strSQL); //得到
            arrResult = GetFieldName(dtFormLu, dt, out arrAdd, out arrChinaName);
            return arrResult;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="tablename"></param>
        /// <param name="FieldName"></param>
        /// <param name="nExelAdd"></param>
        /// <returns></returns>
        public ArrayList GetFiledName(string tablename, ArrayList FieldName, out ArrayList nExelAdd)
        {
            nExelAdd = new ArrayList();
            ArrayList uArray = new ArrayList();
            ArrayList tArray = new ArrayList();
            int i = 0; int j = 0;
            tablename = tablename.ToUpper();
            try
            {
                string sql = string.Format("select * from mod_udfquery_field where tablename='{0}'", tablename);
                DataTable mdt = NOAP.CommonDB.DBAcess.Instance().GetDataTable(sql);


                for (i = 0; i < FieldName.Count; i++)       //数据库己经存在的字段的查找
                {
                    bool Find = false;
                    for (j = 0; j < mdt.Rows.Count; j++)
                    {
                        if (FieldName[i].ToString().ToUpper() == (mdt.Rows[j]["china_name"].ToString().ToUpper()))
                        {
                            Find = true;
                            uArray.Add(mdt.Rows[j]["Field_name"].ToString());
                            tArray.Add(FieldName[i].ToString());
                            break;
                        }
                    }
                    if (!Find)
                    {
                        nExelAdd.Add(FieldName[i].ToString());
                    }
                }
                return uArray;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 在己有的DataTable数据中找己有的字段名称
        /// </summary>
        /// <param name="dtsource">公式字段</param>
        /// <param name="dtFind">要查找的字段</param>
        /// <param name="nExelAdd"></param>
        /// <returns></returns>
        public ArrayList GetFieldName(DataTable dtsource, DataTable dtFind, out ArrayList nExelAdd,out ArrayList ArrChinaNAME)
        {
            nExelAdd = new ArrayList();
            ArrChinaNAME = new ArrayList();
            ArrayList arrFormu = new ArrayList();
            ArrayList tArray = new ArrayList();
            int i = 0; int j = 0;
            try
            {
                for (i = 0; i < dtFind.Rows.Count; i++)          //数据库己经存在的字段的查找(要查找的)
                {
                    if (dtFind.Rows[i] == null) continue;
                    bool Find = false;
                    for (j = 0; j < dtsource.Rows.Count; j++)    //标准库字段
                    {
                        if (dtsource.Rows[j]["ATT_CHNAME"] == null) continue;
                        if (dtFind.Rows[i]["CHIAN_NAME"].ToString().ToUpper() == (dtsource.Rows[j]["ATT_CHNAME"].ToString().ToUpper())) //匹配查找功能
                        {
                            Find = true;
                            arrFormu.Add(dtsource.Rows[j]["FORMULAALL"].ToString());
                            tArray.Add(dtFind.Rows[i]["CHIAN_NAME"].ToString());
                            ArrChinaNAME.Add(dtFind.Rows[i]["CHIAN_NAME"].ToString());
                            break;
                        }
                    }
                    if (!Find)
                    {
                        nExelAdd.Add(dtFind.Rows[i]["CHIAN_NAME"].ToString());
                    }
                }
                return arrFormu;
            }
            catch
            {
                return null;
            }
        }


        /// <summary>
        /// 根据
        /// </summary>
        /// <returns></returns>
        public Dictionary<int,string>  DicGetFieldName()
        {
            Dictionary<int, string> dic = new Dictionary<int, string>();
            strSQL = " select * from cfg_provice_perf t where t.isuser=1 ";         //取的公式的值关系
            DataTable dt = NOAP.CommonDB.DBAcess.Instance().GetDataTable(strSQL);   //取的公式表对应的位置关系
            foreach (DataRow dr in dt.Rows)
            { 
                if (dr["ID"]==null || dr["CHIAN_NAME"]==null) continue;
                int id=Convert.ToInt32(dr["ID"]);
                string china_name = Convert.ToString(dr["CHIAN_NAME"]);
                if (!dic.ContainsKey(id))
                    dic.Add(id, china_name);
            }
            return dic;
        }

        /// <summary>
        /// 要据配置表来获取公式表达式和公式ID号
        /// </summary>
        /// <param name="arrID"></param>
        /// <returns></returns>
        public ArrayList arrGetArrFieldName(out ArrayList arrID,out ArrayList arrEnName)
        {
            arrID = new ArrayList();
            arrEnName = new ArrayList();
            ArrayList arr = new ArrayList();
            //strSQL = " select * from cfg_provice_perf t ";                                                            //取的公式的值关系
            strSQL = " select * from cfg_provice_perf t where t.datatype=2 and classCode=1 and vendor='ZY0808'";        //取的公式的名称

            DataTable dt = NOAP.CommonDB.DBAcess.Instance().GetDataTable(strSQL);   //取的公式表对应的位置关系
            int Index=0;
            foreach (DataRow dr in dt.Rows)
            {
                Index++;
                if (dr["ID"] == null || dr["CHIAN_NAME"] == null || dr["EN_NAME"]==null) continue;
                int id = Convert.ToInt32(dr["ID"]);
                string china_name = Convert.ToString(dr["CHIAN_NAME"]);
                string en_Name=Convert.ToString(dr["EN_NAME"]);
                if (dr["isuser"].ToString() == "1")
                {
                    if (!arr.Contains(china_name))
                    {
                        arr.Add(china_name);
                        arrEnName.Add(en_Name);
                        arrID.Add(id);
                    }
                }
                else
                {
                    en_Name = "0 as a" + Index;
                    if (!arr.Contains(china_name))
                    {
                        arr.Add(china_name);
                        arrEnName.Add(en_Name);
                        arrID.Add(id);
                    }
                
                }
            }
            return arr;
        }
        /// <summary>
        /// 根据传入的ArrayList来输出公式名称
        /// </summary>
        /// <param name="arrayResult"></param>
        /// <param name="CITYID">城市名称</param>
        /// <param name="tableName">对应的表名</param>
        /// <param name="TimeCount">汇总的时间间隔</param>
        /// <returns></returns>
        public DataTable GetBSCdt(ArrayList arrayResult, string CITYID, string tableName, int TimeCount) //按照小时来汇
        {
            DataTable dt = new DataTable();

            try
            {
                string FieldName = string.Empty; //组装数据库的字段
                for (int i = 0; i < arrayResult.Count; i++)
                {
                    if (FieldName.Length > 0)
                    {
                        FieldName = FieldName + "," + arrayResult[i].ToString();
                    }
                    else
                    {
                        FieldName = arrayResult[i].ToString();
                    }
                }
                //if (TimeCount==1) //表示是按照地市来统计

                strSQL = string.Format(@"select '{0}' from '{1}' where cityID={3} group by to_char(start_time,'YYYY-MM-DD HH')", FieldName, tableName, CITYID);
                dt = NOAP.CommonDB.DBAcess.Instance().GetDataTable(strSQL);
                return dt;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 根据传入的ArrayList来输出公式名称
        /// </summary>
        /// <param name="arrayResult"></param>
        /// <param name="tableName">对应的表名</param>
        /// <param name="TimeCount">汇总的时间间隔</param>
        /// <returns></returns>
        public DataTable GetBSCdt(ArrayList arrayResult, string tableName, int TimeCount, out ArrayList arrColumnName) //按照小时来汇
        {
            arrColumnName = new ArrayList();
            DataTable dt = new DataTable();
            string AsName = string.Empty;
            try
            {
                string FieldName = string.Empty; //组装数据库的字段
                for (int i = 0; i < arrayResult.Count; i++)
                {
                    #region 注释功能
                    //if (FieldName.Length > 0)
                    //{
                    //    //FieldName = FieldName + "," + arrayResult[i].ToString();
                    //    FieldName = FieldName + "," + arrayResult[i].ToString() + " as a" +  i ;
                    //}
                    //else
                    //{
                    //    //FieldName = arrayResult[i].ToString();
                    //    FieldName = arrayResult[i].ToString() + " as a" + i ; 
                    //}

                    //if (AsName.Length > 0)  //得到别名
                    //{
                    //    AsName = AsName + "," + "a.a" + i;
                    //}
                    //else
                    //{
                    //    AsName = "a.a" + i;
                    //}
                    #endregion
                    if (FieldName.Length > 0)
                    {
                        FieldName = FieldName + "," + arrayResult[i].ToString();
                    }
                    else
                    {
                        FieldName = arrayResult[i].ToString();
                    }
                }
                arrColumnName.Add("MSC标志");
                arrColumnName.Add("数据时间点");
                arrColumnName.Add("MSC名称");
                arrColumnName.Add("省份");
                arrColumnName.Add("城市");
                //按照MSC级别来区分公式
                strSQL = string.Format(@"select {0} from {1} where city_ID={2} and start_time>=to_date('2010-2-1 00:00:00','YYYY-MM-DD HH24:MI:SS')         
                                        and start_time<=to_date('2010-2-1 23:00:00','YYYY-MM-DD HH24:MI:SS')
                                        
                group by to_char(start_time,'YYYY-MM-DD HH'),china_name", FieldName, tableName, 20);
                #region 汇总级别
                //按照MSC级别来区分公式
//                strSQL = string.Format(@"select a.china_name as china_name1,a.start_time,b.city_name,b.city_name as city_name1,a.*                    
//                                                    from
//                                                    (select china_name,
//                                                           to_char(start_time, 'YYYY-MM-DD HH') as start_time,
//                                                           city_id,{0}
//                                                      from {1}  
//                                                     where city_ID = {2}
//                                                       and start_time >= to_date('2010-2-1 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
//                                                       and start_time <= to_date('2010-2-1 23:00:00', 'YYYY-MM-DD HH24:MI:SS') 
//                                                     group by to_char(start_time, 'YYYY-MM-DD HH'),china_name,city_id) a,cfg_city b     
//                                                     where a.city_id = b.city_id",FieldName,tableName,20);

                //按照MSC级别来区分公式
                strSQL = string.Format(@"select  a.china_name,a.china_name as china_name1,a.start_time,b.city_name,b.city_name as city_name1,{3}                                                               
                                                    from
                                                    (select china_name,
                                                           to_char(start_time, 'YYYY-MM-DD HH') as start_time,
                                                           city_id,{0}
                                                      from {1}  
                                                     where city_ID = {2}
                                                       and start_time >= to_date('2010-2-1 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
                                                       and start_time <= to_date('2010-2-1 23:00:00', 'YYYY-MM-DD HH24:MI:SS') 
                                                     group by to_char(start_time, 'YYYY-MM-DD HH'),china_name,city_id) a,cfg_city b     
                                                     where a.city_id = b.city_id order by a.start_time,a.china_name", FieldName, tableName, 20, AsName);



                //按照MSC级别来区分公式
                strSQL = string.Format(@"select  a.china_name,a.china_name as china_name1,a.start_time,b.city_name,b.city_name as city_name1,{3}                                                               
                                                    from
                                                    (select china_name,
                                                           to_char(start_time, 'YYYY-MM-DD HH') as start_time,
                                                           city_id,{0}
                                                      from {1}  
                                                     where city_ID = {2}
                                                       and start_time >= to_date('2010-2-1 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
                                                       and start_time <= to_date('2010-2-1 23:00:00', 'YYYY-MM-DD HH24:MI:SS') 
                                                     group by to_char(start_time, 'YYYY-MM-DD HH'),china_name,city_id) a,cfg_city b     
                                                     where a.city_id = b.city_id order by a.start_time,a.china_name", FieldName, tableName, 20, AsName);

                #endregion
                strSQL = string.Format(@"select b.mscname,
                                      to_char(start_time, 'YYYY-MM-DD HH') as start_time,
                                      b.mscname,
                                      c.CITY_NAME,
                                      c.CITY_NAME,  
                                      {0} 
                                      from {1} c, cfg_bsc_map_city b,cfg_city d
                                      where c.CHINA_NAME = b.bscname
                                      and start_time >= to_date('2010-2-1 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
                                                   and start_time <= to_date('2010-2-1 23:00:00', 'YYYY-MM-DD HH24:MI:SS') 

                                      and c.CITY_ID = {2}
                                      and b.city_id=d.city_id
                                      and c.CITY_ID=d.city_id
                                      group by b.mscname, to_char(start_time, 'YYYY-MM-DD HH'),c.CITY_NAME
                                      order by b.mscname, start_time", FieldName, tableName, 20);

                //strSQL = string.Format(@"select {0} from {1} where city_ID={2} and start_time>=to_date('2010-2-1 00:00:00','YYYY-MM-DD HH24:MI:SS')
                //and start_time<=to_date('2010-2-1 23:00:00','YYYY-MM-DD HH24:MI:SS')
                //group by to_char(start_time,'YYYY-MM-DD HH')", FieldName, tableName,20);
                dt = NOAP.CommonDB.DBAcess.Instance().GetDataTable(strSQL);
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
        public void ExportCsv(DataTable dt, string fileName,string DirPath,ArrayList dtCaption,ArrayList dtOther,ArrayList NoArrayList)
        {
            System.IO.FileStream fileStream = null;
            System.IO.StreamWriter sw = null;
            ArrayList arrColumn = new ArrayList();
            int k=0;
            try
            {
                if (!System.IO.Directory.Exists(DirPath))
                    System.IO.Directory.CreateDirectory(DirPath);
                
                fileName = DirPath + "\\" + fileName;
                if(System.IO.File.Exists(fileName))
                    System.IO.File.Delete(fileName);

                fileStream = new System.IO.FileStream(fileName, System.IO.FileMode.Create);//创建一个文件            
                sw = new System.IO.StreamWriter(fileStream, Encoding.Default);//数据流
                StringBuilder sb = new StringBuilder();//写入的文本
                //写入列名

                for (k = 0; k < dtOther.Count; k++)
                {
                    arrColumn.Add(dtOther[k].ToString());
                }
                for (k = 0; k < dtCaption.Count; k++)
                {
                    arrColumn.Add(dtCaption[k].ToString());
                }
                for (k = 0; k < NoArrayList.Count; k++)
                {
                    arrColumn.Add(NoArrayList[k].ToString());  
                }


                for (int i = 0; i < arrColumn.Count; i++)
                {
                    string caption = arrColumn[i].ToString();
                    sb.Append(caption.Replace("\n", ""));
                    sb.Append(',');
                }
                sb.Append("\n");
                //写入内容
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    for (int j = 0; j < dt.Columns.Count; j++)
                    {
                            sb.Append(dt.Rows[i][dt.Columns[j].ColumnName].ToString());
                            sb.Append(',');
                    }
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
        /// <summary>
        /// 
        /// </summary>
        /// <param name="cityID"></param>
        /// <param name="DataType">业务类型  0:1x , 1:DO</param>
        /// <param name="Level">1 OMC,2.MSC,3BTS,4CELL,5CARRIER</param>
        /// <returns></returns>
        public ArrayList NewGetMapSQL(string cityID, int DataType, int Level, out ArrayList arrID,out ArrayList ArrEnname)
        {
            //BJ_PERF_MSC_1X_20091018.csv
            //ZJ_PERF_MSC_DO_20100118.csv
            //b)	地市、省级：
            //BJ_PERF_CITY_DO_20091018.csv
            //ZJ_PERF_CITY_1X_20100118.csv
            List<string> lstformlu = new List<string>(); //得到公式列表
            ArrayList arrResult = new ArrayList();
            arrID = new ArrayList();
            ArrEnname = new ArrayList();
            strSQL = string.Format(@"select * FROM cfg_perf_formula tt where FORMULA_TYPE=7 and ne_type={0} and tt.takeeffect=1 and tt.bustype={1}", DataType, Level);
            DataTable dtFormLu = NOAP.CommonDB.DBAcess.Instance().GetDataTable(strSQL);
            strSQL = "select * from cfg_mapping_perf"; //取的映射的字段名称(全部是华为的公式列表)
            DataTable dt = NOAP.CommonDB.DBAcess.Instance().GetDataTable(strSQL); //得到
            arrResult = this.arrGetArrFieldName(out arrID, out ArrEnname);
            return arrResult;
        }
        /// <summary>
        /// 获取表的中文字段
        /// </summary>
        /// <returns></returns>
        public ArrayList arrNewFieldName()
        {
            ArrayList arr = new ArrayList();
            strSQL = " select * from cfg_provice_perf";                             //取的公式的值关系
            
            DataTable dt = NOAP.CommonDB.DBAcess.Instance().GetDataTable(strSQL);   //取的公式表对应的位置关系
            foreach (DataRow dr in dt.Rows)
            {
                if (dr["ID"] == null || dr["CHIAN_NAME"] == null || dr["EN_NAME"] == null) continue;
                int id = Convert.ToInt32(dr["ID"]);
                string china_name = Convert.ToString(dr["CHIAN_NAME"]);
                string en_Name = Convert.ToString(dr["EN_NAME"]);
                arr.Add(china_name);
            }
            return arr;
        }

        /// <summary>
        /// 根据地市来绑定厂家
        /// </summary>
        /// <param name="city_id"></param>
        /// <returns></returns>
        public string BindVendor(string city_id)
        {
            strSQL = string.Format(@" select distinct vendor from ne_bsc_c where city_id={0} and city_id is not null", city_id);
            DataTable dt = NOAP.CommonDB.DBAcess.Instance().GetDataTable(strSQL);
            string vendor = string.Empty;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (vendor.Length > 0)
                {
                    vendor = vendor + ",'" + dt.Rows[i]["vendor"].ToString() + "'";
                }
                else
                {
                    //vendor = dt.Rows[i]["vendor"].ToString();
                    vendor ="'" + dt.Rows[i]["vendor"].ToString() + "'";
                }
            }
            return vendor;
        }

        /// <summary>
        /// 根据地市来绑定厂家
        /// </summary>
        /// <param name="city_id"></param>
        /// <returns></returns>
        public string BindVendor()
        {
            strSQL = string.Format(@" select distinct vendor from ne_bsc_c");
            DataTable dt = NOAP.CommonDB.DBAcess.Instance().GetDataTable(strSQL);
            string vendor = string.Empty;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (vendor.Length > 0)
                {
                    vendor = vendor + ",'" + dt.Rows[i]["vendor"].ToString() + "'";
                }
                else
                {
                    vendor ="'" + dt.Rows[i]["vendor"].ToString()+ "'";
                }
            }
            return vendor;
        }

        public void WriteLog(string Msg, string Source)
        {
            try
            {
                string LogPath = System.Configuration.ConfigurationManager.AppSettings["LogPath"].TrimEnd('\\') + "\\";
                if (!Directory.Exists(LogPath))
                    Directory.CreateDirectory(LogPath);
                LogPath += DateTime.Now.ToString("yyyy-MM-dd") + "\\";
                if (!Directory.Exists(LogPath))
                    Directory.CreateDirectory(LogPath);

                LogPath += DateTime.Now.Hour.ToString() + ".log";

                StreamWriter sw = new StreamWriter(LogPath, true, Encoding.Default);
                sw.WriteLine(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "\t" + Msg + "\t" + Source);
                sw.Close();
            }
            catch
            {
            }
        }

        /// <summary>
        ///生成城市名称格式
        /// </summary>
        /// <returns></returns>
        public DataTable dtcity()
        {
            try
            {
                strSQL = "select * from cfg_city where city_id is not null";
                DataTable dt = NOAP.CommonDB.DBAcess.Instance().GetDataTable(strSQL);
                return dt;
            }
            catch (Exception ex)
            {
                WriteLog(ex.Message + ex.StackTrace, "生成城市名称出错");
                return null;
            }
        }


        /// <summary>
        /// 增加压缩文件的方法
        /// </summary>
        /// <param name="path"></param>
        /// <param name="M"></param>
        /// <param name="strsuff"></param>
        /// <returns></returns>
        public string CreateZIPFile(string path, int M, string strsuff,string ExtName)
        {
            try
            {
                Crc32 crc = new Crc32();//未压缩的
                path = path + "\\";

                string tmpstrsuff = strsuff.ToUpper().Replace(".CSV", ".");
                string strZipNAME = tmpstrsuff + ExtName;
                

                
                //ICSharpCode.SharpZipLib.Zip.ZipOutputStream zipout = new ICSharpCode.SharpZipLib.Zip.ZipOutputStream(System.IO.File.Create(path + ".zip"));

                ICSharpCode.SharpZipLib.Zip.ZipOutputStream zipout = new ICSharpCode.SharpZipLib.Zip.ZipOutputStream(System.IO.File.Create(path + strZipNAME));

                System.IO.FileStream fs = System.IO.File.OpenRead(path + strsuff);
                long pai = 1024 * 1024 * M;//每M兆写一次

                long forint = fs.Length / pai + 1;
                byte[] buffer = null;
                zipout.SetLevel(7);
                ZipEntry entry = new ZipEntry(System.IO.Path.GetFileName(path+ "\\"+ strsuff));
                entry.Size = fs.Length;
                entry.DateTime = DateTime.Now;
                zipout.PutNextEntry(entry);
                for (long i = 1; i <= forint; i++)
                {
                    if (pai * i < fs.Length)
                    {
                        buffer = new byte[pai];
                        fs.Seek(pai * (i - 1), System.IO.SeekOrigin.Begin);
                    }
                    else
                    {
                        if (fs.Length < pai)
                        {
                            buffer = new byte[fs.Length];
                        }
                        else
                        {
                            buffer = new byte[fs.Length - pai * (i - 1)];
                            fs.Seek(pai * (i - 1), System.IO.SeekOrigin.Begin);
                        }
                    }
                    fs.Read(buffer, 0, buffer.Length);
                    crc.Reset();
                    crc.Update(buffer);
                    zipout.Write(buffer, 0, buffer.Length);
                    zipout.Flush();
                }
                fs.Close();
                zipout.Finish();
                zipout.Close();

                //System.IO.File.Delete(path + strsuff);
                return path + strsuff + ExtName;
            }
            catch (Exception ex)
            {
                string str = ex.Message;
                return path;
            }
        }
    }
}
