package com.spring.domain;

public class EventVo
{
	private	Long	idx;		//행사번호
	private	String	eDate;		//일자
	private	String	eTime;		//일시
	private	String	eTerm;		//행사시간
	private	String	eTitle;		//명칭
	private	String	eNote;		//행사내용
	private	String	ePlace;		//장소
	private	int		eSeats;		//인원
	private	String	etc;		//세부정보
	private	Long	fIdx;		//축제번호
	private	Long	aIdx;		//이미지목록번호
	
	public void setIdx(Long idx) { this.idx = idx; }
	public void seteDate(String eDate) { this.eDate = eDate; }
	public void seteTime(String eTime) { this.eTime = eTime; }
	public void seteTerm(String eTerm) { this.eTerm = eTerm; }
	public void seteTitle(String eTitle) { this.eTitle = eTitle; }
	public void seteNote(String eNote) { this.eNote = eNote; }
	public void setePlace(String ePlace) { this.ePlace = ePlace; }
	public void seteSeats(int eSeats) { this.eSeats = eSeats; }
	public void setEtc(String etc) { this.etc = etc; }
	public void setfIdx(Long fIdx) { this.fIdx = fIdx; }
	public void setaIdx(Long aIdx) { this.aIdx = aIdx; }
	
	public Long getIdx() { return idx; }
	public String geteDate() { return eDate; }
	public String geteTime() { return eTime; }
	public String geteTerm() { return eTerm; }
	public String geteTitle() { return eTitle; }
	public String geteNote() { return eNote; }
	public String getePlace() { return ePlace; }
	public int geteSeats() { return eSeats; }
	public String getEtc() { return etc; }
	public Long getfIdx() { return fIdx; }
	public Long getaIdx() { return aIdx; }
	
	@Override
	public String toString() {
		return "EventVo [idx=" + idx + ", eDate=" + eDate + ", eTime=" + eTime + ", eTerm=" + eTerm + ", eTitle="
				+ eTitle + ", eNote=" + eNote + ", ePlace=" + ePlace + ", eSeats=" + eSeats + ", etc=" + etc + ", fIdx="
				+ fIdx + ", aIdx=" + aIdx + "]";
	}
}