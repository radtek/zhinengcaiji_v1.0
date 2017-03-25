package com.unicom.ucloud.service.dao;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.StringUtil;

import com.unicom.ucloud.esb_sfwnos_sfwnos_inquiryresinfosrv.QueryConditionCollection;
import com.unicom.ucloud.esb_sfwnos_sfwnos_inquiryresinfosrv.QueryConditionItem;
import com.unicom.ucloud.esb_sfwnos_sfwnos_inquiryresinfosrv.SortFieldCollection;
import com.unicom.ucloud.esb_sfwnos_sfwnos_inquiryresinfosrv.SortFieldItem;

public class ESB_SFWNOS_SFWNOS_90001_DAO extends DAO {

	private static final Logger LOG = LoggerFactory.getLogger(ESB_SFWNOS_SFWNOS_90001_DAO.class);

	/** Map <外部系统字段名,我方数据库字段名> **/
	protected Map<String, String> queryFieldMappingMap = new HashMap<String, String>();

	protected Map<String, String> queryConditionCollectionMappingMap = new HashMap<String, String>();

	protected Map<String, String> sortCollectionMappingMap = new HashMap<String, String>();

	public void getQuerySql(QueryConditionCollection conditions, int index, StringBuffer sql) throws Exception {
		QueryConditionItem condition = conditions.getQueryConditionItem().get(index);

		String fieldName = condition.getQueryFieldName();
		if (StringUtil.isNull(fieldName))
			throw new Exception("invalid fieldName ");

		if (queryFieldMappingMap.containsKey(fieldName.toUpperCase()))
			fieldName = queryFieldMappingMap.get(fieldName.toUpperCase());

		sql.append(fieldName);
		sql.append(condition.getOperation());
		sql.append(condition.getQueryConditionVLAUE());
		sql.append(" ");
	}

	public void getSortSql(SortFieldCollection sorts, int index, StringBuffer sql) throws Exception {
		SortFieldItem sort = sorts.getSortFieldItem().get(index);
		String fieldName = sort.getSortFieldName();
		if (StringUtil.isNull(fieldName))
			throw new Exception("invalid fieldName ");

		if (queryFieldMappingMap.containsKey(fieldName.toUpperCase()))
			fieldName = queryFieldMappingMap.get(fieldName.toUpperCase());

		sql.append(sort.getSortFieldName());
		sql.append(" ");
		sql.append(sort.getSortMod());
	}

}
