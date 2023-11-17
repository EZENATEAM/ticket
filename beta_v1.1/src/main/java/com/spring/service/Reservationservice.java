package com.spring.service;

import java.util.List;
import java.util.Map;

import com.spring.domain.ReservationVo;

public interface Reservationservice
{
	int				insert(List<ReservationVo>	list);
	ReservationVo	select(Long					idx	);
	int				update(ReservationVo		vo	);
	int				delete(Long					idx	);
	int				deleteAll(Map<String, Long>	map	);
	List<ReservationVo> list(Map<String, Long>	map	);
}