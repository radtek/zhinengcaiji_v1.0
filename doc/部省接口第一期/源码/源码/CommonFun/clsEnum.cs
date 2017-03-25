using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DataCollect.CommonFun
{
    public  class clsEnum
    {
        /// <summary>
        ///定义数据类型
        /// </summary>
        public enum DATATYPE
        { 
            //(1代表配置数据，2代表性能数据，3代表用户呼叫分布统计上报 4 网优人员数据上报 5 厂商信息上报，6 仪器仪表信息）
            
            /// <summary>
            ///基础数据类型
            /// </summary>
            BASICDATA=1,
            /// <summary>
            /// 性能数据类型
            /// </summary>
            PERFDATA=2,

            /// <summary>
            ///用户呼叫分布统计上报
            /// </summary>
            USERCALL=3,

            /// <summary>
            /// 网优人员数据上报
            /// </summary>
            USERINFO=4,

            /// <summary>
            ///厂商信息上报
            /// </summary>
            FACTORYMSG=5,

            /// <summary>
            /// 仪器仪表信息
            /// </summary>
            DEVICEMSG=6
        }
        /// </summary>
        public enum NeLevel
        {
            /// <summary>
            /// OMC网元
            /// </summary>
            OMC = 1,
            /// <summary>
            /// BSC网元
            /// </summary>
            BSC = 2,
            /// <summary>
            /// BTS网元
            /// </summary>
            BTS = 3,
            /// <summary>
            /// CELL网元
            /// </summary>
            CELL = 4,
            ///
            /// 载波
            /// 
            CARR = 5,
            /// <summary>
            /// LAC
            /// </summary>
            LAC = 6,
            /// <summary>
            /// 行政区域
            /// </summary>
            ADM_AREA = 7,
            /// <summary>
            /// 频率900,1800
            /// </summary>
            CELL_FRES = 8
        }
    }
}
