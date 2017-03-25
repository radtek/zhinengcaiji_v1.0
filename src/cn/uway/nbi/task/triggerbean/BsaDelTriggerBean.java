package cn.uway.nbi.task.triggerbean;

import cn.uway.nbi.framework.IDMember;

@IDMember(id = 3)
public class BsaDelTriggerBean extends AbstractBsaTriggerBean {

	private static final String SQL = "delete from ne_bsa_pde where ";

	@Override
	protected String getSql(String[] title, String[] nextLine) {

		// 删除数据 sid+nid+extend_bid为主键
		return SQL + "sid=" + nextLine[1] + " and nid=" + nextLine[2] + " and extend_bid= " + nextLine[3];
	}
}
