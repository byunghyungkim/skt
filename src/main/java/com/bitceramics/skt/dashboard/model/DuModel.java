package com.bitceramics.skt.dashboard.model;

import java.util.Date;

import com.luuf.core.object.BaseObject;

public class DuModel extends BaseObject {

	private static final long serialVersionUID = -9155450959383006439L;

	private String DU_NO, REG_NO, DU_NAME, DU_DESC;

	public String getDU_NO() {
		return DU_NO;
	}

	public void setDU_NO(String sDU_NO) {
		DU_NO = sDU_NO;
	}

	public String getDU_NAME() {
		return DU_NAME;
	}

	public void setDU_NAME(String sDU_NAME) {
		DU_NAME = sDU_NAME;
	}

	public String getREG_NO() {
		return REG_NO;
	}

	public void setREG_NO(String sREG_NO) {
		REG_NO = sREG_NO;
	}

	public String getDU_DESC() {
		return DU_DESC;
	}

	public void setDU_DESC(String sDU_DESC) {
		DU_DESC = sDU_DESC;
	}

}
