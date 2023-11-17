package com.spring.controller;

import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.security.access.prepost.PreAuthorize;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import com.spring.domain.rawVo;
import com.spring.domain.Search;
import com.spring.repository.RawDao;

import java.net.URL;
import java.net.URLEncoder;
import java.net.HttpURLConnection;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;
import java.io.InputStreamReader;

import javax.inject.Inject;

import java.io.BufferedReader;
import java.io.IOException;

@RequestMapping(value = "/open")
@Controller
public class ApiController {
	
	@Inject
	private RawDao rDao;
	
	private HttpURLConnection setApi( String ApiUrl,  String key, String rows, String page ) throws IOException {
		if( ApiUrl == null || ApiUrl.equals("") )
			ApiUrl = "http://api.kcisa.kr/openapi/service/rest/meta4/getKCPG0504"; 
		
		if( key == null || key.equals("") )
			key = "844c4a4d-86f8-49d8-bde1-98fdec703dc9"; 
		
		
		StringBuilder urlBuilder = new StringBuilder(ApiUrl); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + key); /*서비스키*/
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode( rows, "UTF-8")); /*세션당 요청레코드수*/
		urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode( page, "UTF-8")); /*페이지수*/

		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		conn.setRequestMethod("GET");
		// Request 형식
		conn.setRequestProperty("Content-type", "application/json");
		// Response 형식
		conn.setRequestProperty("accept", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		
		return conn; 
	}

	public Map<String, Object> send( String ApiUrl,  String key, int rows, int page ) throws IOException {
		HttpURLConnection conn = this.setApi( ApiUrl, key, ""+rows, ""+ page);

		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) { rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8")); }
		else { rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8")); }

		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) { sb.append(line); }
		rd.close(); conn.disconnect();
		// json 형태의 문자열을 jackson을 통해 파싱 후 map으로 변환
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> map = mapper.readValue(sb.toString(), new TypeReference<Map<String, Object>>() {});
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/total.do", method = RequestMethod.GET)
	public int countAll() throws IOException
	{
		// 전체 게시글 수 받아오기 :: 페이지당 1개 게시글을 1페이지 요청
		String totalCount = (String)(
								(Map<?, ?>)(
									(Map<?, ?>)this.send("","",1, 1).get("response")
								).get("body")
							).get("totalCount");
		if( totalCount != null && !totalCount.equals("") && !totalCount.equals("null") )
		{
			try { return Integer.parseInt(totalCount); }
			catch(Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	@ResponseBody
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public List<rawVo> list(Search search) {
		List<rawVo> list = rDao.list(search);
		return list;
	}

	@RequestMapping(value = "/list_api", method = RequestMethod.GET)
	public String list_api(@RequestParam(required = false, defaultValue = "1") Integer page, Search search, Model model) {
		model.addAttribute("list", rDao.list(search));
		return "open/list_api";
	}
	
	@ResponseBody
	@RequestMapping(value = "/view.do", method = RequestMethod.GET)
	public rawVo list(Long idx) {
		rawVo vo = rDao.select(idx);
		return vo;
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/batch.do", method = RequestMethod.GET)
	public String batch() throws IOException {
		int total_API = this.countAll();
		int total_DB = rDao.total();
		if( total_API != total_DB )
			System.out.println("DB를 갱신합니다.");
		else
			System.out.println("DB 최신입니다.");
		return "/";
	}
	

//	OpenApi로부터 모든 게시글을 받아옵니다
//	처음 DB 구축할때 사용합니다
	@SuppressWarnings("unchecked")
	@Transactional
	@RequestMapping(value = "/set", method = RequestMethod.GET)
	public void set() throws IOException {
		// 전체 게시글 수 받아오기 :: 페이지당 1개 게시글을 1페이지 요청
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		
		list.addAll((List<Map<String, Object>>)((Map<?, ?>)((Map<?, ?>)((Map<?, ?>)this.send("","",10000, 1).get("response")).get("body")).get("items")).get("item"));
		list.addAll((List<Map<String, Object>>)((Map<?, ?>)((Map<?, ?>)((Map<?, ?>)this.send("","",10000, 2).get("response")).get("body")).get("items")).get("item"));
/*		List<Map<String,Object>> list1 = (List<Map<String, Object>>)((Map<?, ?>)((Map<?, ?>)((Map<?, ?>)this.send("","",10000, 1).get("response")).get("body")).get("items")).get("item");
		List<Map<String,Object>> list2 = (List<Map<String, Object>>)((Map<?, ?>)((Map<?, ?>)((Map<?, ?>)this.send("","",10000, 2).get("response")).get("body")).get("items")).get("item");	*/
		System.out.println("가져온 데이터 갯수 : " + list.size());
		
		ArrayList<rawVo> list_rawVo = new ArrayList<rawVo>();
		
		for(Map<String,Object> item : list)
		{
			ObjectMapper objectMapper = new ObjectMapper();
			rawVo vo = objectMapper.convertValue(item, rawVo.class);
			list_rawVo.add(vo);
		}

		for( rawVo vo: list_rawVo )
		{
			System.out.println("vo---------------------");
			System.out.println(vo.toString());
		}
		rDao.insert(list_rawVo);
	}
}