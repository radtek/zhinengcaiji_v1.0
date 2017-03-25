package cn.uway.nbi.util;

/**
 Copyright 2005 Bytecode Pty Ltd.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */
import java.io.IOException;
import java.io.Reader;
import java.math.BigDecimal;
import java.sql.Clob;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Timestamp;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import cn.uway.commons.type.StringUtil;

/**
 * helper class for processing JDBC ResultSet objects
 */
public class ResultSetHelperService implements ResultSetHelper {

	public static final int CLOBBUFFERSIZE = 2048;

	// note: we want to maintain compatibility with Java 5 VM's
	// These types don't exist in Java 5
	private static final int NVARCHAR = -9;

	private static final int NCHAR = -15;

	private static final int LONGNVARCHAR = -16;

	private static final int NCLOB = 2011;

	SimpleDateFormat timeFormat = new SimpleDateFormat(SysCfg.getInstance().getDateFormat());

	private String fileExt;

	public String getFileExt() {
		return fileExt;
	}

	public void setFileExt(String fileExt) {
		this.fileExt = fileExt;
	}

	@Override
	public String[] getColumnNames(ResultSet rs) throws SQLException {
		List<String> names = new ArrayList<String>();
		ResultSetMetaData metadata = rs.getMetaData();

		for (int i = 0; i < metadata.getColumnCount(); i++) {
			names.add(metadata.getColumnName(i + 1));
		}

		String[] nameArray = new String[names.size()];
		return names.toArray(nameArray);
	}

	/**
	 * 获取到 结果集的表头
	 * 
	 * @param rs
	 * @return Map&lt;列名, 列索引&gt; 索引以0开始
	 * @throws SQLException
	 */
	public Map<String, Integer> getColumnNamesMap(ResultSet rs) throws SQLException {
		Map<String, Integer> names = new LinkedHashMap<String, Integer>();
		ResultSetMetaData metadata = rs.getMetaData();
		for (int i = 0; i < metadata.getColumnCount(); i++) {
			names.put(metadata.getColumnName(i + 1), i);
		}
		return names;
	}

	@Override
	public String[] getColumnValues(ResultSet rs, boolean bFlag, Map<String, String> symbol) throws SQLException, IOException {
		List<String> values = new ArrayList<String>();
		ResultSetMetaData metadata = rs.getMetaData();
		for (int i = 0; i < metadata.getColumnCount(); i++) {
			values.add(replaceSymbol(symbol, getColumnValue(rs, metadata, metadata.getColumnType(i + 1), i + 1, bFlag)));
		}
		String[] valueArray = new String[values.size()];
		return values.toArray(valueArray);
	}

	private String replaceSymbol(Map<String, String> symbol, String columnData) {
		if (null == symbol || symbol.isEmpty() || null == columnData) {
			return columnData;
		}
		for (Map.Entry<String, String> entry : symbol.entrySet()) {
			columnData = columnData.replaceAll(entry.getKey(), entry.getValue());
		}
		return columnData;
	}

	@Override
	public String[] getColumnValues(ResultSet rs, boolean bFlag) throws SQLException, IOException {
		List<String> values = new ArrayList<String>();
		ResultSetMetaData metadata = rs.getMetaData();
		for (int i = 0; i < metadata.getColumnCount(); i++)
			values.add(getColumnValue(rs, metadata, metadata.getColumnType(i + 1), i + 1, bFlag));
		String[] valueArray = new String[values.size()];
		return values.toArray(valueArray);
	}
	/**
	 * 根据MAPPING.XML转换city_id为英文名称
	 * @param rs
	 * @param bFlag
	 * @param cityMap
	 * @return
	 * @throws SQLException
	 * @throws IOException
	 */
	public String[] getCovertColumnValues(ResultSet rs, boolean bFlag,Map<String, Map<String, String>> cityMap) throws SQLException, IOException {
		List<String> values = new ArrayList<String>();
		ResultSetMetaData metadata = rs.getMetaData();
		String value;
		for (int i = 0; i < metadata.getColumnCount(); i++)
		{
			value = getColumnValue(rs, metadata, metadata.getColumnType(i + 1), i + 1, bFlag);
			if("city_id".equalsIgnoreCase(metadata.getColumnName(i + 1)) 
					&& cityMap.get(value) != null)
			{
				value = cityMap.get(value).get("${city_en}") == null?value:cityMap.get(value).get("${city_en}");
			}
			values.add(value);
		}
			
		String[] valueArray = new String[values.size()];
		return values.toArray(valueArray);
	}

	public String[] getRowValuesStringArr(ResultSet rs) throws SQLException, IOException {

		ResultSetMetaData metadata = rs.getMetaData();
		String[] rowData = new String[metadata.getColumnCount()];

		for (int i = 0; i < metadata.getColumnCount(); i++) {
			rowData[i] = getColumnValue(rs, metadata, metadata.getColumnType(i + 1), i + 1, false);
		}
		return rowData;
	}

	public Map<String, String> getRowValues(ResultSet rs) throws SQLException, IOException {
		Map<String, String> rowData = new LinkedHashMap<String, String>();
		ResultSetMetaData metadata = rs.getMetaData();
		for (int i = 0; i < metadata.getColumnCount(); i++) {
			rowData.put(metadata.getColumnName(i + 1), getColumnValue(rs, metadata, metadata.getColumnType(i + 1), i + 1, false));
		}
		return rowData;
	}

	public String getKey(ResultSet rs, List<String> groupColumns) throws SQLException, IOException {
		ResultSetMetaData metadata = rs.getMetaData();
		String name = null;

		Map<String, String> keyMapValue = new HashMap<String, String>();

		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < metadata.getColumnCount(); i++) {
			name = metadata.getColumnName(i + 1);
			if (groupColumns.contains(name)) {
				String tmpValue = getColumnValue(rs, metadata, metadata.getColumnType(i + 1), i + 1, false);
				keyMapValue.put(name, tmpValue);

			}
		}
		// 拼接key
		if (groupColumns != null) {
			for (String eName : groupColumns) {
				sb.append(keyMapValue.get(eName)).append("_");
			}
		}
		return sb.toString();
	}

	private String handleObject(Object obj) {
		return obj == null ? "" : String.valueOf(obj);
	}

	private String handleBigDecimal(BigDecimal decimal) {
		return decimal == null ? "" : decimal.toString();
	}

	private String handleLong(ResultSet rs, int columnIndex) throws SQLException {
		long lv = rs.getLong(columnIndex);
		return rs.wasNull() ? "" : Long.toString(lv);
	}

	private String handleInteger(ResultSet rs, int columnIndex) throws SQLException {
		int i = rs.getInt(columnIndex);
		return rs.wasNull() ? "" : Integer.toString(i);
	}

	public String handleDate2(ResultSet rs, ResultSetMetaData rsm, int index) throws SQLException {
		String value = rs.getString(index);
		// 91.92.93表示字段类型是时间类型
		if (rsm.getColumnType(index) == 91 || rsm.getColumnType(index) == 92 || rsm.getColumnType(index) == 93) {
			// 日期型取前19位数据，yyyy-mm-dd hh:mi:ss
			if (value != null) {
				value = value.substring(0, 19);
			}
		}
		return value;
	}

	private String handleTime(Time time) {
		return time == null ? null : time.toString();
	}

	private String handleTimestamp(Timestamp timestamp) {
		return timestamp == null ? null : timeFormat.format(timestamp);
	}

	private String getColumnValue(ResultSet rs, ResultSetMetaData metadata, int colType, int colIndex, boolean bFlag) throws SQLException,
			IOException {
		String value = "";
		switch (colType) {
			case Types.BIT :
			case Types.JAVA_OBJECT :
				value = handleObject(rs.getObject(colIndex));
				break;
			case Types.BOOLEAN :
				boolean b = rs.getBoolean(colIndex);
				value = Boolean.valueOf(b).toString();
				break;
			case NCLOB : // todo : use rs.getNClob
			case Types.CLOB :
				Clob c = rs.getClob(colIndex);
				if (c != null)
					value = read(c);
				break;
			case Types.BIGINT :
				value = handleLong(rs, colIndex);
				break;
			case Types.DOUBLE :	
				double d = rs.getDouble(colIndex);
				value = String.valueOf(d==0?"":d);
				break;
			case Types.FLOAT :	
				float f = rs.getFloat(colIndex);
				value = String.valueOf(f==0?"":f);
				break;
			case Types.DECIMAL :
			case Types.REAL :
			case Types.NUMERIC :
				value = handleBigDecimal(rs.getBigDecimal(colIndex));
				break;
			case Types.INTEGER :
			case Types.TINYINT :
			case Types.SMALLINT :
				value = handleInteger(rs, colIndex);
				break;
			case Types.DATE :
				value = handleTimestamp(rs.getTimestamp(colIndex));
				break;
			case Types.TIME :
				value = handleTime(rs.getTime(colIndex));
				break;
			case Types.TIMESTAMP :
				value = handleTimestamp(rs.getTimestamp(colIndex));
				break;
			case NVARCHAR : // todo : use rs.getNString
			case NCHAR : // todo : use rs.getNString
			case LONGNVARCHAR : // todo : use rs.getNString
			case Types.LONGVARCHAR :
			case Types.VARCHAR :
			case Types.CHAR :
				value = rs.getString(colIndex);

				// if(bFlag)
				if (StringUtil.isNotNull(value)) {
					if (value.contains(","))
						value = "\"" + value + "\"";

				}
				break;
			default :
				value = "";
		}
		if (value == null)
			value = "";
		else
			value = value.replace('\n', ' ').replace('\r', ' ');

		return value.trim();
	}

	private static String read(Clob c) throws SQLException, IOException {
		StringBuilder sb = new StringBuilder((int) c.length());
		Reader r = c.getCharacterStream();
		char[] cbuf = new char[CLOBBUFFERSIZE];
		int n;
		while ((n = r.read(cbuf, 0, cbuf.length)) != -1)
			sb.append(cbuf, 0, n);
		return sb.toString();
	}
}
