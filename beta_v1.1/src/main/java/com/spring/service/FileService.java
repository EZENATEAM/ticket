package com.spring.service;

import java.util.List;

import com.spring.domain.ImageVo;

public interface FileService
{
	int insert(List<ImageVo> list);
	ImageVo	select(Long idx);
	int delete(Long idx );
	int deleteAll(Long aIdx);
	List<ImageVo> list(Long aIdx);
}
