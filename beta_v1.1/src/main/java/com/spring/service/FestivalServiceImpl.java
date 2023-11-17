package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.domain.FestivalVo;
import com.spring.domain.Search;
import com.spring.repository.FestivalDao;

@Service
public class FestivalServiceImpl implements FestivalService
{
	@Inject
	private FestivalDao fDao;

	@Override
	public int insert(FestivalVo vo) {
		return fDao.insert(vo);
	}

	@Override
	public FestivalVo select(Long idx) {
		return fDao.select(idx);
	}

	@Override
	public int update(FestivalVo vo) {
		return fDao.update(vo);
	}

	@Override
	public int delete(Long idx) {
		return fDao.delete(idx);
	}

	@Override
	public FestivalVo findByRaw(Long rIdx) {
		return fDao.findByRaw(rIdx);
	}

	@Override
	public List<FestivalVo> list(Search search) {
		return fDao.list(search);
	}

	@Override
	public List<FestivalVo> list_act(Search search) {
		return fDao.list_Act(search);
	}
}