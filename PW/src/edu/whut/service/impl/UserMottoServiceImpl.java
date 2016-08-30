package edu.whut.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.whut.dao.UserMottoDao;
import edu.whut.entity.UserMotto;
import edu.whut.service.UserMottoService;

@Service
public class UserMottoServiceImpl implements UserMottoService {
	
	@Autowired
	private UserMottoDao userMottoDao;

	@Override
	public List<UserMotto> findAllUserMottosAvailable(Long id) {
		return userMottoDao.getUserMottosAvailable(id);
	}

}
