package cn.uway.nbi.db.dao;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.db.pojo.BsaDTO;

public class BSADataCheckUtil {

	private BSARuleLogDao bsaLog = new BSARuleLogDao();

	public boolean bsaHandleBefore(String[] values, StringBuilder sbColumn, StringBuilder sbErrorType, String stempName) {
		if (values.length < 25) {
			return false;
		}

		values[23] = "1";
		values[24] = "-1";

		String split = ",";

		boolean tuidaoFlag1 = false;
		boolean tuidaoFlag2 = false;
		boolean tuidaoFlag3 = false;

		boolean tuidaoFlag4 = false;
		boolean tuidaoFlag5 = false;

		for (int i = 0; i < values.length; i++) {
			String tmp = values[i];
			if (i == 0) {
				if (!findByRegex(tmp, "^[-a-zA-Z0-9]{1,50}$", 0)) {
					sbColumn.append("A").append(split);
					sbErrorType.append("1").append(split);
				}
			}

			else if (i == 1) {
				if (!findByRegex(tmp, "^(\\d{1,4}|[1-2]\\d\\d\\d\\d|3[0-1]\\d\\d\\d|32[0-6]\\d\\d|327[0-5]\\d|3276[0-7])$", 0)) {
					sbColumn.append("B").append(split);
					sbErrorType.append("1").append(split);
				}
			}

			else if (i == 2) {
				if (!findByRegex(tmp, "^(\\d{1,4}|[1-5]\\d\\d\\d\\d|6[0-4]\\d\\d\\d|65[0-4]\\d\\d|655[0-2]\\d|6553[0-5])$", 0)) {
					sbColumn.append("C").append(split);
					sbErrorType.append("1").append(split);
				}
			} else if (i == 3) {
				if (StringUtil.isNotNull(tmp.trim()) && !findByRegex(tmp, "^([1-9]\\d*)$", 0)) {
					sbColumn.append("D").append(split);
					sbErrorType.append("1").append(split);
				}
			} else if (i == 4) {
				// 对值的范围进行检验
				if (StringUtil.isNull(values[4])
						|| (StringUtil.isNotNull(values[4]) && !findByRegex(tmp, "^(\\d{1,2}|[1-4]\\d\\d|50\\d|51[01])$", 0))) {
					sbColumn.append("E").append(split);
					sbErrorType.append("1").append(split);
				}

			}

			else if (i == 5) {
				if (StringUtil.isNotNull(tmp.trim()) && !findByRegex(tmp, "^(\\d(\\.\\d+)?|[1-8]\\d(\\.\\d+)?|90(\\.0+)?)$", 0)) {
					sbColumn.append("F").append(split);
					sbErrorType.append("1").append(split);
				}
			} else if (i == 6) {
				if (StringUtil.isNotNull(tmp.trim()) && !findByRegex(tmp, "^(\\d{1,2}(\\.\\d+)?|1[0-7]\\d(\\.\\d+)?|180(\\.0+)?)$", 0)) {
					sbColumn.append("G").append(split);
					sbErrorType.append("1").append(split);
				}
			} else if (i == 7) {
				if (StringUtil.isNotNull(tmp.trim()) && !findByRegex(tmp, "^(\\-?\\d{1,2}|\\-1[0-5]\\d|\\-160|[1-9]\\d\\d|[1-8]\\d\\d\\d|9000)$", 0)) {
					sbColumn.append("H").append(split);
					sbErrorType.append("1").append(split);
				}
			}

			else if (i == 8) {
				if (StringUtil.isNull(tmp)) {
					sbColumn.append("I").append(split);
					sbErrorType.append("9").append(split);
					tuidaoFlag1 = true;
				} else if (StringUtil.isNotNull(tmp)
						&& (findByRegex(tmp, "^([1-9]|\\d{2,4}|[1-5]\\d\\d\\d\\d|6[0-4]\\d\\d\\d|65[0-4]\\d\\d|655[0-2]\\d|6553[0-5])$", 0) && !findByRegex(
								tmp, "^(300|600|1500)$", 0))) {
					sbColumn.append("I").append(split);
					sbErrorType.append("4").append(split);
					tuidaoFlag1 = true;
				}
			} else if (i == 9) {
				if (StringUtil.isNotNull(tmp.trim()) && !findByRegex(tmp, "^(\\-?\\d(\\.\\d+)?|\\-?[1-8]\\d(\\.\\d+)?|\\-?90(\\.0+)?)$", 0)) {
					sbColumn.append("J").append(split);
					sbErrorType.append("1").append(split);
				}

				if (StringUtil.isNull(tmp)) {
					values[9] = "0";
				}
			}

			else if (i == 10) {
				if (StringUtil.isNotNull(tmp.trim()) && !findByRegex(tmp, "^(\\-?\\d{1,2}(\\.\\d+)?|\\-?1[0-7]\\d(\\.\\d+)?|\\-?180(\\.0+)?)$", 0)) {
					sbColumn.append("K").append(split);
					sbErrorType.append("5").append(split);
				}

				if (StringUtil.isNull(tmp)) {
					values[10] = "0";
				}
			} else if (i == 11) {
				if (StringUtil.isNull(tmp)) {
					values[11] = "0";
				} else if (!findByRegex(
						tmp,
						"^(\\-?\\d{1,2}(\\.\\d+)?|\\-1[0-5]\\d(\\.\\d+)?|\\-160(\\.0+)?|[1-9]\\d\\d(\\.\\d+)?|[1-8]\\d\\d\\d(\\.\\d+)?|9000(\\.0+)?)$",
						0)) {
					sbColumn.append("L").append(split);
					sbErrorType.append("1").append(split);
				}
			}

			else if (i == 12) {
				if (StringUtil.isNotNull(tmp) && !findByRegex(tmp, "^(\\d{1,2}|[1,2]\\d\\d|3[0-5]\\d)$", 0)) {
					sbColumn.append("M").append(split);
					sbErrorType.append("1").append(split);
				}
			} else if (i == 13) {
				if (StringUtil.isNotNull(tmp) && !findByRegex(tmp, "^([1-9]|[1-9]\\d|[12]\\d\\d|3[0-5]\\d|360)$", 0)) {
					sbColumn.append("N").append(split);
					sbErrorType.append("1").append(split);
				}
			} else if (i == 14) {
				if (StringUtil.isNotNull(tmp) && !findByRegex(tmp, "^([1-9]\\d{0,4}|100000)$", 0)) {
					sbColumn.append("O").append(split);
					sbErrorType.append("1").append(split);
				}
			}

			else if (i == 15) {
				if (StringUtil.isNotNull(tmp)
						&& !findByRegex(
								tmp,
								"^(\\-?\\d{1,2}(\\.\\d+)?|\\-1[0-5]\\d(\\.\\d+)?|\\-160(\\.0+)?|[1-9]\\d\\d(\\.\\d+)?|[1-8]\\d\\d\\d(\\.\\d+)?|9000(\\.0+)?)$",
								0)) {
					sbColumn.append("P").append(split);
					sbErrorType.append("6").append(split);
				}
				if (StringUtil.isNull(tmp)) {
					values[15] = "0";
				}
			}

			else if (i == 16) {
				if (StringUtil.isNull(tmp)) {
					values[16] = "0";
				} else if (StringUtil.isNotNull(tmp.trim())
						&& !findByRegex(
								tmp,
								"^(\\-?\\d{1,2}(\\.\\d+)?|\\-1[0-5]\\d(\\.\\d+)?|\\-160(\\.0+)?|[1-9]\\d\\d(\\.\\d+)?|[1-8]\\d\\d\\d(\\.\\d+)?|9000(\\.0+)?)$",
								0)) {
					sbColumn.append("Q").append(split);
					sbErrorType.append("6").append(split);
				}

			}

			else if (i == 17) {
				if (StringUtil.isNull(tmp.trim()) || !findByRegex(tmp, "^[01]$", 0)) {
					sbColumn.append("R").append(split);
					sbErrorType.append("1").append(split);
				}
			}

			else if (i == 18) {
				if (StringUtil.isNotNull(tmp.trim())) {
					if (!findByRegex(tmp, "^[1-8]$", 0)) {
						sbColumn.append("S").append(split);
						sbErrorType.append("1").append(split);
					} else if (StringUtil.isNotNull(values[4]) && Float.valueOf(values[4]) % Float.valueOf(tmp.trim()) != 0) {
						sbColumn.append("S").append(split);
						sbErrorType.append("11").append(split);
					}
				}
			} else if (i == 19) {
				if (StringUtil.isNotNull(tmp.trim()) && !findByRegex(tmp, "^(\\-?\\d{1,4}(\\.\\d+)?|\\-?10000(\\.0+)?)$", 0)) {
					sbColumn.append("T").append(split);
					sbErrorType.append("13").append(split);
				}
			} else if (i == 20) {
				if (StringUtil.isNotNull(tmp.trim())
						&& !findByRegex(
								tmp,
								"^([1-9]\\d{0,3}(\\.\\d+)?|[1-5]\\d\\d\\d\\d(\\.\\d+)?|6[0-4]\\d\\d\\d(\\.\\d+)?|65[0-4]\\d\\d(\\.\\d+)?|655[0-2]\\d(\\.\\d+)?|6553[0-4](\\.\\d+)?|65535(\\.0+)?)$",
								0)) {
					sbColumn.append("U").append(split);
					sbErrorType.append("13").append(split);
				}
			} else if (i == 21) {
				if (StringUtil.isNotNull(tmp.trim()) && !findByRegex(tmp, "^(\\-?\\d{1,4}(\\.\\d+)?|\\-?10000(\\.0+)?)$", 0)) {
					sbColumn.append("V").append(split);
					sbErrorType.append("15").append(split);
					tuidaoFlag2 = true;
				}
			} else if (i == 22) {
				if (StringUtil.isNotNull(tmp.trim())
						&& !findByRegex(
								tmp,
								"^([1-9]\\d{0,3}(\\.\\d+)?|[1-5]\\d\\d\\d\\d(\\.\\d+)?|6[0-4]\\d\\d\\d(\\.\\d+)?|65[0-4]\\d\\d(\\.\\d+)?|655[0-2]\\d(\\.\\d+)?|6553[0-4](\\.\\d+)?|65535(\\.0+)?)$",
								0)) {
					sbColumn.append("W").append(split);
					sbErrorType.append("15").append(split);
					tuidaoFlag3 = true;

				}
			} else if (i == 23) {
				if (StringUtil.isNull(tmp.trim())) {
					values[23] = "1";
				} else if (StringUtil.isNotNull(tmp.trim()) && (StringUtil.isNotNull(tmp.trim()) && Double.valueOf(tmp) > 1)) {
					sbColumn.append("X").append(split);
					sbErrorType.append("15").append(split);
					tuidaoFlag4 = true;
				}

			} else if (i == 24) {
				if (StringUtil.isNull(tmp.trim())) {
					values[24] = "-1";
				} else if (StringUtil.isNotNull(tmp.trim()) && !(Double.valueOf(tmp) >= -1 && Double.valueOf(tmp) <= 255)) {
					sbColumn.append("Y");
					sbErrorType.append("1");
					tuidaoFlag5 = true;
				}
			}
		}
		if (sbErrorType.length() > 0) {
			BsaDTO dto = bsaLog.conver(values, sbColumn.toString(), sbErrorType.toString(), "4");
			bsaLog.insertNBILog(dto);
			if (tuidaoFlag1 || tuidaoFlag2 || tuidaoFlag3 || tuidaoFlag4 || tuidaoFlag5) {
				return true;
			} else {
				return false;
			}
		}
		return true;
	}

	public boolean bsaHandleAfter(String[] values, StringBuilder sbColumn, StringBuilder sbErrorType, String stempName) {
		if (values.length < 25) {
			return false;
		}

		boolean bFlag = bsaHandleAfterCheck(values, sbColumn, sbErrorType);

		if (!bFlag) {

			BsaDTO dto = bsaLog.conver(values, sbColumn.toString(), sbErrorType.toString(), stempName);
			bsaLog.insertNBILog(dto);
			return false;
		}

		return true;
	}

	public boolean bsaHandleAfterCheck(String[] values, StringBuilder sbColumn, StringBuilder sbErrorType) {
		if (values.length < 25) {
			return false;
		}

		values[23] = "1";
		values[24] = "-1";

		String split = ",";


		for (int i = 0; i < values.length; i++) {
			String tmp = values[i];
			if (i == 0) {
				if (!findByRegex(tmp, "^[-a-zA-Z0-9]{1,50}$", 0)) {
					sbColumn.append("A").append(split);
					sbErrorType.append("1").append(split);
				}
			}

			else if (i == 1) {
				if (!findByRegex(tmp, "^(\\d{1,4}|[1-2]\\d\\d\\d\\d|3[0-1]\\d\\d\\d|32[0-6]\\d\\d|327[0-5]\\d|3276[0-7])$", 0)) {
					sbColumn.append("B").append(split);
					sbErrorType.append("1").append(split);
				}
			}

			else if (i == 2) {

				if (!findByRegex(tmp, "^(\\d{1,4}|[1-5]\\d\\d\\d\\d|6[0-4]\\d\\d\\d|65[0-4]\\d\\d|655[0-2]\\d|6553[0-5])$", 0)) {
					sbColumn.append("C").append(split);
					sbErrorType.append("1").append(split);
				}
			}
			else if (i == 3) {
				if (StringUtil.isNotNull(tmp.trim()) && !findByRegex(tmp, "^([1-9]\\d*)$", 0)) {
					sbColumn.append("D").append(split);
					sbErrorType.append("1").append(split);
				}
			}
			else if (i == 4) {
				// 对值的范围进行检验
				if (StringUtil.isNull(values[4])
						|| (StringUtil.isNotNull(values[4]) && !  findByRegex(tmp, "^(\\d{1,2}|[1-4]\\d\\d|50\\d|51[01])$", 0))) {
					sbColumn.append("E").append(split);
					sbErrorType.append("1").append(split);
				}
			}

			else if (i == 5) {
				if (StringUtil.isNotNull(tmp.trim()) && !  findByRegex(tmp, "^(\\d(\\.\\d+)?|[1-8]\\d(\\.\\d+)?|90(\\.0+)?)$", 0)) {
					sbColumn.append("F").append(split);
					sbErrorType.append("1").append(split);
				}
			}
			else if (i == 6) {
				if (StringUtil.isNotNull(tmp.trim()) && ! findByRegex(tmp, "^(\\d{1,2}(\\.\\d+)?|1[0-7]\\d(\\.\\d+)?|180(\\.0+)?)$", 0)) {
					sbColumn.append("G").append(split);
					sbErrorType.append("1").append(split);
				}
			}
			else if (i == 7) {
				if (StringUtil.isNotNull(tmp.trim()) && ! findByRegex(tmp, "^(\\-?\\d{1,2}|\\-1[0-5]\\d|\\-160|[1-9]\\d\\d|[1-8]\\d\\d\\d|9000)$", 0)) {
					sbColumn.append("H").append(split);
					sbErrorType.append("1").append(split);
				}
			}

			else if (i == 8) {
				if (StringUtil.isNull(tmp)) {
					sbColumn.append("I").append(split);
					sbErrorType.append("9").append(split);
				} else if (StringUtil.isNotNull(tmp) &&  ( findByRegex(tmp, "^([1-9]|\\d{2,4}|[1-5]\\d\\d\\d\\d|6[0-4]\\d\\d\\d|65[0-4]\\d\\d|655[0-2]\\d|6553[0-5])$", 0) && !findByRegex(tmp, "^(300|600|1500)$", 0))) {
					
					sbColumn.append("I").append(split);
					sbErrorType.append("4").append(split);
				}
			}
			else if (i == 9) {
				if (StringUtil.isNotNull(tmp.trim()) && ! findByRegex(tmp, "^(\\-?\\d(\\.\\d+)?|\\-?[1-8]\\d(\\.\\d+)?|\\-?90(\\.0+)?)$", 0)) {
					sbColumn.append("J").append(split);
					sbErrorType.append("1").append(split);
				}
				if (StringUtil.isNull(tmp)) {
					values[9] = "0";
				}
			}

			else if (i == 10) {
				if (StringUtil.isNotNull(tmp.trim()) && ! findByRegex(tmp, "^(\\-?\\d{1,2}(\\.\\d+)?|\\-?1[0-7]\\d(\\.\\d+)?|\\-?180(\\.0+)?)$", 0)) {
					sbColumn.append("K").append(split);
					sbErrorType.append("5").append(split);
				}

				if (StringUtil.isNull(tmp)) {
					values[10] = "0";
				}
			}
			else if (i == 11) {
				if (StringUtil.isNull(tmp)) {
					values[11] = "0";
				}else if( !findByRegex(tmp, "^(\\-?\\d{1,2}(\\.\\d+)?|\\-1[0-5]\\d(\\.\\d+)?|\\-160(\\.0+)?|[1-9]\\d\\d(\\.\\d+)?|[1-8]\\d\\d\\d(\\.\\d+)?|9000(\\.0+)?)$", 0))
				{
					sbColumn.append("L").append(split);
					sbErrorType.append("1").append(split);
				}
				
			}

			else	if (i == 12) {
				if (StringUtil.isNotNull(tmp) && !  findByRegex(tmp, "^(\\d{1,2}|[1,2]\\d\\d|3[0-5]\\d)$", 0)) {
					sbColumn.append("M").append(split);
					sbErrorType.append("1").append(split);
				}
			}
			else if (i == 13) {
				if (StringUtil.isNotNull(tmp) && !  findByRegex(tmp, "^([1-9]|[1-9]\\d|[12]\\d\\d|3[0-5]\\d|360)$", 0)) {
					sbColumn.append("N").append(split);
					sbErrorType.append("1").append(split);
				}
			}
			else if (i == 14) {
				if (StringUtil.isNotNull(tmp) && !  findByRegex(tmp, "^([1-9]\\d{0,4}|100000)$", 0)) {
					sbColumn.append("O").append(split);
					sbErrorType.append("1").append(split);
				}
			}

			else if (i == 15) {
				if (StringUtil.isNotNull(tmp) && ! findByRegex(tmp, "^(\\-?\\d{1,2}(\\.\\d+)?|\\-1[0-5]\\d(\\.\\d+)?|\\-160(\\.0+)?|[1-9]\\d\\d(\\.\\d+)?|[1-8]\\d\\d\\d(\\.\\d+)?|9000(\\.0+)?)$", 0)) {
					sbColumn.append("P").append(split);
					sbErrorType.append("6").append(split);
				}
				if (StringUtil.isNull(tmp)) {
					values[15] = "0";
				}
			}

			else if (i == 16) {
				if (StringUtil.isNull(tmp)) {
					values[16] = "0";
				}else if (StringUtil.isNotNull(tmp.trim()) && !   findByRegex(tmp, "^(\\-?\\d{1,2}(\\.\\d+)?|\\-1[0-5]\\d(\\.\\d+)?|\\-160(\\.0+)?|[1-9]\\d\\d(\\.\\d+)?|[1-8]\\d\\d\\d(\\.\\d+)?|9000(\\.0+)?)$", 0)) {
					sbColumn.append("Q").append(split);
					sbErrorType.append("6").append(split);
				}

			}

			else if (i == 17) {
				if (StringUtil.isNull(tmp.trim()) || !  findByRegex(tmp, "^[01]$", 0)) {
					sbColumn.append("R").append(split);
					sbErrorType.append("1").append(split);
				}
			}

			else if (i == 18) {
				if (StringUtil.isNotNull(tmp.trim())) {
					if (!  findByRegex(tmp, "^[1-8]$", 0)) {
						sbColumn.append("S").append(split);
						sbErrorType.append("1").append(split);
					} else if (StringUtil.isNotNull(values[4]) && Float.valueOf(values[4]) % Float.valueOf(tmp.trim()) != 0) {
						sbColumn.append("S").append(split);
						sbErrorType.append("11").append(split);
					}
				}
			}
			else if (i == 19) {
				if (StringUtil.isNotNull(tmp.trim()) && !  findByRegex(tmp, "^(\\-?\\d{1,4}(\\.\\d+)?|\\-?10000(\\.0+)?)$", 0)) {
					sbColumn.append("T").append(split);
					sbErrorType.append("13").append(split);
				}
			}
			else if (i == 20) {
				if (StringUtil.isNotNull(tmp.trim()) && ! findByRegex(tmp, "^([1-9]\\d{0,3}(\\.\\d+)?|[1-5]\\d\\d\\d\\d(\\.\\d+)?|6[0-4]\\d\\d\\d(\\.\\d+)?|65[0-4]\\d\\d(\\.\\d+)?|655[0-2]\\d(\\.\\d+)?|6553[0-4](\\.\\d+)?|65535(\\.0+)?)$", 0)) {
					
					sbColumn.append("U").append(split);
					sbErrorType.append("13").append(split);
				}
			}
			else if (i == 21) {
				
				if (StringUtil.isNotNull(tmp.trim()) && ! findByRegex(tmp, "^(\\-?\\d{1,4}(\\.\\d+)?|\\-?10000(\\.0+)?)$", 0)) {
					sbColumn.append("V").append(split);
					sbErrorType.append("15").append(split);
				}
			}
			else if (i == 22) {
				if (StringUtil.isNotNull(tmp.trim()) && ! findByRegex(tmp, "^([1-9]\\d{0,3}(\\.\\d+)?|[1-5]\\d\\d\\d\\d(\\.\\d+)?|6[0-4]\\d\\d\\d(\\.\\d+)?|65[0-4]\\d\\d(\\.\\d+)?|655[0-2]\\d(\\.\\d+)?|6553[0-4](\\.\\d+)?|65535(\\.0+)?)$", 0)) {

					sbColumn.append("W").append(split);
					sbErrorType.append("15").append(split);

				}
			}
			else if (i == 23) {
				if (StringUtil.isNull(tmp.trim())) {
					values[23] = "1";
				} else if (StringUtil.isNotNull(tmp.trim()) && (StringUtil.isNotNull(tmp.trim()) && Double.valueOf(tmp) > 1)) {
					sbColumn.append("X").append(split);
					sbErrorType.append("15").append(split);
				}

			}
			else if (i == 24) {
				if (StringUtil.isNull(tmp.trim())) {
					values[24] = "-1";
				} else if (StringUtil.isNotNull(tmp.trim()) && !(Double.valueOf(tmp) >= -1 && Double.valueOf(tmp) <= 255)) {
					sbColumn.append("Y");
					sbErrorType.append("1");
				}
			}
		}
		if (sbErrorType.length() > 0 && values.length >= 25) {
			sbColumn.deleteCharAt(sbColumn.length() - 1);
			sbErrorType.deleteCharAt(sbErrorType.length() - 1);
			return false;
		}

		return true;
	}

	public boolean findByRegex(String str, String regEx, int group) {
		String resultValue = null;
		if (regEx == null || (regEx != null && "".equals(regEx.trim()))) {
			return false;
		}
		Pattern p = Pattern.compile(regEx);
		Matcher m = p.matcher(str);

		boolean result = m.find();// 查找是否有匹配的结果
		if (result) {
			resultValue = m.group(group);// 找出匹配的结果
		}
		return StringUtil.isNotNull(resultValue);
	}

	public static void main(String[] args) {
		BSADataCheckUtil u = new BSADataCheckUtil();

		boolean bb = u.findByRegex("abc2222", "^[-a-zA-Z0-9]{1,50}$", 0);
		System.out.println(bb);
		// try {
		// BufferedReader br = new BufferedReader(new
		// FileReader("C:\\Users\\Admin\\Desktop\\shanxi1227\\2\\REQ_FULL_201412260000_3510002.csv_out.csv"));
		// String lineTmp =null;
		// br.readLine();
		// br.readLine();
		// // while ((lineTmp = br.readLine()) != null) {
		// // String lines[]= lineTmp.split(",");
		// //
		// // if (lines.length >= 25) {
		// // StringBuilder sbColumn = new StringBuilder();
		// // StringBuilder sbErrorType = new StringBuilder();
		// // boolean b =u.bsaHandleAfter(lines, sbColumn, sbErrorType);
		// // System.out.println(b);
		// // }
		// // }
		//
		// String aa ="XZ-XinZhouWeiYe1-312-283,257,100,18546984,312,38.55993,112.64895,45,300,0,0,,200,120,5000,0,0,0,3,12,150,,,1,-1";
		// String lines[]= aa.split(",");
		//
		// StringBuilder sbColumn = new StringBuilder();
		// StringBuilder sbErrorType = new StringBuilder();
		// boolean b =u.bsaHandleBefore(lines, sbColumn, sbErrorType,"4");
		// System.out.println(b);
		// System.out.println(lines);
		//
		// } catch (Exception e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }

	}
}
