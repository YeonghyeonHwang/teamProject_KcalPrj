package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.FoodApiService;
import vo.FoodVO;

@Controller
@RequestMapping("/food")
public class FoodApiController {
	
	@Autowired
	FoodApiService foodApiService;
	
	@GetMapping("/main")
	public String toMain() {
		return "food_main";
	}
	
	@ResponseBody
	@PostMapping("/getData")
	public List<FoodVO> getData(@RequestParam String food) throws Exception {
		
		List<FoodVO> list = foodApiService.getItemsFromApi(food);
//		if(list.isEmpty()) {
//			System.out.println("비어있음");
//		}
		
		return list;
//		return foodApiService.getItemsFromApi(food);
		
	}
	
	
	
}