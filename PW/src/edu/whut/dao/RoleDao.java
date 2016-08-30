package edu.whut.dao;

import java.util.List;
import java.util.Map;


public interface RoleDao {

	public abstract List<Map<Long, String>> findRoleResourceListByRoleId(Long roleId);

}
