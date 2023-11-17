package com.spring.service;

import java.util.ArrayList;
import java.util.List;

import com.spring.domain.Search;
import com.spring.domain.rawVo;

public interface RawService
{
	// 등록
	int insert(ArrayList<rawVo> list);
	// 조회
	rawVo select(Long idx);
	// 수정
	int update(rawVo vo);
	// 삭제
	int delete(Long idx);
	
	// 목록 불러오기
	List<rawVo> list(Search search);
	
	int total();
}
