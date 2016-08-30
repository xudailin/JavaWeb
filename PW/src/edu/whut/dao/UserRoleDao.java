package edu.whut.dao;

import java.util.List;

public interface UserRoleDao {

	public abstract List<Long> findRoleIdListByUserId(Long userId);

}
