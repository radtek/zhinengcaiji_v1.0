package com.unicom.ucloud.service;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.db.dbpool.DBUtil;
import cn.uway.nbi.util.ResultSetHelper;
import cn.uway.nbi.util.ResultSetHelperService;

import com.unicom.ucloud.esb_sfwnos_sfwnos_inquiryresinfosrv.ESBSFWNOSSFWNOSInquiryResInfoSrvOutputCollection;
import com.unicom.ucloud.esb_sfwnos_sfwnos_inquiryresinfosrv.ESBSFWNOSSFWNOSInquiryResInfoSrvOutputItem;
import com.unicom.ucloud.esb_sfwnos_sfwnos_inquiryresinfosrv.ESBSFWNOSSFWNOSInquiryResInfoSrvResponse;
import com.unicom.ucloud.esb_sfwnos_sfwnos_inquiryresinfosrv.OutputFieldCollection;
import com.unicom.ucloud.esb_sfwnos_sfwnos_inquiryresinfosrv.OutputFieldItem;
import com.unicom.ucloud.esb_sfwnos_sfwnos_inquiryresinfosrv.QueryConditionCollection;
import com.unicom.ucloud.esb_sfwnos_sfwnos_inquiryresinfosrv.QueryConditionItem;
import com.unicom.ucloud.esb_sfwnos_sfwnos_inquiryresinfosrv.SortFieldCollection;
import com.unicom.ucloud.esb_sfwnos_sfwnos_inquiryresinfosrv.SortFieldItem;

/**
 * Ucloud业务处理实现类
 * 
 * @author liuwx
 */
public class ServiceMgr {

	private static final Logger LOG = LoggerFactory.getLogger(ServiceMgr.class);

	private Map<String, ServiceEntity> serviceEntityMap = new HashMap<String, ServiceEntity>();

	private Map<String, DS> dsMap = new HashMap<String, DS>();

	/* Map<服务编号，模板> */
	private Map<String, Templet> templetMap = new HashMap<String, Templet>();

	public String getWebserviceUrl(String serviceId) throws Exception {
		ServiceEntity t = serviceEntityMap.get(serviceId);
		if (t != null)
			return t.getService_url();
		throw new Exception("ucloud.xml文件中service节点url无效,请检验");

	}

	private static ServiceMgr instance = new ServiceMgr();
	{
		ServiceConfigParser parser = new ServiceConfigParser();
		serviceEntityMap = parser.getServiceEntityMap();
		dsMap = parser.getDsMap();
		templetMap = parser.getTempletMap();
	}

	public static ServiceMgr getInstance() {
		if (instance == null)
			instance = new ServiceMgr();
		return instance;
	}

	/**
	 * 获取输出字段，并转化为字符串
	 * 
	 * @param outputfieldcollection
	 *            获取输出字段
	 * @return 字符串
	 */
	public String getOutputFields(OutputFieldCollection outputfieldcollection) {
		StringBuilder sb = new StringBuilder();
		List<OutputFieldItem> list = outputfieldcollection.getOutputFieldItem();
		if (list != null) {
			for (OutputFieldItem item : list) {
				sb.append(item.getOutputFieldName()).append(",");
			}
			if (sb.length() > 0) {
				sb.deleteCharAt(sb.length() - 1);
			} else {
				sb.append("*");
			}
		}
		return sb.toString();
	}

	/**
	 * 通过查询条件，返回资源查询结果集合
	 * 
	 * @param response
	 *            需要返回的结果对象
	 * @param entityName
	 *            实体名，用于标记属于哪个子服务
	 * @param query_Condition_Collection
	 *            查询条件
	 * @param sort_Field_Collection
	 *            排序条件
	 * @param outputfieldcollection
	 *            输出字段
	 * @param currPage
	 *            当前页
	 * @param pageSize
	 *            页大小
	 * @return 符合条件的结果结合
	 */
	public List<ESBSFWNOSSFWNOSInquiryResInfoSrvOutputCollection> process(ESBSFWNOSSFWNOSInquiryResInfoSrvResponse response, String entityName,
			QueryConditionCollection query_Condition_Collection, SortFieldCollection sort_Field_Collection,
			OutputFieldCollection outputfieldcollection, long currPage, long pageSize) {
		List<ESBSFWNOSSFWNOSInquiryResInfoSrvOutputCollection> resultList = new ArrayList<ESBSFWNOSSFWNOSInquiryResInfoSrvOutputCollection>();

		ESBSFWNOSSFWNOSInquiryResInfoSrvOutputCollection collection = new ESBSFWNOSSFWNOSInquiryResInfoSrvOutputCollection();
		List<ESBSFWNOSSFWNOSInquiryResInfoSrvOutputItem> rList = new ArrayList<ESBSFWNOSSFWNOSInquiryResInfoSrvOutputItem>();

		Templet templet = templetMap.get(entityName);
		String mappingServiceId = templet.getMappingServiceId();
		String tmpServiceId = new String(entityName);
		if (StringUtil.isNotNull(mappingServiceId)) {
			tmpServiceId = mappingServiceId;
		}
		ServiceEntity entity = serviceEntityMap.get(tmpServiceId);
		String nameCn = entity.getService_name_cn();
		String nameEn = entity.getService_name_en();
		String serviceUrl = entity.getService_url();

		String service_message = nameCn + "_" + tmpServiceId + "_" + entityName;

		List<ResultSetEntity> resultSet = templet.getResultSetList();

		long totalCount = 0;
		boolean isError = false;
		for (ResultSetEntity result : resultSet) {
			DS ds = result.getDs();

			Connection conn = null;
			Statement ps = null;
			ResultSet rs = null;
			String sql = null;
			try {
				conn = DBUtil.getConnection(ds.getDriver(), ds.getUrl(), ds.getUsername(), ds.getPassword());
				ps = conn.createStatement();
				String sql1 = result.getSql();

				result.conver();
				Map<String, String> mappingMap = null;// result.getColumnMappingMap();

				String condition = getQueryConditionMappingSql(query_Condition_Collection, mappingMap);

				StringBuilder conditionTmp = new StringBuilder();

				String countSql = new String("select count(*) totalCount from ");

				if (StringUtil.isNotNull(condition)) {
					if (sql1.contains("where ") || sql1.contains("WHERE "))
						condition = " and  " + condition;
					else
						condition = " where  " + condition;
					conditionTmp.append(condition);

					countSql = countSql + " (" + sql1 + " " + condition + ") ";

				}
				rs = ps.executeQuery(countSql.toString());

				while (rs.next()) {
					totalCount = rs.getLong("totalCount");
				}
				String sortSql = getSortFieldCollectionMappingSql(sort_Field_Collection, mappingMap);
				if (StringUtil.isNotNull(sortSql)) {
					sortSql = " order by   " + sortSql;
					conditionTmp.append(sortSql);
				}
				String rowCondition = " where rowno between __start and __end  ";

				sql = "with partdata as ( select * from (" + sql1 + conditionTmp + " ) " + rowCondition + " )" + " select "
						+ getOutputFields(outputfieldcollection) + " from partdata ";

				sql = sql.replace("__start", String.valueOf(currPage == 1 ? 1 : (currPage - 1) * pageSize + 1)).replace("__end",
						String.valueOf(currPage * pageSize));

				LOG.info("sql:  " + sql.toString());

				rs = ps.executeQuery(sql.toString());
				ResultSetHelper resultService = new ResultSetHelperService();
				String[] headLine = resultService.getColumnNames(rs);

				int record_num = 1;
				String[] values = null;
				while (rs.next()) {
					ESBSFWNOSSFWNOSInquiryResInfoSrvOutputItem item = new ESBSFWNOSSFWNOSInquiryResInfoSrvOutputItem();
					item.setRecordNum(BigDecimal.valueOf(record_num));

					values = resultService.getColumnValues(rs, true);
					if (values == null)
						continue;
					int i = 0;
					StringBuffer sb = new StringBuffer();

					for (String v : values) {
						sb.append("<").append(headLine[i]).append(">").append(v).append("</").append(headLine[i]).append(">");
						i++;
					}
					item.setResult(sb.toString());
					rList.add(item);//
				}

			} catch (Exception e) {
				response.setSERVICEFLAG("FALSE");
				isError = true;
				response.setSERVICEMESSAGE(service_message + ": 失败.原因:" + e);
				LOG.error("查询脚本出现异常." + sql, e);
			} finally {
				DBUtil.close(rs, ps, conn);
			}
			collection.getESBSFWNOSSFWNOSInquiryResInfoSrvOutputItem().addAll(rList);
			resultList.add(collection);
		}
		response.setCURRENTPAGE(new BigDecimal(currPage));
		if (!isError) {
			response.setSERVICEFLAG("TRUE");
			response.setSERVICEMESSAGE(service_message + ": 成功.");
		}
		response.setINSTANCEID(new BigDecimal(1));
		response.setTOTALRECORD(new BigDecimal(totalCount));
		response.setTOTALPAGE(new BigDecimal((long) Math.ceil((double) totalCount / pageSize)));

		return resultList;
	}

	/**
	 * 获取查询sql语句
	 * 
	 * @param conditions
	 *            条件
	 * @param index
	 *            编号
	 * @param sql
	 *            sql语句
	 * @param queryFieldMappingMap
	 *            查询字段
	 * @throws Exception
	 *             异常
	 */
	public void getQuerySql(QueryConditionCollection conditions, int index, StringBuffer sql, Map<String, String> queryFieldMappingMap)
			throws Exception {
		QueryConditionItem condition = conditions.getQueryConditionItem().get(index);

		String fieldName = condition.getQueryFieldName();
		if (StringUtil.isNull(fieldName))
			throw new Exception("invalid fieldName ");

		/*
		 * if (queryFieldMappingMap.containsKey(fieldName.toUpperCase())) fieldName = queryFieldMappingMap.get(fieldName.toUpperCase());
		 */

		sql.append(fieldName).append(" ");
		sql.append(getOperationConver(condition.getOperation()));
		sql.append(" '" + condition.getQueryConditionVLAUE() + "' ");
		sql.append(" ");
	}

	/**
	 * 排序字段映射处理
	 * 
	 * @param sorts
	 *            排序字段
	 * @param queryFieldMappingMap
	 *            字段映射
	 * @return 返回排序sql脚本
	 * @throws Exception
	 *             异常
	 */
	public String getSortFieldCollectionMappingSql(SortFieldCollection sorts, Map<String, String> queryFieldMappingMap) throws Exception {

		if (sorts == null || sorts.getSortFieldItem().size() <= 0)
			return null;

		int sortsSize = sorts.getSortFieldItem().size();
		StringBuffer sql = new StringBuffer("");
		// sql.append(" order by  ");

		for (int i = 0; i < sortsSize - 1; i++) {
			getSortSql(sorts, i, sql, queryFieldMappingMap);
			sql.append(" , ");
		}

		if (sortsSize > 0) {
			getSortSql(sorts, sortsSize - 1, sql, queryFieldMappingMap);
		}
		return sql.toString();
	}

	/**
	 * 拼装排序sql脚本
	 * 
	 * @param sorts
	 *            排序字段
	 * @param index
	 *            索引编号
	 * @param sql
	 *            sql脚本
	 * @param queryFieldMappingMap
	 *            字段映射关系
	 * @throws Exception
	 *             异常
	 */
	public void getSortSql(SortFieldCollection sorts, int index, StringBuffer sql, Map<String, String> queryFieldMappingMap) throws Exception {
		SortFieldItem sort = sorts.getSortFieldItem().get(index);
		String fieldName = sort.getSortFieldName();
		if (StringUtil.isNull(fieldName))
			throw new Exception("invalid fieldName ");

		/*
		 * if (queryFieldMappingMap.containsKey(fieldName.toUpperCase())) fieldName = queryFieldMappingMap.get(fieldName.toUpperCase());
		 */

		sql.append(fieldName);
		sql.append(" ");
		sql.append(sort.getSortMod());
	}

	/**
	 * 拼装查询条件sql
	 * 
	 * @param conditions
	 *            查询条件
	 * @param queryFieldMappingMap
	 *            映射字段
	 * @return 拼装查询条件sql
	 * @throws Exception
	 */
	public String getQueryConditionMappingSql(QueryConditionCollection conditions, Map<String, String> queryFieldMappingMap) throws Exception {
		int length = conditions.getQueryConditionItem().size();
		StringBuffer sql = new StringBuffer("");
		for (int i = 0; i < length - 1; i++) {
			QueryConditionItem condition = conditions.getQueryConditionItem().get(i);
			getQuerySql(conditions, i, sql, queryFieldMappingMap);
			sql.append(condition.getRelation());
			sql.append(" ");
		}
		if (conditions.getQueryConditionItem().size() > 0) {
			QueryConditionItem condition = conditions.getQueryConditionItem().get(length - 1);
			// sql.append(queryFieldMappingMap.get(condition.getQueryFieldName())).append(" ");
			sql.append(condition.getQueryFieldName()).append(" ");

			sql.append(getOperationConver(condition.getOperation())).append(" ");
			sql.append("'" + condition.getQueryConditionVLAUE() + "'");
		}
		return sql.toString();
	}

	/**
	 * 相关操作符转换
	 * 
	 * @param ope
	 *            操作符号
	 * @return 替换后的操作符号
	 */
	public String getOperationConver(String ope) {
		if (StringUtil.isNotNull(ope)) {
			if (ope.trim().endsWith("=="))
				return "=";
			if (ope.trim().endsWith("!="))
				return "<>";
		}
		return ope;
	}

	/**
	 * 是否是in操作
	 * 
	 * @param ope
	 *            操作符
	 * @return
	 */
	public boolean validInOperation(String ope) {
		if (StringUtil.isNotNull(ope)) {
			if (ope.trim().endsWith("in"))
				return true;
		}
		return false;
	}

	/**
	 * 查询列字段映射
	 * 
	 * @param serviceId
	 *            服务编号
	 * @param srcColumnName
	 *            列字段
	 * @return 映射后的信息
	 */
	public String queryColumnMapping(String serviceId, String srcColumnName) {
		ServiceEntity entity = serviceEntityMap.get(serviceId);
		String nameCn = entity.getService_name_cn();
		String nameEn = entity.getService_name_en();
		String serviceUrl = entity.getService_url();
		Templet templet = templetMap.get(serviceId);

		List<ResultSetEntity> resultSet = templet.getResultSetList();

		for (ResultSetEntity result : resultSet) {
			DS ds = result.getDs();
			List<Column> cList = result.getColumnList();

			for (Column c : cList) {
				if (c.src.equalsIgnoreCase(srcColumnName)) {
					String descTable = c.descTable;
					String value = "";
					if (StringUtil.isNull(descTable)) {
						value = c.desc;
					} else {
						value = descTable + "." + c.desc;
					}
					return value;
				}
			}
		}
		return null;
	}
}
