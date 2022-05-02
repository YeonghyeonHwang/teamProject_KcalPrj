package vo;

import java.util.List;

public class MealcardVO {
	private int mealnum;
	private int unum;
	private String date;
	private String time;
	private int totalKcal;
	private List<MealinfoVO> mealInfoList;
	
	public MealcardVO() {

	}

	public int getMealnum() {
		return mealnum;
	}

	public void setMealnum(int mealnum) {
		this.mealnum = mealnum;
	}

	public int getUnum() {
		return unum;
	}

	public void setUnum(int unum) {
		this.unum = unum;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getTotalKcal() {
		return totalKcal;
	}

	public void setTotalKcal(int totalKcal) {
		this.totalKcal = totalKcal;
	}

	public List<MealinfoVO> getMealInfoList() {
		return mealInfoList;
	}

	public void setMealInfoList(List<MealinfoVO> mealInfoList) {
		this.mealInfoList = mealInfoList;
	}
	
	
}
