package service;


import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.stereotype.Service;

import vo.FoodVO;

@Service
public class FoodApiService {

	public List<FoodVO> getItemsFromApi(String food) throws Exception {
		
		List<FoodVO> list = new ArrayList<FoodVO>();
		
		try{
			String encodeFood = URLEncoder.encode(food, "UTF-8");
			
			URL url = new URL("https://openapi.foodsafetykorea.go.kr/api/19edad5b93f84a0184ce/I2790/json/1/1000/DESC_KOR=%22" + encodeFood + "%22");
			
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			Object obj = JSONValue.parse(new InputStreamReader(con.getInputStream()));
			
			JSONObject result = (JSONObject)obj;
			
			JSONObject all = (JSONObject)result.get("I2790");
//			System.out.println("all: "+all);
			
			String totalCnt = (String)all.get("total_count");
//			System.out.println("totalCnt: "+totalCnt);
			
			JSONArray row = (JSONArray)all.get("row");
//			System.out.println("row: "+row);
			
			if(Integer.parseInt(totalCnt) != 0) {
				for(int i = 0; i < row.size(); i++) {
					FoodVO vo = new FoodVO();
					
					JSONObject item = (JSONObject)row.get(i);
					String num = (String)item.get("NUM");
					String foodName = (String)item.get("DESC_KOR");
					String servingSize = (String)item.get("SERVING_SIZE");
					String kcal = (String)item.get("NUTR_CONT1");
					
					vo.setNum(Integer.parseInt(num));
					vo.setFoodName(foodName);
					vo.setServingSize((int)Float.parseFloat(servingSize));
					vo.setKcal((int)Float.parseFloat(kcal));
					
					list.add(vo);
				}				
			}else {
				System.out.println("검색결과 없음");
			}
			
//			for(FoodVO item : list) {
//				System.out.println("----------------");
//				System.out.println("이름: "+ item.getFoodName());
//				System.out.println("1회제공량: "+ item.getServingSize());
//				System.out.println("열량: "+ item.getKcal());
//				System.out.println("----------------");
//			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}

}
