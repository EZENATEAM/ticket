package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.domain.ReplyVo;
import com.spring.domain.Search;
import com.spring.repository.ReplyDao;

@Service
public class ReplyServiceImpl implements ReplyService
{
	@Inject
	private ReplyDao rDao;

	@Override
	public int insert(ReplyVo vo) {
		return rDao.insert(vo);
	}

	@Override
	public ReplyVo select(Long idx) {
		return rDao.select(idx);
	}

	@Override
	public int update(ReplyVo vo) {
		return rDao.update(vo);
	}

	@Override
	public int delete(Long idx) {
		return rDao.delete(idx);
	}

	@Override
	public int deleteAll(Long fIdx) {
		return rDao.deleteAll(fIdx);
	}

	@Override
	public List<ReplyVo> list(Long fIdx) {
		return rDao.list(fIdx);
	}

	@Override
	public List<ReplyVo> list(Search search) {
		return rDao.list(search);
	}
}