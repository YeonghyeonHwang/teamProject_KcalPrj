package service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import vo.MemberVO;
import vo.PostfileVO;
import vo.UserpostVO;

@Service
public class PostService{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<Map<String, Object>> getPostList(MemberVO mvo, int pageNum, int count) {
		MemberVO vo1 = sqlSessionTemplate.selectOne("member.selectMember", mvo);
		int usernum = vo1.getUnum();
		UserpostVO pvo = new UserpostVO();
		pvo.setUnum(usernum);
		int postCnt =sqlSessionTemplate.selectOne("userpost.selectPostCnt", pvo);
		int pageCnt;
	    if(postCnt<1) {
	    	 pageCnt=0;
	    	 List listNull = new ArrayList<Object>(); 
	    	 Map<String, Object> map = new HashMap<String, Object>();

	    	 map.put("pageCnt", pageCnt);
	    	 listNull.add(map);
	    	 return listNull;
	    }else {
	    	 pageCnt=(postCnt / count + ((postCnt % count == 0) ? 0 : 1));
	    }
		
		pvo.setPageNumber(pageNum);
		pvo.setCount(count);
	    pvo.setStart((pageNum - 1) * pvo.getCount());
	    
	   
		//pvo.setCreatedate(new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA).format(new Date()));
	    List<Map<String, Object>> pvoList = sqlSessionTemplate.selectList("userpost.selectPost", pvo);
		pvoList.get(0).put("pageCnt", pageCnt);
		
for(int i=0; i< pvoList.size(); i++ ) {
	   int pnum =(int) pvoList.get(i).get("pnum"); 
	   
	  
      PostfileVO fvo=new PostfileVO();
	   fvo.setPnum(pnum);
       fvo=sqlSessionTemplate.selectOne("userpost.selectPostfileThumbnail",fvo);
       if(fvo != null) {
       
   	   pvoList.get(i).put("servername", fvo.getServername());
   	   pvoList.get(i).put("localname", fvo.getLocalname());
      }else {
    	  pvoList.get(i).put("servername", null);
	      pvoList.get(i).put("localname",null);
       }  
    }

		return pvoList;

	}
    
	
    public int setPost(UserpostVO vo) {
    	sqlSessionTemplate.insert("userpost.insertPost",vo);
    	return vo.getPnum();
    	
    }
   
    
    public void postfiles(PostfileVO vo) {
    	sqlSessionTemplate.insert("userpost.insertPostfile",vo);
    }
    public int updatePost(UserpostVO vo) {
    	sqlSessionTemplate.update("userpost.updatePost",vo);
    	return vo.getPnum();
    	
    }
    public void updatepostfiles(PostfileVO vo) {
    	sqlSessionTemplate.delete("userpost.deletePostFile",vo);
    	postfiles(vo);
    }
    
    public UserpostVO userpostView(UserpostVO vo) {
    	UserpostVO uvo=new UserpostVO();
    	uvo=sqlSessionTemplate.selectOne("userpost.userpostView",vo);
    	
//    	model.addAttribute("userpostView",sqlSessionTemplate.selectOne("userpost.userpostView",vo));
    	return uvo;
    	
    	
    }
    public List<PostfileVO> userpostViewImg(PostfileVO vo) {
    
    	List<PostfileVO> lvo=sqlSessionTemplate.selectList("userpost.selectPostfileList",vo);
    	

    	return lvo;
    	
    	
    }
    public void updateViewCnt(UserpostVO vo) {
        
    	sqlSessionTemplate.update("userpost.updateViewCnt",vo);
    	
    	
    	
    }
    
    public String deletePost(UserpostVO vo) {
    	sqlSessionTemplate.delete("userpost.deletePost",vo);
    	String result="delete";
    	return result;
    }
    public void updateRec(UserpostVO vo) {
    	sqlSessionTemplate.update("userpost.updateRec",vo);
    	
    }

}
