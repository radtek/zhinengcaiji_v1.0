using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

//功能描述说明
namespace DataCollect.CommonFun
{
    public class clsType
    {
        private DateTime _start_time;
        /// <summary>
        /// 执行时间
        /// </summary>
        public DateTime Start_time
        {
            get { return _start_time; }
            set { _start_time = value; }
        }

        private int _DataType;

        /// <summary>
        /// 数据类型
        /// </summary>
        public int DataType
        {
            get { return _DataType; }
            set { _DataType = value; }
        }


        private DateTime _Msc_Collect_time;

        /// <summary>
        /// MSC的采集时间
        /// </summary>
        public DateTime Msc_Collect_time
        {
            get { return _Msc_Collect_time; }
            set { _Msc_Collect_time = value; }
        }

        private DateTime _BSC_Collect_time;

        /// <summary>
        /// BSC的采集时间
        /// </summary>
        public DateTime BSC_Collect_time
        {
            get { return _BSC_Collect_time; }
            set { _BSC_Collect_time = value; }
        }

        private DateTime _BTS_Collect_time;

        /// <summary>
        /// BTS的采集时间
        /// </summary>
        public DateTime BTS_Collect_time
        {
            get { return _BTS_Collect_time; }
            set { _BTS_Collect_time = value; }
        }


        private DateTime _PERF_MSC_1X_Collect_Time;

        /// <summary>
        /// 按照MSC级别的1X采集时间
        /// </summary>
        public DateTime PERF_MSC_1X_Collect_Time
        {
            get { return _PERF_MSC_1X_Collect_Time; }
            set { _PERF_MSC_1X_Collect_Time = value; }
        }

        private DateTime _PERF_MSC_DO_Collect_Time;
        /// <summary>
        /// 按照MSC级别的DO采集时间
        /// </summary>
        public DateTime PERF_MSC_DO_Collect_Time
        {
            get { return _PERF_MSC_DO_Collect_Time; }
            set { _PERF_MSC_DO_Collect_Time = value; }
        }


        private DateTime _PERF_CITY_1X_Collect_Time;

        /// <summary>
        /// 按照MSC级别的1X采集时间
        /// </summary>
        public DateTime PERF_CITY_1X_Collect_Time
        {
            get { return _PERF_CITY_1X_Collect_Time; }
            set { _PERF_CITY_1X_Collect_Time = value; }
        }

        private DateTime _PERF_CITY_DO_Collect_Time;
        /// <summary>
        /// 按照MSC级别的DO采集时间
        /// </summary>
        public DateTime PERF_CITY_DO_Collect_Time
        {
            get { return _PERF_CITY_DO_Collect_Time; }
            set { _PERF_CITY_DO_Collect_Time = value; }
        }


        private DateTime _CDL_Morning_Collect_time;

        /// <summary>
        /// 早忙时的采集数据
        /// </summary>
        public DateTime CDL_Morning_Collect_time
        {
            get { return _CDL_Morning_Collect_time; }
            set { _CDL_Morning_Collect_time = value; }
        }


        private DateTime _CDL_After_Collect_time;

        /// <summary>
        /// 晚忙时的采集数据
        /// </summary>
        public DateTime CDL_After_Collect_time
        {
            get { return _CDL_After_Collect_time; }
            set { _CDL_After_Collect_time = value; }
        }
    }
}
