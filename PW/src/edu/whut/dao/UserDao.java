package edu.whut.dao;


import edu.whut.entity.User;

public interface UserDao{

    /**
     * 根据用户名查询用户
     *
     * @param username
     * @return
     */
	public abstract User findUserByLoginName(String username);

    /**
     * 添加用户
     *
     * @param user
     * @return
     */
	public abstract boolean insertUser(User user);
	
    /**
     * 根据用户id查询用户
     *
     * @param id
     * @return
     */
	public abstract User findUserById(Long id);
	
	 /**
     * 更新用户信息
     *
     * @param user
     * @return
     */
	public abstract void updateUser(User user);
	
	/**
     * 根据前台路径查询用户
     *
     * @param username
     * @return
     */
	public abstract User findUserByFrontUrl(String front_url);
	
}
