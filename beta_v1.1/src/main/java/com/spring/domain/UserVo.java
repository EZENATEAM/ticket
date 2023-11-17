package com.spring.domain;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.List;

public class UserVo implements UserDetails
{
	private static final long serialVersionUID = -2077450993073059808L;
	
	private Long	idx;			//유저번호
	private String	ID;				//아이디
	private String	PASSWORD;		//비번
	private String	NAME;			//이름
	private String	birth;			//생년월일
	private String	tel;			//전화번호
	private String	EMAIL;			//이메일
	private String	uStat;			//계정상태	/ A:활성 :: 기본값 / D:비활성/휴면 / R:탈퇴
	private String	jDate;			//가입일자
	
	private List<Authority> authorities;

	public Long getIdx() { return idx; }
	public void setIdx(Long idx) { this.idx = idx; }

	public String getID() { return ID; }
	public void setID(String iD) { ID = iD; }

	public String getPASSWORD() { return PASSWORD; }
	public void setPASSWORD(String pASSWORD) { PASSWORD = pASSWORD; }

	public String getNAME() { return NAME; }
	public void setNAME(String nAME) { NAME = nAME; }

	public String getBirth() { return birth; }
	public void setBirth(String birth) { this.birth = birth; }

	public String getTel() { return tel; }
	public void setTel(String tel) { this.tel = tel; }

	public String getEMAIL() { return EMAIL; }
	public void setEMAIL(String eMAIL) { EMAIL = eMAIL; }

	public String getuStat() { return uStat; }
	public void setuStat(String uStat) { this.uStat = uStat; }

	public String getjDate() { return jDate; }
	public void setjDate(String jDate) { this.jDate = jDate; }
	
	public void setAuthorities(List<Authority> authorities) { this.authorities = authorities; }
	public Collection<? extends GrantedAuthority> getAuthorities() { return authorities; }

	public boolean isAccountNonExpired() { return true; }
	public boolean isAccountNonLocked() { return true; }
	public boolean isCredentialsNonExpired() { return true; }

	public boolean isEnabled() {
		if( this.uStat.equals("A") )
			return true;
		return false;
	}

	public static UserVo current() {
		try { return (UserVo) SecurityContextHolder.getContext().getAuthentication().getPrincipal(); }
		catch (Exception e) { return null; }
	}

	@Override
	public String getPassword() { return PASSWORD; }

	@Override
	public String getUsername() { return this.EMAIL; }

	@Override
	public String toString() {
		String UserSTR = "UserVo [idx=" + idx + ", ID=" + ID + ", PASSWORD=" + PASSWORD + ", NAME=" + NAME + ", birth=" + birth + ", tel=" + tel + ", EMAIL=" + EMAIL + ", uStat=" + uStat + "]";
		String AuthoritySTR = "";
		if( this.authorities != null ) for( Authority item : authorities) AuthoritySTR += item.toString() + "\n";
		return UserSTR + AuthoritySTR;
	}
}