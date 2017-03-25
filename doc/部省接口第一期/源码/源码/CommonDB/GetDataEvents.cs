using Microsoft.Practices.Composite.App.Event;
using Microsoft.Practices.Composite.Events;

namespace NOAP.CommonDB
{
    public enum EMDataReType
    {
        None = 0,
        Int  = 1,
        DataTable = 2,
        DataSet = 3,
        DbDataReader = 4,
        Object 
    }

    public class GetDataEvents
    {
        
    }

    /// <summary>
    /// 
    /// </summary>
    public class Event_CommonDB_GetData : CompositeAppEvent<EventParam_CommonDB_GetData>
    {


    }

    /// <summary>
    /// 
    /// </summary>
    public class EventParam_CommonDB_GetData : EventParam
    {
        public EMDataReType DataType { get; set; }
        public int DestModuleID  { get; set;}
        public string DestSubID { get; set;}
        public string FullName { get; set; }
        public int FunctionID { get; set; }
        public object Data { get; set;}

        public EventParam_CommonDB_GetData(object src, object dst, EMDataReType type, int nModuleID, string sSubID, string sFullName, int nFunctionID)
            : base(src, dst)
        {
            DataType = type;
            DestModuleID = nModuleID;
            DestSubID = sSubID;
            FullName = sFullName;
            FunctionID = nFunctionID;
        }

        public EventParam_CommonDB_GetData(EMDataReType type, int nModuleID, string sSubID, string sFullName, int nFunctionID)
        {
            DataType = type;
            DestModuleID = nModuleID;
            DestSubID = sSubID;
            FullName = sFullName;
            FunctionID = nFunctionID;

            return;
        }
    }
}