package cn.uway.nbi.task.triggerbean;

import java.sql.Connection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.db.dbpool.DBUtil;
import cn.uway.nbi.db.pojo.Task;
import cn.uway.nbi.framework.IDMember;

/**
 * 更新事件
 * 
 * @author litp 2011-8-5
 */
@IDMember(id = 2)
public class UpdateBean extends TriggerBean {

	private static final Logger LOG = LoggerFactory.getLogger(UpdateBean.class);

	public void setParam(Object param) throws Exception {
		// this.param = (Connection) param;
	}

	@Override
	public void trigger(Task task) throws Exception {
		param = DBUtil.getConnection();
		String sql = "update ne_bts_c b set (b.longitude, b.latitude) =(select a.lng, a.lat  from (select max(t.longitude) lng, max(t.latitude) lat, ne_bts_id id from cfg_map_dev_to_ne t where t.longitude is not null and t.latitude is not null and t.ne_bts_id is not null group by ne_bts_id) a where b.ne_sys_id = a.id) where longitude is null  and latitude is null";

		LOG.debug(sql);
		DBUtil.executeUpdateO((Connection) param, sql);
	}

}