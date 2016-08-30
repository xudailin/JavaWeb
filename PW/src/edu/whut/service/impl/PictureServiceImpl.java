package edu.whut.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.whut.dao.PictureDao;
import edu.whut.entity.Picture;
import edu.whut.service.PictureService;

@Service
public class PictureServiceImpl implements PictureService {
	
	@Autowired
	private PictureDao pictureDao;

	@Override
	public List<Picture> findAllPictures(Long id) {
		return pictureDao.findPictureList(id);
	}

}
