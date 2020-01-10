package com.khrd.domain;

import java.util.Date;

public class MemberVO {
	private String mId;
	private String mPassword;
	private String mName;
	private String mTel;
	private String mEmail;
	private Date mBirth;
	private int mSecession;

	public MemberVO() {
		super();
	}

	public MemberVO(String mId, String mPassword, String mName, String mTel, String mEmail, Date mBirth, int mSecession) {
		super();
		this.mId = mId;
		this.mPassword = mPassword;
		this.mName = mName;
		this.mTel = mTel;
		this.mEmail = mEmail;
		this.mBirth = mBirth;
		this.mSecession = mSecession;
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

	public String getmTel() {
		return mTel;
	}

	public void setmTel(String mTel) {
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

	public int getmSecession() {
		return mSecession;
	}

	public void setmSecession(int mSecession) {
		this.mSecession = mSecession;
	}

	@Override
	public String toString() {
		return "MemberVO [mId=" + mId + ", mPassword=" + mPassword + ", mName=" + mName + ", mTel=" + mTel + ", mEmail="
				+ mEmail + ", mBirth=" + mBirth + ", mSecession=" + mSecession + "]";
	}

}
