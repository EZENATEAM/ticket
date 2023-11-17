package com.spring.repository;

import com.spring.domain.ReservationVo;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationDao {
	@Autowired
	private SqlSession sqlSession;

	// 예약 등록은 리스트로 한번에
	public int			 insert(List<ReservationVo> list) { return sqlSession.insert(	  "mapper.Reservation.insert",	list); }
	// 예약 단건을 읽어야 할때
	public ReservationVo select(Long idx				) { return sqlSession.selectOne(  "mapper.Reservation.select",	idx	); }
	// 예약 정보 수정시
	public int			 update(ReservationVo vo		) { return sqlSession.update(	  "mapper.Reservation.update",	vo	); }
	// 예약 단건 삭제
	public int			 delete(Long idx				) { return sqlSession.delete(	  "mapper.Reservation.delete",	idx	); }
	// 행사번호, 유저번호로 예약을 삭제한다
	public int			 deleteAll(Map<String, Long> map) { return sqlSession.delete(	  "mapper.Reservation.deleteAll",map); }
	// 행사번호, 유저번호로 예약 목록을 불러온다
	public List<ReservationVo> list(Map<String, Long> map) { return sqlSession.selectList("mapper.Reservation.list",	map	); }
}