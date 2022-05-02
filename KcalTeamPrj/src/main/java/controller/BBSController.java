package controller;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.BBSService;
import vo.BBSPagingVO;
import vo.BBSVO;

@Controller
@RequestMapping("/bbs")
public class BBSController {

	@Autowired
	BBSService bbsService;
	
	@ResponseBody
	@PostMapping("/bbsList")
	public ResponseEntity<BBSPagingVO> getBBSList(String category, int count, 
												  @RequestParam(defaultValue = "0") int unum, 
												  @RequestParam(defaultValue = "1") int pageNum,
												  @RequestParam(defaultValue = "") String searchCategory,
												  @RequestParam(defaultValue = "") String searchText) {
		BBSPagingVO bbsList = bbsService.getBBSList(category, unum, pageNum, count, searchCategory, searchText);
		
		ResponseEntity<BBSPagingVO> entity = new ResponseEntity<BBSPagingVO>(bbsList, HttpStatus.OK); 
		
		return entity;
	}
	
	@GetMapping("/detail")
	public String bbsDetail(Model model, BBSVO vo) {
		
		bbsService.selectBBS(model, vo);
		
		return "community_bbs_detail";
	}
	
	@GetMapping("/create")
	public String getBBSCreate(BBSVO vo, String currCategory, Model model) {
		model.addAttribute("currCategory", currCategory);
		return "community_bbs_create";
	}
	
	@PostMapping("/create_result")
	public String setBBSCreate(BBSVO vo, Model model) {
		model.addAttribute("category", vo.getCategory());
		int bnum = bbsService.insertBBS(vo);
		return "redirect:/bbs/detail?bnum=" + bnum;
	}
	
	@GetMapping("/modify")
	public String modifyBBS(@ModelAttribute BBSVO vo, Model model) {
		bbsService.selectBBS(model, vo);
		return "community_bbs_modify";
	}
	
	@PostMapping("/modify_result")
	public String modifyBBSResult(BBSVO vo, Model model) {
		int bnum = vo.getBnum();
		bbsService.updateBBS(vo, model);
		return "redirect:/bbs/detail?bnum=" + bnum;
	}
	
	@GetMapping("/delete")
	public String deleteBBS(BBSVO vo, String category, HttpSession session) {
		bbsService.deleteBBS(vo, session);
		return "redirect:/community/bbs?category=" + category;
	}
	
	@ResponseBody
	@PostMapping("/recommend")
	public String updateRecommend(int bnum) {
		
		return bbsService.updateRecommend(bnum);
	}
	
	
	
}
