package edu.whut.dao;

import java.util.List;

import edu.whut.entity.Picture;

public interface PictureDao {

	public abstract List<Picture> findPictureList(Long id);
}
