using System;
using System.Collections.Generic;
using System.Text;
using NOAP.CommonDB;
using System.Data;
using System.Collections;

namespace DataCollect.CommonFun
{
    /// <summary>
    /// 输出用户信息文件
    /// </summary>
    public class clsUser
    {
        string strSQL = string.Empty;
        public DataTable GetUserdt(out ArrayList arrayChinaName)
        {
            arrayChinaName = new ArrayList();
            DataTable dt = new DataTable();
            try
            {
                strSQL = string.Format(@"select '广东',city.city_name,
                                    sec.username,
                                    case sec.usex  
                                         when 1 then '男'
                                         else '女'
                                    end,
                                    '',
                                    '',
                                    '',
                                    sec.utelephone,
                                    sec.email,
                                    '',
                                    '',
                                    '',
                                    '',
                                    '',
                                    to_char(trunc(sysdate,'dd'),'YYYY-MM-DD')
                                    from sec_userinfo sec,cfg_city city
                                    where  sec.city_id=city.city_id");

                dt = NOAP.CommonDB.DBAcess.Instance().GetDataTable(strSQL);
                return dt;
            }
            catch
            { return null; }
        }
    }
}
