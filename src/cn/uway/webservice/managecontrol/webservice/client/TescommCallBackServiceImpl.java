package cn.uway.webservice.managecontrol.webservice.client;

import javax.jws.WebService;

@WebService(serviceName = "TescommCallBackService", targetNamespace = "http://tempuri.org/", endpointInterface = "cn.uway.webservice.managecontrol.ITescommService")
public class TescommCallBackServiceImpl implements ITescommService {

	@Override
	public int wNMSChangeAsyncback(String BTSname, String FTPpath, String NodeState) {
		throw new UnsupportedOperationException();
	}

	@Override
	public int combaCallBack(String BTSname, String FTPpath) {
		throw new UnsupportedOperationException();
	}

	@Override
	public int propertyUpdate(String FTPpath) {
		throw new UnsupportedOperationException();
	}

	@Override
	public int eMOSCallBack(String BTSname, String FTPpath, String NodeState) {
		throw new UnsupportedOperationException();
	}

	@Override
	public int combaAlarmAsyncback(String BTSname, String FTPpath, String NodeState) {
		throw new UnsupportedOperationException();
	}

	@Override
	public int indoorWorkOrderSend(String BTSname, String Details) {
		throw new UnsupportedOperationException();
	}

	@Override
	public int wNMSCallBack(String BTSname, String FTPpath, String NodeState) {
		throw new UnsupportedOperationException();
	}

	@Override
	public int tianYueCallBack(String BTSname, String FTPpath) {
		throw new UnsupportedOperationException();
	}

	@Override
	public int wNMSWorkOrderSend(String BTSname, String Details) {
		throw new UnsupportedOperationException();
	}

	@Override
	public int tianYueUpdate(String FTPpath) {
		throw new UnsupportedOperationException();
	}

	@Override
	public int combaUpdate(String FTPpath) {
		throw new UnsupportedOperationException();
	}

	@Override
	public int propertyCallBack(String BTSname, String FTPpath) {
		throw new UnsupportedOperationException();
	}

}
