package service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import vo.FollowVO;
import vo.MemberVO;


@Service
public class FollowService {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public void getFollowCnt(Model model, FollowVO fvo) {
		Map<String,Object> map= sqlSessionTemplate.selectOne("follow.countFollow",fvo);
		Object i1=map.get("followerCnt");
		Object i2=map.get("followeeCnt");
	
		model.addAttribute("followerCnt",i1);
		model.addAttribute("followeeCnt",i2);
		
		
	}
	
	public void getFollowerList(Model model, FollowVO fvo, String accnick) {
		
		
		List<FollowVO> fvoList=sqlSessionTemplate.selectList("follow.followerList",fvo);
		String a = "false";
		for (FollowVO item : fvoList) {
		    if (item.getFollower_n().equals(accnick)) {
		       a="true";
		        break;
		    }
		}
	     if(accnick.equals(fvo.getFollowee_n())) {
	    	a="mine";
	        
	    }
		
		
		
		model.addAttribute("followcheck",a);
		model.addAttribute("followerList",fvoList);
	}
	public void getFolloweeList(Model model, FollowVO fvo) {
		
		model.addAttribute("followeeList",sqlSessionTemplate.selectList("follow.followeeList",fvo));
	}
	
	public void updateFollowImg(MemberVO mvo) {
		FollowVO fvo1=new FollowVO();
		FollowVO fvo2=new FollowVO();
	    fvo1.setFollower_n(mvo.getNickname());
	    fvo1.setErimg_localname(mvo.getImg_localname());
	    fvo1.setErimg_servername(mvo.getImg_servername());
	    fvo2.setFollowee_n(mvo.getNickname());
	    fvo2.setEeimg_localname(mvo.getImg_localname());
	    fvo2.setEeimg_servername(mvo.getImg_servername());
	    sqlSessionTemplate.update("follow.updateEeImg",fvo2);
	    sqlSessionTemplate.update("follow.updateErImg",fvo1);
	   
	}
	public void deleteFollow(FollowVO vo) {
		sqlSessionTemplate.delete("follow.deleteFollow",vo);
		
	}
	public void selectfollowee(MemberVO evo,MemberVO rvo) {
		   evo = sqlSessionTemplate.selectOne("member.selectMember",evo);
		   FollowVO fvo=new FollowVO();
		   fvo.setFollower(rvo.getUnum());
		   fvo.setFollowee(evo.getUnum());
		   fvo.setFollower_n(rvo.getNickname());
		   fvo.setFollowee_n(evo.getNickname());
		   fvo.setErimg_localname(rvo.getImg_localname());
		   fvo.setErimg_servername(rvo.getImg_servername());
		   fvo.setEeimg_localname(evo.getImg_localname());
		   fvo.setEeimg_servername(evo.getImg_servername());
		   sqlSessionTemplate.insert("follow.updateFollow",fvo);
	}
	
	
}
