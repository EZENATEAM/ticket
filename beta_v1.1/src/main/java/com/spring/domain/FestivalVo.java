package com.spring.domain;

public class FestivalVo
{
	private	Long	idx;			//축제번호
	private	String	wDate;			//저장일시
	private	String	status;			//노출설정
	
	private	String	title;			//표시제목
	private	String	note;			//표시내용
	private	String	addr;			//주소
	private	String	startDate;		//시작일
	private	String	endDate;		//종료일
	private	String	fTel;			//연락처
	private	String	location;		//지도좌표
	
	private	Long	rIdx;			//원본번호
	private	Long	aIdx;			//이미지그룹번호

	public Long	  getIdx() { return idx; }
	public String getwDate() { return wDate; }
	public String getStatus() { return status; }
	public String getTitle() { return title; }
	public String getNote() { return note; }
	public String getAddr() { return addr; }
	public String getStartDate() { return startDate; }
	public String getEndDate() { return endDate; }
	public String getfTel() { return fTel; }
	public String getLocation() { return location; }
	public Long   getrIdx() { return rIdx; }
	public Long   getaIdx() { return aIdx; }
	
	public void setIdx(Long idx) { this.idx = idx; }
	public void setwDate(String wDate) { this.wDate = wDate; }
	public void setStatus(String status) { this.status = status; }
	public void setTitle(String title) { this.title = title; }
	public void setNote(String note) { this.note = note; }
	public void setAddr(String addr) { this.addr = addr; }
	public void setStartDate(String startDate) { this.startDate = startDate; }
	public void setEndDate(String endDate) { this.endDate = endDate; }
	public void setfTel(String fTel) { this.fTel = fTel; }
	public void setLocation(String location) { this.location = location; }
	public void setrIdx(Long rIdx) { this.rIdx = rIdx; }
	public void setaIdx(Long aIdx) { this.aIdx = aIdx; }
	
	@Override
	public String toString() {
		return "FestivalVo [idx=" + idx + ", wDate=" + wDate + ", status=" + status + ", title=" + title + ", note="
				+ note + ", addr=" + addr + ", startDate=" + startDate + ", endDate=" + endDate + ", fTel=" + fTel
				+ ", location=" + location + ", rIdx=" + rIdx + ", aIdx=" + aIdx + "]";
	}
}