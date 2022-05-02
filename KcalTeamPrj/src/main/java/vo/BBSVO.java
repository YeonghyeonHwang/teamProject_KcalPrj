package vo;

public class BBSVO {
	private int bnum;
	private String category;
	private String region;
	private int unum;
	private String id;
	private String nickname;
	private String createdate;
	private String title;
	private String content;
	private int view_cnt;
	private int recommend;
	private String isdelete;
	private String isreport;
	private String isopen;
	private int start;
	private int count;
	private int replyCnt;
	
	public BBSVO() {
		this.start = 0;
		this.count = 10;
		this.replyCnt = 0;
	}
	
	


	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public int getUnum() {
		return unum;
	}

	public void setUnum(int unum) {
		this.unum = unum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}


	
	public int getView_cnt() {
		return view_cnt;
	}




	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}




	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public String getIsdelete() {
		return isdelete;
	}

	public void setIsdelete(String isdelete) {
		this.isdelete = isdelete;
	}

	public String getIsreport() {
		return isreport;
	}

	public void setIsreport(String isreport) {
		this.isreport = isreport;
	}

	public String getIsopen() {
		return isopen;
	}

	public void setIsopen(String isopen) {
		this.isopen = isopen;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}




	public int getReplyCnt() {
		return replyCnt;
	}




	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	
	
}
