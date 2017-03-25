package cn.uway.webservice.managecontrol.webservice.client;

import java.net.MalformedURLException;
import java.util.Collection;
import java.util.HashMap;

import javax.xml.namespace.QName;

import org.codehaus.xfire.XFireRuntimeException;
import org.codehaus.xfire.aegis.AegisBindingProvider;
import org.codehaus.xfire.annotations.AnnotationServiceFactory;
import org.codehaus.xfire.annotations.jsr181.Jsr181WebAnnotations;
import org.codehaus.xfire.client.XFireProxyFactory;
import org.codehaus.xfire.jaxb2.JaxbTypeRegistry;
import org.codehaus.xfire.service.Endpoint;
import org.codehaus.xfire.service.Service;
import org.codehaus.xfire.soap.AbstractSoapBinding;
import org.codehaus.xfire.transport.TransportManager;

public class TescommCallBackServiceClient {

	private static XFireProxyFactory proxyFactory = new XFireProxyFactory();

	private final HashMap endpoints = new HashMap();

	private Service service0;

	public TescommCallBackServiceClient(String url) {
		create0();
		Endpoint ITescommServiceLocalEndpointEP = service0.addEndpoint(new QName("http://tempuri.org/", "ITescommServiceLocalEndpoint"), new QName(
				"http://tempuri.org/", "ITescommServiceLocalBinding"), "xfire.local://TescommCallBackService");
		endpoints.put(new QName("http://tempuri.org/", "ITescommServiceLocalEndpoint"), ITescommServiceLocalEndpointEP);
		Endpoint BasicHttpBinding_ITescommServiceEP = service0.addEndpoint(new QName("http://tempuri.org/", "BasicHttpBinding_ITescommService"),
				new QName("http://tempuri.org/", "BasicHttpBinding_ITescommService"), url);
		endpoints.put(new QName("http://tempuri.org/", "BasicHttpBinding_ITescommService"), BasicHttpBinding_ITescommServiceEP);
	}

	public Object getEndpoint(Endpoint endpoint) {
		try {
			return proxyFactory.create(endpoint.getBinding(), endpoint.getUrl());
		} catch (MalformedURLException e) {
			throw new XFireRuntimeException("Invalid URL", e);
		}
	}

	public Object getEndpoint(QName name) {
		Endpoint endpoint = (Endpoint) endpoints.get(name);
		if (endpoint == null) {
			throw new IllegalStateException("No such endpoint!");
		}
		return getEndpoint(endpoint);
	}

	public Collection getEndpoints() {
		return endpoints.values();
	}

	private void create0() {
		TransportManager tm = org.codehaus.xfire.XFireFactory.newInstance().getXFire().getTransportManager();
		HashMap props = new HashMap();
		props.put("annotations.allow.interface", true);
		AnnotationServiceFactory asf = new AnnotationServiceFactory(new Jsr181WebAnnotations(), tm, new AegisBindingProvider(new JaxbTypeRegistry()));
		asf.setBindingCreationEnabled(false);
		service0 = asf.create(cn.uway.webservice.managecontrol.webservice.client.ITescommService.class, props);
		{
			AbstractSoapBinding soapBinding = asf.createSoap11Binding(service0, new QName("http://tempuri.org/", "BasicHttpBinding_ITescommService"),
					"http://schemas.xmlsoap.org/soap/http");
		}
		{
			AbstractSoapBinding soapBinding = asf.createSoap11Binding(service0, new QName("http://tempuri.org/", "ITescommServiceLocalBinding"),
					"urn:xfire:transport:local");
		}
	}

	public ITescommService getITescommServiceLocalEndpoint() {
		return (ITescommService) this.getEndpoint(new QName("http://tempuri.org/", "ITescommServiceLocalEndpoint"));
	}

	public ITescommService getITescommServiceLocalEndpoint(String url) {
		ITescommService var = getITescommServiceLocalEndpoint();
		org.codehaus.xfire.client.Client.getInstance(var).setUrl(url);
		return var;
	}

	public ITescommService getBasicHttpBinding_ITescommService() {
		return (ITescommService) this.getEndpoint(new QName("http://tempuri.org/", "BasicHttpBinding_ITescommService"));
	}

	public ITescommService getBasicHttpBinding_ITescommService(String url) {
		ITescommService var = getBasicHttpBinding_ITescommService();
		org.codehaus.xfire.client.Client.getInstance(var).setUrl(url);
		return var;
	}

}
