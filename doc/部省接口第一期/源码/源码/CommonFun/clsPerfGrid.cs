using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Collections;

namespace DataCollect.CommonFun
{
    public class clsPerfGrid
    {
        //1度等于 111.11公里查的
        clsPerf clsPerf = new clsPerf();
        CommonTool clsTool = new CommonTool();
        
        string strSQL = string.Empty;
        string[,] arrGrid;
        List<clsPoi> lstBigPoi = new List<clsPoi>();            //得到大格子的结构图
        //得到小格子的数据结构
        ArrayList arrayData = new ArrayList();
        //Dictionary<int, int> dic = new Dictionary<int, int>();
        /// <summary>
        /// 得到数据组构(0.01表示是1KM的间隔)(以前的换算是0.001)来进行处理的
        /// </summary>
        /// <param name="city_id"></param>
        /// <returns></returns>
        public string[,] array(int city_id, out int XResultLengTh, out int YResultLengTh)
        {
            int i=0;
            int longitude_lb =-1;
            int latitude_lb = -1;

            int XLengTh = 0;
            int YLengTh = 0;
            
            strSQL = string.Format(@" select * from cfg_city where city_id ={0}",city_id);
            DataTable dt = NOAP.CommonDB.DBAcess.Instance().GetDataTable(strSQL);
            clsPoi Poi = new clsPoi();

           	//113.9772	24.59921	116.6004	27.0461		
            //取的城市的左上角，右下角
            for (i = 0; i < dt.Rows.Count; i++)
            {
                Poi.longitude_lb = Convert.ToSingle(dt.Rows[i]["longitude_lb"].ToString());    //经度 左上角
                Poi.latitude_lb = Convert.ToSingle(dt.Rows[i]["latitude_lb"].ToString());      //纬度

                Poi.longitude_rb = Convert.ToSingle(dt.Rows[i]["longitude_rb"].ToString());
                Poi.latitude_rb = Convert.ToSingle(dt.Rows[i]["latitude_rb"].ToString());
            }
            //获取大格子的值
            for (double k = Poi.longitude_lb; k < Poi.longitude_rb; k = k + 0.01f)     //经度
            {
                longitude_lb = longitude_lb + 1;  //x轴的表示方法
            }
            for (double j = Poi.latitude_lb; j < Poi.latitude_rb; j = j + 0.01f)       //纬度
            {
                latitude_lb = latitude_lb + 1;    //y轴的表示方法
            }
            arrGrid = new string[longitude_lb, latitude_lb];
            XLengTh = longitude_lb;
            YLengTh = latitude_lb;

            XResultLengTh = XLengTh;
            YResultLengTh = YLengTh;

            longitude_lb = -1;
            latitude_lb = -1; ;

            #region 注释
            //获取经续度的值结构图
            for (double u = Poi.longitude_lb; u < Poi.longitude_rb; u = u + 0.01f)     //经度
            {
                longitude_lb = longitude_lb + 1;
                if (longitude_lb >= XLengTh)
                {
                    break;
                }
                for (double v = Poi.latitude_lb; v < Poi.latitude_rb; v = v + 0.01f)   //纬度
                {
                    latitude_lb = latitude_lb + 1;
                    if (latitude_lb >= YLengTh)
                    {
                        latitude_lb = -1;
                        continue;
                    }
                    clsPoi BigPoi = new clsPoi();
                    BigPoi.longitude_lb = u;
                    BigPoi.latitude_lb = v;

                    BigPoi.longitude_rb = u + 0.01f;
                    BigPoi.latitude_rb = v + 0.01f;

                    lstBigPoi.Add(BigPoi);    //临时获取点的X轴的坐标

                    string strResult = Convert.ToString(u) + "|" + Convert.ToString(v);
                    arrGrid[longitude_lb, latitude_lb] = strResult;
                }
            }
            #endregion
            return arrGrid;
        }

        /// <summary>
        /// 得到城市的大格子
        /// </summary>
        /// <param name="city_id"></param>
        /// <param name="Initlongitude"></param>
        /// <param name="Initlatitude"></param>
        /// <param name="xLength"></param>
        /// <param name="yLength"></param>
        /// <returns></returns>
        public List<clsPoi> Bigarray(int city_id, out double Initlongitude, out double Initlatitude, out int xLength, out int yLength)
        {
            List<clsPoi> bigPoiList = new List<clsPoi>();   
            Initlongitude = 0f; //经度
            Initlatitude = 0f; //纬度
            xLength = 0;
            yLength = 0;

            int longitude_lb = -1;
            int latitude_lb = -1;

            strSQL = string.Format(@" select * from cfg_city where city_id ={0}", city_id);
            DataTable dt = NOAP.CommonDB.DBAcess.Instance().GetDataTable(strSQL);
            if (dt == null || dt.Rows.Count == 0)
            {
                return new List<clsPoi>();
            }
            clsPoi Poi = new clsPoi();

            //113.9772	24.59921	116.6004	27.0461		
            //取的城市的左上角，右下角
            Poi.longitude_lb = Convert.ToSingle(dt.Rows[0]["longitude_lb"].ToString()); //经度 左上角
            Poi.latitude_lb = Convert.ToSingle(dt.Rows[0]["latitude_lb"].ToString()); //纬度

            Poi.longitude_rb = Convert.ToSingle(dt.Rows[0]["longitude_rb"].ToString());
            Poi.latitude_rb = Convert.ToSingle(dt.Rows[0]["latitude_rb"].ToString());

            Initlongitude = Poi.longitude_lb;
            Initlatitude = Poi.latitude_rb;

            //获取经续度的值结构图
            double lb_longitude = Convert.ToSingle(Math.Round(Poi.longitude_lb, 2));
            double rb_latitude = Convert.ToSingle(Math.Round(Poi.latitude_rb, 2));

            for (double u = lb_longitude; u < Poi.longitude_rb; u += 0.01f) //经度
            {
                longitude_lb = longitude_lb + 1;
                for (double v = rb_latitude; v > Poi.latitude_lb; v -= 0.01f) //纬度
                {
                    latitude_lb = latitude_lb + 1;
                    clsPoi BigPoi = new clsPoi();
                    BigPoi.longitude_lb = Convert.ToSingle(Math.Round(u, 2));
                    BigPoi.latitude_lb = Convert.ToSingle(Math.Round(v, 2));

                    BigPoi.longitude_rb = Convert.ToSingle(Math.Round(Convert.ToDouble(u + 0.01f), 2));
                    BigPoi.latitude_rb = Convert.ToSingle(Math.Round(Convert.ToDouble(v - 0.01f), 2));

                    BigPoi.Row = latitude_lb;
                    BigPoi.Column = longitude_lb;

                    BigPoi.longitudeandlatitude = Convert.ToString(BigPoi.longitude_lb*100) +
                                                  Convert.ToString(BigPoi.latitude_lb*100);

                    bigPoiList.Add(BigPoi);
                }

                if (yLength == 0)
                    yLength = latitude_lb;

                latitude_lb = -1;
            }

            xLength = longitude_lb;

            return bigPoiList;
        }

        /// <summary>
        ///得到经纬度的DataTabel
        /// </summary>
        /// <param name="CITY_ID"></param>
        /// <param name="strTime"></param>
        /// <returns></returns>
        public Hashtable htdt(int CITY_ID, string strTime)
        {
            Hashtable ht = new Hashtable();
            try
            {
                DataTable dt = new DataTable();

                strSQL = string.Format(@"select key,
                                        sum(nvl(voice_call_num,0)) as voice_call_num,
                                        sum(nvl(data_call_num,0))  as data_call_num,
                                        sum(nvl(voice_drop_num,0)) as voice_drop_num,
                                        sum(nvl(data_drop_num,0))  as data_drop_num,
                                        sum(nvl(dodata_call_num,0)) as dodata_call_num,
                                        sum(nvl(callnum,0))
                                        from (select longitude * 100 || latitude * 100 key,
                                        voice_call_num,
                                        voice_drop_num,
                                        data_call_num,
                                        data_drop_num,
                                        dodata_call_num,
                                        callnum
                                        from (select trunc(to_number(substr(GRID_ID, length(GRID_ID) - 4, 5)) / 1000,
                                                     2.1) as latitude,
                                               trunc(to_number(substr(grid_id, 0, length(grid_id) - 5)) / 1000,
                                                     2.1) as longitude,
                                               t.voice_call_num,
                                               t.voice_drop_num,
                                               t.data_call_num,
                                               t.data_drop_num,
                                               t.dodata_call_num,
                                               t.callnum
                                          from mod_cdl_grid t
                                         where city_id={0} and {1}
                                         order by longitude))
                                        group by key", CITY_ID, strTime);
                dt = NOAP.CommonDB.DBAcess.Instance().GetDataTable(strSQL);
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

                    if (dr["dodata_call_num"] != null && dr["dodata_call_num"].ToString() != "")
                        cls.DODATA_CALL_NUM = Convert.ToSingle(dr["dodata_call_num"]);
                    else
                        cls.DODATA_CALL_NUM = 0;

                    if (dr["voice_call_num"] != null && dr["voice_call_num"].ToString() != "")
                        cls.Voice_call_num = Convert.ToSingle(dr["voice_call_num"]);
                    else
                        cls.Voice_call_num = 0;

                    if (dr["voice_drop_num"] != null && dr["voice_drop_num"].ToString() != "")
                        cls.Voice_drop_num = Convert.ToSingle(dr["voice_drop_num"]);
                    else
                        cls.Voice_drop_num = 0;

                    string strkey = dr["key"].ToString().Trim();

                    if (!ht.ContainsKey(strkey))
                        ht.Add(strkey, cls);
                }
                 return ht;
            }

            catch(Exception ex)
            {
                return ht;
            }
        }

        /// <summary>
        ///得到经纬度的DataTabel
        /// </summary>
        /// <param name="CITY_ID"></param>
        /// <param name="strTime"></param>
        /// <returns></returns>
        public Hashtable htdtDo( int CITY_ID, string strTime)
        {
            Hashtable ht = new Hashtable();
            try
            {
                DataTable dt = new DataTable();
                strSQL = string.Format(@"select key,
                                        sum(nvl(dodata_call_num,0)) as dodata_call_num
                                        from (select longitude * 100 || latitude * 100 key,
                                        dodata_call_num
                                        from (select trunc(to_number(substr(GRID_ID, length(GRID_ID) - 4, 5)) / 1000,
                                                     2.1) as latitude,
                                               trunc(to_number(substr(grid_id, 0, length(grid_id) - 5)) / 1000,
                                                     2.1) as longitude,
                                               t.dodata_call_num
                                          from mod_cdl_do_grid t
                                         where city_id={0} and {1}
                                         order by longitude))
                                        group by key", CITY_ID, strTime);
                dt = NOAP.CommonDB.DBAcess.Instance().GetDataTable(strSQL);
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

            catch (Exception ex)
            {
                return ht;
            }
        }

        /// <summary>
        /// 有多少个小格存在于大格中
        /// </summary>
        /// <returns></returns>
        public DataTable getsmallExistBig(DataTable dt, List<clsPoi> clsPoi, 
                                          int XLength,int YLength,int city_id,
                                          DateTime date, string strTime, float minlongitude, float maxlongitude) 
                                            
        {
            try
            {
                string result = string.Empty;
                DataTable dt1 = new DataTable();
                for (int i = 0; i < clsPoi.Count; i++)   //大格子是一个范围的值(即对角线的值结构)
                {
                    //遍历查找功能函数。确定有多少格子在这个大格子中(callnum;dropnum)
                    clsResult cls = new clsResult();
                    cls.LsData = new List<clsData>();
                    clsPoi clsP = clsPoi[i] as clsPoi;
                    //if (clsP.longitude_lb <= minlongitude) continue;  //
                    double longitude_lb = clsP.longitude_lb; //左下角的坐标
                    double latitude_lb = clsP.latitude_lb;   //左下角的坐标的结构对象

                    double longitude_rb = clsP.longitude_rb; //右上角的坐标
                    double latitude_rb = clsP.latitude_rb;   //右上角的坐标

                    string strWhere = string.Format(@"latitude>={0} and longitude>={1} and 
                                               latitude<={2} and longitude<={3}"
                                                   , latitude_lb, longitude_lb, latitude_rb, longitude_rb);
                    
                    DataRow[] dr = dt.Select(strWhere,"longitude asc");
                    for (int kk = 0; kk < dr.Length; kk++)
                    {
                        clsData clsquota = new clsData();
                        #region 性能指标
                        if (dr[kk]["voice_call_num"] != null && dr[kk]["voice_call_num"].ToString() != "")  //接入次数(1X语音业务)
                        {
                            clsquota.Voice_call_num = Convert.ToSingle(dr[kk]["voice_call_num"]);           
                        }
                        else
                        {
                            clsquota.Voice_call_num = 0;
                        }
                        if (dr[kk]["voice_drop_num"] != null && dr[kk]["voice_drop_num"].ToString() != "")  //掉话次数(1X语音业务)
                        {
                            clsquota.Voice_drop_num = Convert.ToSingle(dr[kk]["Voice_drop_num"]);          
                        }
                        else
                        {
                            clsquota.Voice_drop_num = 0;
                        }
                        if (dr[kk]["data_call_num"] != null && dr[kk]["data_call_num"].ToString() != "")   //接入次数(1X数据业务)
                        {
                            clsquota.Data_call_num = Convert.ToSingle(dr[kk]["data_call_num"]);
                        }
                        else
                        {
                            clsquota.Data_call_num = 0;
                        }

                        if (dr[kk]["data_drop_num"] != null && dr[kk]["data_drop_num"].ToString() != "")   //掉话次数(1X数据业务)
                        {
                            clsquota.Data_drop_num = Convert.ToSingle(dr[kk]["data_drop_num"]);
                        }
                        else
                        {
                            clsquota.Data_drop_num = 0;
                        }

                        if (dr[kk]["DODATA_CALL_NUM"] != null && dr[kk]["DODATA_CALL_NUM"].ToString() != "") //DO业务：接入次数DODATA_CALL_NUM  
                        {
                            clsquota.DODATA_CALL_NUM = Convert.ToSingle(dr[kk]["DODATA_CALL_NUM"]);
                        }
                        else
                        {
                            clsquota.DODATA_CALL_NUM = 0;
                        }
                        #endregion
                        //clsquota.Data_drop_num = Convert.ToSingle(dr[kk]["callnum"]);                   
                        //clsquota.Voice_call_num = Convert.ToSingle(dr[kk]["callnum"]);
                        cls.Latitude = dt.Rows[kk]["latitude"].ToString();
                        cls.Longitude = dt.Rows[kk]["longitude"].ToString();
                        if (dr[kk]["GRID_ID"] != null && dr[kk]["GRID_ID"].ToString() != "")
                        {
                            clsquota.XYZUOBIAO = Convert.ToString(dr[kk]["GRID_ID"]);              //确定坐标点
                        }
                        clsquota.Row = clsP.Row;                                                   //得到行号
                        clsquota.Column = clsP.Column;                                             //得到列号
                        cls.LsData.Add(clsquota);
                    }
                    arrayData.Add(cls); //得到所有大格子的数据结构
                } //得到个数据结构图
                dt1 = getZhiBiao(arrayData, city_id, date, strTime);
                return dt1;
            }
            catch(Exception ex)
            {
                clsTool.WriteLog(ex.Message + ex.StackTrace, "getsmallExistBig大格子里有多少个小格子");
                return null;
            }
        }


        /// <summary>
        /// 有多少个小格存在于大格中
        /// </summary>
        /// <returns></returns>
        public DataTable newgetsmallExistBig(DataTable dt, List<clsPoi> clsPoi,
                                             int XLength, int YLength, int city_id,
                                             DateTime date, string strTime, float minlongitude, float maxlongitude)
        {
            try
            {
                string result = string.Empty;
                DataTable dt1 = new DataTable();

                dt1.Columns.Add(new DataColumn("col"));
                dt1.Columns.Add(new DataColumn("row"));
                dt1.Columns.Add(new DataColumn("voice_call_num"));
                dt1.Columns.Add(new DataColumn("voice_drop_num"));
                dt1.Columns.Add(new DataColumn("data_call_num"));
                dt1.Columns.Add(new DataColumn("data_drop_num"));
                dt1.Columns.Add(new DataColumn("DODATA_CALL_NUM"));

                //查找功能函数
                for (int kk = 0; kk < dt.Rows.Count; kk++)
                {
                    for (int i = 0; i < clsPoi.Count; i++)   //大格子是一个范围的值(即对角线的值结构)
                    {
                        //遍历查找功能函数。确定有多少格子在这个大格子中(callnum;dropnum)
                        clsResult cls = new clsResult();
                        cls.LsData = new List<clsData>();
                        clsPoi clsP = clsPoi[i] as clsPoi;

                        double longitude_lb = clsP.longitude_lb; //左下角的坐标
                        double latitude_lb = clsP.latitude_lb;   //左下角的坐标的结构对象

                        double longitude_rb = clsP.longitude_rb; //右上角的坐标
                        double latitude_rb = clsP.latitude_rb;   //右上角的坐标
                        string longtiuandlatiud = dt.Rows[kk]["key"].ToString();
                        if (clsP.longitudeandlatitude == dt.Rows[kk]["key"].ToString())
                        {
                            clsData clsquota = new clsData();
                            DataRow dr = dt1.NewRow();
                            dr["col"] = clsP.Column;
                            dr["row"] = clsP.Row;
                            if (dt.Rows[kk]["voice_call_num"] != null && dt.Rows[kk]["voice_call_num"].ToString() != "")  //接入次数(1X语音业务)
                            {
                                clsquota.Voice_call_num = Convert.ToSingle(dt.Rows[kk]["voice_call_num"]);
                            }
                            else
                            {
                                clsquota.Voice_call_num = 0;
                            }
                            dr["voice_call_num"] = clsquota.Voice_call_num;
                            if (dt.Rows[kk]["voice_drop_num"] != null && dt.Rows[kk]["voice_drop_num"].ToString() != "")  //掉话次数(1X语音业务)
                            {
                                clsquota.Voice_drop_num = Convert.ToSingle(dt.Rows[kk]["Voice_drop_num"]);
                            }
                            else
                            {
                                clsquota.Voice_drop_num = 0;
                            }
                            dr["voice_drop_num"] = clsquota.Voice_drop_num;
                            if (dt.Rows[kk]["data_call_num"] != null && dt.Rows[kk]["data_call_num"].ToString() != "")   //接入次数(1X数据业务)
                            {
                                clsquota.Data_call_num = Convert.ToSingle(dt.Rows[kk]["data_call_num"]);
                            }
                            else
                            {
                                clsquota.Data_call_num = 0;
                            }
                            dr["data_call_num"] = clsquota.Data_call_num;

                            if (dt.Rows[kk]["data_drop_num"] != null && dt.Rows[kk]["data_drop_num"].ToString() != "")   //掉话次数(1X数据业务)
                            {
                                clsquota.Data_drop_num = Convert.ToSingle(dt.Rows[kk]["data_drop_num"]);
                            }
                            else
                            {
                                clsquota.Data_drop_num = 0;
                            }
                            dr["data_drop_num"] = clsquota.Data_drop_num;

                            if (dt.Rows[kk]["DODATA_CALL_NUM"] != null && dt.Rows[kk]["DODATA_CALL_NUM"].ToString() != "") //DO业务：接入次
                            {
                                clsquota.DODATA_CALL_NUM = Convert.ToSingle(dt.Rows[kk]["DODATA_CALL_NUM"]);
                            }
                            else
                            {
                                clsquota.DODATA_CALL_NUM = 0;
                            }
                            dr["DODATA_CALL_NUM"] = clsquota.DODATA_CALL_NUM;
                            dt1.Rows.Add(dr);
                        }
                    }
                }
                return dt1;
            }
            catch (Exception ex)
            {
                clsTool.WriteLog(ex.Message + ex.StackTrace, "getsmallExistBig大格子里有多少个小格子");
                return null;
            }
        }
        /// <summary>
        /// 有多少个小格存在于大格中
        /// </summary>
        /// <returns></returns>
        public DataTable getNewsmallExistBig(DataTable dt, string[,] array, int XLength, int YLength, int city_id)
        {
            string result = string.Empty;
            float longitude = 0f;
            float latitude = 0f;
            DataTable dt1 = new DataTable();
            for (int i = 0; i < XLength; i++)
            {
                for (int j = 0; j < YLength; j++)
                {
                    result = array[i, j];
                    string[] arr = result.Split('|');

                    longitude = Convert.ToSingle(arr[0]);
                    latitude = Convert.ToSingle(arr[1]);

                    longitude = longitude * 1000;
                    latitude = latitude * 1000;

                    //遍历查找功能函数。确定有多少格子在这个大格子中(callnum;dropnum)
                    clsResult cls = new clsResult();
                    foreach (DataRow dr in dt.Rows)
                    {
                        if (dr["longitude"] == null || dr["longitude"].ToString() == string.Empty) continue;
                        float smalllongitude = Convert.ToSingle(dr["longitude"].ToString());  //取的经度
                        if (dr["latitude"] == null || dr["latitude"].ToString() == string.Empty) continue;
                        float smalllatitude = Convert.ToSingle(dr["latitude"].ToString());   //取的纬度
                        if (dr["callnum"] == null || dr["callnum"].ToString() == string.Empty) continue;
                        float callnum = Convert.ToSingle(dr["callnum"]);
                        if (dr["callnum"] == null || dr["callnum"].ToString() == string.Empty) continue;
                        float dropnum = Convert.ToSingle(dr["dropnum"]);

                        //判数是否在有多少在大格子中
                        if (longitude >= smalllongitude && latitude >= smalllatitude)
                        {
                            clsData clsquota = new clsData();
                            clsquota.Data_drop_num = dropnum;         //掉话次数
                            clsquota.Data_call_num = callnum;         //呼叫总次数
                            cls.ArrGrid[i, j] = array[i, j];          //单元格称
                            cls.LsData.Add(clsquota);

                            cls.Latitude = dr["latitude"].ToString();
                            cls.Longitude = dr["longitude"].ToString();
                        }
                    }
                    arrayData.Add(cls); //得到个数据结构图
                }
            }
            //dt1 = getZhiBiao(arrayData, city_id);
            return dt1;
        }
        /// <summary>
        /// 得到指标的数据结构
        /// </summary>
        /// <returns></returns>
        public DataTable getZhiBiao(ArrayList arrData,int city_id, DateTime date,string strTime)
        {
            try
            {
                DataTable dt = new DataTable();
                int row = 0;
                int columns = 0;
                for (int i = 0; i < arrData.Count; i++)
                {
                    clsResult cls = arrData[i] as clsResult;
                    List<clsData> clsData = cls.LsData;
                    if (clsData.Count <= 0) continue;
                    //string Test = string.Empty;
                    string strWhere = string.Empty;
                    for (int j = 0; j < clsData.Count; j++)
                    {
                        row = clsData[j].Row;
                        columns = clsData[j].Column;
                        string strJoin = clsData[j].XYZUOBIAO;
                        if (strWhere.Length > 0)
                        {
                            strWhere = strWhere + "," + strJoin;
                        }
                        else
                        {
                            strWhere = strJoin;
                        }
                    }
                    strSQL = string.Format(@"select {3} as columnss,{4} as rowss,sum(voice_call_num) as voice_call_num ,
                                        sum(voice_drop_num) as voice_drop_num,
                                        sum(data_call_num) as data_call_num,sum(data_drop_num) as data_drop_num,
                                        sum(DODATA_CALL_NUM) as DODATA_CALL_NUM
                                        from mod_cdl_grid where GRID_ID in ({0}) and city_id={1} 
                                        and {2} group by start_time ", strWhere, city_id, strTime, columns, row);

                    DataTable tempdt = NOAP.CommonDB.DBAcess.Instance().GetDataTable(strSQL); //获取临时的数据结构的值
                    clsPerf.BuildDataTable(ref dt, tempdt); //数据结构上传数据
                }
                return dt;
            }
            catch(Exception ex)
            {
                clsTool.WriteLog(ex.Message + ex.StackTrace, "getZhiBiao");
                return null;
            }
        }
        /// <summary>
        /// 导出DataTable
        /// </summary>
        /// <param name="gView"></param>
        /// <param name="fileName"></param>
        public void ExportCsv(DataTable dt, string fileName, string DirPath,ArrayList TopOne,ArrayList dtCaption)
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
                //for (k = 0; k < TopOne.Count; k++)
                //{
                //    TopOne.Add(TopOne[k].ToString());
                //}
                for (int i = 0; i < TopOne.Count; i++)
                {
                    string caption = TopOne[i].ToString();
                    sb.Append(caption.Replace("\n", ""));
                    sb.Append(',');
                }
                if (sb.Length > 1) sb = sb.Remove(sb.Length - 1, 1);
                sb.Append("\n");
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
                if (sb.Length > 1) sb = sb.Remove(sb.Length - 1, 1);
                sb.Append("\n");
                //写入内容
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    for (int j = 0; j < dt.Columns.Count; j++)
                    {
                        sb.Append(dt.Rows[i][dt.Columns[j].ColumnName].ToString());
                        sb.Append(',');
                    }
                    if (sb.Length > 1) sb = sb.Remove(sb.Length - 1, 1);
                    sb.Append("\n");
                }
                sw.Write(sb.ToString());
            }
            catch (Exception ex)
            {
                string test = ex.StackTrace;
                throw ex;
            }
            finally
            {
                sw.Close();
                fileStream.Close();
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

                dt1.Columns.Add(new DataColumn("col"));
                dt1.Columns.Add(new DataColumn("row"));
                dt1.Columns.Add(new DataColumn("voice_call_num"));
                dt1.Columns.Add(new DataColumn("data_call_num"));
                dt1.Columns.Add(new DataColumn("voice_drop_num"));
                dt1.Columns.Add(new DataColumn("data_drop_num"));
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

                        dr["voice_call_num"] = newcls.Voice_call_num;
                        dr["data_call_num"] = newcls.Data_call_num;
                        dr["voice_drop_num"] = newcls.Voice_drop_num;
                        dr["data_drop_num"] = newcls.Data_drop_num;
                        dr["DODATA_CALL_NUM"] = newcls.DODATA_CALL_NUM;
                        dt1.Rows.Add(dr);
                    }
                }
                return dt1;
            }
            catch (Exception ex)
            {
                clsTool.WriteLog(ex.Message + ex.StackTrace, "getsmallExistBig大格子里有多少个小格子");
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

                dt1.Columns.Add(new DataColumn("col"));
                dt1.Columns.Add(new DataColumn("row"));
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
                clsTool.WriteLog(ex.Message + ex.StackTrace, "getsmallExistBigDo大格子里有多少个小格子");
                return null;
            }
        }
    }

    /// <summary>
    /// 得到格子对象数据
    /// </summary>
    public class clsResult
    {
        string[,] _arrGrid;
        public string[,] ArrGrid
        {
            get { return _arrGrid; }
            set { _arrGrid = value; }
        }
        private string _longitude;

        /// <summary>
        /// 经度的值结构
        /// </summary>
        public string Longitude
        {
            get { return _longitude; }
            set { _longitude = value; }
        }
        private string _latitude;
        /// <summary>
        /// 纬度结构类型
        /// </summary>
        public string Latitude
        {
            get { return _latitude; }
            set { _latitude = value; }
        }
        List<clsData> _lsData=new List<clsData>(); //对象结构
        public List<clsData> LsData
        {
            get { return _lsData; }
            set { _lsData = value; }
        }
    }
    /// <summary>
    /// 定义经纬的类对象
    /// </summary>
    public class clsPoi
    {
        public double longitude_lb;  //左上角  //经度
        public double latitude_lb;             //纬度

        public double longitude_rb;  //右下角  //经度
        public double latitude_rb;             //纬度


        public int Row;             //行号   //对应是的经度
        public int Column;          //列号   //对应的是纬度


        public string longitudeandlatitude;  //2个字符串的联合功能
    }

    /// <summary>
    /// 存储的数据结构
    /// </summary>
    public class clsData
    {
        //1X语音业务：接入次数  voice_call_num 、掉话次数   voice_drop_num 
        //1X数据业务：接入次数 data_call_num 、掉话次数data_drop_num 
        //DO业务：接入次数 DODATA_CALL_NUM 
        private float _voice_call_num;
        /// <summary>
        /// 接入次数(1X语音业务)
        /// </summary>
        public float Voice_call_num
        {
            get { return _voice_call_num; }
            set { _voice_call_num = value; }
        }
        private float _voice_drop_num;
        /// <summary>
        /// 掉话次数(1X语音业务)
        /// </summary>
        public float Voice_drop_num
        {
            get { return _voice_drop_num; }
            set { _voice_drop_num = value; }
        }

        private float _data_call_num;
        /// <summary>
        /// 接入次数(1X数据业务)
        /// </summary>
        public float Data_call_num
        {
            get { return _data_call_num; }
            set { _data_call_num = value; }
        }


        private float _data_drop_num;

        /// <summary>
        /// 掉话次数(1X数据业务)
        /// </summary>
        public float Data_drop_num
        {
            get { return _data_drop_num; }
            set { _data_drop_num = value; }
        }

        private float _sms_call_num;
        public float Sms_call_num
        {
            get { return _sms_call_num; }
            set { _sms_call_num = value; }
        }

        private float _sms_drop_num;
        public float Sms_drop_num
        {
            get { return _sms_drop_num; }
            set { _sms_drop_num = value; }
        }

        private float _accesspnstravg;
        public float Accesspnstravg
        {
            get { return _accesspnstravg; }
            set { _accesspnstravg = value; }
        }

        private float _DODATA_CALL_NUM;

        /// <summary>
        /// 接入次数
        /// </summary>
        public float DODATA_CALL_NUM
        {
            get { return _DODATA_CALL_NUM; }
            set { _DODATA_CALL_NUM = value; }
        }

        private int _Row;   
        /// <summary>
        /// 行的定义
        /// </summary>
        public int Row
        {
            get { return _Row; }
            set { _Row = value; }
        }
        private int _Column; //列的定义

        /// <summary>
        /// 列的定义功能
        /// </summary>
        public int Column
        {
            get { return _Column; }
            set { _Column = value; }
        }

        private string _XYZUOBIAO;

        /// <summary>
        /// 
        /// </summary>
        public string XYZUOBIAO
        {
            get { return _XYZUOBIAO; }
            set { _XYZUOBIAO = value; }
        }

    }
}
