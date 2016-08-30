package edu.whut.commons.result;

import java.io.Serializable;

public class Result implements Serializable {

	private static final long serialVersionUID = -1740958762757360014L;
	
    private String msg = "";

    private Object obj = null;
    
    private boolean success = false;

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getObj() {
		return obj;
	}

	public void setObj(Object obj) {
		this.obj = obj;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}
    
    

}
