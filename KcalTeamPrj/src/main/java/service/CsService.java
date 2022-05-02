package service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vo.CsqnaPagingVO;
import vo.CsqnaVO;


@Service
public class CsService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public void insertCsqna(CsqnaVO vo) {
		sqlSessionTemplate.insert("csqna.insertCsqna", vo);
	}

	public CsqnaPagingVO getCsqnaList(String nickname, int pageNum) {
		
		CsqnaVO cqvo = new CsqnaVO();
		cqvo.setNickname(nickname);
		cqvo.setStart((pageNum - 1) * cqvo.getCount());
		
		int postCnt = sqlSessionTemplate.selectOne("csqna.selectCsqnaCount", cqvo);
		
		CsqnaPagingVO cqpVO = new CsqnaPagingVO();
		cqpVO.setCsqnaList(sqlSessionTemplate.selectList("csqna.selectCsqnaList", cqvo));
		cqpVO.setPageNum(pageNum);
		cqpVO.setPostCnt(postCnt);
		cqpVO.setPageCnt(postCnt / 10 + ((postCnt % 10 == 0) ? 0 : 1));
		cqpVO.setMinBlock((((pageNum - 1) / 5) * 5) + 1);
		cqpVO.setMaxBlock(((pageNum - 1) / 5 + 1) * 5);
		
		return cqpVO;
	}

}


	
	