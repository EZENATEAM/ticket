package com.spring.service;

import com.spring.domain.UserVo;
import com.spring.domain.Authority;
import com.spring.repository.UserDao;
import com.spring.repository.AuthorityDao;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

@Service
public class UserService implements UserDetailsService {
	
	@Inject
	private UserDao uDao;
	@Inject
	private AuthorityDao aDao;
	@Inject
	private PasswordEncoder pwEncoder;

	public Boolean checkPW( Long idx, String pw )
	{
		if( idx == null || pw == null || pw.equals("") )
			return false;
		// DB에서 암호화된 비번을 받아옴
		System.out.println(uDao.findOne(idx).getPassword());
		System.out.println(pw);
		if( pwEncoder.matches(pw, uDao.findOne(idx).getPassword()) )
		{
			System.out.println("matched");
			return true;
		}
		System.out.println("not matched");
		return false;
	}
	
	public Boolean UpdateWithNewPW( UserVo user, String npw )
	{
		if( user == null || npw == null || npw.equals("") )
			return false;
		user.setPASSWORD(pwEncoder.encode(npw));
		System.out.println(user.toString());
		uDao.update(user);
		return true;
	}

	public Boolean signup(UserVo user) {
		if(user.getID() == null || user.getEMAIL() == null || user.getPASSWORD() ==  null)
			return false;

		user.setPASSWORD(pwEncoder.encode(user.getPASSWORD()));	// 사용자의 실제 비밀번호를 Bcrypt로 암호화함
		uDao.insert(user);

		Authority authority = new Authority();
		authority.setuIdx(user.getIdx());
		authority.setROLE("ROLE_USER");
		aDao.insert(authority);

		if(user.getEMAIL().contains("admin")) {
			Authority adminAuthority = new Authority();
			adminAuthority.setuIdx(user.getIdx());
			adminAuthority.setROLE("ROLE_ADMIN");
			aDao.insert(adminAuthority);
		}

		System.out.println("user created :" + new Date());
		return true;
	}

	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserVo user = uDao.findByEmail(username);
		if (user == null) {
			throw new UsernameNotFoundException("Invalid username/password.");
		}
		List<Authority> authorities = aDao.select(user.getIdx());
		user.setAuthorities(authorities);
		System.out.println("user = " + user);
		return user;
	}
	
	public int findByID(String id)
	{
		if(uDao.findByID(id) != null) return 1;
		else return -1;
	}
	
	public UserVo findByName(UserVo vo)
	{
		return uDao.findByName(vo);
	}
	
	public UserVo findOne(Long idx)
	{
		return uDao.findOne(idx);
	}
}