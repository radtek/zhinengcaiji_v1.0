package cn.uway.nbi.ui;

/**
 * 　DRS102获取文件请求
 * 
 * <pre>
 *  service_id	业务编号	string	DRS102
 * 	version	业务版本	string	缺省值(V1)
 * 	service_name	业务名称	string	获取文件请求
 * 	service_desc	业务描述	string	总部系统通过调用省级系统提供的下行数据传输接口服务向省级系统下发获取数据文件的请求
 * 	service_content	业务内容	string	参见DRS102+service_content输入/输出/异常信息参数定义
 * 
 * </pre>
 * 
 * <pre>
 * 参数名称	参数中文名称	参数类型	参数含义
 * 	sercaller	服务调用方	string	服务调用方，为总部代码。取值参见附录A.2　。
 * 	requestid	获取数据文件请求标识	string	获取数据文件请求标识。取值形式参见附录A.3　。
 * 	domaintype	网络域	string	网络域，取值为：GSM：GSM无线接入网WCDMA：WCDMA无线接入网CS：CS域核心网PS：PS域核心网
 * 	filetype	定时上报的数据文件类型	string	表示设置的定时上报的数据文件类型如果网络域选择“GSM”则数据文件类型为GR_CONF：GSM无线基础数据GR_PARA：GSM无线参数数据GR_KPI：GSM性能统计数据GR_RTKPI：GSM原始性能数据GR_SMR：汇总GSM MR数据GR_RTMR：实时GSM MR数据GR_DT：GSM路测数据GR_LOG：GSM日志数据如果网络域选择“WCMDA”则数据文件类型为WR_CONF：WCMDA无线基础数据WR_PARA：WCMDA无线参数数据WR_KPI：WCMDA性能统计数据WR_RTKPI：WCMDA原始性能数据WR_SMR：汇总WCMDA MR数据WR_RTMR：实时WCMDA MR数据WR_DT：WCMDA路测数据WR_LOG：WCMDA日志数据如果网络域选择“CS”则数据文件类型为CS_CONF：CS域核心网基础数据CS_KPI：CS域核心网KPI数据CS_CDR：CS域核心网CDR数据CS_PARA：CS域核心网参数数据CS_LOG：日志数据如果网络域选择“PS”则数据文件类型为PS_CONF：PS域核心网基础数据PS_KPI：PS域核心网KPI数据PS_CDR：PS域核心网CDR数据PS_PARA：PS域核心网参数数据PS_LOG：日志数据
 * 	begintime	文件数据采集/统计开始时间	string	文件数据采集/统计开始时间，最小粒度到小时。
 * 	endtime	文件数据采集/统计结束时间	string	文件数据采集/统计结束时间，应晚于当前时间最小粒度到小时
 * 	lastreporttime	最晚上报时间	string	数据提供方最晚上报的时间要求
 * 	filter	过滤参数	filterType	过滤参数，取值为以下结构体：1）objectLevel：文件对象粒度，取值约定如下：OMC、BSC、BTS、CELL；2）objectList：为指定对象级别的对象唯一标识列表。(sequence<objectID>)如果不指定过滤参数的值，则NULL
 * </pre>
 * 
 * @author liuwx
 */
public class DRS102service_content extends Service_common {

	public String serCaller;

	public String requestid;

	public String domainType;

	public String fileType;

	public String begintime;

	public String endtime;

	public String objectlevel;

	public String objectlist;
}
