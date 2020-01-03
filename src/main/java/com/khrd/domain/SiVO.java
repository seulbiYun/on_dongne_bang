package com.khrd.domain;

public class SiVO {
	private int sNo;
	private String sName;

	public SiVO() {
		super();
	}

	public SiVO(int sNo, String sName) {
		super();
		this.sNo = sNo;
		this.sName = sName;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	@Override
	public String toString() {
		return "SiVO [sNo=" + sNo + ", sName=" + sName + "]";
	}

}
