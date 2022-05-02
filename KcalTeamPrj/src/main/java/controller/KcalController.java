package controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import service.KcalService;
import vo.MealVO;
import vo.MealcardVO;
import vo.MealinfoVO;
import vo.MemberVO;

@Controller
@RequestMapping("/kcal")
public class KcalController {
	
	@Autowired
	KcalService kcalService;

	@GetMapping("/goKcal")
	public String goKcal() {
		
		return "kcal";
	}
	
	@ResponseBody 
	@PostMapping("/saveMyMeal")
	public String setMyMeal(@RequestParam String foodList, int kcalAll, String date, String time, HttpSession session) {

	    String result = kcalService.setMeal(foodList, kcalAll, date, time, session);
	      
		return result;
	}
	
	
	
	@GetMapping("/mealTest")
	public String mealTest() {
		return "meal_test";
	}
	
	@ResponseBody
	@PostMapping("/mealList")
	public ResponseEntity<List<MealVO>> getMealCard(int unum, String startDate, String endDate) {
		
		List<MealVO> mealVO =  kcalService.getMealList(unum, startDate, endDate);
		
		ResponseEntity<List<MealVO>> entity = new ResponseEntity<List<MealVO>>(mealVO, HttpStatus.OK);
		
		return entity;
	}
	
	@ResponseBody
	@PostMapping("/deleteMeal")
	public String deleteMealCard(int mealnum) {
		
		return kcalService.deleteMealCard(mealnum);
	}
}
