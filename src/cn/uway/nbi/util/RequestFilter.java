package cn.uway.nbi.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class RequestFilter implements Filter {

	private static Logger logger = LoggerFactory.getLogger(RequestFilter.class);

	public void destroy() {

	}

	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest http = (HttpServletRequest) req;
		String remoteadd = req.getRemoteAddr();

		logger.info("接收到请求:" + http.getRequestURL() + " 请求者:" + remoteadd);

		chain.doFilter(req, resp);
	}

	public void init(FilterConfig arg0) throws ServletException {
	}

}
