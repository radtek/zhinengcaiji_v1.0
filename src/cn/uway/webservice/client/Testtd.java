package cn.uway.webservice.client;

import java.net.MalformedURLException;
import java.net.URL;
import java.rmi.RemoteException;

import javax.xml.rpc.ServiceException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Testtd {

	private static final Logger log = LoggerFactory.getLogger(Testtd.class);

	public static void main(String[] args) throws ServiceException, RemoteException {
		String clientKey = "---------------key-----------------";
		log.debug(clientKey);
		String url = "http://localhost:8088/nbi/services/BSAServiceImpl?wsdl";
		BSAServiceImplServiceLocator service = new BSAServiceImplServiceLocator();
		BSAServiceImpl_PortType gsp;
		String id = null;
		if (args != null && args.length >= 1) {
			id = args[0];
		}
		try {
			gsp = service.getBSAServiceImpl(new URL(url));
			int result = gsp.fullDeductIndicator(id);
			log.debug("调用输出结果：  " + result);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}

	}
}
