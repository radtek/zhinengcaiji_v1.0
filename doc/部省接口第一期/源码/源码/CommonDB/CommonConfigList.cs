using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Reflection;

namespace NOAP.CommonDB
{
    public interface IHadID
    {
        int ID { get; set;}
    }

    public interface IBuildDataByRow
    {
        /// <summary>
        /// 构造特殊字段 完成数据转换
        /// </summary>
        /// <param name="dr"></param>
        /// <returns></returns>
        void BuildDataByRow(DataRow dr);
    }

    public interface ISelfOpDB
    {
        void Update(params object[] newprops);
        void Commit();
        void Delete();
    }

    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Property, AllowMultiple = false)]
    public class ConfigTableAttribute : Attribute
    {
        public string TableID;
        public ConfigTableAttribute(string nID)
        {
            TableID = nID;
        }
    }

    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Property, AllowMultiple = false)]
    public class ConfigColumnAttribute : Attribute
    {
        public string ColumnName;
        public ConfigColumnAttribute(string sColName)
        {
            ColumnName = sColName;
        }
    }

    public class CommonConfigList<TObject> where TObject : class, IHadID, new()
    {
        public Dictionary<int, TObject> Objects = new Dictionary<int, TObject>();

        public string Desc { get; set; }

        public override string ToString()
        {
            return Desc;
        }

        public CommonConfigList()
        {
// ReSharper disable DoNotCallOverridableMethodsInConstructor
            Load();
// ReSharper restore DoNotCallOverridableMethodsInConstructor
        }

        public CommonConfigList(string sDesc)
        {
            Desc = sDesc;
// ReSharper disable DoNotCallOverridableMethodsInConstructor
            Load();
// ReSharper restore DoNotCallOverridableMethodsInConstructor
        }

        public virtual void Load()
        {
            Objects.Clear();
            LoadData();
        }

        protected virtual void LoadData()
        {
            DataTable dt = GetDataTable();
            if (dt == null || dt.Rows.Count <= 0)
                return;

            var lstColNames = new List<string>();
            var lstPros = new List<PropertyInfo>();
            foreach (PropertyInfo pinfo in typeof(TObject).GetProperties())
            {
                object[] attrCols = pinfo.GetCustomAttributes(false);
                var colattr = attrCols.FirstOrDefault(obj => obj is ConfigColumnAttribute) as ConfigColumnAttribute;
                if (colattr == null || string.IsNullOrEmpty(colattr.ColumnName))
                    continue;

                lstColNames.Add(colattr.ColumnName);
                lstPros.Add(pinfo);
            }

            //if (lstColNames.Count <= 0)
            //    return;

            foreach (DataRow dr in dt.Rows)
            {
                TObject obj = BuildByDataRow(dr);
                if (obj == null)
                    continue;
                int nIndex = 0;
                foreach (PropertyInfo p in lstPros)
                {
                    Type tp = p.PropertyType;
                    object value = dr[lstColNames[nIndex++]];
                    if (value.GetType() == typeof(DBNull))
                        continue;
                    if (tp.IsEnum)
                    {
                        value = Convert.ChangeType(value, nIndex.GetType());
                        p.SetValue(obj,value, null);
                    }
                    else
                        p.SetValue(obj, Convert.ChangeType(value, p.PropertyType), null);
                }
                if (obj is IBuildDataByRow)
                    (obj as IBuildDataByRow).BuildDataByRow(dr);

                AddObj(obj);
            }

            return;
        }

        protected virtual TObject BuildByDataRow(DataRow dr)
        {
            return new TObject();
        }

        protected virtual DataTable GetDataTable()
        {
            object[] attrs = GetType().GetCustomAttributes(false);
            var tbattr = attrs.FirstOrDefault(obj => obj is ConfigTableAttribute) as ConfigTableAttribute;
            if (tbattr != null)
                return DBAcess.Instance().GetDataTable(1, tbattr.TableID, GetDBParams(), GetParams());

            return DBAcess.Instance().GetDataTable(GetType().FullName, 1, GetDBParams(), GetParams());

        }

        protected virtual DbParameter[] GetDBParams()
        {
            return null;
        }

        protected virtual object[] GetParams()
        {
            return null;
        }

        //特殊字段 不是简单的int string 需要自己Convert
        //protected virtual void BuildDetailByDataRow(DataRow dr, TObject o)
        //{
        //    return;
        //}

        public virtual void UpdateDBObj(TObject t, object[] newprops)
        {
            if (t is ISelfOpDB)
            {
                ((ISelfOpDB)t).Update(newprops);
            }

            return;
        }

        public virtual void DelDBObj(TObject t)
        {
            if (t is ISelfOpDB)
                ((ISelfOpDB)t).Delete();

            Objects.Remove(t.ID);

            return;
        }

        public virtual void AddDBObj(TObject t)
        {
            if (t is ISelfOpDB)
                ((ISelfOpDB)t).Commit();

            Objects.Add(t.ID, t);

            return;
        }

        public void AddObj(TObject t)
        {
            Objects.Add(t.ID, t);
        }

        public void RemoveObj(TObject t)
        {
            Objects.Remove(t.ID);
        }
    }
}