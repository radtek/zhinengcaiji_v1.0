package cn.uway.webservice.perfservice;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.util.ConstDef;

public class Parser {

	private static final Logger LOG = LoggerFactory.getLogger(Parser.class);

	private String xml;

	private String type;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	private Table table = new Table();

	public String getXml() {
		return xml;
	}

	public void setXml(String xml) {
		this.xml = xml;
	}

	/**
	 * 解析xml封装到table对象中
	 */
	@SuppressWarnings("unchecked")
	public void parser() throws DocumentException, NullPointerException {
		Document doc = null;
		if (null == this.xml || "".equals(this.xml.trim())) {
			String filepath = ConstDef.TEMPLET_PATH_FOR_TASK_WS + type + ".xml";
			doc = readHistoryXML(filepath);
		}
		try {
			if (doc == null) {
				doc = DocumentHelper.parseText(xml);
			}
		} catch (DocumentException e) {
			LOG.debug("通过web service 获取的xml 数据不是规范的xml，解析失败！" + e.getLocalizedMessage());
			String filepath = ConstDef.TEMPLET_PATH_FOR_TASK_WS + type + ".xml";
			LOG.debug("开始读取上次成功的历史xml。file=" + filepath);
			doc = readHistoryXML(filepath);
		}
		if (doc == null) {
			throw new NullPointerException("本次获取的xml与历史xml数据都解析失败！无法继续获取数据！");
		}
		Element root = doc.getRootElement(); // nbi_table
		Attribute orderBy = root.attribute("order_by"); // 排序字段
		String orderStr = "";
		if (orderBy != null) {
			orderStr = orderBy.getValue();
			table.setOrderByList(orderStr.split(","));
		}
		List<Element> trs = root.elements();
		List<TR> listTR = new ArrayList<TR>();
		for (int i = 0; i < trs.size(); i++) {
			TR objTR = new TR();//
			Element tr = trs.get(i);// tr
			String idAttr = tr.attribute("id").getValue();
			if (StringUtil.isNull(idAttr)) {
				objTR.setId(i + 1);
			} else {
				objTR.setId(Integer.valueOf(idAttr));
			}
			String primaryKeys = tr.attribute("primary_key").getValue();
			objTR.setPrimaryKeyList(Arrays.asList(primaryKeys.split(","))); // 设置组合主键
			// 解析TD
			List<Element> tds = tr.elements();
			List<TD> listTD = new ArrayList<TD>();
			for (int j = 0; j < tds.size(); j++) {
				Element td = tds.get(j);
				TD objTD = new TD();
				objTD.setSql(td.getText());
				objTD.setId(j + 1);
				listTD.add(objTD);
				Attribute leftAttr = td.attribute("left_join");
				if (leftAttr == null) {
					continue;
				}
				String leftStr = leftAttr.getValue();
				objTD.setLeftJoin(Boolean.valueOf(leftStr));
			}
			objTR.setTdList(listTD);
			listTR.add(objTR);
		}
		this.table.setTrList(listTR);
	}

	public Document readHistoryXML(String filepath) {
		LOG.debug("xml数据为空！开始读取上一次成功的xml数据，file=:" + filepath);
		try {
			SAXReader reader = new SAXReader();
			File file = new File(filepath);
			if (!file.exists()) {
				LOG.debug("文件不存在！file=" + filepath);
				return null;
			}
			return reader.read(file);
		} catch (Exception e) {
			LOG.debug("读取文件=" + filepath + "失败！" + e.getLocalizedMessage());
		}
		return null;
	}

	/**
	 * 获得Table结构
	 * 
	 * @return
	 */
	public Table getTable() {
		return table;
	}

	public static void main(String[] args) {
		try {
			Parser parse = new Parser();
			parse.xml = "<?xml version=\"1.0\" encoding=\"utf-8\"?> <nbi_table  order_by=\"${order_by}\">		<tr id = \"1\" primary_key=\"${primary_key_1}\">			<td left_join=\"true\">${sql_1}</td>			<td>${sql_2}</td>		</tr>		<tr id = \"2\" primary_key=\"${primary_key_2}\">			<td left_join=\"true\">${sql_3}</td>			<td>${sql_4}</td>		</tr></nbi_table>";
			parse.parser();
			parse.getTable();
		} catch (DocumentException e) {
			e.printStackTrace();
		}

	}

}
