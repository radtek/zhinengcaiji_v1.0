using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DataCollect.CommonFun
{
   /// <summary>
   /// 线程类函数
   /// </summary>
   public class clsThread
   {
         //20, out XLength, out YLength, out Initlongitude, out Initlatiude

       private int _City_id;

       /// <summary>
       /// 城市ID名称
       /// </summary>
       public int City_id
       {
           get { return _City_id; }
           set { _City_id = value; }
       }

       private int _XLength;

       /// <summary>
       /// 得到X轴的长度
       /// </summary>
       public int XLength
       {
           get { return _XLength; }
           set { _XLength = value; }
       }

       private int _YLength;

       /// <summary>
       /// 得到Y轴的长度
       /// </summary>
       public int YLength
       {
           get { return _YLength; }
           set { _YLength = value; }
       }

       private int _Initlongitude;

       /// <summary>
       /// 初始化经度
       /// </summary>
       public int Initlongitude
       {
           get { return _Initlongitude; }
           set { _Initlongitude = value; }
       }
       private int _Initlatiude;
       /// <summary>
       /// 初始化纬度
       /// </summary>
       public int Initlatiude
       {
           get { return _Initlatiude; }
           set { _Initlatiude = value; }
       }

       private string _start_time;

       /// <summary>
       /// 采集开始时间
       /// </summary>
       public string Start_time
       {
           get { return _start_time; }
           set { _start_time = value; }
       }

       private string _end_time;

       /// <summary>
       /// 采集结束时间
       /// </summary>
       public string End_time
       {
           get { return _end_time; }
           set { _end_time = value; }
       }

       private string _provice_name;

       /// <summary>
       /// 省份配置
       /// </summary>
       public string Provice_name
       {
           get { return _provice_name; }
           set { _provice_name = value; }
       }
       private string _filename;

       /// <summary>
       /// 文件名称
       /// </summary>
       public string Filename
       {
           get { return _filename; }
           set { _filename = value; }
       }

       private string _city_enname;

       /// <summary>
       /// 城市英文名称
       /// </summary>
       public string City_enname
       {
           get { return _city_enname; }
           set { _city_enname = value; }
       }


       private string _oneFileName;

       /// <summary>
       /// 一部分时间的命名规则
       /// </summary>
       public string OneFileName
       {
           get { return _oneFileName; }
           set { _oneFileName = value; }
       }

       private string _dirName;

       public string DirName
       {
           get { return _dirName; }
           set { _dirName = value; }
       }
 
   }
}
