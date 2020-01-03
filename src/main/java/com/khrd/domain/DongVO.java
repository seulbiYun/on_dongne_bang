package com.khrd.domain;

public class DongVO {
	private int dNo;
	private String dName;
	private GuVO gu;

	public DongVO() {
		super();
	}

	public DongVO(int dNo, String dName, GuVO gu) {
		super();
		this.dNo = dNo;
		this.dName = dName;
		this.gu = gu;
	}

	public int getdNo() {
		return dNo;
	}

	public void setdNo(int dNo) {
		this.dNo = dNo;
	}

	public String getdName() {
		return dName;
	}

	public void setdName(String dName) {
		this.dName = dName;
	}

	public GuVO getGu() {
		return gu;
	}

	public void setGu(GuVO gu) {
		this.gu = gu;
	}

	@Override
	public String toString() {
		return "DongVO [dNo=" + dNo + ", dName=" + dName + ", gu=" + gu + "]";
	}

}
