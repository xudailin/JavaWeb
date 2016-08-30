package edu.whut.service;

import java.util.List;
import java.util.Map;

public interface RoleService {

	/**
     * 根据用户查询id查询权限集合
     *
     * @param userId
     * @return
     */
	public abstract List<Long> findRoleIdListByUserId(Long userId);

    /**
     * 根据角色id查询资源路径集合
     *
     * @param roleId
     * @return
     */
	public abstract List<Map<Long, String>> findRoleResourceListByRoleId(Long roleId);
    
	
}

