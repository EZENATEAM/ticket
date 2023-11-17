package com.spring.controller;

import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

import javax.inject.Inject;

import java.util.HashMap;
import java.util.ArrayList;

import com.spring.domain.Search;
import com.spring.domain.EventList;
import com.spring.domain.FestivalVo;

import com.spring.service.RawService;
import com.spring.service.EventService;
import com.spring.service.FestivalService;

@Controller
@RequestMapping("/admin")
public class EventController
{
	@Inject
	private RawService rawService;
	
	@Inject
	private FestivalService fesService;
	
	@Inject
	private EventService eventService;
	
	// 이벤트 등록
	@RequestMapping(value = "/evnt_post", method = RequestMethod.POST)
	public String event_post(EventList list, Model model) {
		eventService.insert(list);
		Long fIdx = list.getEventList().get(0).getfIdx();
		Long fesIdx = fesService.findByRaw(fIdx).getIdx();
		return "redirect:/admin/fes_view?idx="+fesIdx;
	}
	
	// 축제번호로 이벤트 목록 불러오기
	@RequestMapping(value = "/evnt_list", method = RequestMethod.GET)
	public String event_list(Search search, Model model) {
		ArrayList<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		// 축제 리스트 생성
		for( FestivalVo item : fesService.list(search))
		{
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("festival", item);
			// 축제 번호로 이벤트 리스트 생성
			map.put("events", eventService.list(item.getrIdx()));
			// 축제 번호로 raw 데이터 생성
			map.put("raw", rawService.select(item.getrIdx()));
			list.add(map);
			System.out.println("축제번호 : " + item.getrIdx());
		}
		// 축제 번호로, 정보를 받아온다
		model.addAttribute("list", list);
		return "admin/evnt_list";
	}
	
	// 이벤트 번호로 이벤트 상세 정보 불러오기
	
	// 이벤트 정보 수정하기
	
	// 이벤트 삭제하기
	
}