package com.spring.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.List;
import java.util.UUID;

import java.io.File;
import java.io.IOException;

@RequestMapping(value = "/board")
@Controller
public class FileController {
	
	@RequestMapping(value="/fileupload.do", method = RequestMethod.GET)
	public String fileupload() { return "file/upload"; }
	
	@RequestMapping(value="/fileupload.do", method = RequestMethod.POST)
	public String fileupload( MultipartHttpServletRequest mreq ) throws IllegalStateException, IOException
	{
//		System.out.println("title : " + vo.getTitle());
//		System.out.println("note : " + vo.getNote());
		
		List<MultipartFile> files = mreq.getFiles("file");
		String path  = mreq.getSession().getServletContext().getRealPath("/resources/upload");
		System.out.println( "path : " + path );
		
		for( MultipartFile file : files ) {
			if( !file.getOriginalFilename().isEmpty() ) {
				System.out.println(path);
				// 원본 파일명을 받아옴
				String fileName = file.getOriginalFilename();
				// 새로운 파일명을 생성
				String newFileName = UUID.randomUUID().toString();
				// 원본 파일명과, 새로운 파일명을 경로와 함께 저장
				String orgName = path + "\\" + fileName;
				String newName = path + "\\" + newFileName;
				System.out.println("원본 파일명 : " + orgName);
				System.out.println("변경 파일명 : " + newName);
				// MultipartFile객체에서 제공하는 메소드 사용
				file.transferTo(new File( newName ));
				// 첨부파일을 DB에 등록하는 service를 호출
				// 생략되어있습니다
			}
		}
		return "";
	}
}