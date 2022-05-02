package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.CsService;
import service.LetterService;
import vo.CsqnaPagingVO;
import vo.CsqnaVO;
import vo.LetterVO;

@Controller
@RequestMapping("/cs")
public class CsController {
	
	
	@Autowired
	CsService csService;
	
	
	@GetMapping("/goCs")
	public String goCs(Model model,CsqnaVO vo) {

		return "cs";
	}

	@PostMapping("/insertCsqna")
	public String insertCsqna(CsqnaVO vo) {
		csService.insertCsqna(vo);
	
		return "redirect:goCs?curPage=curCs";
	}

	@ResponseBody
	@PostMapping("/csqnaList")
	public ResponseEntity<CsqnaPagingVO> getBBSList(@RequestParam(defaultValue = "") String nickname, 
												   @RequestParam(defaultValue = "1") int pageNum) {
		CsqnaPagingVO csqnaList = csService.getCsqnaList(nickname, pageNum);
		
		ResponseEntity<CsqnaPagingVO> entity = new ResponseEntity<CsqnaPagingVO>(csqnaList, HttpStatus.OK); 
		
		return entity;
	}
	
	
}
