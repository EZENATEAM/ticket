package com.spring.repository;

import com.spring.domain.ReplyVo;
import com.spring.domain.Search;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDao {
	@Autowired
	private SqlSession sqlSession;
	public int		insert(	  ReplyVo vo  ) { return sqlSession.insert(	  "mapper.Reply.insert",	vo	); }
	public ReplyVo	select(	  Long	  idx ) { return sqlSession.selectOne("mapper.Reply.select",	idx	); }
	public int		update(	  ReplyVo vo  ) { return sqlSession.update(	  "mapper.Reply.update",	vo	); }
	public int		delete(	  Long	  idx ) { return sqlSession.delete(	  "mapper.Reply.delete",	idx	); }
	public int		deleteAll(Long	  fIdx) { return sqlSession.delete(	  "mapper.Reply.deleteAll",	fIdx); }
	// 축제 번호로 리뷰 목록을 불러온다
	public List<ReplyVo> list(Long	 fIdx	) { return sqlSession.selectList("mapper.Reply.ReplyList",	fIdx	); }
	public List<ReplyVo> list(Search search	) { return sqlSession.selectList("mapper.Reply.list",		search	); }
}