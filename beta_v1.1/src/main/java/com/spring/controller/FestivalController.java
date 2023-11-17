package com.spring.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.Search;
import com.spring.domain.EventVo;
import com.spring.domain.FestivalVo;

import com.spring.service.RawService;
import com.spring.service.EventService;
import com.spring.service.FestivalService;

@Controller
@RequestMapping("/admin")
public class FestivalController
{
	@Inject
	private RawService rawService;
	
	@Inject
	private FestivalService fesService;
	
	@Inject
	private EventService eventService;
	
	// 축제 목록
	@RequestMapping(value = "/fes_list", method = RequestMethod.GET)
	public String fes_list(Search search, Model model)
	{
		model.addAttribute("list", fesService.list(search));
		return "admin/fes_list";
	}
	
	// 축제 조회
	@RequestMapping(value = "/fes_view", method = RequestMethod.GET)
	public String fes_view(Long idx, Model model)
	{
		FestivalVo vo = fesService.findByRaw(idx);
		model.addAttribute("festival", vo);
		
		model.addAttribute("raw", rawService.select(vo.getrIdx()));
		List<EventVo> event = eventService.list(vo.getrIdx());
		model.addAttribute("events", event);
		EventVo eVo = new EventVo();
		model.addAttribute("event", eVo);
		return "admin/view";
	}

	// 축제 세부정보 등록
	@RequestMapping(value = "/fes_post", method = RequestMethod.GET)
	public String festival_post(Long idx, Model model) {
		model.addAttribute("raw", rawService.select(idx));
		FestivalVo vo = fesService.findByRaw(idx);
		if( vo == null ) vo = new FestivalVo();
		model.addAttribute("vo", vo);
		return "admin/fes_post";
	}
	
	// 축제 세부정보 등록
	@RequestMapping(value = "/fes_post", method = RequestMethod.POST)
	public String festival_post(FestivalVo vo, Model model) {
		fesService.insert(vo);
		model.addAttribute("festival", vo);
		model.addAttribute("raw", rawService.select(vo.getrIdx()));
		model.addAttribute("events", eventService.list(vo.getIdx()));
		model.addAttribute("event", new EventVo());
		return "admin/view";
	}
	
	// 축제 노출 설정
	@RequestMapping(value = "/fes_toggle", method = RequestMethod.GET)
	public String festival_active(Long idx, String status, Model model) {

		FestivalVo festival = fesService.select(idx);
		festival.setStatus(status);
		fesService.update(festival);
		model.addAttribute("festival", festival);
		
		model.addAttribute("raw", rawService.select(festival.getrIdx()));
		model.addAttribute("events", eventService.list(idx));
		model.addAttribute("event", new EventVo());
		return "admin/view";
	}
}