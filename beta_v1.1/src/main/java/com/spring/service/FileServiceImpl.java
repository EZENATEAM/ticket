package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.domain.ImageVo;
import com.spring.repository.FileDao;

@Service
public class FileServiceImpl implements FileService
{
	@Inject
	private FileDao fDao;

	@Override
	public int insert(List<ImageVo> list) {
		return fDao.insert(list);
	}

	@Override
	public ImageVo select(Long idx) {
		return fDao.select(idx);
	}

	@Override
	public int delete(Long idx) {
		return fDao.delete(idx);
	}

	@Override
	public int deleteAll(Long aIdx) {
		return fDao.deleteAll(aIdx);
	}

	@Override
	public List<ImageVo> list(Long aIdx) {
		return fDao.list(aIdx);
	}
}