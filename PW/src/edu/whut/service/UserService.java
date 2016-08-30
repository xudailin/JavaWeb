package edu.whut.service;

import edu.whut.entity.User;

/**
 * @description：用户管理
 */
public interface UserService {
  
	
	/**
     * 根据前台路径查询用户
     *
     * @param username
     * @return
     */
	public abstract User findUserByFrontUrl(String front_url);
	
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
     * @param User
     * @return
     */
	public abstract boolean addUser(User user);
    
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
     * @param id
     * @return
     */
	public boolean updateUserInfo(User user);
	
	/**
     * 发送邮件
     *
     * @param id
     * @return
     */
	public boolean sendEmail(String emailContent , User visitor, User blogAdmin);
}
