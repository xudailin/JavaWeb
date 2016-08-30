package edu.whut.dao;

import java.util.List;

import edu.whut.entity.UserMotto;

public interface UserMottoDao {

	public abstract List<UserMotto> getUserMottosAvailable(Long id);

}
