package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.TipSerivce;
import vo.TipVO;

@Controller
@RequestMapping("/tip")
public class TipContoller {
	
	@Autowired
	private TipSerivce tipService;
	
	@GetMapping("/goTip")
	public String goTip(Model model, @RequestParam(defaultValue = "column") String category,
						@RequestParam(defaultValue = "1") int cnum,
						@RequestParam(defaultValue = "1") int wnum) {
		tipService.selectTipList(model, cnum, wnum);
		model.addAttribute("category", category);
		return "tip";
	}
	
	@GetMapping("/createTip")
	public String createTip() {
		
		return "createTip";
	}
	
	@PostMapping("/create_result")
	public String createResult(TipVO vo) {	
		tipService.insertTip(vo);

		return "redirect:/tip/goTip?curPage=curTip";
	}
	
	@GetMapping("/tipDetail")
	public String tipDetail(@ModelAttribute("tipVO") TipVO tvo, TipVO vo) {
		tipService.updateCnt(vo);
		tipService.selectTip(tvo);
		
		return "tipDetail";
	}
	
	@GetMapping("/modify")
	public String modify(@ModelAttribute("tipVO") TipVO tvo) {
		tipService.selectTip(tvo);
		
		return "tipModify";
	}
	
	@PostMapping("/modify_result")
	public String modify_result(TipVO vo) {
		tipService.updateTip(vo);
		
		return "redirect:/tip/goTip?curPage=curTip";
	}
	
	
	@GetMapping("/deleteTip")
	public String deleteTip(TipVO vo) {
		tipService.deleteTip(vo);
		
		return "redirect:/tip/goTip?curPage=curTip";
	}

}






















