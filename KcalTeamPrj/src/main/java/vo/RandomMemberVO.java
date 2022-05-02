package vo;

public class RandomMemberVO {
	private String nickname;
	private String img_servername;
	private int followerCnt;
	private int followingCnt;
	
	public RandomMemberVO() {

	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getImg_servername() {
		return img_servername;
	}

	public void setImg_servername(String img_servername) {
		this.img_servername = img_servername;
	}

	public int getFollowerCnt() {
		return followerCnt;
	}

	public void setFollowerCnt(int followerCnt) {
		this.followerCnt = followerCnt;
	}

	public int getFollowingCnt() {
		return followingCnt;
	}

	public void setFollowingCnt(int followingCnt) {
		this.followingCnt = followingCnt;
	}

	
	
}
