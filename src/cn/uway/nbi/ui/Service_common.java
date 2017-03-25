package cn.uway.nbi.ui;

/**
 * * 公共信息
 * 
 * <pre>
 * <rnop_service_input_para>
 * 	<service_instance>
 * 		<service_id>DRS102</service_id>
 * 		<version>R1</version>
 * 		<service_name>文件获取请求</service_name>
 * 		<service_desc>总部系统向省级系统要求上报数据文件,例如补报或文件查询等</service_desc>
 * 		<service_content>
 * 			<DRS102service_content>
 * 				<serCaller>总部</serCaller>
 * 				<requestid>ZOB_ GSM_GR_CONF_201000001</requestid>
 * 				<domainType>GSM无线接入网</domainType>
 * 				<fileType>GSM无线基础数据</fileType>
 * 				<begintime>2010-07-17-6:00:00</begintime>
 * 				<endtime>2010-07-18-6:00:00</endtime>
 * 				<filter>
 * 					<objectLevel>BSC</objectLevel>
 * 					<objectList>
 * 						<objectID/>
 * 					</objectList>
 * 				</filter>
 * 			</DRS102service_content>
 * 		</service_content>
 * 	</service_instance>
 * </rnop_service_input_para>
 * </pre>
 * 
 * @author liuwx
 */
public class Service_common {

	public String service_id;

	public String version;

	public String service_name;

	public String service_desc;

}
