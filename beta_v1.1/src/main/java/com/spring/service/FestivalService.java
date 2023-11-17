package com.spring.service;

import java.util.List;

import com.spring.domain.FestivalVo;
import com.spring.domain.Search;

public interface FestivalService
{
	// 축제정보 등록
	int insert(FestivalVo vo);
	// 축제정보 조회
	FestivalVo select(Long idx);
	// 축제정보 수정
	int update(FestivalVo vo);
	// 축제정보 삭제
	int delete(Long idx);
	// 원본 번호로 축제정보 조회
	FestivalVo findByRaw(Long rIdx);
	// 검색 정보로 축제정보 목록
	List<FestivalVo> list(Search search);
	// 검색 정보로 축제정보 목록
	List<FestivalVo> list_act(Search search);
}