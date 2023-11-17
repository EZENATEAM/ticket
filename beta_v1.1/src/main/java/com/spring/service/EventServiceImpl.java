package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.domain.EventList;
import com.spring.domain.EventVo;
import com.spring.repository.EventDao;

@Service
public class EventServiceImpl implements EventService
{
	@Inject
	private EventDao eDao;

	@Override
	public int insert(EventList list) {
		return eDao.insert(list);
	}

	@Override
	public EventVo select(Long idx) {
		return eDao.select(idx);
	}

	@Override
	public int update(EventVo vo) {
		return eDao.update(vo);
	}

	@Override
	public int delete(Long idx) {
		return eDao.delete(idx);
	}

	@Override
	public List<EventVo> list(Long fIdx) {
		return eDao.list(fIdx);
	}

}