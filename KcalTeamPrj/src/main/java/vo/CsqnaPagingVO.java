package vo;

import java.util.List;

public class CsqnaPagingVO {
	private int pageNum;
	private int postCnt;
	private int pageCnt;
	private int minBlock;
	private int maxBlock;
	private List<CsqnaVO> csqnaList;
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getPostCnt() {
		return postCnt;
	}
	public void setPostCnt(int postCnt) {
		this.postCnt = postCnt;
	}
	public int getPageCnt() {
		return pageCnt;
	}
	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}
	public int getMinBlock() {
		return minBlock;
	}
	public void setMinBlock(int minBlock) {
		this.minBlock = minBlock;
	}
	public int getMaxBlock() {
		return maxBlock;
	}
	public void setMaxBlock(int maxBlock) {
		this.maxBlock = maxBlock;
	}
	public List<CsqnaVO> getCsqnaList() {
		return csqnaList;
	}
	public void setCsqnaList(List<CsqnaVO> csqnaList) {
		this.csqnaList = csqnaList;
	}
	
	
}
