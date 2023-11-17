package com.spring.domain;

import org.springframework.security.core.GrantedAuthority;

public class Authority implements GrantedAuthority
{
	private static final long serialVersionUID = 7408870287929608044L;
	
	private Long	idx;
	private Long	uIdx;
	private String	ROLE;

	public String getAuthority() { return ROLE; }

	public Long getIdx() {return idx; }
	public Long getuIdx() { return uIdx; }
	public String getROLE() { return ROLE; }

	public void setIdx(Long idx) { this.idx = idx; }
	public void setuIdx(Long uIdx) { this.uIdx = uIdx; }
	public void setROLE(String rOLE) { ROLE = rOLE; }

	@Override
	public String toString() {
		return "Authority [idx=" + idx + ", uIdx=" + uIdx + ", ROLE=" + ROLE + "]";
	}
}