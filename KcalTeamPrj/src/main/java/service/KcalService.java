package service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import vo.MealVO;
import vo.MealcardVO;
import vo.MealinfoVO;
import vo.MemberVO;

@Service
public class KcalService {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public String setMeal(String foodList, int kcalAll, String date, String time, HttpSession session) {
		String result = "";
		
		MemberVO mvo = (MemberVO)session.getAttribute("account");
		MealcardVO mealcard = new MealcardVO();

		mealcard.setUnum(mvo.getUnum());
		mealcard.setDate(date);
		mealcard.setTime(time);
		mealcard.setTotalKcal(kcalAll);


		int i1 = sqlSessionTemplate.insert("meal.insertMealcard", mealcard);
		int mealnum = mealcard.getMealnum();

		List<MealinfoVO> mealInfoList = new ArrayList<MealinfoVO>();
		
		List<Map<String, Object>> fList = new Gson().fromJson(String.valueOf(foodList),
	              new TypeToken<List<Map<String, Object>>>(){}.getType());
		
	      for (Map<String, Object> food : fList) {
	    	  String menu = String.valueOf(food.get("menu"));
	    	  int intake = (int)Float.parseFloat(String.valueOf(food.get("intake")));
	    	  int kcal = (int)Float.parseFloat(String.valueOf(food.get("kcal")));
	    	  
	    	  MealinfoVO mealinfo = new MealinfoVO();
	    	  mealinfo.setMealnum(mealnum);
	    	  mealinfo.setMenu(menu);
	    	  mealinfo.setIntake(intake);
	    	  mealinfo.setKcal(kcal);
	    	  
	    	  mealInfoList.add(mealinfo);
	      } 
	      
	      int i2 = 0;
	      for (MealinfoVO mealInfo : mealInfoList) {
	    	  i2 += sqlSessionTemplate.insert("meal.insertMealinfo", mealInfo);
	      }
	      
	      if (i1 > 0 && i2 > 0) {
	    	  result = "success";
	      }else {
	    	  result = "fail";
	      }
		
	      return result;
	}

	
	public List<MealVO> getMealList(int unum, String startDate, String endDate) {
				
		List<MealVO> mealVO = new ArrayList<MealVO>();
		MealVO vo = new MealVO();
		vo.setUnum(unum);
		vo.setStartDate(startDate);
		vo.setEndDate(endDate);

		mealVO = sqlSessionTemplate.selectList("meal.selectMeal", vo);
		
		return mealVO;
	}


	public String deleteMealCard(int mealnum) {
		String result = "fail";
		int i = sqlSessionTemplate.delete("meal.deleteMealcard", mealnum);
		if(i > 0) {
			result = "success";
		}
		
		return result;
	}

	
}
