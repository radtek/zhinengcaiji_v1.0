package cn.uway.webservice.client;

import java.net.MalformedURLException;
import java.net.URL;
import java.rmi.RemoteException;

import javax.xml.rpc.ServiceException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Test {

	private static final Logger log = LoggerFactory.getLogger(Test.class);

	public static void main(String[] args) throws ServiceException, RemoteException {
		String clientKey = "---------------key-----------------";
		log.debug(clientKey);
		String url = "http://localhost:8088/nbi/services/BSAServiceImpl?wsdl";
		BSAServiceImplServiceLocator service = new BSAServiceImplServiceLocator();
		BSAServiceImpl_PortType gsp;
		try {
			gsp = service.getBSAServiceImpl(new URL(url));
			int result = gsp.bsaCommandInterface("25,512,510,513,519,511,516,514,523,515,518,527,517", "add");
			log.debug("调用输出结果：  " + result);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}

	}
}
