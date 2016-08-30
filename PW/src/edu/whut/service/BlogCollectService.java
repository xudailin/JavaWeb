package edu.whut.service;

import edu.whut.entity.BlogCollect;
import edu.whut.entity.User;

public interface BlogCollectService {
	
	public abstract Boolean containBlogCollect(User visitor,Long id);
	
	public abstract Boolean BlogCollect(BlogCollect blogCollect);
	
	public abstract void cancelBlogCollect(BlogCollect blogCollect);

}
