package com.bitceramics.skt.dashboard.model;

import com.luuf.core.object.BaseObject;

public class DashBoardModel extends BaseObject {

	private static final long serialVersionUID = -9155450959383006439L;

	private String REG_NO, REG_NAME, REG_DESC;

	public String getREG_NO() {
		return REG_NO;
	}

	public void setREG_NO(String sREG_NO) {
		REG_NO = sREG_NO;
	}

	public String getREG_NAME() {
		return REG_NAME;
	}

	public void setREG_NAME(String sREG_NAME) {
		REG_NAME = sREG_NAME;
	}

	public String getREG_DESC() {
		return REG_DESC;
	}

	public void setREG_DESC(String sREG_DESC) {
		REG_DESC = sREG_DESC;
	}

}
