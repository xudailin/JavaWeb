package edu.whut.service;

import java.util.List;

import edu.whut.entity.UserMotto;

public interface UserMottoService {
	/**
     * 查询所有可用的格言
     *
     * @param 
     * @return
     */
	public abstract List<UserMotto> findAllUserMottosAvailable(Long id);


}
