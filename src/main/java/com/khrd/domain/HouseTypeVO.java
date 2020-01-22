package com.khrd.domain;

public class HouseTypeVO {
	private int hNo;
	private String hType;
	private String hAddress;// 방주소
	private int hElevator;
	private int hParking;
	private int hFloor;

	public HouseTypeVO() {
		super();
	}

	public HouseTypeVO(int hNo, String hType, String hAddress, int hElevator, int hParking, int hFloor) {
		super();
		this.hNo = hNo;
		this.hType = hType;
		this.hAddress = hAddress;
		this.hElevator = hElevator;
		this.hParking = hParking;
		this.hFloor = hFloor;
	}

	public int gethNo() {
		return hNo;
	}

	public void sethNo(int hNo) {
		this.hNo = hNo;
	}

	public String gethType() {
		return hType;
	}

	public void sethType(String hType) {
		this.hType = hType;
	}

	public String gethAddress() {
		return hAddress;
	}

	public void sethAddress(String hAddress) {
		this.hAddress = hAddress;
	}

	public int gethElevator() {
		return hElevator;
	}

	public void sethElevator(int hElevator) {
		this.hElevator = hElevator;
	}

	public int gethParking() {
		return hParking;
	}

	public void sethParking(int hParking) {
		this.hParking = hParking;
	}

	public int gethFloor() {
		return hFloor;
	}

	public void sethFloor(int hFloor) {
		this.hFloor = hFloor;
	}

	@Override
	public String toString() {
		return "HouseTypeVO [hNo=" + hNo + ", hType=" + hType + ", hAddress=" + hAddress + ", hElevator=" + hElevator
				+ ", hParking=" + hParking + ", hFloor=" + hFloor + "]";
	}

}
