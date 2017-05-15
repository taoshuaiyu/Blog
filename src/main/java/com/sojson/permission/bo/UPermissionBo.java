package com.sojson.permission.bo;

import java.io.Serializable;

import com.sojson.core.shiro.token.manager.TokenManager;
import com.sojson.permission.enity.UPermission;
import com.sojson.common.utils.StringUtils;
import org.apache.shiro.subject.Subject;

/**
 * 
 * 权限选择
 * @author zhou-baicheng
 *
 */
public class UPermissionBo extends UPermission implements Serializable {
	private static final long serialVersionUID = 1L;
	/**
	 * 是否勾选
	 */
	private String marker;
	/**
	 * role Id
	 */
	private String roleId;

	public boolean isCheck(){
		return marker.equals(roleId);
	}
	public String getMarker() {
		return marker;
	}

	public void setMarker(String marker) {
		this.marker = marker;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	
}
