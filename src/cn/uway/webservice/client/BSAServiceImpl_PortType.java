/**
 * BSAServiceImpl_PortType.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package cn.uway.webservice.client;

public interface BSAServiceImpl_PortType extends java.rmi.Remote {

	public int bsaCommandInterface(java.lang.String city_id, java.lang.String type) throws java.rmi.RemoteException;

	public int deductIndicator(java.lang.String sid_nid_extidList) throws java.rmi.RemoteException;

	public int fullDeductIndicator(java.lang.String sid_nid_extidList) throws java.rmi.RemoteException;

	public void main(java.lang.String[] args) throws java.rmi.RemoteException;
}
