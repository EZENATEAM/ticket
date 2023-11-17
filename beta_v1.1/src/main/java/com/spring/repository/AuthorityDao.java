package com.spring.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;

import com.spring.domain.Authority;

@Repository
public class AuthorityDao {
	
	@Autowired
	private SqlSession sqlSession;

	public int				insert(Authority vo	) { return sqlSession.insert(	 "mapper.Authority.insert", vo	); }
	public List<Authority>	select(Long idx		) { return sqlSession.selectList("mapper.Authority.select", idx	); }
	public int				update(Authority vo	) { return sqlSession.update(	 "mapper.Authority.update", vo	); }
	public int				delete(Long uIdx	) { return sqlSession.delete(	 "mapper.Authority.delete", uIdx); }
}