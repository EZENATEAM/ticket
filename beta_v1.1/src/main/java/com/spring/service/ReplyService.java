package com.spring.service;

import java.util.List;

import com.spring.domain.ReplyVo;
import com.spring.domain.Search;

public interface ReplyService
{
	int		insert(	  ReplyVo vo  );
	ReplyVo	select(	  Long	  idx );
	int		update(	  ReplyVo vo  );
	int		delete(	  Long	  idx );
	int		deleteAll(Long	  fIdx);
	List<ReplyVo> list(Long	 fIdx	);
	List<ReplyVo> list(Search search);
}
