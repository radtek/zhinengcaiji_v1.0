/**
 * BSAServiceImplServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package cn.uway.webservice.client;

public class BSAServiceImplServiceLocator extends org.apache.axis.client.Service implements cn.uway.webservice.client.BSAServiceImplService {

	public BSAServiceImplServiceLocator() {
	}

	public BSAServiceImplServiceLocator(org.apache.axis.EngineConfiguration config) {
		super(config);
	}

	public BSAServiceImplServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
		super(wsdlLoc, sName);
	}

	// Use to get a proxy class for BSAServiceImpl
	private java.lang.String BSAServiceImpl_address = "http://localhost:8088/nbi/services/BSAServiceImpl";

	public java.lang.String getBSAServiceImplAddress() {
		return BSAServiceImpl_address;
	}

	// The WSDD service name defaults to the port name.
	private java.lang.String BSAServiceImplWSDDServiceName = "BSAServiceImpl";

	public java.lang.String getBSAServiceImplWSDDServiceName() {
		return BSAServiceImplWSDDServiceName;
	}

	public void setBSAServiceImplWSDDServiceName(java.lang.String name) {
		BSAServiceImplWSDDServiceName = name;
	}

	public cn.uway.webservice.client.BSAServiceImpl_PortType getBSAServiceImpl() throws javax.xml.rpc.ServiceException {
		java.net.URL endpoint;
		try {
			endpoint = new java.net.URL(BSAServiceImpl_address);
		} catch (java.net.MalformedURLException e) {
			throw new javax.xml.rpc.ServiceException(e);
		}
		return getBSAServiceImpl(endpoint);
	}

	public cn.uway.webservice.client.BSAServiceImpl_PortType getBSAServiceImpl(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
		try {
			cn.uway.webservice.client.BSAServiceImplSoapBindingStub _stub = new cn.uway.webservice.client.BSAServiceImplSoapBindingStub(portAddress,
					this);
			_stub.setPortName(getBSAServiceImplWSDDServiceName());
			return _stub;
		} catch (org.apache.axis.AxisFault e) {
			return null;
		}
	}

	public void setBSAServiceImplEndpointAddress(java.lang.String address) {
		BSAServiceImpl_address = address;
	}

	/**
	 * For the given interface, get the stub implementation. If this service has no port for the given interface, then ServiceException is thrown.
	 */
	public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
		try {
			if (cn.uway.webservice.client.BSAServiceImpl_PortType.class.isAssignableFrom(serviceEndpointInterface)) {
				cn.uway.webservice.client.BSAServiceImplSoapBindingStub _stub = new cn.uway.webservice.client.BSAServiceImplSoapBindingStub(
						new java.net.URL(BSAServiceImpl_address), this);
				_stub.setPortName(getBSAServiceImplWSDDServiceName());
				return _stub;
			}
		} catch (java.lang.Throwable t) {
			throw new javax.xml.rpc.ServiceException(t);
		}
		throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  "
				+ (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
	}

	/**
	 * For the given interface, get the stub implementation. If this service has no port for the given interface, then ServiceException is thrown.
	 */
	public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
		if (portName == null) {
			return getPort(serviceEndpointInterface);
		}
		java.lang.String inputPortName = portName.getLocalPart();
		if ("BSAServiceImpl".equals(inputPortName)) {
			return getBSAServiceImpl();
		} else {
			java.rmi.Remote _stub = getPort(serviceEndpointInterface);
			((org.apache.axis.client.Stub) _stub).setPortName(portName);
			return _stub;
		}
	}

	public javax.xml.namespace.QName getServiceName() {
		return new javax.xml.namespace.QName("http://netOptimize.local.webservice", "BSAServiceImplService");
	}

	private java.util.HashSet ports = null;

	public java.util.Iterator getPorts() {
		if (ports == null) {
			ports = new java.util.HashSet();
			ports.add(new javax.xml.namespace.QName("http://netOptimize.local.webservice", "BSAServiceImpl"));
		}
		return ports.iterator();
	}

	/**
	 * Set the endpoint address for the specified port name.
	 */
	public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {

		if ("BSAServiceImpl".equals(portName)) {
			setBSAServiceImplEndpointAddress(address);
		} else { // Unknown Port Name
			throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
		}
	}

	/**
	 * Set the endpoint address for the specified port name.
	 */
	public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
		setEndpointAddress(portName.getLocalPart(), address);
	}

}
