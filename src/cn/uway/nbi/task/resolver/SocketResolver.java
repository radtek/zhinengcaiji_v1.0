package cn.uway.nbi.task.resolver;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.framework.IDMember;

/**
 * Socket型数据源解释器
 * 
 * @author litp 2011-5-18
 */
@IDMember(id = 300)
public class SocketResolver extends Resolver {

	private static final Logger LOG = LoggerFactory.getLogger(SocketResolver.class);

	@Override
	public void parseResolveNode() {

	}

	@Override
	public ResolverResult resolve() throws Exception {
		ResolverResult resolverResult = new ResolverResult();
		LOG.info("开始进行cocket数据收集!");
		return resolverResult;
	}
}
