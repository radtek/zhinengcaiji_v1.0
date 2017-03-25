package cn.uway.webservice.dt;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;

import javax.xml.namespace.QName;
import javax.xml.soap.SOAPException;
import javax.xml.soap.SOAPHeader;

import org.apache.axis.AxisFault;
import org.apache.axis.Message;
import org.apache.axis.MessageContext;
import org.apache.axis.handlers.BasicHandler;
import org.apache.axis.message.MessageElement;
import org.apache.axis.message.SOAPEnvelope;
import org.apache.axis.message.SOAPHeaderElement;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.util.ConstDef;

@SuppressWarnings("unchecked")
public class DTHandle extends BasicHandler {

	private static final Logger LOG = LoggerFactory.getLogger(DTHandle.class);

	private static final long serialVersionUID = 1L;

	// String endpoint =
	// "http://192.168.15.103:8088/nbi/services/DTService?wsdl";//
	// ServiceConstant.endpoint;//
	// webservice的具体路径
	Map<String, String> map = ConstDef.checkMap;// 包含校验码信息的map

	// 在执行service前先处理handler
	// invoke()会被自动调用，而且 SOAP 信息可以由 msgContext 取得
	public void invoke(MessageContext msgContext) throws AxisFault {
		LOG.debug("invoke");
		boolean processedHeader = false;
		try {
			// 取得 Request 的 SOAP 信息
			Message msg = msgContext.getRequestMessage();
			SOAPEnvelope envelope = msg.getSOAPEnvelope();
			SOAPHeader header = envelope.getHeader();
			Iterator it = header.examineAllHeaderElements();
			SOAPHeaderElement hel;
			while (it.hasNext()) {
				hel = (SOAPHeaderElement) it.next();
				String headerName = hel.getNodeName();
				if (headerName.equals("cp:MessageHeader")) {
					// 对于 mustUnderstand 设为 true 的 Header，必须
					// 利用下列的方式把它设为"已经处理"，否则 service
					// 会回传 Did not understand "MustUnderstand"
					hel.setProcessed(true);
					checkUser(hel);
					processedHeader = true;
				}
			}
		} catch (SOAPException e) {
			LOG.error("无法处理 SOAP Header.", e);
			throw new AxisFault("无法处理 SOAP Header.", e);

		}
		if (!processedHeader) {
			LOG.error("接收 SOAP Header 失败");
			throw new AxisFault("接收 SOAP Header 失败");
		} else {
			LOG.error("接收 SOAP Header 成功");
			System.out.println("成功");
		}
	}

	private void checkUser(SOAPHeaderElement hel) throws AxisFault {
		MessageElement element1 = hel.getChildElement(new QName("http://netOptimize.local.webservice", "name"));
		MessageElement element2 = hel.getChildElement(new QName("http://netOptimize.local.webservice", "password"));
		String username = element1.getValue();
		String password = element2.getValue();
		String passtmp = map.get(username);
		if (!map.containsKey(username) || !password.equalsIgnoreCase(passtmp))
			throw new AxisFault("校验失败");

		// String current = DateUtil.getDateString(new Date());// 当前时间字符串
		// MessageElement element1 = hel.getChildElement(new QName(endpoint,
		// "isLogin"));
		//
		// MessageElement element2 = hel.getChildElement(new QName(endpoint,
		// "operNum"));
		//
		// MessageElement element3 = hel.getChildElement(new QName(endpoint,
		// "checkNum"));
		//
		// MessageElement element4 = hel.getChildElement(new QName(endpoint,
		// "time"));
		//
		// // 用户访问的不是登录接口，则进行校验码验证
		// if ( null == element1 && null != element2 && null != element3
		// && null != element4 )
		// {
		// operNum = element2.getValue();
		// checkNum = element3.getValue();
		// time = element4.getValue();
		// Boolean flag1 = false;
		// if ( map.keySet().contains(operNum) )
		// {
		// CheckNumBean check = (CheckNumBean) map.get(operNum);
		// System.out.println(check.getCheckNum());
		// if ( check.getCheckNum().equals(checkNum) )
		// {
		// flag1 = true;
		// }
		// }
		//
		// Boolean flag2 = false;
		// if ( flag1 )
		// {
		// // 计算服务器时间与soapHeader时间戳之间的差值
		// Long between = countTime(time, current);
		// // 时差在一个小时之内，算正常
		// if ( Math.abs(between) < 3600L )
		// {
		// flag2 = true;
		// }
		// }
		//
		// if ( !(flag1 && flag2) ) { throw new AxisFault("校验失败"); }
		//
		// // 更新map内信息
		// CheckNumBean check = (CheckNumBean) map.get(operNum);
		// check.setLastTime(check.getCurrentTime());
		// check.setCurrentTime(current);
		// }
		// else if ( null == element1
		// && (null == element2 || null == element3 || null == element4) ) {
		// throw new AxisFault("校验失败"); }
	}

	// 计算时间差
	private Long countTime(String str1, String str2) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date begin = null;
		Date end = null;
		try {
			begin = df.parse(str1);
			end = df.parse(str2);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		long between = (end.getTime() - begin.getTime()) / 1000;// 除以1000是为了转换成秒
		return between;
	}
}