package vo;

public class LetterVO {
	private int lnum;
	private String rnick;
	private String snick;
	private String title;
	private String content;
	private String date;
	private String ischeck;
	private int rstart;
	private int sstart;
	private int count;
	
	public LetterVO() {
		this.rstart = 0;
		this.sstart = 0;
		this.count = 10;
	}

	public int getLnum() {
		return lnum;
	}

	public void setLnum(int lnum) {
		this.lnum = lnum;
	}

	public String getRnick() {
		return rnick;
	}

	public void setRnick(String rnick) {
		this.rnick = rnick;
	}

	public String getSnick() {
		return snick;
	}

	public void setSnick(String snick) {
		this.snick = snick;
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

	

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getIscheck() {
		return ischeck;
	}

	public void setIscheck(String ischeck) {
		this.ischeck = ischeck;
	}

	

	public int getRstart() {
		return rstart;
	}

	public void setRstart(int rstart) {
		this.rstart = rstart;
	}

	public int getSstart() {
		return sstart;
	}

	public void setSstart(int sstart) {
		this.sstart = sstart;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	
	
	
}
