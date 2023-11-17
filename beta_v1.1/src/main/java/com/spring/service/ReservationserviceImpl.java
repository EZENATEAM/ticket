package com.spring.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.domain.ReservationVo;
import com.spring.repository.ReservationDao;

@Service
public class ReservationserviceImpl implements Reservationservice
{
	@Inject
	private ReservationDao rDao;

	@Override
	public int insert(List<ReservationVo> list) {
		return rDao.insert(list);
	}

	@Override
	public ReservationVo select(Long idx) {
		return rDao.select(idx);
	}

	@Override
	public int update(ReservationVo vo) {
		return rDao.update(vo);
	}

	@Override
	public int delete(Long idx) {
		return rDao.delete(idx);
	}

	@Override
	public int deleteAll(Map<String, Long> map) {
		return rDao.deleteAll(map);
	}

	@Override
	public List<ReservationVo> list(Map<String, Long> map) {
		return rDao.list(map);
	}
}