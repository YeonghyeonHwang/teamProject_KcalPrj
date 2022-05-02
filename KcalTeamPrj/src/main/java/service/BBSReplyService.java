package service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vo.BBSReplyVO;

@Service
public class BBSReplyService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public void insertReply(BBSReplyVO vo) {
		sqlSessionTemplate.insert("reply.insertReply", vo);
	}

	public List<BBSReplyVO> selectReplyList(BBSReplyVO rvo) {
		return sqlSessionTemplate.selectList("reply.selectReplyList", rvo);
	}

	public void deleteReply(BBSReplyVO vo) {
		sqlSessionTemplate.delete("reply.deleteReply", vo);		
	}

	public void updateReply(BBSReplyVO vo) {
		sqlSessionTemplate.update("reply.updateReply", vo);
	}

}
