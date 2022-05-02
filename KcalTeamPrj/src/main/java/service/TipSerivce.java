package service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import vo.TipVO;

@Service
public class TipSerivce {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public void selectTipList(Model model, int cnum, int wnum) {
		TipVO vo = new TipVO();
		vo.setStart((cnum-1)*vo.getCount());
		model.addAttribute("cList", sqlSessionTemplate.selectList("tip.selectTipCList", vo));
		model.addAttribute("cCount", sqlSessionTemplate.selectOne("tip.selectCCount", vo));

		
		TipVO vo2 = new TipVO();
		vo2.setStart((wnum-1)*vo2.getCount());
		model.addAttribute("wList", sqlSessionTemplate.selectList("tip.selectTipWList", vo2));
		model.addAttribute("wCount", sqlSessionTemplate.selectOne("tip.selectWCount", vo2));
		
		model.addAttribute("cnum", cnum);
		model.addAttribute("wnum", wnum);
	}
	
	public void selectTip(TipVO tvo) {
		TipVO vo = sqlSessionTemplate.selectOne("tip.selectTip", tvo);
		
		tvo.setTnum(vo.getTnum());
		tvo.setCategory(vo.getCategory());
		tvo.setTitle(vo.getTitle());
		tvo.setContents(vo.getContents());
		tvo.setCreatedate(vo.getCreatedate().substring(0, 19));
		tvo.setOwnerid(vo.getOwnerid());
		tvo.setOwnername(vo.getOwnername());
		tvo.setView_cnt(vo.getView_cnt());
	}
	
	public void insertTip(TipVO vo) {
		sqlSessionTemplate.insert("tip.insertTip", vo);
	}
	
	public void updateTip(TipVO vo) {
		sqlSessionTemplate.update("tip.updateTip", vo);
	}
	
	public void updateCnt(TipVO vo) {
		sqlSessionTemplate.update("tip.updateCnt", vo);
	}
	
	public void deleteTip(TipVO vo) {
		sqlSessionTemplate.delete("tip.deleteTip", vo);
	}
}
