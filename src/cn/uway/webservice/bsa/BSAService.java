package cn.uway.webservice.bsa;

public interface BSAService {

	public int bsaCommandInterface(String city_id, String type);

	public int deductIndicator(String command);
}
