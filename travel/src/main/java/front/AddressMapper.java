package front;

import java.util.HashMap;
import java.util.Map;

public class AddressMapper {
   public static Map<String, String> map = new HashMap<String, String>();
	public static void init() {
		  map.put("seoul", "서울"); map.put("gyeonggi", "경기도");
	      map.put("jeju", "제주도");  map.put("busan", "부산");
	      map.put("jeolla", "전라도"); map.put("gyeongsang", "경상도");
	      map.put("gangwon", "강원도");
	      
	      map.put("gapyeong","가평군");  map.put("yangpyeong","양평군");
	      map.put("mokpo","목포"); map.put("yeosu","여수시");
	      map.put("haeundae","해운대구"); map.put("pohang","포항시");
	      map.put("gangneung","강릉");  map.put("goseong","고성시");
	      map.put("seogwipo","서귀포시");  map.put("gangnam","강남구");
	      map.put("seocho","서초구"); map.put("junggu","중구");
	      map.put("songpa","송파구"); map.put("gangdong","강동구");
	      map.put("gwanganri","광안리"); map.put("donggu","동구"); 
	      map.put("busanjingu","부산진구"); map.put("yangyang","양양");
	      map.put("jejucity","제주시"); map.put("sokcho","속초");  
	      map.put("namyangju","남양주시"); map.put("dongtan","동탄"); 
	      map.put("suwon","수원시"); map.put("pyeongchang","평창");
	      map.put("daegu","대구"); map.put("tongyeong","통영"); 
	      map.put("jeonju","전주"); map.put("yongin","용인시");
	      
	}
	
	public static String getValue(String key) {
		return map.get(key);
	}

}
