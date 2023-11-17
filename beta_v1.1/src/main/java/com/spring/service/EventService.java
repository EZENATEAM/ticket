package com.spring.service;

import java.util.List;

import com.spring.domain.EventList;
import com.spring.domain.EventVo;

public interface EventService
{
	// 행사정보 등록
//	int insert(List<EventVo> list);
	int insert(EventList list);
	// 행사정보 조회
	EventVo select(Long idx);
	// 행사정보 수정
	int update(EventVo vo);
	// 행사정보 삭제
	int delete(Long idx);
	// 축제번호로 행사정보 목록 불러오기
	List<EventVo> list(Long fIdx);
}