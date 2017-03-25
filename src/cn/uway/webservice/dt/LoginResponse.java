package cn.uway.webservice.dt;

import java.io.Serializable;

public class LoginResponse implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private boolean flag;// 操作员登录验证是否通过：true 验证通过 false 验证失败

	// private OperatorBean operator;// 登录成功后返回的操作员信息，登录失败返回null
	// private AuthorityBean[] authorityArray;// 登录成功后返回操作员的权限，登录失败返回null
	private String checkNum;// 校验码

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	// public OperatorBean getOperator()
	// {
	// return operator;
	// }
	//
	// public void setOperator(OperatorBean operator)
	// {
	// this.operator = operator;
	// }
	//
	// public AuthorityBean[] getAuthorityArray()
	// {
	// return authorityArray;
	// }
	//
	// public void setAuthorityArray(AuthorityBean[] authorityArray)
	// {
	// this.authorityArray = authorityArray;
	// }

	public String getCheckNum() {
		return checkNum;
	}

	public void setCheckNum(String checkNum) {
		this.checkNum = checkNum;
	}
}