package com.shop.app.controller;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.app.domain.BuyerVO;
import com.shop.app.service.BuyerService;

@Controller // 스프링 프레임워크에 Controller bean 객체로 등록
@RequestMapping(value="/login")
public class BuyerController {
	
	private static final Logger logger = LoggerFactory.getLogger(BuyerController.class);
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	BuyerService buyerService;
	
	
	
	// 회원가입 양식 호출
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String login(Model model) {
		return "login_register";
	}

//////////////////////////////////////////////////////////////
	// login_register 아이디 중복체크 컨트롤러
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
	
	////////////////////////////////////////////////////////////////
	// 회원가입 컨트롤러
	@RequestMapping(value="/login_result", method=RequestMethod.POST)
	public String login_result(BuyerVO vo){
		// login1 폼에서 입력받은 값을 vo 에 넣어서 insert합니다.
		// 아이디가 PK라서 같은 아이디 두번넣으면 에러남.
		buyerService.insert(vo);
		logger.info("회원가입 성공! ");
		return "login_result";
	}
	
/*	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public void openLoginJSP(){
		
	}
	*/
/*	@RequestMapping(value="login", method=RequestMethod.POST)
	public void login(String b_id, String b_pw){	
		logger.info("login 컨트롤러 실행");
		logger.info("b_id : "+b_id+" , b_pw : "+b_pw);
		if (buyerService.isValidUser(b_id, b_pw)){
			logger.info("로그인 성공");
		} else {
			logger.info("로그인 실패");
		}
	}*/
	
////////////////////////////////////////////////////////////////////////////////////////////////////
	
	// 인증번호 발송
	@RequestMapping(value = "/checkemail", method = RequestMethod.POST)
	public void checkEmail(@RequestBody String email, HttpServletResponse response) throws IOException {
		logger.info("email: " + email);
		
		// @ converted to %40 in HTTPPost request
		String convert_email = URLDecoder.decode(email, "UTF-8"); 
		
		// 필요없는 문자열을 제거
		String b_email = convert_email.substring(0, convert_email.length()-1);
		
		// 4자리 인증번호 생성
		// 1. 0~9999 까지의 난수를 발생시킨 후 1~3자리 수를 없애기위해 1000을 더해준다 (1000~10999)
		// 2. 다섯자리가 넘어가면 1000을 빼준다.			
		int code = (int) (Math.random() * 10000 + 1000); 
		if (code > 10000){
			code = code - 1000;
		}
		
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(b_email); // 받는 이메일 등록
		
			logger.info("메일 주소 : " + b_email);
		
		message.setSubject("쇼핑몰 인증번호");  // 이메일 제목
		message.setText("인증번호 : " + code);  // 이메일 내용
		
			logger.info("보낸 코드 : " + code);
		
		mailSender.send(message);  // 이메일 전송
		// model.addAttribute("code", code);
		
		response.getWriter().print(code);
		//return "email_result";
	}
	
/*	@RequestMapping(value="/checkcode", method=RequestMethod.POST)
	public void checkCode(@RequestBody String code, HttpServletResponse response) throws IOException{
		
		logger.info("checkCode 실행");

		
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
	}*/
	
	
	
	
} // end class
