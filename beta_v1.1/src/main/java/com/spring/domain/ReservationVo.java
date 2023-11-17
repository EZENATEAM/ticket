package com.spring.domain;

public class ReservationVo
{
	private Long	 idx;		//예약번호
	private String	 wDate;		//예약일자
	private String	 person;		//예약인원
	private String	 stat;		//처리상태
	private Long	 eIdx;		//행사번호
	private Long	 uIdx;		//예약유저번호
	
	public Long getIdx() { return idx; }
	public String getwDate() { return wDate; }
	public String getPerson() { return person; }
	public String getStat() { return stat; }
	public Long geteIdx() { return eIdx; }
	public Long getuIdx() { return uIdx; }
	
	public void setIdx(Long idx) { this.idx = idx; }
	public void setwDate(String wDate) { this.wDate = wDate; }
	public void setPerson(String person) { this.person = person; }
	public void setStat(String stat) { this.stat = stat; }
	public void seteIdx(Long eIdx) { this.eIdx = eIdx; }
	public void setuIdx(Long uIdx) { this.uIdx = uIdx; }
	
	@Override
	public String toString() {
		return "ReservationVo [idx=" + idx + ", wDate=" + wDate + ", person=" + person + ", stat=" + stat + ", eIdx="
				+ eIdx + ", uIdx=" + uIdx + "]";
	}
}