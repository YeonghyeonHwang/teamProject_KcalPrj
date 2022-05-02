package vo;

import java.util.List;

public class UserpostVO {
private int pnum;
private int unum;
private String createdate;
private String title;
private String content;
private int view_cnt;
private int recommend;
private String isopen;
private String isdelete;
private String isreport;
private int pageNumber;
private int count;
private int start;
private int pageCnt;
public int getPageCnt() {
	return pageCnt;
}
public void setPageCnt(int pageCnt) {
	this.pageCnt = pageCnt;
}
public UserpostVO() {
	this.start = 0;
	this.count = 8;
}
public int getStart() {
	return start;
}

public void setStart(int start) {
	this.start = start;
}



public int getPageNumber() {
	return pageNumber;
}
public void setPageNumber(int pageNumber) {
	this.pageNumber = pageNumber;
}
public int getCount() {
	return count;
}
public void setCount(int count) {
	this.count = count;
}
//private List<UserpostVO> postVoList;
//public List<UserpostVO> getPostVoList() {
//	return postVoList;
//}
//public void setPostVoList(List<UserpostVO> postVoList) {
//	this.postVoList = postVoList;
//}
public int getPnum() {
	return pnum;
}
public void setPnum(int pnum) {
	this.pnum = pnum;
}
public int getUnum() {
	return unum;
}
public void setUnum(int unum) {
	this.unum = unum;
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
public String getIsopen() {
	return isopen;
}
public void setIsopen(String isopen) {
	this.isopen = isopen;
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

}
