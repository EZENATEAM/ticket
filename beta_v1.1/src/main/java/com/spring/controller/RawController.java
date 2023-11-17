package com.spring.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.rawVo;
import com.spring.domain.Search;
import com.spring.domain.EventVo;

import com.spring.service.RawService;
import com.spring.service.EventService;
import com.spring.service.FestivalService;

@Controller
@RequestMapping("/admin")
public class RawController
{
	@Inject
	private RawService rawService;
	@Inject
	private FestivalService fesService;
	@Inject
	private EventService eventService;

	// raw 데이터 목록 조회
	@RequestMapping(value = "/raw_list", method = RequestMethod.GET)
	public String raw_list(Search search, Model model) {
		model.addAttribute("total", rawService.total());
		model.addAttribute("list", rawService.list(search));
		return "admin/raw_list";
	}

	// raw 데이터 세부 정보
	@RequestMapping(value = "/raw_view", method = RequestMethod.GET)
	public String raw_view(Long idx, Model model) { // idx :: raw -> idx / Festival -> rIdx / Event -> fIdx
		model.addAttribute("raw", rawService.select(idx));
		model.addAttribute("festival", fesService.findByRaw(idx));
		model.addAttribute("events", eventService.list(idx));
		model.addAttribute("event", new EventVo());
		return "admin/view";
	}

	// raw 데이터 상태 토글
	@RequestMapping(value = "/raw_toggle", method = RequestMethod.GET)
	public String raw_toggle(Long idx, String status, HttpServletRequest request) {
		if( raw_update(idx, status).equals("OK") ) return "redirect:/admin/raw_view?idx="+ idx;
		return "redirect:"+ request.getHeader("Referer");
	}

	@ResponseBody
	@RequestMapping(value = "/raw_toggle", method = RequestMethod.POST)
	public String raw_update(Long idx, String status) {
		rawVo vo = rawService.select(idx);
		vo.setStatus(status);
		if(rawService.update(vo) < 1) return "ERROR";
		else return "OK";
	}
}