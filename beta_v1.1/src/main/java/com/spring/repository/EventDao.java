package com.spring.repository;

import com.spring.domain.EventList;
import com.spring.domain.EventVo;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int		insert(EventList list)
	{
		System.out.println("**************************************");
		System.out.println("**************************************");
		System.out.println("**************************************");
		System.out.println("**************************************");
		for( EventVo item : list.getEventList() )
		{
			System.out.println(item.toString());
		}
		return sqlSession.insert(	 "mapper.Event.insert",	list.getEventList() );
	}
//	public int		insert(List<EventVo> list) { return sqlSession.insert(	 "mapper.Event.insert",	list ); }
	public EventVo		 select(Long	 idx ) { return sqlSession.selectOne("mapper.Event.select",idx	 ); }
	public int			 update(EventVo	 vo	 ) { return sqlSession.update(	 "mapper.Event.update",	vo	 ); }
	public int			 delete(Long	 idx ) { return sqlSession.delete(	 "mapper.Event.delete",	idx	 ); }
	public int			 deleteAll(Long	fIdx ) { return sqlSession.delete(	 "mapper.Event.delete",	fIdx ); }
	// 축제 번호로 행사 목록을 불러온다
	public List<EventVo> list(	Long	fIdx ) { return sqlSession.selectList("mapper.Event.list",	fIdx ); }
}