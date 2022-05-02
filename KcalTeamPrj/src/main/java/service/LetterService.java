package service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import vo.LetterVO;

@Service
public class LetterService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public void selectLetterList(Model model, String nickname, int rnum, int snum) {
		LetterVO rvo = new LetterVO();
		LetterVO svo = new LetterVO();
		
		rvo.setRnick(nickname);
		svo.setSnick(nickname);
		
		rvo.setRstart((rnum-1)*rvo.getCount());
		svo.setSstart((snum-1)*svo.getCount());
		
		model.addAttribute("receiveLetterList", sqlSessionTemplate.selectList("letter.selectLetterList", rvo));
		model.addAttribute("sendLetterList", sqlSessionTemplate.selectList("letter.selectLetterList", svo));
		model.addAttribute("rcount", sqlSessionTemplate.selectOne("letter.selectLetterCount", rvo));
		model.addAttribute("scount", sqlSessionTemplate.selectOne("letter.selectLetterCount", svo));
		model.addAttribute("rnum", rnum);
		model.addAttribute("snum", snum);
	}

	public int deleteLetter(List<Integer> deleteLetterList) {
		int deleteCnt = 0;
		for(int lnum : deleteLetterList) {
			System.out.println(lnum);
			
			LetterVO vo = new LetterVO();
			vo.setLnum(lnum);
			sqlSessionTemplate.delete("letter.deleteLetter", vo);
			deleteCnt += 1;
		}		
		
		return deleteCnt;
	}

	public LetterVO selectLetterOne(Model model, int lnum) {
		LetterVO vo = new LetterVO();
		vo.setLnum(lnum);
		vo = sqlSessionTemplate.selectOne("letter.selectLetter", vo);

		return vo;
	}

	public int updateLetter(int lnum) {
		int result = 0;
		LetterVO vo = new LetterVO();
		vo.setLnum(lnum);
		int i = sqlSessionTemplate.update("letter.updateLetter", vo);
		if(i > 0) {
			result = lnum;
		}
		return result;
	}

	public String insertLetter(LetterVO vo) {
		String result = "f";
		int i = sqlSessionTemplate.insert("letter.insertLetter", vo);
		if(i > 0) {
			result = "s";
		}
		return result;
	}

	
}
