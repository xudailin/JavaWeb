package edu.whut.service;

import java.util.List;

import edu.whut.entity.Picture;

public interface PictureService {
	
	/**
     * 查询所有图片
     *
     * @param 
     * @return
     */
	public abstract List<Picture> findAllPictures(Long id);
	
}
