using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Data;

namespace NOAP.CommonDB
{
    /// <summary>
    /// 任务完成后的回调[未用]
    /// </summary>
    /// <param name="Result"></param>
    public delegate void TaskCallBack(object Result);

    /// <summary>
    /// 任务管理器
    /// </summary>
    public class TaskController
    {
        protected static List<WorkTaskItem> taskList = new List<WorkTaskItem>();

        /// <summary>
        /// 添加执行任务
        /// </summary>
        /// <param name="task"></param>
        /// <returns></returns>
        public static string AddTask(ITask task)
        {
            WorkTaskItem item = new WorkTaskItem();

            item.ThreadItem = new Thread(new ParameterizedThreadStart(Work));
            item.ThreadItem.Name = Guid.NewGuid().ToString();
            item.ThreadItem.IsBackground = true;
            item.Connection = task.CurrentConnection;
            taskList.Add(item);

            item.ThreadItem.Start(task);
            return item.ThreadItem.Name;
        }

        /// <summary>
        /// 开始任务
        /// </summary>
        /// <param name="task"></param>
        protected static void Work(object task)
        {
            ITask curTask = task as ITask;
            object obj = curTask.Run();

            if (curTask.Callback != null)
            {
                curTask.Callback(obj);
            }

            Stop(Thread.CurrentThread.Name);
        }

        /// <summary>
        /// 停止某个执行的任务
        /// </summary>
        /// <param name="threadName"></param>
        public static void Stop(string threadName)
        {
            for (int i = 0; i < taskList.Count; i++)
            {
                if (taskList[i].ThreadItem.Name == threadName)
                {
                    if (taskList[i].Connection != null)
                    {
                        taskList[i].Connection.Close();
                    }
                    taskList[i].ThreadItem.Abort();
                    taskList.Remove(taskList[i]);
                }
            }
        }
    }

    /// <summary>
    /// 
    /// </summary>
    public class WorkTaskItem
    {
        /// <summary>
        /// 
        /// </summary>
        public Thread ThreadItem { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public IDbConnection Connection { get; set; }
    }

    /// <summary>
    /// 
    /// </summary>
    public interface ITask
    {
        /// <summary>
        /// 执行任务
        /// </summary>
        /// <returns></returns>
        object Run();

        /// <summary>
        /// 任务完成后的回调[未用]
        /// </summary>
        TaskCallBack Callback { get; set; }

        /// <summary>
        /// 当前连接
        /// </summary>
        IDbConnection CurrentConnection { get; set; }
    }

    /// <summary>
    /// 当前DBAccess中的通用任务
    /// </summary>
    public class CommonExecQueryTask : ITask
    {
        /// <summary>
        /// 执行方法的委托
        /// </summary>
        /// <param name="objs"></param>
        public delegate void NonQuerySyn(object objs);

        /// <summary>
        /// 执行任务
        /// </summary>
        /// <returns></returns>
        public object Run()
        {
            if (nonQuerySyn != null)
            {
                nonQuerySyn(Parameters);
            }

            return null;
        }

        /// <summary>
        /// 当前连接
        /// </summary>
        public IDbConnection CurrentConnection { get; set; }

        /// <summary>
        /// 任务完成后的回调[未用]
        /// </summary>
        public TaskCallBack Callback { get; set; }

        /// <summary>
        /// 执行的方法
        /// </summary>
        public NonQuerySyn nonQuerySyn { get; set; }

        /// <summary>
        /// 执行方法中的参数
        /// </summary>
        public CommonExecQueryParams Parameters { get; set; }
    }

    public class CommonExecQueryParams
    {
        public CommonExecQueryParams(IDbConnection connection, int _nModuleID, string _sSubID, System.Data.Common.DbParameter[] _Params, int _nLevel, params object[] _arguments)
        {
            nModuleID = _nModuleID;
            sSubID = _sSubID;
            Params = _Params;
            nLevel = _nLevel;
            arguments = _arguments;
            bIsUseID = true;
            Connection = connection;
        }

        public CommonExecQueryParams(IDbConnection connection, int _nModuleID, int _nFunctionID, string _sFullName, System.Data.Common.DbParameter[] _Params, int _nLevel, params object[] _arguments)
        {
            nModuleID = _nModuleID;
            sFullName = _sFullName;
            nFunctionID = _nFunctionID;
            Params = _Params;
            nLevel = _nLevel;
            arguments = _arguments;
            sSubID = sFullName + "_" + nFunctionID;
            bIsUseID = false;
            Connection = connection;
        }

        public int nModuleID;
        public string sSubID;
        public System.Data.Common.DbParameter[] Params;
        public int nLevel;
        public object[] arguments;
        public int nFunctionID;
        public string sFullName;
        public bool bIsUseID;
        public IDbConnection Connection { get; set; }
        //public bool bSyn;
    }
}
