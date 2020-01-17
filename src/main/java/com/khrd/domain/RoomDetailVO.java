package com.khrd.domain;

import java.util.Date;

public class RoomDetailVO {
	private int rdNo;
	private int rdFloor;// 층수
	private int rdType;// 방타입
	private String rdContract;// 계약타입
	private String rdArea;// 방면적
	private int rdAdcost;// 관리비
	private Date rdAvailabledate;// 입주 가능일
	private int rdPet;// 반려동물
	private int rdBalcony;// 발코니
	private String rdHeating;// 난방종류
	private int rdDeposit;// 보증금
	private int rdMonthly;// 월세
	private int rdCloset;// 옷장
	private int rdShoecloset;// 신발장
	private int rdAircon;// 에어컨
	private int rdWasher;// 세탁기
	private int rdInduction;// 인덕션
	private int rdDoorlock;// 도어락
	private int rdBed;// 침대
	private int rdMicrowave;// 전자레인지
	private int rdTv;// TV
	private int rdDesk;// 책상
	private int rdRefrigerator;// 냉장고
	private HouseTypeVO house;
	private MemberVO member;

	public RoomDetailVO() {
		super();
	}

	public RoomDetailVO(int rdNo, int rdFloor, int rdType, String rdContract, String rdArea, int rdAdcost,
			Date rdAvailabledate, int rdPet, int rdBalcony, String rdHeating, int rdDeposit, int rdMonthly, int rdCloset,
			int rdShoecloset, int rdAircon, int rdWasher, int rdInduction, int rdDoorlock, int rdBed, int rdMicrowave,
			int rdTv, int rdDesk, int rdRefrigerator, HouseTypeVO house, MemberVO member) {
		super();
		this.rdNo = rdNo;
		this.rdFloor = rdFloor;
		this.rdType = rdType;
		this.rdContract = rdContract;
		this.rdArea = rdArea;
		this.rdAdcost = rdAdcost;
		this.rdAvailabledate = rdAvailabledate;
		this.rdPet = rdPet;
		this.rdBalcony = rdBalcony;
		this.rdHeating = rdHeating;
		this.rdDeposit = rdDeposit;
		this.rdMonthly = rdMonthly;
		this.rdCloset = rdCloset;
		this.rdShoecloset = rdShoecloset;
		this.rdAircon = rdAircon;
		this.rdWasher = rdWasher;
		this.rdInduction = rdInduction;
		this.rdDoorlock = rdDoorlock;
		this.rdBed = rdBed;
		this.rdMicrowave = rdMicrowave;
		this.rdTv = rdTv;
		this.rdDesk = rdDesk;
		this.rdRefrigerator = rdRefrigerator;
		this.house = house;
		this.member = member;
	}

	public int getRdNo() {
		return rdNo;
	}

	public void setRdNo(int rdNo) {
		this.rdNo = rdNo;
	}

	public int getRdFloor() {
		return rdFloor;
	}

	public void setRdFloor(int rdFloor) {
		this.rdFloor = rdFloor;
	}

	public int getRdType() {
		return rdType;
	}

	public void setRdType(int rdType) {
		this.rdType = rdType;
	}

	public String getRdContract() {
		return rdContract;
	}

	public void setRdContract(String rdContract) {
		this.rdContract = rdContract;
	}

	public String getRdArea() {
		return rdArea;
	}

	public void setRdArea(String rdArea) {
		this.rdArea = rdArea;
	}

	public int getRdAdcost() {
		return rdAdcost;
	}

	public void setRdAdcost(int rdAdcost) {
		this.rdAdcost = rdAdcost;
	}

	public Date getRdAvailabledate() {
		return rdAvailabledate;
	}

	public void setRdAvailabledate(Date rdAvailabledate) {
		this.rdAvailabledate = rdAvailabledate;
	}

	public int getRdPet() {
		return rdPet;
	}

	public void setRdPet(int rdPet) {
		this.rdPet = rdPet;
	}

	public int getRdBalcony() {
		return rdBalcony;
	}

	public void setRdBalcony(int rdBalcony) {
		this.rdBalcony = rdBalcony;
	}

	public String getRdHeating() {
		return rdHeating;
	}

	public void setRdHeating(String rdHeating) {
		this.rdHeating = rdHeating;
	}

	public int getRdDeposit() {
		return rdDeposit;
	}

	public void setRdDeposit(int rdDeposit) {
		this.rdDeposit = rdDeposit;
	}

	public int getRdMonthly() {
		return rdMonthly;
	}

	public void setRdMonthly(int rdMonthly) {
		this.rdMonthly = rdMonthly;
	}

	public int getRdCloset() {
		return rdCloset;
	}

	public void setRdCloset(int rdCloset) {
		this.rdCloset = rdCloset;
	}

	public int getRdShoecloset() {
		return rdShoecloset;
	}

	public void setRdShoecloset(int rdShoecloset) {
		this.rdShoecloset = rdShoecloset;
	}

	public int getRdAircon() {
		return rdAircon;
	}

	public void setRdAircon(int rdAircon) {
		this.rdAircon = rdAircon;
	}

	public int getRdWasher() {
		return rdWasher;
	}

	public void setRdWasher(int rdWasher) {
		this.rdWasher = rdWasher;
	}

	public int getRdInduction() {
		return rdInduction;
	}

	public void setRdInduction(int rdInduction) {
		this.rdInduction = rdInduction;
	}

	public int getRdDoorlock() {
		return rdDoorlock;
	}

	public void setRdDoorlock(int rdDoorlock) {
		this.rdDoorlock = rdDoorlock;
	}

	public int getRdBed() {
		return rdBed;
	}

	public void setRdBed(int rdBed) {
		this.rdBed = rdBed;
	}

	public int getRdMicrowave() {
		return rdMicrowave;
	}

	public void setRdMicrowave(int rdMicrowave) {
		this.rdMicrowave = rdMicrowave;
	}

	public int getRdTv() {
		return rdTv;
	}

	public void setRdTv(int rdTv) {
		this.rdTv = rdTv;
	}

	public int getRdDesk() {
		return rdDesk;
	}

	public void setRdDesk(int rdDesk) {
		this.rdDesk = rdDesk;
	}

	public int getRdRefrigerator() {
		return rdRefrigerator;
	}

	public void setRdRefrigerator(int rdRefrigerator) {
		this.rdRefrigerator = rdRefrigerator;
	}

	public HouseTypeVO getHouse() {
		return house;
	}

	public void setHouse(HouseTypeVO house) {
		this.house = house;
	}

	public MemberVO getMember() {
		return member;
	}

	public void setMember(MemberVO member) {
		this.member = member;
	}

	@Override
	public String toString() {
		return "RoomDetailVO [rdNo=" + rdNo + ", rdFloor=" + rdFloor + ", rdType=" + rdType + ", rdContract="
				+ rdContract + ", rdArea=" + rdArea + ", rdAdcost=" + rdAdcost + ", rdAvailabledate=" + rdAvailabledate
				+ ", rdPet=" + rdPet + ", rdBalcony=" + rdBalcony + ", rdHeating=" + rdHeating + ", rdDeposit="
				+ rdDeposit + ", rdMonthly=" + rdMonthly + ", rdCloset=" + rdCloset + ", rdShoecloset=" + rdShoecloset
				+ ", rdAircon=" + rdAircon + ", rdWasher=" + rdWasher + ", rdInduction=" + rdInduction + ", rdDoorlock="
				+ rdDoorlock + ", rdBed=" + rdBed + ", rdMicrowave=" + rdMicrowave + ", rdTv=" + rdTv + ", rdDesk="
				+ rdDesk + ", rdRefrigerator=" + rdRefrigerator + ", house=" + house + ", member=" + member + "]";
	}

}
