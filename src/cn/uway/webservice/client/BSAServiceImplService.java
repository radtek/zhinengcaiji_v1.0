/**
 * BSAServiceImplService.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package cn.uway.webservice.client;

public interface BSAServiceImplService extends javax.xml.rpc.Service {

	public java.lang.String getBSAServiceImplAddress();

	public cn.uway.webservice.client.BSAServiceImpl_PortType getBSAServiceImpl() throws javax.xml.rpc.ServiceException;

	public cn.uway.webservice.client.BSAServiceImpl_PortType getBSAServiceImpl(java.net.URL portAddress) throws javax.xml.rpc.ServiceException;
}
