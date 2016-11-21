package com.shop.app.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.app.domain.BuyerVO;
import com.shop.app.service.BuyerService;

@Controller // 스프링 프레임워크에 Controller bean 객체로 등록
public class BuyerController {
	
	@Autowired
	BuyerService buyerService;
	
	private static final Logger logger = LoggerFactory.getLogger(BuyerController.class);
	
	// login1 아이디 중복체크 컨트롤러
	@RequestMapping(value="/checkid", method=RequestMethod.POST)
	public void checkid(@RequestBody String userid, HttpServletResponse response) throws IOException{
		logger.info("checkid 실행");
		logger.info("userid" + userid);
		
		// 필요없는 문자열을 제거
		String b_id = userid.substring(0, userid.length()-1);
		
		// DB에서 입력한 문자열 검색
		BuyerVO vo = buyerService.read(b_id);
		// DB에 있다면 중복...
		if (vo!=null){
			String selectedID = vo.getB_id();
			logger.info("selectedID"+selectedID);
			response.getWriter().print(1);
		}
	}
	
	// 회원가입 컨트롤러
	@RequestMapping(value="joinMember", method=RequestMethod.POST)
	public void joinMember(BuyerVO vo){
		// login1 폼에서 입력받은 값을 vo 에 넣어서 insert합니다.
		// 아이디가 PK라서 같은 아이디 두번넣으면 에러남.
		buyerService.insert(vo);
		logger.info("회원가입 성공! ");
	}
	
}
