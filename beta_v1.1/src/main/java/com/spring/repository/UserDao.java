package com.spring.repository;

import com.spring.domain.Search;
import com.spring.domain.UserVo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao {
	@Autowired
	private SqlSession sqlSession;

	public int	  insert(UserVo	vo	) { return sqlSession.insert(	"mapper.User.insert", vo	); }
	public UserVo select(Long	idx	) { return sqlSession.selectOne("mapper.User.select", idx	); }
	public int	  update(UserVo	vo	) { return sqlSession.update(	"mapper.User.update", vo	); }
	public int	  delete(Long	idx	) { return sqlSession.delete(	"mapper.User.delete", idx	); }
	
	public UserVo findOne(	  Long   idx  ) { return sqlSession.selectOne( "mapper.User.findOne",	 idx	); }
	public UserVo findByID(	  String ID	  ) { return sqlSession.selectOne( "mapper.User.findByID",	 ID		); }
	public UserVo findByEmail(String email) { return sqlSession.selectOne( "mapper.User.findByEmail",email	); }
	public UserVo findByName( UserVo vo	  ) { return sqlSession.selectOne( "mapper.User.findByName", vo		); }
	public List<UserVo> list(Search search) { return sqlSession.selectList("mapper.User.list",		 search	); }
}