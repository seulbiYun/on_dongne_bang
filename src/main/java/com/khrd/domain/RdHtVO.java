package com.khrd.domain;

public class RdHtVO {
	private RoomDetailVO rdVO;
	private HouseTypeVO htVO;

	public RdHtVO() {
		super();
	}

	public RdHtVO(RoomDetailVO rdVO, HouseTypeVO htVO) {
		super();
		this.rdVO = rdVO;
		this.htVO = htVO;
	}

	public RoomDetailVO getRdVO() {
		return rdVO;
	}

	public void setRdVO(RoomDetailVO rdVO) {
		this.rdVO = rdVO;
	}

	public HouseTypeVO getHtVO() {
		return htVO;
	}

	public void setHtVO(HouseTypeVO htVO) {
		this.htVO = htVO;
	}

	@Override
	public String toString() {
		return "RdHtVO [rdVO=" + rdVO + ", htVO=" + htVO + "]";
	}

}
