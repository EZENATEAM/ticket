package com.spring.domain;

public class rawVo
{
	// 관리용 필드
	private Long	idx;					//원본번호
	private String	wDate;					//저장일시
	private String	status;					//등록상태	/ 축제 세부 정보를 등록했는가
	// Open Api 정보들 --------
	private String	title;					//명칭
	private String	alternativeTitle;		//대체명칭
	private String	creator;				//주책임자
	private String	regDate;				//등록일
	private String	collectionDb;			//소속DB
	private String	subjectCategory;		//기관별주제분류체계
	private String	subjectKeyword;			//핵심주제어
	private String	extent;					//자원크기
	private String	description;			//내용
	private String	spatialCoverage;		//관련장소
	private String	temporalCoverage;		//해당시간대
	private String	person;					//사람
	private String	language;				//언어
	private String	sourceTitle;			//참조자원제목
	private String	referenceIdentifier;	//참조식별정보
	private String	rights;					//자원권리
	private String	copyrightOthers;		//저작권
	private String	url;					//지시정보자원위치정보
	private String	contributor;			//기여자
	
	public Long getIdx() { return idx; }
	public String getwDate() { return wDate; }
	public String getStatus() { return status; }
	public String getTitle() { return title; }
	public String getAlternativeTitle() { return alternativeTitle; }
	public String getCreator() { return creator; }
	public String getRegDate() { return regDate; }
	public String getCollectionDb() { return collectionDb; }
	public String getSubjectCategory() { return subjectCategory; }
	public String getSubjectKeyword() { return subjectKeyword; }
	public String getExtent() { return extent; }
	public String getDescription() { return description; }
	public String getSpatialCoverage() { return spatialCoverage; }
	public String getTemporalCoverage() { return temporalCoverage; }
	public String getPerson() { return person; }
	public String getLanguage() { return language; }
	public String getSourceTitle() { return sourceTitle; }
	public String getReferenceIdentifier() { return referenceIdentifier; }
	public String getRights() { return rights; }
	public String getCopyrightOthers() { return copyrightOthers; }
	public String getUrl() { return url; }
	public String getContributor() { return contributor; }

	public void setIdx(Long idx) { this.idx = idx; }
	public void setwDate(String wDate) { this.wDate = wDate; }
	public void setStatus(String status) { this.status = status; }
	public void setTitle(String title) { this.title = title; }
	public void setAlternativeTitle(String alternativeTitle) { this.alternativeTitle = alternativeTitle; }
	public void setCreator(String creator) { this.creator = creator; }
	public void setRegDate(String regDate) { this.regDate = regDate; }
	public void setCollectionDb(String collectionDb) { this.collectionDb = collectionDb; }
	public void setSubjectCategory(String subjectCategory) { this.subjectCategory = subjectCategory; }
	public void setSubjectKeyword(String subjectKeyword) { this.subjectKeyword = subjectKeyword; }
	public void setExtent(String extent) { this.extent = extent; }
	public void setDescription(String description) { this.description = description; }
	public void setSpatialCoverage(String spatialCoverage) { this.spatialCoverage = spatialCoverage; }
	public void setTemporalCoverage(String temporalCoverage) { this.temporalCoverage = temporalCoverage; }
	public void setPerson(String person) { this.person = person; }
	public void setLanguage(String language) { this.language = language; }
	public void setSourceTitle(String sourceTitle) { this.sourceTitle = sourceTitle; }
	public void setReferenceIdentifier(String referenceIdentifier) { this.referenceIdentifier = referenceIdentifier; }
	public void setRights(String rights) { this.rights = rights; }
	public void setCopyrightOthers(String copyrightOthers) { this.copyrightOthers = copyrightOthers; }
	public void setUrl(String url) { this.url = url; }
	public void setContributor(String contributor) { this.contributor = contributor; }
	
	@Override
	public String toString() {
		return "raw [idx=" + idx + "\n wDate=" + wDate + "\n status=" + status + "\n title=" + title
				+ "\n alternativeTitle=" + alternativeTitle + "\n creator=" + creator + "\n regDate=" + regDate
				+ "\n collectionDb=" + collectionDb + "\n subjectCategory=" + subjectCategory + "\n subjectKeyword="
				+ subjectKeyword + "\n extent=" + extent + "\n description=" + description + "\n spatialCoverage="
				+ spatialCoverage + "\n temporalCoverage=" + temporalCoverage + "\n person=" + person + "\n language="
				+ language + "\n sourceTitle=" + sourceTitle + "\n referenceIdentifier=" + referenceIdentifier
				+ "\n rights=" + rights + "\n copyrightOthers=" + copyrightOthers + "\n url=" + url + "\n contributor="
				+ contributor + "]";
	}
}
