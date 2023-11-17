package com.spring.repository;

import com.spring.domain.ImageVo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FileDao {
	@Autowired
	private SqlSession sqlSession;

	public int insert(List<ImageVo> list)
	{
		ImageVo tmp = new ImageVo();
		sqlSession.insert( "mapper.File.mk_list", tmp);
		for( ImageVo item : list ) item.setaIdx(tmp.getaIdx());
		return sqlSession.insert( "mapper.File.insert", list );
	}
	public ImageVo	select(Long		idx	) { return sqlSession.selectOne( "mapper.File.select",	 idx  ); }
	public int		delete(Long		idx	) { return sqlSession.delete(	 "mapper.File.delete",	 idx  ); }
	// 이미지 그룹 번호로 모든 이미지를 지운다
	public int		deleteAll(Long	aIdx	) { return sqlSession.delete("mapper.File.deleteAll",aIdx ); }
	//이미지 그룹 번호로 이미지 목록을 불러온다
	public List<ImageVo> list( Long	aIdx) { return sqlSession.selectList("mapper.File.list",	aIdx  ); }
}