package edu.whut.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.whut.dao.RoleDao;
import edu.whut.dao.UserRoleDao;
import edu.whut.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	private RoleDao roleDao;
	
	@Autowired
    private UserRoleDao userRoleDao;

    @Override
    public List<Long> findRoleIdListByUserId(Long userId) {
        return userRoleDao.findRoleIdListByUserId(userId);
    }
    
    @Override
    public List<Map<Long, String>> findRoleResourceListByRoleId(Long roleId) {
        return roleDao.findRoleResourceListByRoleId(roleId);
    }




}
