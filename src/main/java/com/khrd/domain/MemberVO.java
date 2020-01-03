package com.khrd.domain;

import java.util.Date;

public class MemberVO {
	private String mId;
	private String mPassword;
	private String mName;
	private int mTel;
	private String mEmail;
	private Date mBirth;
	private int mManager;
	private int mSecession;
	private int mUsertype;

	public MemberVO() {
		super();
	}

	public MemberVO(String mId, String mPassword, String mName, int mTel, String mEmail, Date mBirth, int mManager,
			int mSecession, int mUsertype) {
		super();
		this.mId = mId;
		this.mPassword = mPassword;
		this.mName = mName;
		this.mTel = mTel;
		this.mEmail = mEmail;
		this.mBirth = mBirth;
		this.mManager = mManager;
		this.mSecession = mSecession;
		this.mUsertype = mUsertype;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmPassword() {
		return mPassword;
	}

	public void setmPassword(String mPassword) {
		this.mPassword = mPassword;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public int getmTel() {
		return mTel;
	}

	public void setmTel(int mTel) {
		this.mTel = mTel;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public Date getmBirth() {
		return mBirth;
	}

	public void setmBirth(Date mBirth) {
		this.mBirth = mBirth;
	}

	public int getmManager() {
		return mManager;
	}

	public void setmManager(int mManager) {
		this.mManager = mManager;
	}

	public int getmSecession() {
		return mSecession;
	}

	public void setmSecession(int mSecession) {
		this.mSecession = mSecession;
	}

	public int getmUsertype() {
		return mUsertype;
	}

	public void setmUsertype(int mUsertype) {
		this.mUsertype = mUsertype;
	}

	@Override
	public String toString() {
		return "MemberVO [mId=" + mId + ", mPassword=" + mPassword + ", mName=" + mName + ", mTel=" + mTel + ", mEmail="
				+ mEmail + ", mBirth=" + mBirth + ", mManager=" + mManager + ", mSecession=" + mSecession
				+ ", mUsertype=" + mUsertype + "]";
	}

}
