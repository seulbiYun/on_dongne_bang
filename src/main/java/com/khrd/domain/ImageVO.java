package com.khrd.domain;

public class ImageVO {
	private int iNo;
	private String iFullname;
	private RoomDetailVO room;
	public ImageVO() {
		super();
	}
	public ImageVO(int iNo, String iFullname, RoomDetailVO room) {
		super();
		this.iNo = iNo;
		this.iFullname = iFullname;
		this.room = room;
	}
	public int getiNo() {
		return iNo;
	}
	public void setiNo(int iNo) {
		this.iNo = iNo;
	}
	public String getiFullname() {
		return iFullname;
	}
	public void setiFullname(String iFullname) {
		this.iFullname = iFullname;
	}
	public RoomDetailVO getRoom() {
		return room;
	}
	public void setRoom(RoomDetailVO room) {
		this.room = room;
	}
	@Override
	public String toString() {
		return "ImageVO [iNo=" + iNo + ", iFullname=" + iFullname + ", room=" + room + "]";
	}
	
	
}
