package com.spring.repository;

import com.spring.domain.FestivalVo;
import com.spring.domain.Search;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FestivalDao {
	@Autowired
	private SqlSession sqlSession;

	public int				insert(	  FestivalVo vo		) { return sqlSession.insert(	 "mapper.Festival.insert",		vo	 ); }
	public FestivalVo		select(	  Long		 idx	) { return sqlSession.selectOne( "mapper.Festival.select",		idx	 ); }
	public int				update(	  FestivalVo vo		) { return sqlSession.update(	 "mapper.Festival.update",		vo	 ); }
	public int				delete(	  Long		 idx	) { return sqlSession.delete(	 "mapper.Festival.delete",		idx	 ); }
	//원본 번호로 축제 정보를 불러온다
	public FestivalVo		findByRaw(Long		 rIdx	) { return sqlSession.selectOne( "mapper.Festival.findByRaw",	rIdx ); }
	//검색 정보로 축제 목록을 만든다
	public List<FestivalVo>	list(	  Search	 search	) { return sqlSession.selectList("mapper.Festival.list",	  search ); }
	//검색 정보로 노출 설정된 축제 목록을 만든다
	public List<FestivalVo>	list_Act(	  Search	 search	) { return sqlSession.selectList("mapper.Festival.list_active",	  search ); }
	// 축제 개수
	public int countAll() { return sqlSession.selectOne( "mapper.Festival.count_All"	); }
	public int countAct() { return sqlSession.selectOne( "mapper.Festival.count_Active"	); }
	
}