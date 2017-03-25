package cn.uway.webservice.managecontrol.webservice.client;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;

@WebService(name = "ITescommService", targetNamespace = "http://tempuri.org/")
@SOAPBinding(use = SOAPBinding.Use.LITERAL, parameterStyle = SOAPBinding.ParameterStyle.WRAPPED)
public interface ITescommService {

	@WebMethod(operationName = "WNMSChangeAsyncback", action = "http://tempuri.org/ITescommService/WNMSChangeAsyncback")
	@WebResult(name = "WNMSChangeAsyncbackResult", targetNamespace = "http://tempuri.org/")
	public int wNMSChangeAsyncback(@WebParam(name = "BTSname", targetNamespace = "http://tempuri.org/") String BTSname,
			@WebParam(name = "FTPpath", targetNamespace = "http://tempuri.org/") String FTPpath,
			@WebParam(name = "NodeState", targetNamespace = "http://tempuri.org/") String NodeState);

	@WebMethod(operationName = "CombaCallBack", action = "http://tempuri.org/ITescommService/CombaCallBack")
	@WebResult(name = "CombaCallBackResult", targetNamespace = "http://tempuri.org/")
	public int combaCallBack(@WebParam(name = "BTSname", targetNamespace = "http://tempuri.org/") String BTSname,
			@WebParam(name = "FTPpath", targetNamespace = "http://tempuri.org/") String FTPpath);

	@WebMethod(operationName = "PropertyUpdate", action = "http://tempuri.org/ITescommService/PropertyUpdate")
	@WebResult(name = "PropertyUpdateResult", targetNamespace = "http://tempuri.org/")
	public int propertyUpdate(@WebParam(name = "FTPpath", targetNamespace = "http://tempuri.org/") String FTPpath);

	@WebMethod(operationName = "EMOSCallBack", action = "http://tempuri.org/ITescommService/EMOSCallBack")
	@WebResult(name = "EMOSCallBackResult", targetNamespace = "http://tempuri.org/")
	public int eMOSCallBack(@WebParam(name = "BTSname", targetNamespace = "http://tempuri.org/") String BTSname,
			@WebParam(name = "FTPpath", targetNamespace = "http://tempuri.org/") String FTPpath,
			@WebParam(name = "NodeState", targetNamespace = "http://tempuri.org/") String NodeState);

	@WebMethod(operationName = "CombaAlarmAsyncback", action = "http://tempuri.org/ITescommService/CombaAlarmAsyncback")
	@WebResult(name = "CombaAlarmAsyncbackResult", targetNamespace = "http://tempuri.org/")
	public int combaAlarmAsyncback(@WebParam(name = "BTSname", targetNamespace = "http://tempuri.org/") String BTSname,
			@WebParam(name = "FTPpath", targetNamespace = "http://tempuri.org/") String FTPpath,
			@WebParam(name = "NodeState", targetNamespace = "http://tempuri.org/") String NodeState);

	@WebMethod(operationName = "IndoorWorkOrderSend", action = "http://tempuri.org/ITescommService/IndoorWorkOrderSend")
	@WebResult(name = "IndoorWorkOrderSendResult", targetNamespace = "http://tempuri.org/")
	public int indoorWorkOrderSend(@WebParam(name = "BTSname", targetNamespace = "http://tempuri.org/") String BTSname,
			@WebParam(name = "Details", targetNamespace = "http://tempuri.org/") String Details);

	@WebMethod(operationName = "WNMSCallBack", action = "http://tempuri.org/ITescommService/WNMSCallBack")
	@WebResult(name = "WNMSCallBackResult", targetNamespace = "http://tempuri.org/")
	public int wNMSCallBack(@WebParam(name = "BTSname", targetNamespace = "http://tempuri.org/") String BTSname,
			@WebParam(name = "FTPpath", targetNamespace = "http://tempuri.org/") String FTPpath,
			@WebParam(name = "NodeState", targetNamespace = "http://tempuri.org/") String NodeState);

	@WebMethod(operationName = "TianYueCallBack", action = "http://tempuri.org/ITescommService/TianYueCallBack")
	@WebResult(name = "TianYueCallBackResult", targetNamespace = "http://tempuri.org/")
	public int tianYueCallBack(@WebParam(name = "BTSname", targetNamespace = "http://tempuri.org/") String BTSname,
			@WebParam(name = "FTPpath", targetNamespace = "http://tempuri.org/") String FTPpath);

	@WebMethod(operationName = "WNMSWorkOrderSend", action = "http://tempuri.org/ITescommService/WNMSWorkOrderSend")
	@WebResult(name = "WNMSWorkOrderSendResult", targetNamespace = "http://tempuri.org/")
	public int wNMSWorkOrderSend(@WebParam(name = "BTSname", targetNamespace = "http://tempuri.org/") String BTSname,
			@WebParam(name = "Details", targetNamespace = "http://tempuri.org/") String Details);

	@WebMethod(operationName = "TianYueUpdate", action = "http://tempuri.org/ITescommService/TianYueUpdate")
	@WebResult(name = "TianYueUpdateResult", targetNamespace = "http://tempuri.org/")
	public int tianYueUpdate(@WebParam(name = "FTPpath", targetNamespace = "http://tempuri.org/") String FTPpath);

	@WebMethod(operationName = "CombaUpdate", action = "http://tempuri.org/ITescommService/CombaUpdate")
	@WebResult(name = "CombaUpdateResult", targetNamespace = "http://tempuri.org/")
	public int combaUpdate(@WebParam(name = "FTPpath", targetNamespace = "http://tempuri.org/") String FTPpath);

	@WebMethod(operationName = "PropertyCallBack", action = "http://tempuri.org/ITescommService/PropertyCallBack")
	@WebResult(name = "PropertyCallBackResult", targetNamespace = "http://tempuri.org/")
	public int propertyCallBack(@WebParam(name = "BTSname", targetNamespace = "http://tempuri.org/") String BTSname,
			@WebParam(name = "FTPpath", targetNamespace = "http://tempuri.org/") String FTPpath);

}
