package vo;

public class PostfileVO {

	private int pfnum;
	private String localname;
	private String servername;
	private int pnum;
	private int pageNumber;
	private int count;
	private String prev_servername;
	public String getPrev_servername() {
		return prev_servername;
	}
	public void setPrev_servername(String prev_servername) {
		this.prev_servername = prev_servername;
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
	public int getPfnum() {
		return pfnum;
	}
	public void setPfnum(int pfnum) {
		this.pfnum = pfnum;
	}
	public String getLocalname() {
		return localname;
	}
	public void setLocalname(String localname) {
		this.localname = localname;
	}
	public String getServername() {
		return servername;
	}
	public void setServername(String servername) {
		this.servername = servername;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	
}
