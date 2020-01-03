package com.khrd.domain;

public class GuVO {
	private int gNo;
	private String gName;
	private SiVO si;

	public GuVO() {
		super();
	}

	public GuVO(int gNo, String gName, SiVO si) {
		super();
		this.gNo = gNo;
		this.gName = gName;
		this.si = si;
	}

	public int getgNo() {
		return gNo;
	}

	public void setgNo(int gNo) {
		this.gNo = gNo;
	}

	public String getgName() {
		return gName;
	}

	public void setgName(String gName) {
		this.gName = gName;
	}

	public SiVO getSi() {
		return si;
	}

	public void setSi(SiVO si) {
		this.si = si;
	}

	@Override
	public String toString() {
		return "GuVO [gNo=" + gNo + ", gName=" + gName + ", si=" + si + "]";
	}

}
