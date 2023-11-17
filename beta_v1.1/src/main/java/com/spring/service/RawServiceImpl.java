package com.spring.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.domain.rawVo;
import com.spring.domain.Search;
import com.spring.repository.*;

@Service
public class RawServiceImpl implements RawService
{
	@Inject
	private RawDao rDao;
	
	@Override
	public int insert(ArrayList<rawVo> list) {
		return rDao.insert(list);
	}

	@Override
	public rawVo select(Long idx) {
		return rDao.select(idx);
	}

	@Override
	public int update(rawVo vo) {
		return rDao.update(vo);
	}

	@Override
	public int delete(Long idx) {
		return rDao.delete(idx);
	}

	@Override
	public List<rawVo> list(Search search) {
		return rDao.list(search);
	}
	
	@Override
	public int total() {
		return rDao.total();
	}
}