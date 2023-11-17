package com.spring.domain;

public class ImageVo
{
	private Long	 idx;
	private String	 fileName;
	private String	 oriname;
	private Long	 aIdx;
	
	public Long getIdx() { return idx; }
	public String getFileName() { return fileName; }
	public String getOriname() { return oriname; }
	public Long getaIdx() { return aIdx; }
	public void setIdx(Long idx) { this.idx = idx; }
	public void setFileName(String fileName) { this.fileName = fileName; }
	public void setOriname(String oriname) { this.oriname = oriname; }
	public void setaIdx(Long aIdx) { this.aIdx = aIdx; }
	
	@Override
	public String toString() {
		return "ImageVo [idx=" + idx + ", fileName=" + fileName + ", oriname=" + oriname + ", aIdx=" + aIdx + "]";
	}
}