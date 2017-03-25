package cn.uway.nbi.ui;

import java.util.List;

/**
 * 数据信息，用户记录通过总部下发的命令，来匹配对应的采集任务，以及需要上报的各个类型的数据文件
 * 
 * @author liuwx
 */
public class DataEntity {

	public List<FileInfoType> fileInfoTypeList;

	public List<CltTask> matchCltTaskList;

	public List<ObjectListMatch> filterMatchList;
}
