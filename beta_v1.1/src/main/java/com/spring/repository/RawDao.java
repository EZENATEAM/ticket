package com.spring.repository;

import com.spring.domain.rawVo;
import com.spring.domain.Search;

import java.util.List;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RawDao {
	@Autowired
	private SqlSession sqlSession;

	public int insert( ArrayList<rawVo> list ) { return sqlSession.insert( "mapper.Raw.insert", list ); }

	public rawVo select( Long  idx) { return sqlSession.selectOne("mapper.Raw.select", idx	); }
	public int	 update( rawVo vo ) { return sqlSession.update(	  "mapper.Raw.update", vo	); }
	public int	 delete( Long  idx) { return sqlSession.delete(	  "mapper.Raw.delete", idx	); }
	// 검색 정보로 축제 목록을 불러온다
	public List<rawVo> list(Search search) { return sqlSession.selectList("mapper.Raw.list", search); }
	
	public int total() { return sqlSession.selectOne("mapper.Raw.count"); }
}
