package com.spring.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.spring.domain.rawVo;
import com.spring.domain.Search;
import com.spring.domain.EventVo;
import com.spring.domain.FestivalVo;

import com.spring.repository.RawDao;

import com.spring.service.RawService;
import com.spring.service.EventService;
import com.spring.service.FestivalService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Inject
	private RawDao rDao;
	@Inject
	private RawService rawService;
	@Inject
	private FestivalService fesService;
	@Inject
	private EventService eventService;
	@Inject
	private PasswordEncoder pwEncoder;

	/*
	 * ---------------------------------------------------------------------- //
	 * MemberController 에 구현 //id찾기 인증 처리
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/id_mail", method = RequestMethod.GET) public String
	 * idmail(String mail, String code, HttpSession session) {
	 * System.out.println("mail : "+ mail); System.out.println("code : "+ code);
	 * System.out.println("저장된 코드 : "+ session.getAttribute(mail));
	 * 
	 * if(pwEncoder.matches(code, (String) session.getAttribute(mail))) {
	 * System.out.println("인증번호가 일치합니다."); session.setAttribute(mail, ""); return
	 * "OK"; }else { System.out.println("인증번호가 틀립니다."); return "ERROR"; } }
	 * 
	 * //id찾기 결과 이동
	 * 
	 * @RequestMapping(value = "/idfindResult", method = RequestMethod.GET) public
	 * String idfindResult() { return "user/idfindResult"; } //id찾기 결과 이동
	 * 
	 * @RequestMapping(value = "/idfindResult", method = RequestMethod.POST) public
	 * String idfindResult( String name, String to, String emailsign, Model model,
	 * HttpSession session) { System.out.println("이름 : " + name);
	 * System.out.println("이메일 : " + to ); System.out.println("인증코드 : " + emailsign
	 * ); // 악의적인 의도로 주소로 직접 접근하는 경우도 있으므로 // 세션에 저장된 이메일과 암호화된 코드와 파라메타로 받은 이메일과
	 * 사용자가 입력한 코드를 비교해봅니다. if(pwEncoder.matches(emailsign, (String)
	 * session.getAttribute(to))) { System.out.println("인증번호가 일치합니다.");
	 * session.setAttribute(to, ""); }else { System.out.println("인증번호가 틀립니다.");
	 * return "redirect:/"; }
	 * 
	 * String result = "";
	 * 
	 * // 있으면 모델에 계정을 저장하고 idfindResult페이지로 이동 model.addAttribute("msg", result); //
	 * 없으면 모델에 계정이 없습니다 라는 메세지를 찍고 이동 model.addAttribute("msg", "가입정보가 확인되지 않습니다.");
	 * 
	 * return "user/idfindResult"; }
	 */

	/*
	 * // pw찾기 이동
	 * 
	 * @RequestMapping(value = "/pwfind", method = RequestMethod.GET) public String
	 * pwfind() { return "user/pwfind"; }
	 * 
	 * // pw찾기 결과 이동
	 * 
	 * @RequestMapping(value = "/pwfindResult", method = RequestMethod.GET) public
	 * String pwfindResult() { return "user/pwfindResult"; }
	 * 
	 * // pw찾기 결과 이동
	 * 
	 * @RequestMapping(value = "/pwfindResult", method = RequestMethod.POST) public
	 * String pwfindResult(String idsign, String name, String to, String emailsign,
	 * Model model, HttpSession session) { System.out.println("아이디 : " + idsign);
	 * System.out.println("이름 : " + name); System.out.println("이메일 : " + to);
	 * System.out.println("인증코드 : " + emailsign); // 악의적인 의도로 주소로 직접 접근하는 경우도 있으므로
	 * // 세션에 저장된 이메일과 암호화된 코드와 파라메타로 받은 이메일과 사용자가 입력한 코드를 비교해봅니다. if
	 * (pwEncoder.matches(emailsign, (String) session.getAttribute(to))) {
	 * System.out.println("인증번호가 일치합니다."); // 인증 번호가 일치하므로 아이디를 보여줍니다. // 세션에 저장된
	 * 코드를 지웁니다 session.setAttribute(to, ""); } else {
	 * System.out.println("인증번호가 틀립니다."); return "redirect:/"; }
	 * 
	 * // 인증번호 확인이 되었으므로 // DB에서 이름과 이메일이 일치하는 계정이 있는지 확인합니다 String result = ""; //
	 * DB에서 이메일 찾는 로직 작성
	 * 
	 * // 있으면 모델에 계정을 저장하고 idfindResult페이지로 이동 model.addAttribute("msg", result); //
	 * 없으면 모델에 계정이 없습니다 라는 메세지를 찍고 이동 model.addAttribute("msg", "가입정보가 확인되지 않습니다.");
	 * 
	 * return "user/pwfindResult"; }
	 */

	// logindex 이동 / 축제목록 조회 요청
	@RequestMapping(value = "/logindex", method = { RequestMethod.GET, RequestMethod.POST })
	public String logindex(Search search, Model model) {
		if (search == null) {
			search = new Search();
		}
		List<rawVo> list = rDao.list(search);
		model.addAttribute("list", list);
		/*
		 * for(rawVo item : list) { System.out.println(item.toString()); }
		 */
		return "user/logindex";
	}

	// mypage 이동
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage() {
		System.out.println("user contoller / mypage");
		return "user/mypage";
	}

	// goodspage 이동
	@RequestMapping(value = "/goodspage", method = RequestMethod.GET)
	public String goodspage(Long idx, Model model) {
		System.out.println(idx);
		rawVo vo = rDao.select(idx);
		System.out.println(vo.toString());
		model.addAttribute("vo", vo);
		return "user/goodspage";
	}

	// paypage 이동
	@PostMapping("/paypage")
	public String paypage() {
		System.out.println("user contoller / paypage");
		return "user/paypage";
	}

	/*
	 * // 회원 정보 조회 요청
	 * 
	 * @RequestMapping(value = "/view", method = RequestMethod.GET) public String
	 * view() { return "user/mypage"; }
	 */

	/*
	 * // raw 데이터 목록
	 * 
	 * @RequestMapping(value = "/fes", method = RequestMethod.GET) public String
	 * home(Search search, Model model) { if(search == null) search = new Search();
	 * System.out.println(search.getCurPage()); List<FestivalVo> list =
	 * fesService.list(search); model.addAttribute("list", list);
	 * 
	 * return "user/fes_list"; }
	 */

	// 노출 셋팅된 축제 목록
	@RequestMapping(value = "/fes", method = RequestMethod.GET)
	public String home(Search search, Model model) {
		if (search == null)
			search = new Search();
		System.out.println(search.getCurPage());
		List<FestivalVo> list = fesService.list_act(search);
		model.addAttribute("list", list);

		return "user/fes_list";
	}

	// 축제 조회
	@RequestMapping(value = "/fes_view", method = RequestMethod.GET)
	public String fes_view(Search search, Long idx, Model model) {
		FestivalVo vo = fesService.select(idx);
		model.addAttribute("festival", vo);
		model.addAttribute("raw", rawService.select(vo.getrIdx()));
		model.addAttribute("events", eventService.list(idx));
		model.addAttribute("event", new EventVo());
		return "user/view";
	}
}
